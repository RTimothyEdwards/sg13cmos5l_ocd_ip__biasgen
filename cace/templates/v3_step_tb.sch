v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
T {CACE TEMPLATE: voltgen_v3 buffered output: load step settling} -400 -60 0 0 0.4 0.4 {}
C {devices/code_shown.sym} -400 40 0 0 {name=s1 only_toplevel=false value=".option savecurrents
.option TEMP=CACE\{temperature\}

.lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/models/cornerMOShv.lib mos_CACE\{corner\}
.lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/models/cornerMOSlv.lib mos_CACE\{corner\}
.lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/models/cornerDIO.lib dio_CACE\{corner_dio\}
.lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/models/cornerRES.lib res_CACE\{corner_res\}
.lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/models/cornerCAP.lib cap_CACE\{corner_cap\}

.include CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.ref/sg13cmos5l_stdcell/spice/sg13cmos5l_stdcell.spice
.include CACE\{DUT_path\}

*** SCOPE:  this characterises the BUFFERED output only.
***
*** voltgen_v3 contains one output buffer, the low-power folded cascode
*** on vout_buf.  The high-drive class-AB buffer is a separate cell that
*** sits beside it in chipalooza_frame and is characterised with the
*** frame, not here.  vout_unbuf is brought out for that buffer to use;
*** it is the bare resistor tap, outside the feedback loop, so loading it
*** is an uncorrected error and nothing here loads it.

Vvss  vss  0    DC 0
Vdvss dvss 0    DC 0
Vvdd  vdd  vss  DC CACE\{Vdd\}
Vdvdd dvdd dvss DC CACE\{Vdvdd\}

*** Ideal reference, so the block is specified independently of the
*** bandgap.  Note it does not REJECT its reference, it scales it:
*** vout = (s+1)*vbg/(4-high), a gain of 0.25 to 2.67, so bandgap noise
*** and supply rejection are multiplied by up to 8.5 dB on the way to a
*** user project.  These numbers are the buffer, not the delivered bias.
Vvbg  vbg  vss  DC CACE\{Vbg\}

*** ibias1u_1 SOURCES into the feedback amplifier;  ibias1u_2 sinks from
*** the cascode buffer.  Separate conditions so a disabled buffer can
*** have its bias removed, which is the documented usage.
I1 vss       ibias1u_1 DC CACE\{Ibias\}
I2 ibias1u_2 vss       DC CACE\{Ibias2\}

*** Enables are sense-positive.  ena2 belongs to the external class-AB
*** buffer and is held off here;  vgen_ena2_h is its exported level-
*** shifted copy and is left unconnected.
Vena  ena  dvss DC CACE[CACE\{Vdvdd\} * CACE\{Ena\}]
Vena1 ena1 dvss DC CACE[CACE\{Vdvdd\} * CACE\{Ena1\}]
Vena2 ena2 dvss DC 0
Vhigh high dvss DC CACE[CACE\{Vdvdd\} * CACE\{high\}]

Vs0 s[0] dvss DC CACE[CACE\{Vdvdd\} * (CACE\{s\} % 2)]
Vs1 s[1] dvss DC CACE[CACE\{Vdvdd\} * (((CACE\{s\} - (CACE\{s\} % 2)) / 2) % 2)]
Vs2 s[2] dvss DC CACE[CACE\{Vdvdd\} * (((CACE\{s\} - (CACE\{s\} % 4)) / 4) % 2)]

Cl    vout_buf vss CACE\{Cload\}
*** 100 nA load step at t = 100 us, inside the drive capability.
Iload vout_buf vss PWL(0 0 100u 0 100.1u CACE\{Istep\})

Xdut dvdd dvss vdd s[2] s[1] s[0] vbg vss ibias1u_1 vout_buf ibias1u_2 ena
+ vout_unbuf ena1 ena2 high vgen_ena2_h sg13cmos5l_ocd_ip__voltgen_v3

.control
save all
*** A LOAD step, not a reference step:  the reference is a quiet bandgap,
*** whereas a user project switching in is the disturbance this buffer
*** actually sees.
tran 20n 200u
meas tran v_settled find v(vout_buf) at=99u
meas tran v_final   find v(vout_buf) at=199u
*** Window starts AFTER the edge:  from=100u would include the pre-step
*** sample, making the maximum the old operating point and reporting the
*** step size as overshoot.
meas tran v_min min v(vout_buf) from=100.2u to=200u
meas tran v_max max v(vout_buf) from=100.2u to=200u
let dstep_V = v_final - v_settled
let over_V  = v_max - v_final
let under_V = v_final - v_min
echo $&dstep_V $&over_V $&under_V > CACE\{simpath\}/CACE\{filename\}_CACE\{N\}.data
.endc
"}
