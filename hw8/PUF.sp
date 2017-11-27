**PUF Spice file**

**Library Files**
.INCLUDE '/afs/umbc.edu/users/a/k/akaplan1/home/hspice/adder/transistor_model'
.INCLUDE '/afs/umbc.edu/users/a/k/akaplan1/home/hspice/adder/all_gates'

**Sim Options**

.OPTION POST BRIEF PROBE ACCURATE

**Temperature**
.TEMP 45

**Global Node**
.GLOBAL VDD

**Parameters**

**Transient Analysis**

**Sources**

**Model**
**Subcircuit: 2 to 1 Mux**
.SUBCKT MUX2to1_X1  in1     in2     sel     out     VDDx    GNDx

