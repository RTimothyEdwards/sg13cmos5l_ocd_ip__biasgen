v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
T {CACE TEMPLATE: voltgen_v3 + class-AB buffer: disabled output impedance} -400 -60 0 0 0.4 0.4 {}
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
*** The shared node is FORCED here rather than loaded, so that the
*** current drawn by a disabled amplifier can be read directly.
Vforce vout vss DC 1.2

Xdut dvdd dvss vdd s[2] s[1] s[0] vbg vss ibias1u_1 vout ibias1u_2 ena
+ vout_unbuf ena1 ena2 high vgen_ena2_h sg13cmos5l_ocd_ip__voltgen_v3
Xcab vdd vout vout_unbuf vss cab_bias vgen_ena2_h
+ sg13cmos5l_ocd_ip__classab_buffer

.control
save all
*** The two buffers share one output node, so whichever is NOT selected
*** must let go of it.  This forces the shared node to a series of
*** voltages and measures the current the disabled amplifier draws.
*** A properly disabled output is high impedance;  a partly-off one
*** sources or sinks current and drags the active buffer.
***
*** The configuration under test is set by the Ena* conditions, so the
*** same template covers both-off, cascode-only and classAB-only by
*** enumeration rather than by three separate templates.
dc Vforce 0.2 3.1 0.01
meas dc i03 find i(vforce) at=0.3
meas dc i12 find i(vforce) at=1.2
meas dc i24 find i(vforce) at=2.4
meas dc i30 find i(vforce) at=3.0
*** Emitted in BASE SI UNITS -- amps and ohms -- NOT pre-scaled.  CACE
*** applies the prefix in the parameter's unit: field to the raw value,
*** so a number already scaled to nA under unit: nA is scaled twice.
*** That turned a perfectly good 21 Gohm into 0.021 Mohm and failed the
*** spec while the circuit was working correctly.
*** The resistance is reported as a MAGNITUDE.  Once the amplifier is
*** properly off the leakage is picoamps, and the slope of a picoamp
*** against 200 mV is numerical noise whose SIGN is arbitrary -- a
*** signed value failed a sensible minimum with -35000 Mohm while the
*** part was working correctly.  The leakage limits above are the real
*** test;  this number is a readability aid, not a criterion.
let l03 = i03
let l12 = i12
let l24 = i24
let l30 = i30
meas dc ia find i(vforce) at=1.1
meas dc ib find i(vforce) at=1.3
let rsh_ohm = abs(0.2 / (ib - ia))
echo $&l03 $&l12 $&l24 $&l30 $&rsh_ohm > CACE\{simpath\}/CACE\{filename\}_CACE\{N\}.data
.endc
"}
