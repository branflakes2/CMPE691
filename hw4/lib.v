/*
 * 180 nm Generic Library
 * Download from http://crete.cadence.com
 *
 * Export of the technology contained therein is governed by US Export
 * Regulations. Diversion contrary to U.S. law is prohibited. Permission to make
 * copies, either paper or electronic, of this work for personal or classroom use
 * is granted without fee provided that the copies are not made or distributed for
 * profit or commercial advantage. Users are free to use or modify content as
 * appropriate as long as this notice appears in it. Information is provided 'as
 * is' without warranty of any kind. No statement is made and no attempt has been
 * made to examine the information, either with respect to operability, origin,
 * authorship, or otherwise. Please use this information at your own risk. We
 * recommend using it on a copy of your data to be sure you understand what it
 * does under your conditions. Keep your master intact until you are satisfied
 * with the use of this information within your environment. Please report any
 * problems or enhancement requests to crete@cadence.com.
 * 
 * Copyright 2003, Cadence Design Systems - All Rights Reserved
 * 
 */


module ADDHX1 (A, B, CO, S);
input  A ;
input  B ;
output CO ;
output S ;

   and (CO, A, B);
   xor (S, A, B);

endmodule




module ADDFX1 (A, B, CI, CO, S);
input  A ;
input  B ;
input  CI ;
output CO ;
output S ;

   and (I0_out, A, B);
   and (I1_out, B, CI);
   and (I3_out, CI, A);
   or  (CO, I0_out, I1_out, I3_out);
   xor (I5_out, A, B);
   xor (S, I5_out, CI);

endmodule




module AND2X1 (A, B, Q);
input  A ;
input  B ;
output Q ;

   and (Q, A, B);

endmodule






module ISOLANDX1 (D, ISO, Q);
input  D ;
input  ISO ;
output Q ;

   and (Q, D, ISO);

endmodule





module AND4X1 (A, B, C, D, Q);
input  A ;
input  B ;
input  C ;
input  D ;
output Q ;

   and (Q, A, B, C, D);

endmodule






module AND3X1 (A, B, C, Q);
input  A ;
input  B ;
input  C ;
output Q ;

   and (Q, A, B, C);

endmodule






module AOI21X1 (A, B, C, Q);
input  A ;
input  B ;
input  C ;
output Q ;

   and (I0_out, A, B);
   or  (I1_out, I0_out, C);
   not (Q, I1_out);

endmodule





module AO222X1 (A, B, C, D, E, F, Q);
input  A ;
input  B ;
input  C ;
input  D ;
input  E ;
input  F ;
output Q ;

   and (I0_out, A, B);
   and (I1_out, C, D);
   and (I2_out, E, F);
   or  (Q, I0_out, I1_out, I2_out);

endmodule





module OA222X1 (A, B, C, D, E, F, Q);
input  A ;
input  B ;
input  C ;
input  D ;
input  E ;
input  F ;
output Q ;

   or (I0_out, A, B);
   or (I1_out, C, D);
   or (I2_out, E, F);
   and  (Q, I0_out, I1_out, I2_out);

endmodule





module AO22X1 (A, B, C, D, Q);
input  A ;
input  B ;
input  C ;
input  D ;
output Q ;

   and (I0_out, A, B);
   and (I1_out, C, D);
   or  (Q, I0_out, I1_out);

endmodule





module OA22X1 (A, B, C, D, Q);
input  A ;
input  B ;
input  C ;
input  D ;
output Q ;

   or (I0_out, A, B);
   or (I1_out, C, D);
   and  (Q, I0_out, I1_out);

endmodule




module AO221X1 (A, B, C, D, E, Q);
input  A ;
input  B ;
input  C ;
input  D ;
input  E ;
output Q ;

   and (I0_out, A, B);
   and (I1_out, C, D);
   or  (Q, I0_out, I1_out, E);

endmodule





module AOI221X1 (A, B, C, D, E, Q);
input  A ;
input  B ;
input  C ;
input  D ;
input  E ;
output Q ;

   and (I0_out, A, B);
   and (I1_out, C, D);
   or  (I2_out, I0_out, I1_out, E);
   not (Q, I2_out);

endmodule





module AOI222X1 (A, B, C, D, E, F, Q);
input  A ;
input  B ;
input  C ;
input  D ;
input  E ;
input  F ;
output Q ;

   and (I0_out, A, B);
   and (I1_out, C, D);
   and (I2_out, E, F);
   or  (I3_out, I0_out, I1_out, I2_out);
   not (Q, I3_out);

endmodule






module AOI22X1 (A, B, C, D, Q);
input  A ;
input  B ;
input  C ;
input  D ;
output Q ;

   and (I0_out, C, D);
   and (I1_out, A, B);
   or  (I2_out, I0_out, I1_out);
   not (Q, I2_out);

endmodule






module BUFX1 (A, Q);
input  A ;
output Q ;

   buf (Q, A);

endmodule




module BUFX3 (A, Q);
input  A ;
output Q ;

   buf (Q, A);

endmodule




module CLKBUFX1 (A, Q);
input  A ;
output Q ;

   buf (Q, A);

endmodule




module CLKBUFX2 (A, Q);
input  A ;
output Q ;

   buf (Q, A);

endmodule




module CLKBUFX3 (A, Q);
input  A ;
output Q ;

   buf (Q, A);

endmodule




module DFFSRX1 (CK, D, RN, SN, Q, QN);
input  CK ;
input  D ;
input  RN ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (NET0131_, D_, CK, I0_SET, I0_CLEAR, NOTIFIER);
   udp_dff (P0001_, D, CK, I0_CLEAR, I0_SET, NOTIFIER);
   not (D_, D);
   not (NET0131, NET0131_);
   not (P0001, P0001_);
   buf (Q, NET0131);
   buf (QN, P0001);
   not (I12_out, D);
   and (D_EQ_0_AN_RN_EQ_1, I12_out, RN);
   and (D_EQ_1_AN_SN_EQ_1, D, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);

endmodule




module DFFX1 (CK, D, Q, QN);
input  CK ;
input  D ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_dff (P0001, D, CK, 1'B0, 1'B0, NOTIFIER);
   not (P0000, P0001);
   not (Q, P0000);
   buf (QN, P0000);

endmodule




module INVX1 (IN, Q);
input  IN ;
output Q ;

   not (Q, IN);

endmodule



module NBUFFX1 (IN, Q);
input  IN ;
output Q ;

   not (I1_out, IN);
   not (Q, I1_out);

