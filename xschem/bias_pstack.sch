v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
T {250nA} 200 -210 0 0 0.4 0.4 {}
T {These pins represent the m4 shields over the top
which should be connected to avdd externally.} 330 -600 0 0 0.3 0.3 {}
N 190 -510 230 -510 {
lab=avdd}
N 190 -570 190 -540 {
lab=avdd}
N 190 -300 190 -160 {
lab=itail}
N 190 -330 230 -330 {
lab=avdd}
N 230 -430 230 -330 {
lab=avdd}
N 190 -480 190 -460 {
lab=#net1}
N 190 -430 230 -430 {
lab=avdd}
N 60 -430 150 -430 {
lab=pcasc}
N 60 -510 150 -510 {
lab=pbias}
N 190 -570 230 -570 {
lab=avdd}
N 230 -570 230 -510 {
lab=avdd}
N 60 -570 190 -570 {
lab=avdd}
N 230 -510 230 -430 {
lab=avdd}
N 190 -400 190 -360 {
lab=#net2}
N 100 -330 150 -330 {
lab=enb}
N 470 -490 510 -490 {lab=shld2}
N 470 -460 510 -460 {lab=shld3}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} 170 -510 0 0 {name=M13
w=3u
l=1u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {devices/iopin.sym} 60 -570 0 1 {name=p6 lab=avdd}
C {devices/iopin.sym} 190 -160 1 0 {name=p8 lab=itail}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} 170 -330 0 0 {name=M18
w=3u
l=1u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {devices/ipin.sym} 100 -330 0 0 {name=p12 lab=enb}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} 170 -430 0 0 {name=M14
w=3u
l=1u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {devices/ipin.sym} 60 -430 0 0 {name=p1 lab=pcasc}
C {devices/ipin.sym} 60 -510 0 0 {name=p3 lab=pbias}
C {devices/iopin.sym} 470 -490 0 1 {name=p4 lab=shld2}
C {devices/iopin.sym} 470 -460 0 1 {name=p5 lab=shld3}
C {lab_pin.sym} 510 -490 0 1 {name=p9 sig_type=std_logic lab=shld2}
C {lab_pin.sym} 510 -460 0 1 {name=p10 sig_type=std_logic lab=shld3}
