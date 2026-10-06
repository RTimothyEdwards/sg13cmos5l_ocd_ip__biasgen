
# CACE Summary for sg13cmos5l_ocd_ip__voltgen_v2

**netlist source**: schematic

|      Parameter       |         Tool         |     Result      | Min Limit  |  Min Value   | Typ Target |  Typ Value   | Max Limit  |  Max Value   |  Status  |
| :------------------- | :------------------- | :-------------- | ---------: | -----------: | ---------: | -----------: | ---------: | -----------: | :------: |
| vout1 error          | ngspice              | err1_mV              |          -50 mV |          ​ |            ​ |          ​ |        50 mV |          ​ |   Skip 🟧    |
| vout2 error          | ngspice              | err2_mV              |          -50 mV |          ​ |            ​ |          ​ |        50 mV |          ​ |   Skip 🟧    |
| vout1 line regulation | ngspice              | linereg1_mVperV      |        -10 mV/V |          ​ |            ​ |          ​ |      10 mV/V |          ​ |   Skip 🟧    |
| vout2 line regulation | ngspice              | linereg2_mVperV      |        -10 mV/V |          ​ |            ​ |          ​ |      10 mV/V |          ​ |   Skip 🟧    |
| vout1 error          | ngspice              | err1_mV              |         -100 mV |          ​ |            ​ |          ​ |       100 mV |          ​ |   Skip 🟧    |
| vout2 error          | ngspice              | err2_mV              |         -100 mV |          ​ |            ​ |          ​ |       100 mV |          ​ |   Skip 🟧    |
| vout1 output impedance | ngspice              | rout1_kohm           |               ​ |          ​ |            ​ |          ​ |       200 kΩ |   5.623 kΩ |   Pass ✅    |
| vout2 output impedance | ngspice              | rout2_kohm           |               ​ |          ​ |            ​ |          ​ |       200 kΩ |   1.645 kΩ |   Pass ✅    |
| vout1 source limit   | ngspice              | ilim1_src_nA         |          100 nA | 1150870000.000 nA |            ​ |          ​ |            ​ |          ​ |   Pass ✅    |
| vout2 source limit   | ngspice              | ilim2_src_nA         |          100 nA | 9719390000.000 nA |            ​ |          ​ |            ​ |          ​ |   Pass ✅    |
| vout1 PSRR at 1 kHz  | ngspice              | psrr1_1kHz           |           40 dB |          ​ |            ​ |          ​ |            ​ |          ​ |   Skip 🟧    |
| vout2 PSRR at 1 kHz  | ngspice              | psrr2_1kHz           |           40 dB |          ​ |            ​ |          ​ |            ​ |          ​ |   Skip 🟧    |
| vout1 overshoot      | ngspice              | over1_mV             |               ​ |          ​ |            ​ |          ​ |        20 mV |          ​ |   Skip 🟧    |
| vout2 overshoot      | ngspice              | over2_mV             |               ​ |          ​ |            ​ |          ​ |        20 mV |          ​ |   Skip 🟧    |


## Plots