endmodule




module INVX2 (A, Q);
input  A ;
output Q ;

   not (Q, A);

endmodule




module INVX4 (A, Q);
input  A ;
output Q ;

   not (Q, A);

endmodule




module INVX8 (A, Q);
input  A ;
output Q ;

   not (Q, A);

endmodule




module MX2X1 (A, B, S0, Q);
input  A ;
input  B ;
input  S0 ;
output Q ;

   udp_mux2 (Q, A, B, S0);

endmodule




module NAND2X1 (A, B, Q);
input  A ;
input  B ;
output Q ;

   and (I0_out, A, B);
   not (Q, I0_out);
   

endmodule




module NAND2X2 (A, B, Q);
input  A ;
input  B ;
output Q ;

   and (I0_out, A, B);
   not (Q, I0_out);

endmodule




module NAND3X1 (A, B, C, Q);
input  A ;
input  B ;
input  C ;
output Q ;

   and (I1_out, A, B, C);
   not (Q, I1_out);

endmodule




module NAND4X1 (A, B, C, D, Q);
input  A ;
input  B ;
input  C ;
input  D ;
output Q ;

   and (I2_out, A, B, C, D);
   not (Q, I2_out);

endmodule




module NOR2X1 (A, B, Q);
input  A ;
input  B ;
output Q ;

   or  (I0_out, A, B);
   not (Q, I0_out);

endmodule




module NOR4X1 (A, B, C, D, Q);
input  A ;
input  B ;
input  C ;
input  D ;
output Q ;

   or  (I0_out, A, B, C, D);
   not (Q, I0_out);

endmodule




module NOR3X1 (A, B, C, Q);
input  A ;
input  B ;
input  C ;
output Q ;

   or  (I1_out, A, B, C);
   not (Q, I1_out);

   /*specify
     // delay parameters
     specparam
       tplhl$A$Q = 0.077:0.077:0.077,
       tphlh$A$Q = 0.053:0.053:0.053,
       tplhl$B$Q = 0.062:0.062:0.062,
       tphlh$B$Q = 0.043:0.043:0.043,
       tplhl$C$Q = 0.036:0.036:0.036,
       tphlh$C$Q = 0.024:0.024:0.024;

     // path delays
     (A *> Q) = (tphlh$A$Q, tplhl$A$Q);
     (B *> Q) = (tphlh$B$Q, tplhl$B$Q);
     (C *> Q) = (tphlh$C$Q, tplhl$C$Q);

   endspecify*/

endmodule





module OAI21X1 (A, B, C, Q);
input  A ;
input  B ;
input  C ;
output Q ;

   or  (I0_out, A, B);
   and (I1_out, I0_out, C);
   not (Q, I1_out);

  /* specify
     // delay parameters
     specparam
       tplhl$A0$Q = 0.043:0.043:0.043,
       tphlh$A0$Q = 0.036:0.036:0.036,
       tplhl$A1$Q = 0.061:0.061:0.061,
       tphlh$A1$Q = 0.045:0.045:0.045,
       tplhl$B0$Q = 0.032:0.045:0.058,
       tphlh$B0$Q = 0.02:0.021:0.021;

     // path delays
     (A0 *> Q) = (tphlh$A0$Q, tplhl$A0$Q);
     (A1 *> Q) = (tphlh$A1$Q, tplhl$A1$Q);
     (B0 *> Q) = (tphlh$B0$Q, tplhl$B0$Q);

   endspecify*/

endmodule





module OA221X1 (A, B, C, D, E, Q);
input  A ;
input  B ;
input  C ;
input  D ;
input  E ;
output Q ;

   or  (I0_out, A, B);
   or  (I1_out, C, D);
   and (Q, I0_out, I1_out, E);

  /* specify
     // delay parameters
     specparam
       tplhl$A0$Q = 0.043:0.043:0.043,
       tphlh$A0$Q = 0.036:0.036:0.036,
       tplhl$A1$Q = 0.061:0.061:0.061,
       tphlh$A1$Q = 0.045:0.045:0.045,
       tplhl$B0$Q = 0.032:0.045:0.058,
       tphlh$B0$Q = 0.02:0.021:0.021;

     // path delays
     (A0 *> Q) = (tphlh$A0$Q, tplhl$A0$Q);
     (A1 *> Q) = (tphlh$A1$Q, tplhl$A1$Q);
     (B0 *> Q) = (tphlh$B0$Q, tplhl$B0$Q);

   endspecify*/

endmodule







module OAI221X1 (A, B, C, D, E, Q);
input  A ;
input  B ;
input  C ;
input  D ;
input  E ;
output Q ;

   or  (I0_out, A, B);
   or  (I1_out, C, D);
   and (I2_out, I0_out, I1_out, E);
   not (Q, I2_out);
   
  /* specify
     // delay parameters
     specparam
       tplhl$A0$Q = 0.043:0.043:0.043,
       tphlh$A0$Q = 0.036:0.036:0.036,
       tplhl$A1$Q = 0.061:0.061:0.061,
       tphlh$A1$Q = 0.045:0.045:0.045,
       tplhl$B0$Q = 0.032:0.045:0.058,
       tphlh$B0$Q = 0.02:0.021:0.021;

     // path delays
     (A0 *> Q) = (tphlh$A0$Q, tplhl$A0$Q);
     (A1 *> Q) = (tphlh$A1$Q, tplhl$A1$Q);
     (B0 *> Q) = (tphlh$B0$Q, tplhl$B0$Q);

   endspecify*/

endmodule





module OA21X1 (A, B, C, Q);
input  A ;
input  B ;
input  C ;
output Q ;

   or  (I0_out, A, B);
   and (Q, I0_out, C);

  /* specify
     // delay parameters
     specparam
       tplhl$A0$Q = 0.043:0.043:0.043,
       tphlh$A0$Q = 0.036:0.036:0.036,
       tplhl$A1$Q = 0.061:0.061:0.061,
       tphlh$A1$Q = 0.045:0.045:0.045,
       tplhl$B0$Q = 0.032:0.045:0.058,
       tphlh$B0$Q = 0.02:0.021:0.021;

     // path delays
     (A0 *> Q) = (tphlh$A0$Q, tplhl$A0$Q);
     (A1 *> Q) = (tphlh$A1$Q, tplhl$A1$Q);
     (B0 *> Q) = (tphlh$B0$Q, tplhl$B0$Q);

   endspecify*/

endmodule





