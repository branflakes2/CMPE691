******** 4-bit Adder ***********
******* Library Files *********
.INCLUDE '~/CMPE691/hw8/all_gates'
.INCLUDE '~/CMPE691/hw8/transistor_model'
******* Simulation Control Options *********
.OPTION POST BRIEF PROBE ACCURATE INGOLD=2 MEASDGT=8
******* Temperature *********
***.TEMP sets the circuit temperature
.TEMP 45
******* Global Node *********
***.GLOBAL is used to define nodes and sources to enable their use in subckt nodes
.GLOBAL VDD
******* Parameters *********
***.PARAM is used to assign values to a parameters
*.PARAM LMIN=50E-09, vth_pmos=-0.3021, vth_nmos=0.322, toxm_pmos=1.26e-009,toxm_nmos=1.14e-09
.PARAM LMIN=GAUSS(50E-09,0.1,3), vth_pmos=GAUSS(-0.3021,0.1,1),vth_nmos=GAUSS(0.322,0.1,1), toxm_pmos=GAUSS(1.26E-009,0.01,1), toxm_nmos=GAUSS(1.14E-09,0.01,1)
******* Transient Analysis *********
.TRAN 2n 200n START=0n SWEEP MONTE=30
.PRINT TRAN V(a0) V(a1) V(a2) V(a3) V(b0) V(b1) V(b2) V(b3) V(cin)
+ V(sum0) V(sum1) V(sum2) V(sum3) V(cout)
.MEASURE TRAN rise_difference TRIG V(b0) VAL=0.55 RISE=1 TARG V(sum0) VAL=0.55 RISE=2
.MEASURE TRAN fall_difference TRIG V(a0) VAL=0.55 FALL=1 TARG V(sum0) VAL=0.55 FALL=1
.MEASURE TRAN rise_time TRIG V(sum0) VAL=0.11 RISE=2 TARG V(sum0) VAL=0.99 RISE=2
.MEASURE TRAN fall_time TRIG V(sum0) VAL=0.99 FALL=1 TARG V(sum0) VAL=0.11 FALL=1
******** Sources ***********
Vsupply VDD 0 1.1
Va0 a0 GND PULSE(0 1.1 0n 100p 100p 40n 80.2n)
Va1 a1 GND PULSE(0 1.1 10n 100p 100p 40n 80.2n)
Va2 a2 GND PULSE(0 1.1 30n 100p 100p 40n 80.2n)
Va3 a3 GND PULSE(0 1.1 50n 100p 100p 40n 80.2n)
Vb0 b0 GND PULSE(0 1.1 60n 100p 100p 50n 100.2n)
Vb1 b1 GND PULSE(0 1.1 80n 100p 100p 50n 100.2n)
Vb2 b2 GND PULSE(0 1.1 100n 100p 100p 50n 100.2n)
Vb3 b3 GND PULSE(0 1.1 120n 100p 100p 50n 100.2n)
Vcin cin GND PWL(0n 0 110n 0 110.1n 1.1 160n 1.1)
******** Model *********
*** Subcircuit: Full Adder
.SUBCKT ADDER_X1 a b cinx sum coutx VDDx GNDx
xXOR_0 a b temp0 VDDx GNDx XOR_X1
xXOR_1 cinx temp0 sum VDDx GNDx XOR_X1
xAND_0 a b temp1 VDDx GNDx AND2_X1
xAND_1 a cinx temp2 VDDx GNDx AND2_X1
xAND_2 b cinx temp3 VDDx GNDx AND2_X1
xOR_0 temp1 temp2 temp4 VDDx GNDx OR2_X1
xOR_1 temp3 temp4 coutx VDDx GNDx OR2_X1
.ENDS
*** Netlist: 4-bit Adder
xADDER_0 a0 b0 cin sum0 t0 VDD GND ADDER_X1
xADDER_1 a1 b1 t0 sum1 t1 VDD GND ADDER_X1
xADDER_2 a2 b2 t1 sum2 t2 VDD GND ADDER_X1
xADDER_3 a3 b3 t2 sum3 cout VDD GND ADDER_X1
.END
