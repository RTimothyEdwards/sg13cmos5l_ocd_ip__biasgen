v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 130 -80 130 -50 {lab=X}
N 130 -140 190 -140 {lab=vdd}
N 190 -210 190 -140 {lab=vdd}
N 130 -210 190 -210 {lab=vdd}
N 130 -210 130 -170 {lab=vdd}
N 130 10 130 50 {lab=vss}
N 130 50 220 50 {lab=vss}
N 220 -20 220 50 {lab=vss}
N 130 -20 220 -20 {lab=vss}
N 60 -20 90 -20 {lab=A}
N 60 -80 60 -20 {lab=A}
N 60 -140 90 -140 {lab=A}
N 130 -80 210 -80 {lab=X}
N 130 -110 130 -80 {lab=X}
N 30 -80 60 -80 {lab=A}
N 60 -140 60 -80 {lab=A}
N 90 50 130 50 {lab=vss}
N 90 -210 130 -210 {lab=vdd}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} 110 -140 0 0 {name=M1
l=0.4u
w=2.0u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_hv_nmos.sym} 110 -20 0 0 {name=M2
l=0.45u
w=1.0u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {ipin.sym} 30 -80 0 0 {name=p1 lab=A}
C {iopin.sym} 90 -210 0 1 {name=p2 lab=vdd}
C {iopin.sym} 90 50 0 1 {name=p3 lab=vss}
C {opin.sym} 210 -80 0 0 {name=p4 lab=X}
