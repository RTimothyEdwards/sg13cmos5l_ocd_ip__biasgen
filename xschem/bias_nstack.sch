v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
T {50nA} -200 -330 0 0 0.4 0.4 {}
N -140 60 -40 60 {
lab=nbias}
N -180 90 -180 110 {
lab=avss}
N -220 60 -180 60 {
lab=avss}
N -220 60 -220 110 {
lab=avss}
N -180 -30 -180 30 {
lab=#net1}
N -220 -60 -180 -60 {
lab=avss}
N -220 -60 -220 60 {
lab=avss}
N -220 -160 -180 -160 {
lab=avss}
N -220 -160 -220 -60 {
lab=avss}
N -180 -280 -180 -190 {
lab=itail}
N -220 110 -180 110 {
lab=avss}
N -180 110 -110 110 {
lab=avss}
N -180 -280 -110 -280 {
lab=itail}
N -180 -130 -180 -90 {
lab=#net2}
N -140 -160 70 -160 {lab=ena}
N -140 -60 -120 -60 {lab=ncasc}
C {sg13cmos5l_pr/sg13_hv_nmos.sym} -160 60 0 1 {name=M3
w=3u
l=1u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {devices/iopin.sym} -110 110 0 0 {name=p4 lab=avss}
C {devices/ipin.sym} 70 -160 0 1 {name=p5 lab=ena}
C {sg13cmos5l_pr/sg13_hv_nmos.sym} -160 -60 0 1 {name=M6
w=3u
l=1u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_hv_nmos.sym} -160 -160 0 1 {name=M12
w=3u
l=1u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {devices/ipin.sym} -40 60 0 1 {name=p1 lab=nbias}
C {devices/iopin.sym} -110 -280 0 0 {name=p2 lab=itail}
C {devices/ipin.sym} -120 -60 0 1 {name=p7 lab=ncasc}