module AO21X1 (A, B, C, Q);
input  A ;
input  B ;
input  C ;
output Q ;

   and  (I0_out, A, B);
   or (Q, I0_out, C);

endmodule






module OAI22X1 (A, B, C, D, Q);
input  A ;
input  B ;
input  C ;
input  D ;
output Q ;

   or  (I0_out, C, D);
   or  (I1_out, A, B);
   and (I2_out, I0_out, I1_out);
   not (Q, I2_out);

endmodule





module LSDNENX1(D, ENB, Q);
input D;
input ENB;
output Q;

	not (I0_out, ENB);
	or  (Q, I0_out, D);
		
endmodule




/*
module DFFNX2(CLK,D,Q);

	input D, CLK; 
	output Q;
	reg Q;

	always @ (posedge CLK)
	  Q <= D;

endmodule
*/

module DFFNX2 (CLK, D, Q);
input  CLK ;
input  D ;
output Q ;
reg NOTIFIER ;

   udp_dff (P0001, D, CLK, 1'B0, 1'B0, NOTIFIER);
   not (P0000, P0001);
   not (Q, P0000);

  /* specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.11:0.11:0.11,
       tplhl$CK$Q = 0.13:0.13:0.13,
       tpllh$CK$QN = 0.15:0.15:0.15,
       tplhl$CK$QN = 0.13:0.13:0.13,
       tminpwh$CK = 0.056:0.1:0.15,
       tminpwl$CK = 0.063:0.082:0.1,
       tsetup_negedge$D$CK = 0.12:0.12:0.12,
       thold_negedge$D$CK = 0:0:0,
       tsetup_posedge$D$CK = 0.12:0.12:0.12,
       thold_posedge$D$CK = 0:0:0;

     // path delays
     if (CK == 1'b1)
       (CK *> Q) = (tpllh$CK$Q, tplhl$CK$Q);
     if (CK == 1'b1)
       (CK *> QN) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify*/

endmodule




/*
module SDFFX1(D,SI,SE,CLK,Q,QN);

	input D, CLK, SI, SE; 
	output Q, QN;
	reg Q, QN;

	not(notSE, SE);
	and(and1, D, notSE);
	and(and2, SE, SI);
	or(Din, and1, and2);
	not(Qn,Q);
	
	always @ (posedge CLK)
	  Q <= Din;

	  
endmodule
*/



module SDFFX1 (D,SI,SE,CLK,Q,QN);
input  CLK ;
input  D ;
input  SE ;
input  SI ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_mux2 (new_D, D, SI, SE);
   udp_dff (P0001, new_D, CLK, 1'B0, 1'B0, NOTIFIER);
   not (P0000, P0001);
   not (Q, P0000);
   buf (QN, P0000);

  /* specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.11:0.11:0.11,
       tplhl$CK$Q = 0.13:0.13:0.13,
       tpllh$CK$QN = 0.15:0.15:0.15,
       tplhl$CK$QN = 0.13:0.13:0.13,
       tminpwh$CK = 0.056:0.1:0.15,
       tminpwl$CK = 0.063:0.082:0.1,
       tsetup_negedge$D$CK = 0.12:0.12:0.12,
       thold_negedge$D$CK = 0:0:0,
       tsetup_posedge$D$CK = 0.12:0.12:0.12,
       thold_posedge$D$CK = 0:0:0;

     // path delays
     if (CK == 1'b1)
       (CK *> Q) = (tpllh$CK$Q, tplhl$CK$Q);
     if (CK == 1'b1)
       (CK *> QN) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify*/

endmodule




module MUX21X2(A,B,S,Q);
input A, B, S ;
output Q;
reg  Q;

	not (I0_out, S);
	and (I1_out, I0_out, A);
	and (I2_out, S, B);
	or (Q, I1_out, I2_out);

endmodule //End Of Module mux




module OAI33X1 (A0, A1, A2, B0, B1, B2, Q);
input  A0 ;
input  A1 ;
input  A2 ;
input  B0 ;
input  B1 ;
input  B2 ;
output Q ;

   or  (I1_out, B0, B1, B2);
   or  (I3_out, A0, A1, A2);
   and (I4_out, I1_out, I3_out);
   not (Q, I4_out);

  /* specify
     // delay parameters
     specparam
       tplhl$A0$Q = 0.082:0.11:0.13,
       tphlh$A0$Q = 0.1:0.11:0.12,
       tplhl$A1$Q = 0.099:0.13:0.16,
       tphlh$A1$Q = 0.12:0.13:0.14,
       tplhl$A2$Q = 0.11:0.14:0.18,
       tphlh$A2$Q = 0.13:0.14:0.15,
       tplhl$B0$Q = 0.093:0.12:0.14,
       tphlh$B0$Q = 0.12:0.13:0.14,
       tplhl$B1$Q = 0.11:0.14:0.17,
       tphlh$B1$Q = 0.14:0.15:0.16,
       tplhl$B2$Q = 0.12:0.15:0.19,
       tphlh$B2$Q = 0.15:0.16:0.17;

     // path delays
     (A0 *> Q) = (tphlh$A0$Q, tplhl$A0$Q);
     (A1 *> Q) = (tphlh$A1$Q, tplhl$A1$Q);
     (A2 *> Q) = (tphlh$A2$Q, tplhl$A2$Q);
     (B0 *> Q) = (tphlh$B0$Q, tplhl$B0$Q);
     (B1 *> Q) = (tphlh$B1$Q, tplhl$B1$Q);
     (B2 *> Q) = (tphlh$B2$Q, tplhl$B2$Q);

   endspecify*/

endmodule




module OR2X1 (A, B, Q);
input  A ;
input  B ;
output Q ;

   or  (Q, A, B);

 /*  specify
     // delay parameters
     specparam
       tpllh$A$Q = 0.051:0.051:0.051,
       tphhl$A$Q = 0.068:0.068:0.068,
       tpllh$B$Q = 0.042:0.042:0.042,
       tphhl$B$Q = 0.06:0.06:0.06;

     // path delays
     (A *> Q) = (tpllh$A$Q, tphhl$A$Q);
     (B *> Q) = (tpllh$B$Q, tphhl$B$Q);

   endspecify*/

endmodule




