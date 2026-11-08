#!/bin/bash
#
# Open Circuit Design bias generator library sg13cmos5l_ocd_ip__biasgen
#
# Project setup:
#
# Source this script to from the top level directory.  This creates
# local libraries to hold .mag views of the IHP library cells read
# from the IHP open PDK sources.  This avoids the need to re-import
# GDS every time magic is run.
#
# The created directories are in .gitignore so they do not become
# part of the project repository, but can be generated on the fly
# as needed.  This script can be run at any time without affecting
# the rest of the project.
#
# Usage:
#	setenv PDK <path/to/IHP/pdk>
#	./setup.sh
#
#	Run this script in the repository top level directory.
#
# Warning:
#	The generated .mag files contain references back to the IHP
#	PDK.  If the IHP PDK gets updated, then the references may
#	become invalid, and this setup should be re-run.

export PDK_ROOT=${PDK_ROOT:-/home/tim/gits}
export PDK=${PDK:-ihp-sg13cmos5l}

cd magic

# Import the standard cell library
# Create directory under magic/ for the library
mkdir -p sg13cmos5l_stdcell

magic -dnull -noconsole -rcfile ${PDK_ROOT}/${PDK}/libs.tech/magic/${PDK}.magicrc << EOF
drc off
crashbackups stop
locking disable
# 
# Prepare for library import
gds readonly true
gds rescale false
gds drccheck false
cd sg13cmos5l_stdcell
gds read ${PDK_ROOT}/${PDK}/libs.ref/sg13cmos5l_stdcell/gds/sg13cmos5l_stdcell.gds
load CoreSite
cellname delete {(UNNAMED)}

# Annotate with LEF
lef read ${PDK_ROOT}/${PDK}/libs.ref/sg13cmos5l_stdcell/lef/sg13cmos5l_stdcell.lef

# Annotate with SPICE
readspice ${PDK_ROOT}/${PDK}/libs.ref/sg13cmos5l_stdcell/spice/sg13cmos5l_stdcell.spice

# Write all the .mag files out
writeall force
EOF

echo "Done!"
exit 0
