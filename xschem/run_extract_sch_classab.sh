#!/bin/bash
mkdir -p ../netlist/schematic

project=sg13cmos5l_ocd_ip__classab_buffer

export PDK_ROOT=${PDK_ROOT:-/home/tim/gits}
export PDK=${PDK:-ihp-sg13cmos5l}

xschem -n -s -r -x -q --tcl "set top_is_subckt 1" --rcfile $PDK_ROOT/$PDK/libs.tech/xschem/xschemrc -o ../netlist/schematic -N $project.spice $project.sch

echo "Done!"
exit 0
