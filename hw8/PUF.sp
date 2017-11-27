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
.PARAM LMIN=GAUSS(50E-09,0.1,3), vth_pmos=GAUSS(-0.3021,0.1,1), vth_nmos=GAUSS(0.322,0.1,1), toxm_pmos=GAUSS(1.26E-009,0.01,1), toxm_nmos=GAUSS(1.14E-09,0.01,1)

**Transient Analysis**
.TRAN 50p 80n START=0n SWEEP MONTE=8
.PRINT TRAN V(in) V(out0) V(out1) V(out2) V(out3) V(out4) V(out5) V(out6) V(out7)
.MEASURE TRAN rise_difference TRIG V(b0) VAL=0.55 RISE=1 TARG V(sum0) VAL=0.55 RISE=2
.MEASURE TRAN fall_difference TRIG V(a0) VAL=0.55 FALL=1 TARG V(sum0) VAL=0.55 FALL=1
.MEASURE TRAN rise_time TRIG V(sum0) VAL=0.11 RISE=2 TARG V(sum0) VAL=0.99 RISE=2
.MEASURE TRAN fall_time TRIG V(sum0) VAL=0.99 FALL=1 TARG V(sum0) VAL=0.11 FALL=1

**Sources**
Vs      VDD GND DC 1.1
Vclk    in  GND PULSE(0, 1.1, 1n, 100p, 100p, 2.5n, 5n)
Vc0 c0 GND PWL(0n 0 5ns 0 5.1n 0 10n 0 10.1n 1.1 15n 1.1 15.1n 1.1 20n 1.1 20.1n 1.1 25n 1.1 25.1n 1.1 30n 1.1 30.1n 1.1 35n 1.1 35.1n 1.1 40n 1.1 40.1n 0 45n 0 45.1n 0 50n 0 50.1n 0 55n 0 55.1n 0 60n 0 60.1n 0 65n 0 65.1n 0 70n 0 70.1n 1.1 75n 1.1)
Vc1 c1 GND PWL(0n 1.1 5ns 1.1 5.1n 1.1 10n 1.1 10.1n 0 15n 0 15.1n 0 20n 0 20.1n 1.1 25n 1.1 25.1n 1.1 30n 1.1 30.1n 0 35n 0 35.1n 0 40n 0 40.1n 0 45n 0 45.1n 0 50n 0 50.1n 1.1 55n 1.1 55.1n 1.1 60n 1.1 60.1n 1.1 65n 1.1 65.1n 1.1 70n 1.1 70.1n 0 75n 0)
Vc2 c2 GND PWL(0n 0 5ns 0 5.1n 0 10n 0 10.1n 0 15n 0 15.1n 0 20n 0 20.1n 0 25n 0 25.1n 0 30n 0 30.1n 0 35n 0 35.1n 0 40n 0 40.1n 0 45n 0 45.1n 0 50n 0 50.1n 0 55n 0 55.1n 0 60n 0 60.1n 0 65n 0 65.1n 0 70n 0 70.1n 1.1 75n 1.1)
Vc3 c3 GND PWL(0n 0 5ns 0 5.1n 0 10n 0 10.1n 1.1 15n 1.1 15.1n 0 20n 0 20.1n 1.1 25n 1.1 25.1n 1.1 30n 1.1 30.1n 1.1 35n 1.1 35.1n 1.1 40n 1.1 40.1n 1.1 45n 1.1 45.1n 1.1 50n 1.1 50.1n 1.1 55n 1.1 55.1n 1.1 60n 1.1 60.1n 0 65n 0 65.1n 0 70n 0 70.1n 0 75n 0)
Vc4 c4 GND PWL(0n 0 5ns 0 5.1n 0 10n 0 10.1n 1.1 15n 1.1 15.1n 1.1 20n 1.1 20.1n 1.1 25n 1.1 25.1n 1.1 30n 1.1 30.1n 0 35n 0 35.1n 0 40n 0 40.1n 1.1 45n 1.1 45.1n 1.1 50n 1.1 50.1n 1.1 55n 1.1 55.1n 1.1 60n 1.1 60.1n 0 65n 0 65.1n 0 70n 0 70.1n 1.1 75n 1.1)
Vc5 c5 GND PWL(0n 1.1 5ns 1.1 5.1n 1.1 10n 1.1 10.1n 0 15n 0 15.1n 0 20n 0 20.1n 1.1 25n 1.1 25.1n 1.1 30n 1.1 30.1n 1.1 35n 1.1 35.1n 1.1 40n 1.1 40.1n 1.1 45n 1.1 45.1n 1.1 50n 1.1 50.1n 0 55n 0 55.1n 0 60n 0 60.1n 0 65n 0 65.1n 0 70n 0 70.1n 0 75n 0)
Vc6 c6 GND PWL(0n 0 5ns 0 5.1n 1.1 10n 1.1 10.1n 0 15n 0 15.1n 0 20n 0 20.1n 0 25n 0 25.1n 0 30n 0 30.1n 0 35n 0 35.1n 0 40n 0 40.1n 1.1 45n 1.1 45.1n 1.1 50n 1.1 50.1n 0 55n 0 55.1n 0 60n 0 60.1n 0 65n 0 65.1n 0 70n 0 70.1n 0 75n 0)
Vc7 c7 GND PWL(0n 1.1 5ns 1.1 5.1n 1.1 10n 1.1 10.1n 0 15n 0 15.1n 0 20n 0 20.1n 0 25n 0 25.1n 0 30n 0 30.1n 0 35n 0 35.1n 0 40n 0 40.1n 1.1 45n 1.1 45.1n 1.1 50n 1.1 50.1n 0 55n 0 55.1n 0 60n 0 60.1n 1.1 65n 1.1 65.1n 1.1 70n 1.1 70.1n 1.1 75n 1.1)
Vc8 c8 GND PWL(0n 0 5ns 0 5.1n 0 10n 0 10.1n 0 15n 0 15.1n 0 20n 0 20.1n 0 25n 0 25.1n 0 30n 0 30.1n 0 35n 0 35.1n 0 40n 0 40.1n 0 45n 0 45.1n 0 50n 0 50.1n 1.1 55n 1.1 55.1n 1.1 60n 1.1 60.1n 1.1 65n 1.1 65.1n 1.1 70n 1.1 70.1n 1.1 75n 1.1)
Vc9 c9 GND PWL(0n 1.1 5ns 1.1 5.1n 1.1 10n 1.1 10.1n 1.1 15n 1.1 15.1n 1.1 20n 1.1 20.1n 1.1 25n 1.1 25.1n 1.1 30n 1.1 30.1n 1.1 35n 1.1 35.1n 1.1 40n 1.1 40.1n 0 45n 0 45.1n 0 50n 0 50.1n 0 55n 0 55.1n 0 60n 0 60.1n 1.1 65n 1.1 65.1n 1.1 70n 1.1 70.1n 1.1 75n 1.1)
Vc10 c10 GND PWL(0n 1.1 5ns 1.1 5.1n 1.1 10n 1.1 10.1n 1.1 15n 1.1 15.1n 1.1 20n 1.1 20.1n 0 25n 0 25.1n 0 30n 0 30.1n 0 35n 0 35.1n 0 40n 0 40.1n 1.1 45n 1.1 45.1n 1.1 50n 1.1 50.1n 1.1 55n 1.1 55.1n 1.1 60n 1.1 60.1n 1.1 65n 1.1 65.1n 1.1 70n 1.1 70.1n 1.1 75n 1.1)
Vc11 c11 GND PWL(0n 0 5ns 0 5.1n 0 10n 0 10.1n 0 15n 0 15.1n 0 20n 0 20.1n 1.1 25n 1.1 25.1n 1.1 30n 1.1 30.1n 0 35n 0 35.1n 0 40n 0 40.1n 0 45n 0 45.1n 0 50n 0 50.1n 1.1 55n 1.1 55.1n 0 60n 0 60.1n 1.1 65n 1.1 65.1n 0 70n 0 70.1n 0 75n 0)
Vc12 c12 GND PWL(0n 0 5ns 0 5.1n 0 10n 0 10.1n 1.1 15n 1.1 15.1n 1.1 20n 1.1 20.1n 0 25n 0 25.1n 0 30n 0 30.1n 1.1 35n 1.1 35.1n 0 40n 0 40.1n 1.1 45n 1.1 45.1n 1.1 50n 1.1 50.1n 1.1 55n 1.1 55.1n 1.1 60n 1.1 60.1n 0 65n 0 65.1n 0 70n 0 70.1n 0 75n 0)
Vc13 c13 GND PWL(0n 1.1 5ns 1.1 5.1n 1.1 10n 1.1 10.1n 0 15n 0 15.1n 0 20n 0 20.1n 0 25n 0 25.1n 0 30n 0 30.1n 0 35n 0 35.1n 0 40n 0 40.1n 0 45n 0 45.1n 1.1 50n 1.1 50.1n 0 55n 0 55.1n 0 60n 0 60.1n 0 65n 0 65.1n 0 70n 0 70.1n 0 75n 0)
Vc14 c14 GND PWL(0n 1.1 5ns 1.1 5.1n 1.1 10n 1.1 10.1n 0 15n 0 15.1n 0 20n 0 20.1n 0 25n 0 25.1n 0 30n 0 30.1n 1.1 35n 1.1 35.1n 1.1 40n 1.1 40.1n 0 45n 0 45.1n 0 50n 0 50.1n 1.1 55n 1.1 55.1n 1.1 60n 1.1 60.1n 1.1 65n 1.1 65.1n 1.1 70n 1.1 70.1n 1.1 75n 1.1)
Vc15 c15 GND PWL(0n 1.1 5ns 1.1 5.1n 1.1 10n 1.1 10.1n 1.1 15n 1.1 15.1n 1.1 20n 1.1 20.1n 1.1 25n 1.1 25.1n 0 30n 0 30.1n 0 35n 0 35.1n 0 40n 0 40.1n 1.1 45n 1.1 45.1n 1.1 50n 1.1 50.1n 0 55n 0 55.1n 0 60n 0 60.1n 0 65n 0 65.1n 0 70n 0 70.1n 1.1 75n 1.1)


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

