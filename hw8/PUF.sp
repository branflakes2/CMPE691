**PUF Spice file**

**Library Files**
.INCLUDE '~/CMPE691/hw8/all_gates'
.INCLUDE '~/CMPE691/hw8/transistor_model'

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
.SUBCKT MUX2to1_X1  in0     in1     sel     out     VDDx    GNDx
xINV_0      sel     nsel    VDD     GND
xAND_0      nsel    in0     n0      VDDx    GNDx
xAND_1      sel     in1     n1      VDDx    GNDx
xOR_1       n0      n1      out     VDDx    GNDx
.ENDS

**Subcircuit: Arbiter Chain**
.SUBCKT ACHAIN_X1   in  c0  c1  c2  c3  c4  c5  c6  c7  c8  c9  c10 c11 c12 c14 c15 out nout    VDDx    GNDx
xMUX2to1_t0     in      in      c0      m0t     VDDx    GNDx
xMUX2to1_b0     in      in      c0      m0b     VDDx    GNDx
xMUX2to1_t1     m0b     m0t     c1      m1t     VDDx    GNDx
xMUX2to1_b1     m0t     m0b     c1      m1b     VDDx    GNDx    
xMUX2to1_t2     m1b     m1t     c2      m2t     VDDx    GNDx
xMUX2to1_b2     m1t     m1b     c2      m2b     VDDx    GNDx    
xMUX2to1_t3     m2b     m2t     c3      m3t     VDDx    GNDx
xMUX2to1_b3     m2t     m2b     c3      m3b     VDDx    GNDx    
xMUX2to1_t4     m3b     m3t     c4      m4t     VDDx    GNDx
xMUX2to1_b4     m3t     m3b     c4      m4b     VDDx    GNDx    
xMUX2to1_t5     m4b     m4t     c5      m5t     VDDx    GNDx
xMUX2to1_b5     m4t     m4b     c5      m5b     VDDx    GNDx    
xMUX2to1_t6     m5b     m5t     c6      m6t     VDDx    GNDx
xMUX2to1_b6     m5t     m5b     c6      m6b     VDDx    GNDx    
xMUX2to1_t7     m6b     m6t     c7      m7t     VDDx    GNDx
xMUX2to1_b7     m6t     m6b     c7      m7b     VDDx    GNDx    
xMUX2to1_t8     m7b     m7t     c8      m8t     VDDx    GNDx
xMUX2to1_b8     m7t     m7b     c8      m8b     VDDx    GNDx    
xMUX2to1_t9     m8b     m8t     c9      m9t     VDDx    GNDx
xMUX2to1_b9     m8t     m8b     c9      m9b     VDDx    GNDx    
xMUX2to1_t10    m9b     m9t     c10     m10t    VDDx    GNDx
xMUX2to1_b10    m9t     m9b     c10     m10b    VDDx    GNDx    
xMUX2to1_t11    m10b    m10t    c11     m11t    VDDx    GNDx
xMUX2to1_b11    m10t    m10b    c11     m11b    VDDx    GNDx    
xMUX2to1_t12    m11b    m11t    c12     m12t    VDDx    GNDx
xMUX2to1_b12    m11t    m11b    c12     m12b    VDDx    GNDx    
xMUX2to1_t13    m12b    m12t    c13     m13t    VDDx    GNDx
xMUX2to1_b13    m12t    m12b    c13     m13b    VDDx    GNDx    
xMUX2to1_t14    m13b    m13t    c14     m14t    VDDx    GNDx
xMUX2to1_b14    m13t    m13b    c14     m14b    VDDx    GNDx    
xMUX2to1_t15    m14b    m14t    c15     m15t    VDDx    GNDx
xMUX2to1_b15    m14t    m14b    c15     m15b    VDDx    GNDx    
xDFF_0          m15t    m15b    out     nout    VDDx    GNDx
.ENDS
