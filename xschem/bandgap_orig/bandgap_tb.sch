v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -10 330 -10 390 {lab=vss}
N -10 330 140 330 {lab=vss}
N 70 240 70 390 {lab=vdd}
N 70 240 140 240 {lab=vdd}
N -120 270 -120 390 {lab=vtrim[15:0]}
N -120 270 140 270 {lab=vtrim[15:0]}
N 290 260 370 260 {lab=vbg}
N -190 450 70 450 {lab=GND}
N -190 290 140 290 {lab=#net1}
N -190 290 -190 390 {lab=#net1}
C {devices/vsource.sym} -10 420 0 0 {name=Vvss value=0 savecurrent=false}
C {devices/gnd.sym} -60 450 0 0 {name=l1 lab=GND}
C {devices/code_shown.sym} -170 530 0 0 {name=s1 only_toplevel=false value=".option savecurrents
.control
save all
tran 1n 1u
plot V(vbg)
.endc"}
C {devices/code_shown.sym} -170 710 0 0 {name=s2 only_toplevel=false value=".lib $PDK_ROOT/ihp-sg13cmos5l/libs.tech/ngspice/models/cornerMOSlv.lib mos_tt
.lib $PDK_ROOT/ihp-sg13cmos5l/libs.tech/ngspice/models/cornerPNP.lib typ
.lib $PDK_ROOT/ihp-sg13cmos5l/libs.tech/ngspice/models/cornerDIO.lib dio_tt
.lib $PDK_ROOT/ihp-sg13cmos5l/libs.tech/ngspice/models/cornerRES.lib res_typ
"}
C {devices/vsource.sym} -120 420 0 0 {name=Vtrim[15:0] value=0 savecurrent=false}
C {devices/vsource.sym} 70 420 0 0 {name=Vdvdd value=1.8 savecurrent=false}
C {sg13cmos5l_ocd_ip__bandgap.sym} 160 340 0 0 {name=x1}
C {lab_pin.sym} -10 330 0 0 {name=p1 sig_type=std_logic lab=vss}
C {lab_pin.sym} 70 240 0 0 {name=p2 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 370 260 0 1 {name=p4 sig_type=std_logic lab=vbg}
C {isource.sym} -190 420 0 0 {name=I0 value=250n}
C {lab_pin.sym} -120 270 0 0 {name=p3 sig_type=std_logic lab=vtrim[15:0]}