module OR4X1 (A, B, C, D, Q);
input  A ;
input  B ;
input  C ;
input  D ;
output Q ;

   or  (Q, A, B, C, D);

  /* specify
     // delay parameters
     specparam
       tpllh$A$Q = 0.1:0.1:0.1,
       tphhl$A$Q = 0.12:0.12:0.12,
       tpllh$B$Q = 0.096:0.096:0.096,
       tphhl$B$Q = 0.11:0.11:0.11,
       tpllh$C$Q = 0.081:0.081:0.081,
       tphhl$C$Q = 0.09:0.09:0.09,
       tpllh$D$Q = 0.057:0.057:0.057,
       tphhl$D$Q = 0.06:0.06:0.06;

     // path delays
     (A *> Q) = (tpllh$A$Q, tphhl$A$Q);
     (B *> Q) = (tpllh$B$Q, tphhl$B$Q);
     (C *> Q) = (tpllh$C$Q, tphhl$C$Q);
     (D *> Q) = (tpllh$D$Q, tphhl$D$Q);

   endspecify*/

endmodule





module OR3X1 (A, B, C, Q);
input  A ;
input  B ;
input  C ;
output Q ;

   or  (Q, A, B, C);

  /* specify
     // delay parameters
     specparam
       tpllh$A$Q = 0.1:0.1:0.1,
       tphhl$A$Q = 0.12:0.12:0.12,
       tpllh$B$Q = 0.096:0.096:0.096,
       tphhl$B$Q = 0.11:0.11:0.11,
       tpllh$C$Q = 0.081:0.081:0.081,
       tphhl$C$Q = 0.09:0.09:0.09,
       tpllh$D$Q = 0.057:0.057:0.057,
       tphhl$D$Q = 0.06:0.06:0.06;

     // path delays
     (A *> Q) = (tpllh$A$Q, tphhl$A$Q);
     (B *> Q) = (tpllh$B$Q, tphhl$B$Q);
     (C *> Q) = (tpllh$C$Q, tphhl$C$Q);
     (D *> Q) = (tpllh$D$Q, tphhl$D$Q);

   endspecify*/

endmodule





module SDFFSRX1 (CK, D, RN, SE, SI, SN, Q, QN);
input  CK ;
input  D ;
input  RN ;
input  SE ;
input  SI ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_mux2 (I0_D, D, SI, SE);
   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (P0002, I0_D, CK, I0_CLEAR, I0_SET, NOTIFIER);
   not (P0000, P0002);
   not (Q, P0000);
   buf (QN, P0000);
   and (RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1, RN, SE, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);
   not (I12_out, SE);
   and (RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1, RN, I12_out, SN);

  /* specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.29:0.29:0.29,
       tplhl$CK$Q = 0.21:0.21:0.21,
       tpllh$CK$QN = 0.18:0.18:0.18,
       tplhl$CK$QN = 0.26:0.26:0.26,
       tphhl$RN$Q = 0.14:0.14:0.14,
       tphlh$RN$QN = 0.11:0.11:0.11,
       tplhl$SN$Q = 0.12:0.12:0.12,
       tphlh$SN$Q = 0.12:0.12:0.12,
       tpllh$SN$QN = 0.092:0.092:0.092,
       tphhl$SN$QN = 0.092:0.094:0.097,
       tminpwh$CK = 0.082:0.19:0.29,
       tminpwl$CK = 0.073:0.15:0.22,
       tminpwl$RN = 0.062:0.11:0.17,
       tminpwl$SN = 0.054:0.089:0.12,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.12:-0.12:-0.12,
       tsetup_negedge$SE$CK = 0.12:0.16:0.19,
       thold_negedge$SE$CK = -0.12:-0.094:-0.062,
       tsetup_negedge$SI$CK = 0.25:0.25:0.25,
       thold_negedge$SI$CK = -0.12:-0.12:-0.12,
       tsetup_posedge$D$CK = 0.062:0.062:0.062,
       thold_posedge$D$CK = 0:0:0,
       tsetup_posedge$SE$CK = 0.12:0.19:0.25,
       thold_posedge$SE$CK = -0.12:-0.062:0,
       tsetup_posedge$SI$CK = 0.12:0.12:0.12,
       thold_posedge$SI$CK = 0:0:0,
       trec$RN$CK = 0.062:0.062:0.062,
       trem$RN$CK = 0:0:0,
       trec$RN$SN = 0.063:0.094:0.12,
       trec$SN$CK = 0.062:0.062:0.062,
       trem$SN$CK = 0.063:0.063:0.063;

     // path delays
     if (CK == 1'b1)
       (CK *> Q) = (tpllh$CK$Q, tplhl$CK$Q);
     if (CK == 1'b1)
       (CK *> QN) = (tpllh$CK$QN, tplhl$CK$QN);
     (RN *> Q) = (0, tphhl$RN$Q);
     (RN *> QN) = (tphlh$RN$QN, 0);
     (SN *> Q) = (tphlh$SN$Q, tplhl$SN$Q);
     (SN *> QN) = (tpllh$SN$QN, tphhl$SN$QN);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SE, thold_negedge$SE$CK,  NOTIFIER);
     $setup(negedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SI, thold_negedge$SI$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_0_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SE$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SE, thold_posedge$SE$CK,  NOTIFIER);
     $setup(posedge SI, posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SI$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SI, thold_posedge$SI$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& SN == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& SN == 1'b1, trem$RN$CK, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, posedge CK &&& RN == 1'b1, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& RN == 1'b1, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify*/

endmodule




module TBUFX1 (A, OE, Q);
input  A ;
input  OE ;
output Q ;

   bufif1 (Q, A, OE);

  /* specify
     // delay parameters
     specparam
       tpllh$A$Q = 0.059:0.059:0.059,
       tphhl$A$Q = 0.056:0.056:0.056,
       tpzh$OE$Q = 0.062:0.062:0.062,
       tpzl$OE$Q = 0.024:0.024:0.024,
       tplz$OE$Q = 0.041:0.041:0.041,
       tphz$OE$Q = 0.053:0.053:0.053;

     // path delays
     (A *> Q) = (tpllh$A$Q, tphhl$A$Q);
     (OE *> Q) = (0, 0, tplz$OE$Q, tpzh$OE$Q, tphz$OE$Q, tpzl$OE$Q);

   endspecify*/

endmodule




