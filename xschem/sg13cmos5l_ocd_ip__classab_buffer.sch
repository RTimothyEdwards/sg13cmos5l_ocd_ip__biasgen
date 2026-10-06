v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
T {The class-AB folded cascode amplifier, connected as a
unity-gain buffer.} -270 -190 0 0 0.4 0.4 {}
N 40 -20 140 -20 {lab=out}
N -110 10 -80 10 {lab=out}
N -110 10 -110 70 {lab=out}
N -110 70 140 70 {lab=out}
N 140 -20 140 70 {lab=out}
N 140 -20 170 -20 {lab=out}
N -10 -100 -10 -60 {lab=vdd}
N -10 20 -10 100 {lab=vss}
N -30 30 -30 90 {lab=#net1}
N -50 90 -30 90 {lab=#net1}
N -140 -50 -80 -50 {lab=inp}
N -120 -20 -80 -20 {lab=ena}
N -30 -100 -10 -100 {lab=vdd}
N -10 100 10 100 {lab=vss}
C {se_folded_cascode_np_ab.sym} 70 -20 0 0 {name=x1}
C {ipin.sym} -140 -50 0 0 {name=p1 lab=inp}
C {ipin.sym} -120 -20 0 0 {name=p2 lab=ena}
C {iopin.sym} -30 -100 0 1 {name=p4 lab=vdd}
C {iopin.sym} 10 100 0 0 {name=p5 lab=vss}
C {opin.sym} 170 -20 0 0 {name=p6 lab=out}
C {iopin.sym} -50 90 0 1 {name=p3 lab=bias}
