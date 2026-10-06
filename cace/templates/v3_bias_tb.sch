v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
T {CACE TEMPLATE: voltgen_v3 + class-AB buffer: bias stack headroom} -400 -60 0 0 0.4 0.4 {}
C {devices/code_shown.sym} -400 40 0 0 {name=s1 only_toplevel=false value=".option savecurrents
.option TEMP=CACE\{temperature\}

.lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/models/cornerMOShv.lib mos_CACE\{corner\}
.lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/models/cornerMOSlv.lib mos_CACE\{corner\}
.lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/models/cornerDIO.lib dio_CACE\{corner_dio\}
.lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/models/cornerRES.lib res_CACE\{corner_res\}
.lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/models/cornerCAP.lib cap_CACE\{corner_cap\}

.include CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.ref/sg13cmos5l_stdcell/spice/sg13cmos5l_stdcell.spice

*** The DUT is voltgen_v3.  The class-AB buffer is a SEPARATE cell that
*** lives beside it in chipalooza_frame, so it is included and
*** instantiated here rather than coming from CACE.  This testbench
*** reproduces the frame wiring exactly (frame instances x101/x102):
*** the buffer takes vout_unbuf as its input, its output is tied to
*** vout_buf, and its enable is the level-shifted vgen_ena2_h that
*** voltgen_v3 exports.
.include CACE\{DUT_path\}
.include CACE\{root\}/netlist/schematic/sg13cmos5l_ocd_ip__classab_buffer.spice

Vvss  vss  0    DC 0
Vdvss dvss 0    DC 0
Vvdd  vdd  vss  DC CACE\{Vdd\}
Vdvdd dvdd dvss DC CACE\{Vdvdd\}
Vvbg  vbg  vss  DC CACE\{Vbg\}

*** Bias currents, one condition each so they can be set independently.
*** That matters:  a disabled amplifier must have its bias REMOVED (its
*** shunt pFET pulls the bias node to vdd, and a current source would
*** fight it), but the feedback amplifier has to stay biased throughout
*** or the resistor chain is not regulated at all.
*** ibias1u_1 SOURCES into the feedback amplifier;  ibias1u_2 sinks from
*** the folded-cascode buffer, Ibias3 from the class-AB buffer.  In ngspice I n+ n- value drives value from n+
*** to n- inside the source, so it leaves at n-.
I1 vss       ibias1u_1 DC CACE\{Ibias\}
I2 ibias1u_2 vss       DC CACE\{Ibias2\}
I3 cab_bias  vss       DC CACE\{Ibias3\}

*** Enables are now SENSE-POSITIVE:  a high level enables.  Each
*** amplifier is disabled by a shunt pFET that pulls its bias node to
*** vdd, which is why a disabled amplifier must also have its bias
*** current removed -- otherwise the current source fights the shunt.
Vena  ena  dvss DC CACE[CACE\{Vdvdd\} * CACE\{Ena\}]
Vena1 ena1 dvss DC CACE[CACE\{Vdvdd\} * CACE\{Ena1\}]
Vena2 ena2 dvss DC CACE[CACE\{Vdvdd\} * CACE\{Ena2\}]
Vhigh high dvss DC CACE[CACE\{Vdvdd\} * CACE\{high\}]

*** s[2:0] is binary;  bracket expressions permit + - * / % ** and bare
*** math calls only, so each bit is extracted with % and divide.
Vs0 s[0] dvss DC CACE[CACE\{Vdvdd\} * (CACE\{s\} % 2)]
Vs1 s[1] dvss DC CACE[CACE\{Vdvdd\} * (((CACE\{s\} - (CACE\{s\} % 2)) / 2) % 2)]
Vs2 s[2] dvss DC CACE[CACE\{Vdvdd\} * (((CACE\{s\} - (CACE\{s\} % 4)) / 4) % 2)]

*** The shared output node, as in the frame:  both buffers drive it.
Cl   vout vss CACE\{Cload\}
Iload vout vss DC 0

Xdut dvdd dvss vdd s[2] s[1] s[0] vbg vss ibias1u_1 vout ibias1u_2 ena
+ vout_unbuf ena1 ena2 high vgen_ena2_h sg13cmos5l_ocd_ip__voltgen_v3
Xcab vdd vout vout_unbuf vss cab_bias vgen_ena2_h
+ sg13cmos5l_ocd_ip__classab_buffer

.control
save all
*** Does each bias pin ACCEPT the current it is given?  A stack that
*** cannot pass the intended current saturates, the external bias loses
*** control, and the amplifier runs at whatever its own stack delivers
*** -- invisible in every performance measurement.  Both amplifiers here
*** were in that state before the enable switch was removed from their
*** bias stacks.
***
*** Sink pins are pulled down by an nstack and must stay ABOVE ~0.6 V;
*** the source pin is driven by a pstack and must stay BELOW vdd-0.6 V.
*** Values cross between sweeps as shell variables, since each analysis
*** lands in its own plot.
dc I1 0.2u 4u 10n
meas dc a1 find v(ibias1u_1) at=CACE\{Ibias\}
meas dc a2 find v(ibias1u_1) at=CACE[2 * CACE\{Ibias\}]
set va1 = $&a1
set va2 = $&a2
dc I2 0.2u 4u 10n
meas dc b1 find v(ibias1u_2) at=CACE\{Ibias\}
meas dc b2 find v(ibias1u_2) at=CACE[2 * CACE\{Ibias\}]
set vb1 = $&b1
set vb2 = $&b2
dc I3 0.2u 4u 10n
meas dc c1 find v(cab_bias) at=CACE\{Ibias3\}
meas dc c2 find v(cab_bias) at=CACE[2 * CACE\{Ibias3\}]
set vc1 = $&c1
set vc2 = $&c2
echo $va1 $va2 $vb1 $vb2 $vc1 $vc2 > CACE\{simpath\}/CACE\{filename\}_CACE\{N\}.data
.endc
"}
