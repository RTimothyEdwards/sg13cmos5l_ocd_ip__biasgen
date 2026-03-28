#!/bin/env python3
#
# tech_change.py ---
#
# This is a script that roughly converts sky130 schematics to
# IHP sg13cmos5l.  Obviously doing so does not guarantee a working
# circuit, but it can be a time saver.
#
# This script is not comprehensive, but will take care of about
# 90% of the required changes in a schematic.
#
# Note that there is no MiM cap in the sg13cmos5l process, so all
# capacitors are converted to ideal SPICE capacitors, and require
# being replaced with MOScaps or interdigitated metal capacitors,
# as appropriate.
#
# Substitutions made:
#	sky130_fd_pr	--> 	sg13cmos5l_pr
#	sky130_fd_sc_hd_ --> 	sg13cmos5l_
#	sky130_fd_sc_hd	--> 	sg13cmos5l_stdcells
#	pnp_05v5 	-->	pnpMPA
#	nfet_01v8	-->	sg13_lv_nmos
#	pfet_01v8	-->	sg13_lv_pmos
#	nfet_g5v0d10v5	-->	sg13_hv_nmos
#	pfet_g5v0d10v5	-->	sg13_hv_pmos
#	sky130_fd_pr/cap_mim_m3_1  -->	capa
#	res_xhigh_po	-->	rhigh	(see below)
#
# For transistors:
#	W --> w
#	L --> l
#	ad, pd, as, ps, nrd, nrs, sa, sb, sd --> removed
#	mult --> m
#	nf --> ng
#	All dimension values:  Add "u" for microns
#
# For diodes:
#	Replace area/perimeter with "l" and "w" set to 0.78u.
#
# For resistors:
#	res_xhigh_po_*	-->  "*" gets converted to w;  e.g. "0p69" --> w=0.69u	

import glob
import sys
import re

files = glob.glob('*.sch')
modified = False

for file in files:
    with open(file, 'r') as ifile:
        lines = ifile.read().splitlines()

    newlines = []
    for line in lines:
        newline = line
        addline = None

        if newline.startswith('ad='):
            modified = True
            continue
        elif newline.startswith('pd='):
            modified = True
            continue
        elif newline.startswith('as='):
            modified = True
            continue
        elif newline.startswith('ps='):
            modified = True
            continue
        elif newline.startswith('nrd='):
            modified = True
            continue
        elif newline.startswith('sa='):
            modified = True
            continue

        newline = re.sub('sky130_fd_pr/cap_mim_m3_1', 'capa', newline)
        newline = re.sub('sky130_fd_pr/cap_mim_m3_2', 'capa', newline)
        newline = re.sub('sky130_fd_pr', 'sg13cmos5l_pr', newline)
        newline = re.sub('sky130_fd_sc_hd_', 'sg13cmos5l_', newline)
        newline = re.sub('sky130_fd_sc_hd/', 'sg13cmos5l_stdcells/', newline)
        newline = re.sub('pnp_05v5', 'pnpMPA', newline)
        newline = re.sub('_W0p68L0p68', '', newline)
        newline = re.sub('nfet_01v8', 'sg13_lv_nmos', newline)
        newline = re.sub('pfet_01v8', 'sg13_lv_pmos', newline)
        newline = re.sub('nfet_g5v0d10v5', 'sg13_hv_nmos', newline)
        newline = re.sub('pfet_g5v0d10v5', 'sg13_hv_pmos', newline)
        testline = newline
        newline = re.sub('res_xhigh_po_0p35', 'rhigh', newline)
        if testline != newline:
            addline = 'w=0.35u'
        testline = newline
        newline = re.sub('res_xhigh_po_0p69', 'rhigh', newline)
        if testline != newline:
            addline = 'w=0.69u'
        testline = newline
        newline = re.sub('W=', 'w=', newline)
        if testline != newline:
            newline = newline + 'u'
        testline = newline
        newline = re.sub('L=', 'l=', newline)
        if testline != newline:
            newline = newline + 'u'
        if newline.startswith('area='):
            newline = newline + 'p'
        if newline.startswith('perim='):
            newline = newline + 'u'
        newline = re.sub('mult=', 'm=', newline)
        newline = re.sub('nf=', 'ng=', newline)

        newlines.append(newline)
        if addline:
            newlines.append(addline)

        if newline != line:
            modified = True

    if modified:
        print('Overwriting: ' + file)
        with open(file, 'w') as ofile:
            for line in newlines:
                print(line, file=ofile)

sys.exit(0)
