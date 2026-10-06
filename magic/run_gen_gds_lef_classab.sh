#!/bin/bash
#
# Run GDS and LEF generation on the class-AB follower-amplifier
#
export PDK_ROOT=${PDK_ROOT:-/home/tim/gits}
export PDK=${PDK:-ihp-sg13cmos5l}

PROJECT=sg13cmos5l_ocd_ip__classab_buffer

echo "Running GDS and LEF generation on ${project}"
magic -dnull -noconsole -rcfile ${PDK_ROOT}/${PDK}/libs.tech/magic/${PDK}.magicrc << EOF
# Read the standard cells from foundry GDS
gds read ${PDK_ROOT}/${PDK}/libs.ref/sg13cmos5l_stdcell/gds/sg13cmos5l_stdcell.gds 
load ${PROJECT}
select top cell
expand
select top cell
gds compress 9
gds write ${PROJECT}
select top cell
lef write -hide
quit -noprompt
EOF
rm -rf extfiles
mv ${PROJECT}.gds.gz ../gds/
mv ${PROJECT}.lef ../lef/
echo "Done"
