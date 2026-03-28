v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
P 4 5 1070 -860 1070 20 1640 20 1640 -860 1070 -860 {}
P 4 5 1000 -860 60 -860 60 20 1000 20 1000 -860 {}
T {Startup} 1080 -850 0 0 0.4 0.4 {}
T {Bandgap} 70 -850 0 0 0.4 0.4 {}
T {Standalone bandgap with external 250uA bias} 60 -910 0 0 0.4 0.4 {}
T {based on bandgap design for sky130 by Christoph Weiser} 60 60 0 0 0.4 0.4 {}
N 390 -110 410 -110 {lab=vss}
N 390 0 450 0 {lab=vss}
N 450 0 730 0 {lab=vss}
N 100 -110 120 -110 {lab=vss}
N 100 0 160 0 {lab=vss}
N 160 0 390 -0 {lab=vss}
N 450 -800 450 -740 {lab=vdd}
N 160 -800 160 -740 {lab=vdd}
N 450 -800 730 -800 {lab=vdd}
N 160 -420 160 -140 {lab=vn}
N 1550 -800 1710 -800 {lab=vdd}
N 730 -410 730 0 {lab=vss}
N 450 -620 550 -620 {lab=vbg}
N 780 -450 880 -450 {lab=gate}
N 730 -800 730 -490 {lab=vdd}
N 200 -710 410 -710 {lab=gate}
N 450 -480 660 -480 {lab=vp}
N 160 -420 660 -420 {lab=vn}
N 1550 0 1720 0 {lab=vss}
N 450 -680 450 -620 {lab=vbg}
N 450 -620 450 -600 {lab=vbg}
N 160 -680 160 -600 {lab=comp}
N 310 -500 310 -470 {lab=vss}
N 400 -360 430 -360 {lab=vss}
N 450 -710 490 -710 {lab=vdd}
N 120 -710 160 -710 {lab=vdd}
N 450 -500 450 -480 { lab=vp}
N 450 -480 450 -390 { lab=vp}
N 400 -200 400 -170 { lab=vss}
N 450 -330 450 -280 { lab=#net1}
N 360 -240 380 -240 { lab=trim[15:0]}
N 450 -200 450 -140 { lab=#net2}
N 710 -400 710 -370 { lab=bias}
N 880 -450 1150 -450 { lab=gate}
N 880 -450 880 -380 { lab=gate}
N 880 -320 880 0 { lab=vss}
N 1270 -210 1270 0 { lab=vss}
N 1190 -350 1270 -350 { lab=vs1}
N 1150 -450 1150 -380 { lab=gate}
N 1120 -350 1150 -350 { lab=vss}
N 1270 -240 1300 -240 { lab=vss}
N 1150 -320 1150 0 { lab=vss}
N 1240 -530 1270 -530 { lab=vdd}
N 1270 -350 1270 -270 { lab=vs1}
N 1200 -240 1230 -240 { lab=vbg}
N 1270 -500 1270 -350 { lab=vs1}
N 1550 -530 1580 -530 { lab=vdd}
N 1430 -530 1510 -530 { lab=vs2}
N 1430 -530 1430 -460 { lab=vs2}
N 1550 -500 1550 -460 { lab=vs2}
N 1430 -390 1430 -370 { lab=vs2}
N 1430 -310 1430 0 { lab=vss}
N 1550 -310 1550 0 { lab=vss}
N 1550 -460 1550 -370 { lab=vs2}
N 1430 -460 1550 -460 { lab=vs2}
N 1550 -800 1550 -560 { lab=vdd}
N 1270 -800 1270 -560 { lab=vdd}
N 1350 -340 1390 -340 { lab=vdd}
N 1430 -340 1450 -340 { lab=vs2}
N 1450 -390 1450 -340 { lab=vs2}
N 1430 -390 1450 -390 { lab=vs2}
N 100 -110 100 0 {lab=vss}
N 160 -80 160 0 {lab=vss}
N 390 -110 390 0 {lab=vss}
N 450 -80 450 0 {lab=vss}
N 160 -800 450 -800 {lab=vdd}
N 160 -500 160 -420 {lab=vn}
N 730 -0 880 0 {lab=vss}
N 1150 0 1270 0 {lab=vss}
N 880 0 1150 0 {lab=vss}
N 1310 -530 1430 -530 { lab=vs2}
N 1270 0 1430 0 {lab=vss}
N 1430 0 1550 0 {lab=vss}
N 1270 -800 1550 -800 {lab=vdd}
N 730 -800 1270 -800 {lab=vdd}
N 1430 -460 1430 -390 { lab=vs2}
C {sg13cmos5l_pr/pnpMPA.sym} 430 -110 0 0 {name=Q2
m=8
a=1.4p
p=5.4u}
C {sg13cmos5l_pr/pnpMPA.sym} 140 -110 0 0 {name=Q1
m=1
a=1.4p
p=5.4u}
C {devices/lab_wire.sym} 320 0 0 0 {name=l2 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 660 -480 0 0 {name=l22 sig_type=std_logic lab=vp}
C {devices/lab_wire.sym} 730 -410 3 0 {name=l3 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 660 -420 0 0 {name=l5 sig_type=std_logic lab=vn}
C {devices/iopin.sym} 1710 -800 0 0 {name=p1 lab=vdd}
C {devices/iopin.sym} 1720 0 0 0 {name=p2 lab=vss}
C {devices/opin.sym} 550 -620 0 0 {name=p3 lab=vbg}
C {devices/lab_wire.sym} 820 -450 0 0 {name=l6 sig_type=std_logic lab=gate}
C {devices/lab_wire.sym} 320 -710 0 0 {name=l1 sig_type=std_logic lab=gate}
C {devices/iopin.sym} 710 -370 1 0 {name=p4 lab=bias}
C {capa.sym} 880 -350 0 0 {name=C1 value=1.660p
}
C {bg_res.sym} 280 -470 0 0 {name=xres
}
C {devices/lab_wire.sym} 310 -500 3 0 {name=l4 sig_type=std_logic lab=vss}
C {sg13cmos5l_pr/rhigh.sym} 450 -360 0 0 {name=R1
l=20u
w=0.69u
body=vss
m=1
}
C {devices/lab_wire.sym} 430 -360 0 0 {name=l9 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 160 -660 3 0 {name=l10 sig_type=std_logic lab=comp}
C {sg13cmos5l_pr/sg13_lv_pmos.sym} 180 -710 0 1 {name=M1
l=1u
w=4u
ng=1
m=2
}
C {sg13cmos5l_pr/sg13_lv_pmos.sym} 430 -710 0 0 {name=M2
l=1u
w=4u
ng=1
m=2
}
C {devices/lab_wire.sym} 490 -710 0 0 {name=l7 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 160 -710 0 0 {name=l8 sig_type=std_logic lab=vdd}
C {devices/ipin.sym} 360 -240 0 0 {name=p5 lab=trim[15:0]
}
C {bg_trim.sym} 400 -190 0 0 {name=xtr
}
C {devices/lab_wire.sym} 400 -200 3 0 {name=l19 sig_type=std_logic lab=vss}
C {se_folded_cascode_p.sym} 810 -450 0 0 {name=xamp
}
C {sg13cmos5l_pr/sg13_lv_nmos.sym} 1250 -240 0 0 {name=M3
l=1u
w=1u
ng=1 
m=1
}
C {sg13cmos5l_pr/sg13_lv_nmos.sym} 1170 -350 0 1 {name=M4
l=1u
w=1u
ng=1 
m=1
}
C {devices/lab_wire.sym} 1150 -350 0 0 {name=l11 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 1270 -240 0 1 {name=l12 sig_type=std_logic lab=vss}
C {sg13cmos5l_pr/sg13_lv_pmos.sym} 1290 -530 0 1 {name=M5
l=1u
w=1u
ng=1
m=1
}
C {devices/lab_wire.sym} 1270 -530 0 0 {name=l13 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1230 -240 0 0 {name=l14 sig_type=std_logic lab=vbg}
C {capa.sym} 1550 -340 0 0 {name=C2 value=622f
}
C {sg13cmos5l_pr/sg13_lv_pmos.sym} 1530 -530 0 0 {name=M6
l=1u
w=1u
ng=1
m=1
}
C {devices/lab_wire.sym} 1550 -530 0 1 {name=l15 sig_type=std_logic lab=vdd}
C {sg13cmos5l_pr/sg13_lv_pmos.sym} 1410 -340 0 0 {name=M7
l=1u
w=1u
ng=1
m=1
}
C {devices/lab_wire.sym} 1250 -350 0 0 {name=l16 sig_type=std_logic lab=vs1
}
C {devices/lab_wire.sym} 1430 -530 0 0 {name=l17 sig_type=std_logic lab=vs2
}
C {devices/lab_wire.sym} 1390 -340 0 0 {name=l18 sig_type=std_logic lab=vdd}
