#!/bin/bash
#
# Run layout extraction on the voltage bias generator
#
export PDK_ROOT=${PDK_ROOT:-/home/tim/gits}
export PDK=${PDK:-ihp-sg13cmos5l}

project=sg13cmos5l_ocd_ip__voltgen_v3

echo "Running netlist extraction on $project"
magic -dnull -noconsole -rcfile ${PDK_ROOT}/${PDK}/libs.tech/magic/${PDK}.magicrc << EOF
addpath ../../../magic/sg13cmos5l_stdcell
load $project
select top cell
extract path extfiles
extract do unique
extract no all
extract all
ext2spice lvs
ext2spice -p extfiles -o ../netlist/layout/${project}.spice
quit -noprompt
EOF
rm -rf extfiles
echo "Done"