module TBUFX2 (A, OE, Q);
input  A ;
input  OE ;
output Q ;

   bufif1 (Q, A, OE);

  /* specify
     // delay parameters
     specparam
       tpllh$A$Q = 0.072:0.072:0.072,
       tphhl$A$Q = 0.064:0.064:0.064,
       tpzh$OE$Q = 0.075:0.075:0.075,
       tpzl$OE$Q = 0.019:0.019:0.019,
       tplz$OE$Q = 0.041:0.041:0.041,
       tphz$OE$Q = 0.072:0.072:0.072;

     // path delays
     (A *> Q) = (tpllh$A$Q, tphhl$A$Q);
     (OE *> Q) = (0, 0, tplz$OE$Q, tpzh$OE$Q, tphz$OE$Q, tpzl$OE$Q);

   endspecify*/

endmodule




module TBUFX4 (A, OE, Q);
input  A ;
input  OE ;
output Q ;

   bufif1 (Q, A, OE);

  /* specify
     // delay parameters
     specparam
       tpllh$A$Q = 0.072:0.072:0.072,
       tphhl$A$Q = 0.064:0.064:0.064,
       tpzh$OE$Q = 0.074:0.074:0.074,
       tpzl$OE$Q = 0.02:0.02:0.02,
       tplz$OE$Q = 0.041:0.041:0.041,
       tphz$OE$Q = 0.071:0.071:0.071;

     // path delays
     (A *> Q) = (tpllh$A$Q, tphhl$A$Q);
     (OE *> Q) = (0, 0, tplz$OE$Q, tpzh$OE$Q, tphz$OE$Q, tpzl$OE$Q);

   endspecify*/

endmodule




module TBUFX8 (A, OE, Q);
input  A ;
input  OE ;
output Q ;

   bufif1 (Q, A, OE);

  /* specify
     // delay parameters
     specparam
       tpllh$A$Q = 0.071:0.071:0.071,
       tphhl$A$Q = 0.062:0.062:0.062,
       tpzh$OE$Q = 0.088:0.088:0.088,
       tpzl$OE$Q = 0.029:0.029:0.029,
       tplz$OE$Q = 0.045:0.045:0.045,
       tphz$OE$Q = 0.062:0.062:0.062;

     // path delays
     (A *> Q) = (tpllh$A$Q, tphhl$A$Q);
     (OE *> Q) = (0, 0, tplz$OE$Q, tpzh$OE$Q, tphz$OE$Q, tpzl$OE$Q);

   endspecify*/

endmodule




module TINVX1 (A, OE, Q);
input  A ;
input  OE ;
output Q ;

   not (I0_out, A);
   bufif1 (Q, I0_out, OE);

  /* specify
     // delay parameters
     specparam
       tplhl$A$Q = 0.034:0.034:0.034,
       tphlh$A$Q = 0.044:0.044:0.044,
       tpzh$OE$Q = 0.049:0.049:0.049,
       tpzl$OE$Q = 0.015:0.015:0.015,
       tplz$OE$Q = 0.041:0.041:0.041,
       tphz$OE$Q = 0.066:0.066:0.066;

     // path delays
     (A *> Q) = (tphlh$A$Q, tplhl$A$Q);
     (OE *> Q) = (0, 0, tplz$OE$Q, tpzh$OE$Q, tphz$OE$Q, tpzl$OE$Q);

   endspecify*/

endmodule




module TLATSRX1 (D, G, RN, SN, Q, QN);
input  D ;
input  G ;
input  RN ;
input  SN ;
output Q ;
output QN ;
reg NOTIFIER ;

   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_tlat (P0001, D, G, I0_CLEAR, I0_SET, NOTIFIER);
   not (P0000, P0001);
   not (Q, P0000);
   buf (QN, P0000);
   not (I8_out, D);
   and (D_EQ_0_AN_RN_EQ_1, I8_out, RN);
   and (D_EQ_1_AN_SN_EQ_1, D, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);

  /* specify
     // delay parameters
     specparam
       tpllh$D$Q = 0.13:0.13:0.13,
       tphhl$D$Q = 0.16:0.16:0.16,
       tplhl$D$QN = 0.2:0.2:0.2,
       tphlh$D$QN = 0.21:0.21:0.21,
       tpllh$G$Q = 0.18:0.18:0.18,
       tplhl$G$Q = 0.14:0.14:0.14,
       tpllh$G$QN = 0.19:0.19:0.19,
       tplhl$G$QN = 0.24:0.24:0.24,
       tpllh$RN$Q = 0.13:0.13:0.13,
       tphhl$RN$Q = 0.12:0.12:0.12,
       tplhl$RN$QN = 0.2:0.2:0.2,
       tphlh$RN$QN = 0.17:0.17:0.17,
       tplhl$SN$Q = 0.15:0.15:0.15,
       tphlh$SN$Q = 0.19:0.19:0.19,
       tpllh$SN$QN = 0.2:0.2:0.2,
       tphhl$SN$QN = 0.24:0.24:0.24,
       tminpwh$G = 0.11:0.17:0.24,
       tminpwl$RN = 0.085:0.13:0.17,
       tminpwl$SN = 0.15:0.2:0.24,
       tsetup_negedge$D$G = 0.19:0.19:0.19,
       thold_negedge$D$G = -0.062:-0.062:-0.062,
       tsetup_posedge$D$G = 0.12:0.12:0.12,
       thold_posedge$D$G = 0:0:0,
       trec$RN$G = 0.12:0.12:0.12,
       trem$RN$G = 0:0:0,
       trec$RN$SN = 0.19:0.19:0.19,
       trec$SN$G = 0.19:0.19:0.19,
       trem$SN$G = -0.12:-0.12:-0.12;

     // path delays
     (D *> Q) = (tpllh$D$Q, tphhl$D$Q);
     (D *> QN) = (tphlh$D$QN, tplhl$D$QN);
     if (G == 1'b1)
       (G *> Q) = (tpllh$G$Q, tplhl$G$Q);
     if (G == 1'b1)
       (G *> QN) = (tpllh$G$QN, tplhl$G$QN);
     (RN *> Q) = (tpllh$RN$Q, tphhl$RN$Q);
     (RN *> QN) = (tphlh$RN$QN, tplhl$RN$QN);
     (SN *> Q) = (tphlh$SN$Q, tplhl$SN$Q);
     (SN *> QN) = (tpllh$SN$QN, tphhl$SN$QN);
     $setup(negedge D, negedge G &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$G, NOTIFIER);
     $hold (negedge G &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$G,  NOTIFIER);
     $setup(posedge D, negedge G &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$G, NOTIFIER);
     $hold (negedge G &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$G,  NOTIFIER);
     $recovery(posedge RN, negedge G &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trec$RN$G, NOTIFIER);
     $removal (posedge RN, negedge G &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trem$RN$G, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, negedge G &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trec$SN$G, NOTIFIER);
     $removal (posedge SN, negedge G &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trem$SN$G, NOTIFIER);
     $width(posedge G, tminpwh$G, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify*/