**Netlist: 8 bit PUF with 16 bit challenge**
xACHAIN_0   in  c0  c1  c2  c3  c4  c5  c6  c7  c8  c9  c10 c11 c12 c13 c14 c15 out0    nout0   VDD     GND
xACHAIN_1   in  c0  c1  c2  c3  c4  c5  c6  c7  c8  c9  c10 c11 c12 c13 c14 c15 out1    nout1   VDD     GND
xACHAIN_2   in  c0  c1  c2  c3  c4  c5  c6  c7  c8  c9  c10 c11 c12 c13 c14 c15 out2    nout2   VDD     GND
xACHAIN_3   in  c0  c1  c2  c3  c4  c5  c6  c7  c8  c9  c10 c11 c12 c13 c14 c15 out3    nout3   VDD     GND
xACHAIN_4   in  c0  c1  c2  c3  c4  c5  c6  c7  c8  c9  c10 c11 c12 c13 c14 c15 out4    nout4   VDD     GND
xACHAIN_5   in  c0  c1  c2  c3  c4  c5  c6  c7  c8  c9  c10 c11 c12 c13 c14 c15 out5    nout5   VDD     GND
xACHAIN_6   in  c0  c1  c2  c3  c4  c5  c6  c7  c8  c9  c10 c11 c12 c13 c14 c15 out6    nout6   VDD     GND
xACHAIN_7   in  c0  c1  c2  c3  c4  c5  c6  c7  c8  c9  c10 c11 c12 c13 c14 c15 out7    nout7   VDD     GND

.END
