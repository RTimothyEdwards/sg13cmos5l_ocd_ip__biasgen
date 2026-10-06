
# CACE Summary for sg13cmos5l_ocd_ip__voltgen_v3

**netlist source**: schematic

|      Parameter       |         Tool         |     Result      | Min Limit  |  Min Value   | Typ Target |  Typ Value   | Max Limit  |  Max Value   |  Status  |
| :------------------- | :------------------- | :-------------- | ---------: | -----------: | ---------: | -----------: | ---------: | -----------: | :------: |
| ibias1u_1 at 2x bias | ngspice              | vb1_2x               |               ​ |          ​ |            ​ |          ​ |        2.7 V |          ​ |   Skip 🟧    |
| ibias1u_2 at 2x bias | ngspice              | vb2_2x               |           0.6 V |          ​ |            ​ |          ​ |            ​ |          ​ |   Skip 🟧    |
| class-AB bias at 2x bias | ngspice              | vb3_2x               |           0.6 V |          ​ |            ​ |          ​ |            ​ |          ​ |   Skip 🟧    |
| Leakage at 1.2 V     | ngspice              | leak_1v2_A           |         -1.0 nA |  -0.021 nA |            ​ |          ​ |       1.0 nA |  -0.000 nA |   Pass ✅    |
| Shunt resistance at mid-rail | ngspice              | rshunt_ohm           |          100 MΩ | 21212.600 MΩ |            ​ |          ​ |            ​ |          ​ |   Pass ✅    |


## Plots