endmodule




module TLATX1 (C, D, Q, QN);
input  C ;
input  D ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_tlat (P0000, D, C, 1'B0, 1'B0, NOTIFIER);
   not (NET166, P0000);
   buf (Q, P0000);
   not (QN, P0000);

  /* specify
     // delay parameters
     specparam
       tpllh$C$Q = 0.13:0.13:0.13,
       tplhl$C$Q = 0.12:0.12:0.12,
       tpllh$C$QN = 0.16:0.16:0.16,
       tplhl$C$QN = 0.16:0.16:0.16,
       tpllh$D$Q = 0.087:0.087:0.087,
       tphhl$D$Q = 0.11:0.11:0.11,
       tplhl$D$QN = 0.12:0.12:0.12,
       tphlh$D$QN = 0.15:0.15:0.15,
       tminpwh$C = 0.088:0.12:0.16,
       tsetup_negedge$D$C = 0.12:0.12:0.12,
       thold_negedge$D$C = -0.062:-0.062:-0.062,
       tsetup_posedge$D$C = 0.062:0.062:0.062,
       thold_posedge$D$C = 0:0:0;

     // path delays
     if (C == 1'b1)
       (C *> Q) = (tpllh$C$Q, tplhl$C$Q);
     if (C == 1'b1)
       (C *> QN) = (tpllh$C$QN, tplhl$C$QN);
     (D *> Q) = (tpllh$D$Q, tphhl$D$Q);
     (D *> QN) = (tphlh$D$QN, tplhl$D$QN);
     $setup(negedge D, negedge C, tsetup_negedge$D$C, NOTIFIER);
     $hold (negedge C, negedge D, thold_negedge$D$C,  NOTIFIER);
     $setup(posedge D, negedge C, tsetup_posedge$D$C, NOTIFIER);
     $hold (negedge C, posedge D, thold_posedge$D$C,  NOTIFIER);
     $width(posedge C, tminpwh$C, 0, NOTIFIER);

   endspecify*/

endmodule




module XOR2X1 (A, B, Q);
input  A ;
input  B ;
output Q ;

   xor (Q, A, B);

   /*specify
     // delay parameters
     specparam
       tpllh$A$Q = 0.031:0.06:0.089,
       tplhl$A$Q = 0.042:0.072:0.1,
       tpllh$B$Q = 0.036:0.053:0.07,
       tplhl$B$Q = 0.044:0.067:0.091;

     // path delays
     (A *> Q) = (tpllh$A$Q, tplhl$A$Q);
     (B *> Q) = (tpllh$B$Q, tplhl$B$Q);

   endspecify*/

endmodule





module XOR3X1 (A, B, C, Q);
input  A ;
input  B ;
input  C;
output Q ;

   xor (I2_out, A, B);
   xor (Q, C, I2_out);

   /*specify
     // delay parameters
     specparam
       tpllh$A$Q = 0.031:0.06:0.089,
       tplhl$A$Q = 0.042:0.072:0.1,
       tpllh$B$Q = 0.036:0.053:0.07,
       tplhl$B$Q = 0.044:0.067:0.091;

     // path delays
     (A *> Q) = (tpllh$A$Q, tplhl$A$Q);
     (B *> Q) = (tpllh$B$Q, tplhl$B$Q);

   endspecify*/

endmodule




module XNOR3X1 (A, B, C, Q);
input  A ;
input  B ;
input  C;
output Q ;

   xor (I2_out, A, B);
   xor (I3_out, C, I2_out);
   not (Q, I3_out);

   /*specify
     // delay parameters
     specparam
       tpllh$A$Q = 0.031:0.06:0.089,
       tplhl$A$Q = 0.042:0.072:0.1,
       tpllh$B$Q = 0.036:0.053:0.07,
       tplhl$B$Q = 0.044:0.067:0.091;

     // path delays
     (A *> Q) = (tpllh$A$Q, tplhl$A$Q);
     (B *> Q) = (tpllh$B$Q, tplhl$B$Q);

   endspecify*/

endmodule





module XNOR2X1 (A, B, Q);
input  A ;
input  B ;
output Q ;

   xor (I2_out, A, B);
   not (Q, I2_out);

   /*specify
     // delay parameters
     specparam
       tpllh$A$Q = 0.031:0.06:0.089,
       tplhl$A$Q = 0.042:0.072:0.1,
       tpllh$B$Q = 0.036:0.053:0.07,
       tplhl$B$Q = 0.044:0.067:0.091;

     // path delays
     (A *> Q) = (tpllh$A$Q, tplhl$A$Q);
     (B *> Q) = (tpllh$B$Q, tplhl$B$Q);

   endspecify*/

endmodule



////added Scan cells by Naghmeh



