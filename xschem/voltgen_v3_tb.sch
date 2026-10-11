v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
T {Note:  Vtrim is in the digital 1.2V domain} -120 480 0 0 0.3 0.3 {}
N 700 310 740 310 {lab=vout2}
N 240 450 240 560 {lab=GND}
N 370 470 370 500 {lab=vsel[2]}
N 540 470 540 500 {lab=vsel[1]}
N 710 470 710 500 {lab=vsel[0]}
N 300 400 300 500 {lab=vss}
N 300 400 600 400 {lab=vss}
N 240 560 710 560 {lab=GND}
N 150 320 400 320 {lab=dvdd}
N -30 120 70 120 {lab=vdd}
N -30 200 400 200 {lab=#net1}
N 150 300 150 320 {lab=dvdd}
N 150 140 490 140 {lab=dvdd}
N 490 140 490 160 {lab=dvdd}
N 70 120 600 120 {lab=vdd}
N 600 120 600 160 {lab=vdd}
N 70 120 70 390 {lab=vdd}
N 240 260 240 390 {lab=#net2}
N 240 260 400 260 {lab=#net2}
N 150 280 400 280 {lab=dvdd}
N 150 140 150 280 {lab=dvdd}
N 150 300 400 300 {lab=dvdd}
N 150 280 150 300 {lab=dvdd}
N 370 360 400 360 {lab=vsel[2:0]}
N 150 320 150 390 {lab=dvdd}
N -30 120 -30 140 {lab=vdd}
N -70 120 -30 120 {lab=vdd}
N 280 340 400 340 {lab=vss}
N 280 340 280 400 {lab=vss}
N 280 400 300 400 {lab=vss}
N 930 260 990 260 {lab=vout1}
N 700 260 810 260 {lab=#net3}
N 700 340 720 340 {lab=#net4}
N 720 230 720 340 {lab=#net4}
N 720 230 810 230 {lab=#net4}
N 880 170 880 220 {lab=vdd}
N 880 300 880 330 {lab=GND}
N -190 220 -190 390 {lab=#net5}
N -190 220 400 220 {lab=#net5}
N 240 450 860 450 {lab=GND}
N 860 410 860 450 {lab=GND}
N 860 310 860 350 {lab=#net6}
N -190 450 240 450 {lab=GND}
N 860 170 880 170 {lab=vdd}
N 880 330 920 330 {lab=GND}
N 920 330 920 450 {lab=GND}
N 860 450 920 450 {lab=GND}
C {devices/vsource.sym} 300 530 0 0 {name=Vvss value=0 savecurrent=false}
C {devices/gnd.sym} -60 450 0 0 {name=l1 lab=GND}
C {devices/code_shown.sym} -170 540 0 0 {name=s1 only_toplevel=false value=".option savecurrents
.control
save all
tran 10n 20u
plot V(vout1) V(vout2)
.endc"}
C {devices/code_shown.sym} -170 710 0 0 {name=s2 only_toplevel=false value=".lib $PDK_ROOT/ihp-sg13cmos5l/libs.tech/ngspice/models/cornerMOShv.lib mos_tt
.lib $PDK_ROOT/ihp-sg13cmos5l/libs.tech/ngspice/models/cornerMOSlv.lib mos_tt
.lib $PDK_ROOT/ihp-sg13cmos5l/libs.tech/ngspice/models/cornerPNP.lib typ
.lib $PDK_ROOT/ihp-sg13cmos5l/libs.tech/ngspice/models/cornerDIO.lib dio_tt
.lib $PDK_ROOT/ihp-sg13cmos5l/libs.tech/ngspice/models/cornerRES.lib res_typ
.lib $PDK_ROOT/ihp-sg13cmos5l/libs.tech/ngspice/models/cornerCAP.lib cap_typ

.include $PDK_ROOT/ihp-sg13cmos5l/libs.ref/sg13cmos5l_stdcell/spice/sg13cmos5l_stdcell.spice
"}
C {devices/vsource.sym} 70 420 0 0 {name=Vvdd value=3.3 savecurrent=false}
C {lab_pin.sym} 300 480 0 0 {name=p1 sig_type=std_logic lab=vss}
C {lab_pin.sym} -70 120 0 0 {name=p2 sig_type=std_logic lab=vdd}
C {isource.sym} -190 420 0 0 {name=I0 value=1u}
C {lab_pin.sym} 370 360 0 0 {name=p3 sig_type=std_logic lab=vsel[2:0]}
C {devices/vsource.sym} 150 420 0 0 {name=Vdvdd value=1.2 savecurrent=false}
C {lab_pin.sym} 150 140 0 0 {name=p5 sig_type=std_logic lab=dvdd}
C {lab_pin.sym} 740 310 0 1 {name=p4 sig_type=std_logic lab=vout2}
C {devices/vsource.sym} 240 420 0 0 {name=Vbg value=1.2 savecurrent=false}
C {devices/vsource.sym} 710 530 0 0 {name=Vsel0 value="PULSE(0 1.2 0 10n 10n 2.5u 5u)" savecurrent=false}
C {lab_pin.sym} 370 470 0 1 {name=p6 sig_type=std_logic lab=vsel[2]}
C {lab_pin.sym} 540 470 0 1 {name=p7 sig_type=std_logic lab=vsel[1]}
C {lab_pin.sym} 710 470 0 1 {name=p8 sig_type=std_logic lab=vsel[0]}
C {devices/vsource.sym} 540 530 0 0 {name=Vsel1 value="PULSE(0 1.2 0 10n 10n 5u 10u)" savecurrent=false}
C {devices/vsource.sym} 370 530 0 0 {name=Vsel2 value="PULSE(0 1.2 0 10n 10n 10u 20u)" savecurrent=false}
C {isource.sym} -30 170 0 0 {name=I1 value=1u}
C {lab_pin.sym} 990 260 0 1 {name=p9 sig_type=std_logic lab=vout1}
C {isource.sym} 860 380 0 0 {name=I2 value=1u}
C {sg13cmos5l_ocd_ip__voltgen_v3.sym} 550 310 0 0 {name=x2}
C {sg13cmos5l_ocd_ip__classab_buffer.sym} 960 260 0 0 {name=x1}
C {lab_pin.sym} 860 170 0 0 {name=p10 sig_type=std_logic lab=vdd}