module S_DFFSRX1 (CK, D, RN, SN, SE, SI, Q, QN);
input  CK ;
input  D ;
input  RN ;
input  SN ;
input  SE ;
input  SI ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_mux2 (new_D, D, SI, SE);
   not (I0_CLEAR, RN);
   not (I0_SET, SN);
   udp_dff (NET0131_, D_, CK, I0_SET, I0_CLEAR, NOTIFIER);
   udp_dff (P0001_, new_D, CK, I0_CLEAR, I0_SET, NOTIFIER);
   not (D_, new_D);
   not (NET0131, NET0131_);
   not (P0001, P0001_);
   buf (Q, NET0131);
   buf (QN, P0001);
   not (I12_out, new_D);
   and (D_EQ_0_AN_RN_EQ_1, I12_out, RN);
   and (D_EQ_1_AN_SN_EQ_1, new_D, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);

  /* specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.079:0.079:0.079,
       tplhl$CK$Q = 0.085:0.085:0.085,
       tpllh$CK$QN = 0.14:0.14:0.14,
       tplhl$CK$QN = 0.12:0.12:0.12,
       tpllh$RN$Q = 0.12:0.12:0.12,
       tphhl$RN$Q = 0.091:0.093:0.094,
       tphlh$RN$QN = 0.15:0.15:0.15,
       tpllh$SN$QN = 0.071:0.071:0.071,
       tphhl$SN$QN = 0.06:0.06:0.061,
       tphlh$SN$Q = 0.16:0.18:0.2,
       tminpwh$CK = 0.079:0.11:0.14,
       tminpwl$CK = 0.07:0.085:0.1,
       tminpwl$RN = 0.032:0.092:0.15,
       tminpwl$SN = 0.025:0.11:0.2,
       tsetup_negedge$D$CK = 0.062:0.062:0.062,
       thold_negedge$D$CK = 0:0:0,
       tsetup_posedge$D$CK = 0.12:0.12:0.12,
       thold_posedge$D$CK = 0:0:0,
       trec$RN$CK = 0.12:0.12:0.12,
       trem$RN$CK = 0:0:0,
       trec$RN$SN = 0:0.031:0.063,
       trec$SN$CK = 0:0:0,
       trem$SN$CK = 0.063:0.063:0.063,
       trec$SN$RN = 0.063:0.063:0.063;

     // path delays
     if (CK == 1'b1)
       (CK *> Q) = (tpllh$CK$Q, tplhl$CK$Q);
     if (CK == 1'b1)
       (CK *> QN) = (tpllh$CK$QN, tplhl$CK$QN);
     (RN *> Q) = (tpllh$RN$Q, tphhl$RN$Q);
     (RN *> QN) = (tphlh$RN$QN, 0);
     (SN *> Q) = (tphlh$SN$Q, 0);
     (SN *> QN) = (tpllh$SN$QN, tphhl$SN$QN);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& D_EQ_1_AN_SN_EQ_1 == 1'b1, trem$RN$CK, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, posedge CK &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& D_EQ_0_AN_RN_EQ_1 == 1'b1, trem$SN$CK, NOTIFIER);
     $recovery(posedge SN, posedge RN, trec$SN$RN, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify*/

endmodule





module S_DFFX1 (CK, D, SE, SI, Q, QN);
input  CK ;
input  D ;
input  SE ;
input  SI ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_mux2 (new_D, D, SI, SE);
   udp_dff (P0001, new_D, CK, 1'B0, 1'B0, NOTIFIER);
   not (P0000, P0001);
   not (Q, P0000);
   buf (QN, P0000);

  /* specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.11:0.11:0.11,
       tplhl$CK$Q = 0.13:0.13:0.13,
       tpllh$CK$QN = 0.15:0.15:0.15,
       tplhl$CK$QN = 0.13:0.13:0.13,
       tminpwh$CK = 0.056:0.1:0.15,
       tminpwl$CK = 0.063:0.082:0.1,
       tsetup_negedge$D$CK = 0.12:0.12:0.12,
       thold_negedge$D$CK = 0:0:0,
       tsetup_posedge$D$CK = 0.12:0.12:0.12,
       thold_posedge$D$CK = 0:0:0;

     // path delays
     if (CK == 1'b1)
       (CK *> Q) = (tpllh$CK$Q, tplhl$CK$Q);
     if (CK == 1'b1)
       (CK *> QN) = (tpllh$CK$QN, tplhl$CK$QN);
     $setup(negedge D, posedge CK, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(posedge D, posedge CK, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);

   endspecify*/

endmodule





module S_SDFFSRX1 (CK, D, RN, SE_OLD, SI_OLD, SN, SE, SI, Q, QN);
input  CK ;
input  D ;
input  RN ;
input  SE_OLD ;
input  SI_OLD ;
input  SN ;
input  SE ;
input  SI ;
output Q ;
output QN ;
reg NOTIFIER ;

   udp_mux2 (new_D, D, SI, SE);
   udp_mux2 (I0_D, new_D, SI_OLD, SE_OLD);
   not (I0_CLEAR, RN);
   not (I0_SE_OLDT, SN);
   udp_dff (P0002, I0_D, CK, I0_CLEAR, I0_SE_OLDT, NOTIFIER);
   not (P0000, P0002);
   not (Q, P0000);
   buf (QN, P0000);
   and (RN_EQ_1_AN_SE_OLD_EQ_1_AN_SN_EQ_1, RN, SE_OLD, SN);
   and (RN_EQ_1_AN_SN_EQ_1, RN, SN);
   not (I12_out, SE_OLD);
   and (RN_EQ_1_AN_SE_OLD_EQ_0_AN_SN_EQ_1, RN, I12_out, SN);

   /*specify
     // delay parameters
     specparam
       tpllh$CK$Q = 0.29:0.29:0.29,
       tplhl$CK$Q = 0.21:0.21:0.21,
       tpllh$CK$QN = 0.18:0.18:0.18,
       tplhl$CK$QN = 0.26:0.26:0.26,
       tphhl$RN$Q = 0.14:0.14:0.14,
       tphlh$RN$QN = 0.11:0.11:0.11,
       tplhl$SN$Q = 0.12:0.12:0.12,
       tphlh$SN$Q = 0.12:0.12:0.12,
       tpllh$SN$QN = 0.092:0.092:0.092,
       tphhl$SN$QN = 0.092:0.094:0.097,
       tminpwh$CK = 0.082:0.19:0.29,
       tminpwl$CK = 0.073:0.15:0.22,
       tminpwl$RN = 0.062:0.11:0.17,
       tminpwl$SN = 0.054:0.089:0.12,
       tsetup_negedge$D$CK = 0.19:0.19:0.19,
       thold_negedge$D$CK = -0.12:-0.12:-0.12,
       tsetup_negedge$SE_OLD$CK = 0.12:0.16:0.19,
       thold_negedge$SE_OLD$CK = -0.12:-0.094:-0.062,
       tsetup_negedge$SI_OLD$CK = 0.25:0.25:0.25,
       thold_negedge$SI_OLD$CK = -0.12:-0.12:-0.12,
       tsetup_posedge$D$CK = 0.062:0.062:0.062,
       thold_posedge$D$CK = 0:0:0,
       tsetup_posedge$SE_OLD$CK = 0.12:0.19:0.25,
       thold_posedge$SE_OLD$CK = -0.12:-0.062:0,
       tsetup_posedge$SI_OLD$CK = 0.12:0.12:0.12,
       thold_posedge$SI_OLD$CK = 0:0:0,
       trec$RN$CK = 0.062:0.062:0.062,
       trem$RN$CK = 0:0:0,
       trec$RN$SN = 0.063:0.094:0.12,
       trec$SN$CK = 0.062:0.062:0.062,
       trem$SN$CK = 0.063:0.063:0.063;

     // path delays
     if (CK == 1'b1)
       (CK *> Q) = (tpllh$CK$Q, tplhl$CK$Q);
     if (CK == 1'b1)
       (CK *> QN) = (tpllh$CK$QN, tplhl$CK$QN);
     (RN *> Q) = (0, tphhl$RN$Q);
     (RN *> QN) = (tphlh$RN$QN, 0);
     (SN *> Q) = (tphlh$SN$Q, tplhl$SN$Q);
     (SN *> QN) = (tpllh$SN$QN, tphhl$SN$QN);
     $setup(negedge D, posedge CK &&& RN_EQ_1_AN_SE_OLD_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_negedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_OLD_EQ_0_AN_SN_EQ_1 == 1'b1, negedge D, thold_negedge$D$CK,  NOTIFIER);
     $setup(negedge SE_OLD, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SE_OLD$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SE_OLD, thold_negedge$SE_OLD$CK,  NOTIFIER);
     $setup(negedge SI_OLD, posedge CK &&& RN_EQ_1_AN_SE_OLD_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_negedge$SI_OLD$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_OLD_EQ_1_AN_SN_EQ_1 == 1'b1, negedge SI_OLD, thold_negedge$SI_OLD$CK,  NOTIFIER);
     $setup(posedge D, posedge CK &&& RN_EQ_1_AN_SE_OLD_EQ_0_AN_SN_EQ_1 == 1'b1, tsetup_posedge$D$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_OLD_EQ_0_AN_SN_EQ_1 == 1'b1, posedge D, thold_posedge$D$CK,  NOTIFIER);
     $setup(posedge SE_OLD, posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SE_OLD$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SE_OLD, thold_posedge$SE_OLD$CK,  NOTIFIER);
     $setup(posedge SI_OLD, posedge CK &&& RN_EQ_1_AN_SE_OLD_EQ_1_AN_SN_EQ_1 == 1'b1, tsetup_posedge$SI_OLD$CK, NOTIFIER);
     $hold (posedge CK &&& RN_EQ_1_AN_SE_OLD_EQ_1_AN_SN_EQ_1 == 1'b1, posedge SI_OLD, thold_posedge$SI_OLD$CK,  NOTIFIER);
     $recovery(posedge RN, posedge CK &&& SN == 1'b1, trec$RN$CK, NOTIFIER);
     $removal (posedge RN, posedge CK &&& SN == 1'b1, trem$RN$CK, NOTIFIER);
     $recovery(posedge RN, posedge SN, trec$RN$SN, NOTIFIER);
     $recovery(posedge SN, posedge CK &&& RN == 1'b1, trec$SN$CK, NOTIFIER);
     $removal (posedge SN, posedge CK &&& RN == 1'b1, trem$SN$CK, NOTIFIER);
     $width(posedge CK, tminpwh$CK, 0, NOTIFIER);
     $width(negedge CK, tminpwl$CK, 0, NOTIFIER);
     $width(negedge RN, tminpwl$RN, 0, NOTIFIER);
     $width(negedge SN, tminpwl$SN, 0, NOTIFIER);

   endspecify*/

endmodule



////end of added Scan cells by naghmeh

primitive udp_dff (out, in, clk, clr, set, NOTIFIER);
   output out;
   input  in, clk, clr, set, NOTIFIER;
   reg    out;

   table

// in  clk  clr   set  NOT  : Qt : Qt+1
//
   0  r   ?   0   ?   : ?  :  0  ; // clock in 0
   1  r   0   ?   ?   : ?  :  1  ; // clock in 1
   1  *   0   ?   ?   : 1  :  1  ; // reduce pessimism
   0  *   ?   0   ?   : 0  :  0  ; // reduce pessimism
   ?  f   ?   ?   ?   : ?  :  -  ; // no changes on negedge clk
   *  b   ?   ?   ?   : ?  :  -  ; // no changes when in switches
   ?  ?   ?   1   ?   : ?  :  1  ; // set output
   ?  b   0   *   ?   : 1  :  1  ; // cover all transistions on set
   1  x   0   *   ?   : 1  :  1  ; // cover all transistions on set
   ?  ?   1   0   ?   : ?  :  0  ; // reset output
   ?  b   *   0   ?   : 0  :  0  ; // cover all transistions on clr
   0  x   *   0   ?   : 0  :  0  ; // cover all transistions on clr
   ?  ?   ?   ?   *   : ?  :  x  ; // any notifier changed

   endtable
endprimitive // udp_dff

primitive udp_tlat (out, in, enable, clr, set, NOTIFIER);

   output out;
   input  in, enable, clr, set, NOTIFIER;
   reg    out;

   table

// in  enable  clr   set  NOT  : Qt : Qt+1
//
   1  1   0   ?   ?   : ?  :  1  ; //
   0  1   ?   0   ?   : ?  :  0  ; //
   1  *   0   ?   ?   : 1  :  1  ; // reduce pessimism
   0  *   ?   0   ?   : 0  :  0  ; // reduce pessimism
   *  0   ?   ?   ?   : ?  :  -  ; // no changes when in switches
   ?  ?   ?   1   ?   : ?  :  1  ; // set output
   ?  0   0   *   ?   : 1  :  1  ; // cover all transistions on set
   1  ?   0   *   ?   : 1  :  1  ; // cover all transistions on set
   ?  ?   1   0   ?   : ?  :  0  ; // reset output
   ?  0   *   0   ?   : 0  :  0  ; // cover all transistions on clr
   0  ?   *   0   ?   : 0  :  0  ; // cover all transistions on clr
   ?  ?   ?   ?   *   : ?  :  x  ; // any notifier changed

   endtable
endprimitive // udp_tlat

primitive udp_rslat (out, clr, set, NOTIFIER);

   output out;
   input  clr, set, NOTIFIER;
   reg    out;

   table

// clr   set  NOT  : Qt : Qt+1
//
   ?   1   ?   : ?  :  1  ; // set output
   0   *   ?   : 1  :  1  ; // cover all transistions on set
   1   0   ?   : ?  :  0  ; // reset output
   *   0   ?   : 0  :  0  ; // cover all transistions on clr
   ?   ?   *   : ?  :  x  ; // any notifier changed

   endtable
endprimitive // udp_tlat

primitive udp_mux2 (out, in0, in1, sel);
   output out;
   input  in0, in1, sel;

   table

// in0 in1 sel :  out
//
    1  ?  0 :  1 ;
    0  ?  0 :  0 ;
    ?  1  1 :  1 ;
    ?  0  1 :  0 ;
    0  0  x :  0 ;
    1  1  x :  1 ;

   endtable
endprimitive // udp_mux2


