////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.68d
//  \   \         Application: netgen
//  /   /         Filename: fi16tofl32.v
// /___/   /\     Timestamp: Wed Apr 29 19:24:35 2015
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog F:/quadrotor/prj_INS/qrc_32/INS_prj/ipcore_dir/tmp/_cg/fi16tofl32.ngc F:/quadrotor/prj_INS/qrc_32/INS_prj/ipcore_dir/tmp/_cg/fi16tofl32.v 
// Device	: 7z020clg400-1
// Input file	: F:/quadrotor/prj_INS/qrc_32/INS_prj/ipcore_dir/tmp/_cg/fi16tofl32.ngc
// Output file	: F:/quadrotor/prj_INS/qrc_32/INS_prj/ipcore_dir/tmp/_cg/fi16tofl32.v
// # of Modules	: 1
// Design Name	: fi16tofl32
// Xilinx        : e:\Xilinx\14.6\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module fi16tofl32 (
  operation_nd, clk, sclr, ce, rdy, a, result
)/* synthesis syn_black_box syn_noprune=1 */;
  input operation_nd;
  input clk;
  input sclr;
  input ce;
  output rdy;
  input [15 : 0] a;
  output [31 : 0] result;
  
  // synthesis translate_off
  
  wire \U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/sign_op ;
  wire \U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/exp_op[7] ;
  wire \U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/exp_op[3] ;
  wire \U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/exp_op[2] ;
  wire \U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/exp_op[1] ;
  wire \U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/exp_op[0] ;
  wire \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/HND_SHK/RDY ;
  wire sig00000001;
  wire sig00000002;
  wire sig00000003;
  wire sig00000004;
  wire sig00000005;
  wire sig00000006;
  wire sig00000007;
  wire sig00000008;
  wire sig00000009;
  wire sig0000000a;
  wire sig0000000b;
  wire sig0000000c;
  wire sig0000000d;
  wire sig0000000e;
  wire sig0000000f;
  wire sig00000010;
  wire sig00000011;
  wire sig00000012;
  wire sig00000013;
  wire sig00000014;
  wire sig00000015;
  wire sig00000016;
  wire sig00000017;
  wire sig00000018;
  wire sig00000019;
  wire sig0000001a;
  wire sig0000001b;
  wire sig0000001c;
  wire sig0000001d;
  wire sig0000001e;
  wire sig0000001f;
  wire sig00000020;
  wire sig00000021;
  wire sig00000022;
  wire sig00000023;
  wire sig00000024;
  wire sig00000025;
  wire sig00000026;
  wire sig00000027;
  wire sig00000028;
  wire sig00000029;
  wire sig0000002a;
  wire sig0000002b;
  wire sig0000002c;
  wire sig0000002d;
  wire sig0000002e;
  wire sig0000002f;
  wire sig00000030;
  wire sig00000031;
  wire sig00000032;
  wire sig00000033;
  wire sig00000034;
  wire sig00000035;
  wire sig00000036;
  wire sig00000037;
  wire sig00000038;
  wire sig00000039;
  wire sig0000003a;
  wire sig0000003b;
  wire sig0000003c;
  wire sig0000003d;
  wire sig0000003e;
  wire sig0000003f;
  wire sig00000040;
  wire sig00000041;
  wire sig00000042;
  wire sig00000043;
  wire sig00000044;
  wire sig00000045;
  wire sig00000046;
  wire sig00000047;
  wire sig00000048;
  wire sig00000049;
  wire sig0000004a;
  wire sig0000004b;
  wire sig0000004c;
  wire sig0000004d;
  wire sig0000004e;
  wire sig0000004f;
  wire sig00000050;
  wire sig00000051;
  wire sig00000052;
  wire sig00000053;
  wire sig00000054;
  wire sig00000055;
  wire sig00000056;
  wire sig00000057;
  wire sig00000058;
  wire sig00000059;
  wire sig0000005a;
  wire sig0000005b;
  wire sig0000005c;
  wire sig0000005d;
  wire sig0000005e;
  wire sig0000005f;
  wire sig00000060;
  wire sig00000061;
  wire sig00000062;
  wire sig00000063;
  wire sig00000064;
  wire sig00000065;
  wire sig00000066;
  wire sig00000067;
  wire sig00000068;
  wire sig00000069;
  wire sig0000006a;
  wire sig0000006b;
  wire sig0000006c;
  wire sig0000006d;
  wire sig0000006e;
  wire sig0000006f;
  wire sig00000070;
  wire sig00000071;
  wire sig00000072;
  wire sig00000073;
  wire sig00000074;
  wire sig00000075;
  wire sig00000076;
  wire sig00000077;
  wire sig00000078;
  wire sig00000079;
  wire sig0000007a;
  wire sig0000007b;
  wire sig0000007c;
  wire sig0000007d;
  wire sig0000007e;
  wire sig0000007f;
  wire sig00000080;
  wire sig00000081;
  wire sig00000082;
  wire sig00000083;
  wire sig00000084;
  wire sig00000085;
  wire sig00000086;
  wire sig00000087;
  wire sig00000088;
  wire sig00000089;
  wire sig0000008a;
  wire sig0000008b;
  wire sig0000008c;
  wire sig0000008d;
  wire sig0000008e;
  wire sig0000008f;
  wire sig00000090;
  wire sig00000091;
  wire sig00000092;
  wire sig00000093;
  wire sig00000094;
  wire sig00000095;
  wire sig00000096;
  wire sig00000097;
  wire sig00000098;
  wire sig00000099;
  wire sig0000009a;
  wire sig0000009b;
  wire sig0000009c;
  wire sig0000009d;
  wire sig0000009e;
  wire sig0000009f;
  wire sig000000a0;
  wire sig000000a1;
  wire sig000000a2;
  wire sig000000a3;
  wire sig000000a4;
  wire sig000000a5;
  wire sig000000a6;
  wire sig000000a7;
  wire sig000000a8;
  wire sig000000a9;
  wire sig000000aa;
  wire sig000000ab;
  wire sig000000ac;
  wire sig000000ad;
  wire sig000000ae;
  wire sig000000af;
  wire sig000000b0;
  wire sig000000b1;
  wire sig000000b2;
  wire sig000000b3;
  wire sig000000b4;
  wire sig000000b5;
  wire sig000000b6;
  wire sig000000b7;
  wire sig000000b8;
  wire sig000000b9;
  wire sig000000ba;
  wire sig000000bb;
  wire sig000000bc;
  wire sig000000bd;
  wire sig000000be;
  wire sig000000bf;
  wire sig000000c0;
  wire sig000000c1;
  wire sig000000c2;
  wire sig000000c3;
  wire sig000000c4;
  wire sig000000c5;
  wire sig000000c6;
  wire sig000000c7;
  wire sig000000c8;
  wire sig000000c9;
  wire sig000000ca;
  wire sig000000cb;
  wire sig000000cc;
  wire sig000000cd;
  wire sig000000ce;
  wire sig000000cf;
  wire sig000000d0;
  wire sig000000d1;
  wire sig000000d2;
  wire sig000000d3;
  wire sig000000d4;
  wire sig000000d5;
  wire sig000000d6;
  wire sig000000d7;
  wire sig000000d8;
  wire sig000000d9;
  wire sig000000da;
  wire sig000000db;
  wire sig000000dc;
  wire sig000000dd;
  wire sig000000de;
  wire sig000000df;
  wire sig000000e0;
  wire sig000000e1;
  wire sig000000e2;
  wire sig000000e3;
  wire sig000000e4;
  wire sig000000e5;
  wire sig000000e6;
  wire sig000000e7;
  wire sig000000e8;
  wire sig000000e9;
  wire sig000000ea;
  wire sig000000eb;
  wire sig000000ec;
  wire sig000000ed;
  wire sig000000ee;
  wire sig000000ef;
  wire sig000000f0;
  wire sig000000f1;
  wire sig000000f2;
  wire sig000000f3;
  wire sig000000f4;
  wire sig000000f5;
  wire sig000000f6;
  wire sig000000f7;
  wire sig000000f8;
  wire sig000000f9;
  wire sig000000fa;
  wire sig000000fb;
  wire sig000000fc;
  wire sig000000fd;
  wire sig000000fe;
  wire sig000000ff;
  wire sig00000100;
  wire sig00000101;
  wire sig00000102;
  wire sig00000103;
  wire sig00000104;
  wire sig00000105;
  wire sig00000106;
  wire sig00000107;
  wire sig00000108;
  wire sig00000109;
  wire sig0000010a;
  wire sig0000010b;
  wire sig0000010c;
  wire sig0000010d;
  wire sig0000010e;
  wire sig0000010f;
  wire sig00000110;
  wire sig00000111;
  wire sig00000112;
  wire sig00000113;
  wire sig00000114;
  wire sig00000115;
  wire sig00000116;
  wire sig00000117;
  wire sig00000118;
  wire sig00000119;
  wire sig0000011a;
  wire sig0000011b;
  wire sig0000011c;
  wire sig0000011d;
  wire sig0000011e;
  wire sig0000011f;
  wire sig00000120;
  wire sig00000121;
  wire sig00000122;
  wire sig00000123;
  wire sig00000124;
  wire sig00000125;
  wire sig00000126;
  wire sig00000127;
  wire sig00000128;
  wire sig00000129;
  wire sig0000012a;
  wire sig0000012b;
  wire sig0000012c;
  wire NLW_blk00000069_O_UNCONNECTED;
  wire NLW_blk00000081_O_UNCONNECTED;
  wire NLW_blk00000083_O_UNCONNECTED;
  wire NLW_blk00000085_O_UNCONNECTED;
  wire NLW_blk00000087_O_UNCONNECTED;
  wire NLW_blk00000089_O_UNCONNECTED;
  wire NLW_blk0000008b_O_UNCONNECTED;
  wire NLW_blk0000008d_O_UNCONNECTED;
  wire NLW_blk0000008f_O_UNCONNECTED;
  wire NLW_blk00000144_Q15_UNCONNECTED;
  wire NLW_blk00000146_Q15_UNCONNECTED;
  wire NLW_blk00000148_Q15_UNCONNECTED;
  wire NLW_blk0000014a_Q15_UNCONNECTED;
  wire NLW_blk0000014c_Q15_UNCONNECTED;
  wire [6 : 6] \NlwRenamedSignal_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/exp_op ;
  wire [22 : 8] \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/mant_op ;
  wire [0 : 0] NlwRenamedSig_OI_result;
  assign
    result[31] = \U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/sign_op ,
    result[30] = \U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/exp_op[7] ,
    result[29] = \NlwRenamedSignal_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/exp_op [6],
    result[28] = \NlwRenamedSignal_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/exp_op [6],
    result[27] = \NlwRenamedSignal_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/exp_op [6],
    result[26] = \U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/exp_op[3] ,
    result[25] = \U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/exp_op[2] ,
    result[24] = \U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/exp_op[1] ,
    result[23] = \U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/exp_op[0] ,
    result[22] = \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/mant_op [22],
    result[21] = \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/mant_op [21],
    result[20] = \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/mant_op [20],
    result[19] = \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/mant_op [19],
    result[18] = \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/mant_op [18],
    result[17] = \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/mant_op [17],
    result[16] = \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/mant_op [16],
    result[15] = \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/mant_op [15],
    result[14] = \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/mant_op [14],
    result[13] = \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/mant_op [13],
    result[12] = \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/mant_op [12],
    result[11] = \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/mant_op [11],
    result[10] = \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/mant_op [10],
    result[9] = \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/mant_op [9],
    result[8] = \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/mant_op [8],
    result[7] = NlwRenamedSig_OI_result[0],
    result[6] = NlwRenamedSig_OI_result[0],
    result[5] = NlwRenamedSig_OI_result[0],
    result[4] = NlwRenamedSig_OI_result[0],
    result[3] = NlwRenamedSig_OI_result[0],
    result[2] = NlwRenamedSig_OI_result[0],
    result[1] = NlwRenamedSig_OI_result[0],
    result[0] = NlwRenamedSig_OI_result[0],
    rdy = \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/HND_SHK/RDY ;
  VCC   blk00000001 (
    .P(sig00000001)
  );
  GND   blk00000002 (
    .G(NlwRenamedSig_OI_result[0])
  );
  MUXCY   blk00000003 (
    .CI(sig00000003),
    .DI(sig00000001),
    .S(sig00000001),
    .O(sig00000005)
  );
  MUXCY   blk00000004 (
    .CI(sig00000004),
    .DI(NlwRenamedSig_OI_result[0]),
    .S(NlwRenamedSig_OI_result[0]),
    .O(sig00000003)
  );
  MUXCY   blk00000005 (
    .CI(sig00000001),
    .DI(NlwRenamedSig_OI_result[0]),
    .S(NlwRenamedSig_OI_result[0]),
    .O(sig00000004)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000006 (
    .C(clk),
    .CE(ce),
    .D(sig00000037),
    .Q(sig0000003c)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000007 (
    .C(clk),
    .CE(ce),
    .D(sig00000038),
    .Q(sig0000003d)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000008 (
    .C(clk),
    .CE(ce),
    .D(sig00000039),
    .Q(sig0000003e)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000009 (
    .C(clk),
    .CE(ce),
    .D(sig0000003a),
    .Q(sig0000003f)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000000a (
    .C(clk),
    .CE(ce),
    .D(sig0000003b),
    .Q(sig00000040)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000000b (
    .C(clk),
    .CE(ce),
    .D(sig00000009),
    .Q(sig00000041)
  );
  XORCY   blk0000000c (
    .CI(sig0000009f),
    .LI(NlwRenamedSig_OI_result[0]),
    .O(sig0000009d)
  );
  XORCY   blk0000000d (
    .CI(sig000000a1),
    .LI(sig00000096),
    .O(sig0000009e)
  );
  MUXCY   blk0000000e (
    .CI(sig000000a1),
    .DI(NlwRenamedSig_OI_result[0]),
    .S(sig00000096),
    .O(sig0000009f)
  );
  XORCY   blk0000000f (
    .CI(sig000000a3),
    .LI(sig00000095),
    .O(sig000000a0)
  );
  MUXCY   blk00000010 (
    .CI(sig000000a3),
    .DI(NlwRenamedSig_OI_result[0]),
    .S(sig00000095),
    .O(sig000000a1)
  );
  XORCY   blk00000011 (
    .CI(sig000000a5),
    .LI(sig00000094),
    .O(sig000000a2)
  );
  MUXCY   blk00000012 (
    .CI(sig000000a5),
    .DI(NlwRenamedSig_OI_result[0]),
    .S(sig00000094),
    .O(sig000000a3)
  );
  XORCY   blk00000013 (
    .CI(sig000000a7),
    .LI(sig00000093),
    .O(sig000000a4)
  );
  MUXCY   blk00000014 (
    .CI(sig000000a7),
    .DI(NlwRenamedSig_OI_result[0]),
    .S(sig00000093),
    .O(sig000000a5)
  );
  XORCY   blk00000015 (
    .CI(sig000000a9),
    .LI(sig00000092),
    .O(sig000000a6)
  );
  MUXCY   blk00000016 (
    .CI(sig000000a9),
    .DI(NlwRenamedSig_OI_result[0]),
    .S(sig00000092),
    .O(sig000000a7)
  );
  XORCY   blk00000017 (
    .CI(sig000000ab),
    .LI(sig00000091),
    .O(sig000000a8)
  );
  MUXCY   blk00000018 (
    .CI(sig000000ab),
    .DI(NlwRenamedSig_OI_result[0]),
    .S(sig00000091),
    .O(sig000000a9)
  );
  XORCY   blk00000019 (
    .CI(sig000000ad),
    .LI(sig00000090),
    .O(sig000000aa)
  );
  MUXCY   blk0000001a (
    .CI(sig000000ad),
    .DI(NlwRenamedSig_OI_result[0]),
    .S(sig00000090),
    .O(sig000000ab)
  );
  XORCY   blk0000001b (
    .CI(sig000000af),
    .LI(sig0000008f),
    .O(sig000000ac)
  );
  MUXCY   blk0000001c (
    .CI(sig000000af),
    .DI(NlwRenamedSig_OI_result[0]),
    .S(sig0000008f),
    .O(sig000000ad)
  );
  XORCY   blk0000001d (
    .CI(sig000000b1),
    .LI(sig0000008e),
    .O(sig000000ae)
  );
  MUXCY   blk0000001e (
    .CI(sig000000b1),
    .DI(NlwRenamedSig_OI_result[0]),
    .S(sig0000008e),
    .O(sig000000af)
  );
  XORCY   blk0000001f (
    .CI(sig000000b3),
    .LI(sig0000008d),
    .O(sig000000b0)
  );
  MUXCY   blk00000020 (
    .CI(sig000000b3),
    .DI(NlwRenamedSig_OI_result[0]),
    .S(sig0000008d),
    .O(sig000000b1)
  );
  XORCY   blk00000021 (
    .CI(sig000000b5),
    .LI(sig0000008c),
    .O(sig000000b2)
  );
  MUXCY   blk00000022 (
    .CI(sig000000b5),
    .DI(NlwRenamedSig_OI_result[0]),
    .S(sig0000008c),
    .O(sig000000b3)
  );
  XORCY   blk00000023 (
    .CI(sig000000b7),
    .LI(sig0000008b),
    .O(sig000000b4)
  );
  MUXCY   blk00000024 (
    .CI(sig000000b7),
    .DI(NlwRenamedSig_OI_result[0]),
    .S(sig0000008b),
    .O(sig000000b5)
  );
  XORCY   blk00000025 (
    .CI(sig000000b9),
    .LI(sig0000008a),
    .O(sig000000b6)
  );
  MUXCY   blk00000026 (
    .CI(sig000000b9),
    .DI(NlwRenamedSig_OI_result[0]),
    .S(sig0000008a),
    .O(sig000000b7)
  );
  XORCY   blk00000027 (
    .CI(sig000000bb),
    .LI(sig00000089),
    .O(sig000000b8)
  );
  MUXCY   blk00000028 (
    .CI(sig000000bb),
    .DI(NlwRenamedSig_OI_result[0]),
    .S(sig00000089),
    .O(sig000000b9)
  );
  XORCY   blk00000029 (
    .CI(a[15]),
    .LI(sig00000088),
    .O(sig000000ba)
  );
  MUXCY   blk0000002a (
    .CI(a[15]),
    .DI(NlwRenamedSig_OI_result[0]),
    .S(sig00000088),
    .O(sig000000bb)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000002b (
    .C(clk),
    .CE(ce),
    .D(sig0000009d),
    .Q(sig00000087)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000002c (
    .C(clk),
    .CE(ce),
    .D(sig0000009e),
    .Q(sig00000086)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000002d (
    .C(clk),
    .CE(ce),
    .D(sig000000a0),
    .Q(sig00000085)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000002e (
    .C(clk),
    .CE(ce),
    .D(sig000000a2),
    .Q(sig00000084)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000002f (
    .C(clk),
    .CE(ce),
    .D(sig000000a4),
    .Q(sig00000083)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000030 (
    .C(clk),
    .CE(ce),
    .D(sig000000a6),
    .Q(sig00000082)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000031 (
    .C(clk),
    .CE(ce),
    .D(sig000000a8),
    .Q(sig00000081)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000032 (
    .C(clk),
    .CE(ce),
    .D(sig000000aa),
    .Q(sig00000080)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000033 (
    .C(clk),
    .CE(ce),
    .D(sig000000ac),
    .Q(sig0000007f)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000034 (
    .C(clk),
    .CE(ce),
    .D(sig000000ae),
    .Q(sig0000007e)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000035 (
    .C(clk),
    .CE(ce),
    .D(sig000000b0),
    .Q(sig0000007d)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000036 (
    .C(clk),
    .CE(ce),
    .D(sig000000b2),
    .Q(sig0000007c)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000037 (
    .C(clk),
    .CE(ce),
    .D(sig000000b4),
    .Q(sig0000007b)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000038 (
    .C(clk),
    .CE(ce),
    .D(sig000000b6),
    .Q(sig0000007a)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000039 (
    .C(clk),
    .CE(ce),
    .D(sig000000b8),
    .Q(sig00000079)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000003a (
    .C(clk),
    .CE(ce),
    .D(sig000000ba),
    .Q(sig00000078)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000003b (
    .C(clk),
    .CE(ce),
    .D(sig00000019),
    .Q(sig0000000a)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000003c (
    .C(clk),
    .CE(ce),
    .D(sig0000001a),
    .Q(sig0000000b)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000003d (
    .C(clk),
    .CE(ce),
    .D(sig0000001b),
    .Q(sig0000000c)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000003e (
    .C(clk),
    .CE(ce),
    .D(sig0000001c),
    .Q(sig0000000d)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000003f (
    .C(clk),
    .CE(ce),
    .D(sig0000001d),
    .Q(sig0000000e)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000040 (
    .C(clk),
    .CE(ce),
    .D(sig0000001e),
    .Q(sig0000000f)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000041 (
    .C(clk),
    .CE(ce),
    .D(sig0000001f),
    .Q(sig00000010)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000042 (
    .C(clk),
    .CE(ce),
    .D(sig00000020),
    .Q(sig00000011)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000043 (
    .C(clk),
    .CE(ce),
    .D(sig00000021),
    .Q(sig00000012)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000044 (
    .C(clk),
    .CE(ce),
    .D(sig00000022),
    .Q(sig00000013)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000045 (
    .C(clk),
    .CE(ce),
    .D(sig00000023),
    .Q(sig00000014)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000046 (
    .C(clk),
    .CE(ce),
    .D(sig00000024),
    .Q(sig00000015)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000047 (
    .C(clk),
    .CE(ce),
    .D(sig00000025),
    .Q(sig00000016)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000048 (
    .C(clk),
    .CE(ce),
    .D(sig00000026),
    .Q(sig00000017)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000049 (
    .C(clk),
    .CE(ce),
    .D(sig00000027),
    .Q(sig00000018)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000004a (
    .C(clk),
    .CE(ce),
    .D(sig00000028),
    .Q(sig00000051)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000004b (
    .C(clk),
    .CE(ce),
    .D(sig00000029),
    .Q(sig00000052)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000004c (
    .C(clk),
    .CE(ce),
    .D(sig0000002a),
    .Q(sig00000053)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000004d (
    .C(clk),
    .CE(ce),
    .D(sig0000002b),
    .Q(sig00000054)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000004e (
    .C(clk),
    .CE(ce),
    .D(sig0000002c),
    .Q(sig00000055)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000004f (
    .C(clk),
    .CE(ce),
    .D(sig0000002d),
    .Q(sig00000056)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000050 (
    .C(clk),
    .CE(ce),
    .D(sig0000002e),
    .Q(sig00000057)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000051 (
    .C(clk),
    .CE(ce),
    .D(sig0000002f),
    .Q(sig00000058)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000052 (
    .C(clk),
    .CE(ce),
    .D(sig00000030),
    .Q(sig00000059)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000053 (
    .C(clk),
    .CE(ce),
    .D(sig00000031),
    .Q(sig0000005a)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000054 (
    .C(clk),
    .CE(ce),
    .D(sig00000032),
    .Q(sig0000005b)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000055 (
    .C(clk),
    .CE(ce),
    .D(sig00000033),
    .Q(sig0000005c)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000056 (
    .C(clk),
    .CE(ce),
    .D(sig00000034),
    .Q(sig0000005d)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000057 (
    .C(clk),
    .CE(ce),
    .D(sig00000035),
    .Q(sig0000005e)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000058 (
    .C(clk),
    .CE(ce),
    .D(sig00000036),
    .Q(sig0000005f)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000059 (
    .C(clk),
    .CE(ce),
    .D(sig00000087),
    .Q(sig00000077)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000005a (
    .C(clk),
    .CE(ce),
    .D(sig00000086),
    .Q(sig00000076)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000005b (
    .C(clk),
    .CE(ce),
    .D(sig00000085),
    .Q(sig00000075)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000005c (
    .C(clk),
    .CE(ce),
    .D(sig00000084),
    .Q(sig00000074)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000005d (
    .C(clk),
    .CE(ce),
    .D(sig00000083),
    .Q(sig00000073)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000005e (
    .C(clk),
    .CE(ce),
    .D(sig00000082),
    .Q(sig00000072)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000005f (
    .C(clk),
    .CE(ce),
    .D(sig00000081),
    .Q(sig00000071)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000060 (
    .C(clk),
    .CE(ce),
    .D(sig00000080),
    .Q(sig00000070)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000061 (
    .C(clk),
    .CE(ce),
    .D(sig0000007f),
    .Q(sig0000006f)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000062 (
    .C(clk),
    .CE(ce),
    .D(sig0000007e),
    .Q(sig0000006e)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000063 (
    .C(clk),
    .CE(ce),
    .D(sig0000007d),
    .Q(sig0000006d)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000064 (
    .C(clk),
    .CE(ce),
    .D(sig0000007c),
    .Q(sig0000006c)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000065 (
    .C(clk),
    .CE(ce),
    .D(sig0000007b),
    .Q(sig0000006b)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000066 (
    .C(clk),
    .CE(ce),
    .D(sig0000007a),
    .Q(sig0000006a)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000067 (
    .C(clk),
    .CE(ce),
    .D(sig00000079),
    .Q(sig00000069)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000068 (
    .C(clk),
    .CE(ce),
    .D(sig00000078),
    .Q(sig00000068)
  );
  MUXF7   blk00000069 (
    .I0(sig000000bc),
    .I1(sig000000bd),
    .S(sig00000067),
    .O(NLW_blk00000069_O_UNCONNECTED)
  );
  MUXF7   blk0000006a (
    .I0(sig000000be),
    .I1(sig000000c0),
    .S(sig00000067),
    .O(sig000000c2)
  );
  MUXF7   blk0000006b (
    .I0(sig000000bf),
    .I1(sig000000c1),
    .S(sig00000067),
    .O(sig000000c3)
  );
  MUXCY   blk0000006c (
    .CI(sig00000001),
    .DI(NlwRenamedSig_OI_result[0]),
    .S(sig000000c9),
    .O(sig000000c4)
  );
  MUXCY   blk0000006d (
    .CI(sig000000c4),
    .DI(NlwRenamedSig_OI_result[0]),
    .S(sig000000ca),
    .O(sig000000c5)
  );
  MUXCY   blk0000006e (
    .CI(sig00000001),
    .DI(NlwRenamedSig_OI_result[0]),
    .S(sig000000cb),
    .O(sig000000c6)
  );
  MUXCY   blk0000006f (
    .CI(sig000000c6),
    .DI(NlwRenamedSig_OI_result[0]),
    .S(sig000000cc),
    .O(sig000000c7)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000070 (
    .C(clk),
    .CE(ce),
    .D(sig00000065),
    .Q(sig0000003b)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000071 (
    .C(clk),
    .CE(ce),
    .D(sig00000064),
    .Q(sig00000061)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000072 (
    .C(clk),
    .CE(ce),
    .D(sig000000c2),
    .Q(sig00000064)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000073 (
    .C(clk),
    .CE(ce),
    .D(sig000000c3),
    .Q(sig00000065)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000074 (
    .C(clk),
    .CE(ce),
    .D(sig000000c8),
    .Q(sig00000060)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000075 (
    .C(clk),
    .CE(ce),
    .D(sig000000c4),
    .Q(sig000000cf)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000076 (
    .C(clk),
    .CE(ce),
    .D(sig000000c5),
    .Q(sig00000067)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000077 (
    .C(clk),
    .CE(ce),
    .D(sig000000c6),
    .Q(sig000000ce)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000078 (
    .C(clk),
    .CE(ce),
    .D(sig000000c7),
    .Q(sig000000cd)
  );
  XORCY   blk00000079 (
    .CI(sig000000d2),
    .LI(sig00000117),
    .O(sig000000d0)
  );
  MUXCY   blk0000007a (
    .CI(sig000000d2),
    .DI(NlwRenamedSig_OI_result[0]),
    .S(sig00000117),
    .O(sig00000006)
  );
  XORCY   blk0000007b (
    .CI(sig000000d4),
    .LI(sig00000118),
    .O(sig000000d1)
  );
  MUXCY   blk0000007c (
    .CI(sig000000d4),
    .DI(NlwRenamedSig_OI_result[0]),
    .S(sig00000118),
    .O(sig000000d2)
  );
  XORCY   blk0000007d (
    .CI(sig000000d6),
    .LI(sig00000119),
    .O(sig000000d3)
  );
  MUXCY   blk0000007e (
    .CI(sig000000d6),
    .DI(NlwRenamedSig_OI_result[0]),
    .S(sig00000119),
    .O(sig000000d4)
  );
  XORCY   blk0000007f (
    .CI(sig000000d7),
    .LI(sig0000011a),
    .O(sig000000d5)
  );
  MUXCY   blk00000080 (
    .CI(sig000000d7),
    .DI(NlwRenamedSig_OI_result[0]),
    .S(sig0000011a),
    .O(sig000000d6)
  );
  XORCY   blk00000081 (
    .CI(sig000000d8),
    .LI(NlwRenamedSig_OI_result[0]),
    .O(NLW_blk00000081_O_UNCONNECTED)
  );
  MUXCY   blk00000082 (
    .CI(sig000000d8),
    .DI(NlwRenamedSig_OI_result[0]),
    .S(NlwRenamedSig_OI_result[0]),
    .O(sig000000d7)
  );
  XORCY   blk00000083 (
    .CI(sig000000d9),
    .LI(NlwRenamedSig_OI_result[0]),
    .O(NLW_blk00000083_O_UNCONNECTED)
  );
  MUXCY   blk00000084 (
    .CI(sig000000d9),
    .DI(NlwRenamedSig_OI_result[0]),
    .S(NlwRenamedSig_OI_result[0]),
    .O(sig000000d8)
  );
  XORCY   blk00000085 (
    .CI(sig000000da),
    .LI(NlwRenamedSig_OI_result[0]),
    .O(NLW_blk00000085_O_UNCONNECTED)
  );
  MUXCY   blk00000086 (
    .CI(sig000000da),
    .DI(NlwRenamedSig_OI_result[0]),
    .S(NlwRenamedSig_OI_result[0]),
    .O(sig000000d9)
  );
  XORCY   blk00000087 (
    .CI(sig000000db),
    .LI(NlwRenamedSig_OI_result[0]),
    .O(NLW_blk00000087_O_UNCONNECTED)
  );
  MUXCY   blk00000088 (
    .CI(sig000000db),
    .DI(NlwRenamedSig_OI_result[0]),
    .S(NlwRenamedSig_OI_result[0]),
    .O(sig000000da)
  );
  XORCY   blk00000089 (
    .CI(sig000000dc),
    .LI(NlwRenamedSig_OI_result[0]),
    .O(NLW_blk00000089_O_UNCONNECTED)
  );
  MUXCY   blk0000008a (
    .CI(sig000000dc),
    .DI(NlwRenamedSig_OI_result[0]),
    .S(NlwRenamedSig_OI_result[0]),
    .O(sig000000db)
  );
  XORCY   blk0000008b (
    .CI(sig000000dd),
    .LI(NlwRenamedSig_OI_result[0]),
    .O(NLW_blk0000008b_O_UNCONNECTED)
  );
  MUXCY   blk0000008c (
    .CI(sig000000dd),
    .DI(NlwRenamedSig_OI_result[0]),
    .S(NlwRenamedSig_OI_result[0]),
    .O(sig000000dc)
  );
  XORCY   blk0000008d (
    .CI(sig000000de),
    .LI(NlwRenamedSig_OI_result[0]),
    .O(NLW_blk0000008d_O_UNCONNECTED)
  );
  MUXCY   blk0000008e (
    .CI(sig000000de),
    .DI(NlwRenamedSig_OI_result[0]),
    .S(NlwRenamedSig_OI_result[0]),
    .O(sig000000dd)
  );
  XORCY   blk0000008f (
    .CI(sig00000005),
    .LI(NlwRenamedSig_OI_result[0]),
    .O(NLW_blk0000008f_O_UNCONNECTED)
  );
  MUXCY   blk00000090 (
    .CI(sig00000005),
    .DI(NlwRenamedSig_OI_result[0]),
    .S(NlwRenamedSig_OI_result[0]),
    .O(sig000000de)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000091 (
    .C(clk),
    .CE(ce),
    .D(sig000000d5),
    .Q(sig00000042)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000092 (
    .C(clk),
    .CE(ce),
    .D(sig000000d3),
    .Q(sig00000043)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000093 (
    .C(clk),
    .CE(ce),
    .D(sig000000d1),
    .Q(sig00000044)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000094 (
    .C(clk),
    .CE(ce),
    .D(sig000000d0),
    .Q(sig00000045)
  );
  XORCY   blk00000095 (
    .CI(sig000000e1),
    .LI(sig00000001),
    .O(sig000000df)
  );
  XORCY   blk00000096 (
    .CI(sig000000e3),
    .LI(sig0000011b),
    .O(sig000000e0)
  );
  MUXCY   blk00000097 (
    .CI(sig000000e3),
    .DI(NlwRenamedSig_OI_result[0]),
    .S(sig0000011b),
    .O(sig000000e1)
  );
  XORCY   blk00000098 (
    .CI(sig000000e5),
    .LI(sig0000011c),
    .O(sig000000e2)
  );
  MUXCY   blk00000099 (
    .CI(sig000000e5),
    .DI(NlwRenamedSig_OI_result[0]),
    .S(sig0000011c),
    .O(sig000000e3)
  );
  XORCY   blk0000009a (
    .CI(sig000000e7),
    .LI(sig0000011d),
    .O(sig000000e4)
  );
  MUXCY   blk0000009b (
    .CI(sig000000e7),
    .DI(NlwRenamedSig_OI_result[0]),
    .S(sig0000011d),
    .O(sig000000e5)
  );
  XORCY   blk0000009c (
    .CI(sig000000e9),
    .LI(sig0000011e),
    .O(sig000000e6)
  );
  MUXCY   blk0000009d (
    .CI(sig000000e9),
    .DI(NlwRenamedSig_OI_result[0]),
    .S(sig0000011e),
    .O(sig000000e7)
  );
  XORCY   blk0000009e (
    .CI(sig000000eb),
    .LI(sig0000011f),
    .O(sig000000e8)
  );
  MUXCY   blk0000009f (
    .CI(sig000000eb),
    .DI(NlwRenamedSig_OI_result[0]),
    .S(sig0000011f),
    .O(sig000000e9)
  );
  XORCY   blk000000a0 (
    .CI(sig000000ed),
    .LI(sig00000120),
    .O(sig000000ea)
  );
  MUXCY   blk000000a1 (
    .CI(sig000000ed),
    .DI(NlwRenamedSig_OI_result[0]),
    .S(sig00000120),
    .O(sig000000eb)
  );
  XORCY   blk000000a2 (
    .CI(sig000000ef),
    .LI(sig00000121),
    .O(sig000000ec)
  );
  MUXCY   blk000000a3 (
    .CI(sig000000ef),
    .DI(NlwRenamedSig_OI_result[0]),
    .S(sig00000121),
    .O(sig000000ed)
  );
  XORCY   blk000000a4 (
    .CI(sig000000f1),
    .LI(sig00000122),
    .O(sig000000ee)
  );
  MUXCY   blk000000a5 (
    .CI(sig000000f1),
    .DI(NlwRenamedSig_OI_result[0]),
    .S(sig00000122),
    .O(sig000000ef)
  );
  XORCY   blk000000a6 (
    .CI(sig000000f3),
    .LI(sig00000123),
    .O(sig000000f0)
  );
  MUXCY   blk000000a7 (
    .CI(sig000000f3),
    .DI(NlwRenamedSig_OI_result[0]),
    .S(sig00000123),
    .O(sig000000f1)
  );
  XORCY   blk000000a8 (
    .CI(sig000000f5),
    .LI(sig00000124),
    .O(sig000000f2)
  );
  MUXCY   blk000000a9 (
    .CI(sig000000f5),
    .DI(NlwRenamedSig_OI_result[0]),
    .S(sig00000124),
    .O(sig000000f3)
  );
  XORCY   blk000000aa (
    .CI(sig00000006),
    .LI(sig00000125),
    .O(sig000000f4)
  );
  MUXCY   blk000000ab (
    .CI(sig00000006),
    .DI(NlwRenamedSig_OI_result[0]),
    .S(sig00000125),
    .O(sig000000f5)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000ac (
    .C(clk),
    .CE(ce),
    .D(sig000000f4),
    .Q(sig00000046)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000ad (
    .C(clk),
    .CE(ce),
    .D(sig000000f2),
    .Q(sig00000047)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000ae (
    .C(clk),
    .CE(ce),
    .D(sig000000f0),
    .Q(sig00000048)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000af (
    .C(clk),
    .CE(ce),
    .D(sig000000ee),
    .Q(sig00000049)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000b0 (
    .C(clk),
    .CE(ce),
    .D(sig000000ec),
    .Q(sig0000004a)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000b1 (
    .C(clk),
    .CE(ce),
    .D(sig000000ea),
    .Q(sig0000004b)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000b2 (
    .C(clk),
    .CE(ce),
    .D(sig000000e8),
    .Q(sig0000004c)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000b3 (
    .C(clk),
    .CE(ce),
    .D(sig000000e6),
    .Q(sig0000004d)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000b4 (
    .C(clk),
    .CE(ce),
    .D(sig000000e4),
    .Q(sig0000004e)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000b5 (
    .C(clk),
    .CE(ce),
    .D(sig000000e2),
    .Q(sig0000004f)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000b6 (
    .C(clk),
    .CE(ce),
    .D(sig000000e0),
    .Q(sig00000050)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000b7 (
    .C(clk),
    .CE(ce),
    .D(sig000000df),
    .Q(sig00000007)
  );
  FD   blk000000b8 (
    .C(clk),
    .D(sig00000104),
    .Q(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/mant_op [22])
  );
  FD   blk000000b9 (
    .C(clk),
    .D(sig00000103),
    .Q(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/mant_op [21])
  );
  FD   blk000000ba (
    .C(clk),
    .D(sig00000102),
    .Q(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/mant_op [20])
  );
  FD   blk000000bb (
    .C(clk),
    .D(sig00000101),
    .Q(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/mant_op [19])
  );
  FD   blk000000bc (
    .C(clk),
    .D(sig00000100),
    .Q(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/mant_op [18])
  );
  FD   blk000000bd (
    .C(clk),
    .D(sig000000ff),
    .Q(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/mant_op [17])
  );
  FD   blk000000be (
    .C(clk),
    .D(sig000000fe),
    .Q(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/mant_op [16])
  );
  FD   blk000000bf (
    .C(clk),
    .D(sig000000fd),
    .Q(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/mant_op [15])
  );
  FD   blk000000c0 (
    .C(clk),
    .D(sig000000fc),
    .Q(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/mant_op [14])
  );
  FD   blk000000c1 (
    .C(clk),
    .D(sig000000fb),
    .Q(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/mant_op [13])
  );
  FD   blk000000c2 (
    .C(clk),
    .D(sig000000fa),
    .Q(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/mant_op [12])
  );
  FD   blk000000c3 (
    .C(clk),
    .D(sig000000f9),
    .Q(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/mant_op [11])
  );
  FD   blk000000c4 (
    .C(clk),
    .D(sig000000f8),
    .Q(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/mant_op [10])
  );
  FD   blk000000c5 (
    .C(clk),
    .D(sig000000f7),
    .Q(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/mant_op [9])
  );
  FD   blk000000c6 (
    .C(clk),
    .D(sig000000f6),
    .Q(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/mant_op [8])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  blk000000c7 (
    .C(clk),
    .CE(sig0000010a),
    .D(sig00000107),
    .R(sclr),
    .Q(sig0000010d)
  );
  FDSE #(
    .INIT ( 1'b1 ))
  blk000000c8 (
    .C(clk),
    .CE(sig0000010a),
    .D(sig00000109),
    .S(sclr),
    .Q(sig00000105)
  );
  FDSE #(
    .INIT ( 1'b1 ))
  blk000000c9 (
    .C(clk),
    .CE(sig0000010a),
    .D(sig00000108),
    .S(sclr),
    .Q(sig00000106)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000ca (
    .C(clk),
    .CE(ce),
    .D(sig00000110),
    .Q(sig0000010b)
  );
  LUT3 #(
    .INIT ( 8'hFE ))
  blk000000cb (
    .I0(sig0000003b),
    .I1(sig00000062),
    .I2(sig00000063),
    .O(sig00000038)
  );
  LUT3 #(
    .INIT ( 8'h01 ))
  blk000000cc (
    .I0(sig0000003b),
    .I1(sig00000062),
    .I2(sig00000063),
    .O(sig00000037)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  blk000000cd (
    .I0(sig00000064),
    .I1(sig00000065),
    .I2(sig0000000e),
    .I3(sig0000000c),
    .I4(sig0000000d),
    .I5(sig0000000f),
    .O(sig0000002d)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  blk000000ce (
    .I0(sig00000064),
    .I1(sig00000065),
    .I2(sig0000000d),
    .I3(sig0000000b),
    .I4(sig0000000c),
    .I5(sig0000000e),
    .O(sig0000002c)
  );
  LUT5 #(
    .INIT ( 32'h76325410 ))
  blk000000cf (
    .I0(sig00000065),
    .I1(sig00000064),
    .I2(sig0000000c),
    .I3(sig0000000b),
    .I4(sig0000000a),
    .O(sig0000002a)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  blk000000d0 (
    .I0(sig00000064),
    .I1(sig00000065),
    .I2(sig0000000c),
    .I3(sig0000000a),
    .I4(sig0000000b),
    .I5(sig0000000d),
    .O(sig0000002b)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  blk000000d1 (
    .I0(sig00000064),
    .I1(sig00000065),
    .I2(sig00000017),
    .I3(sig00000015),
    .I4(sig00000016),
    .I5(sig00000018),
    .O(sig00000036)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  blk000000d2 (
    .I0(sig00000064),
    .I1(sig00000065),
    .I2(sig00000016),
    .I3(sig00000014),
    .I4(sig00000015),
    .I5(sig00000017),
    .O(sig00000035)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  blk000000d3 (
    .I0(sig00000064),
    .I1(sig00000065),
    .I2(sig00000015),
    .I3(sig00000013),
    .I4(sig00000014),
    .I5(sig00000016),
    .O(sig00000034)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  blk000000d4 (
    .I0(sig00000064),
    .I1(sig00000065),
    .I2(sig00000014),
    .I3(sig00000012),
    .I4(sig00000013),
    .I5(sig00000015),
    .O(sig00000033)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  blk000000d5 (
    .I0(sig00000064),
    .I1(sig00000065),
    .I2(sig00000013),
    .I3(sig00000011),
    .I4(sig00000012),
    .I5(sig00000014),
    .O(sig00000032)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  blk000000d6 (
    .I0(sig00000064),
    .I1(sig00000065),
    .I2(sig00000012),
    .I3(sig00000010),
    .I4(sig00000011),
    .I5(sig00000013),
    .O(sig00000031)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  blk000000d7 (
    .I0(sig00000064),
    .I1(sig00000065),
    .I2(sig00000011),
    .I3(sig0000000f),
    .I4(sig00000010),
    .I5(sig00000012),
    .O(sig00000030)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  blk000000d8 (
    .I0(sig00000064),
    .I1(sig00000065),
    .I2(sig0000000f),
    .I3(sig0000000d),
    .I4(sig0000000e),
    .I5(sig00000010),
    .O(sig0000002e)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  blk000000d9 (
    .I0(sig00000064),
    .I1(sig00000065),
    .I2(sig00000010),
    .I3(sig0000000e),
    .I4(sig0000000f),
    .I5(sig00000011),
    .O(sig0000002f)
  );
  LUT6 #(
    .INIT ( 64'hFF00CCCCF0F0AAAA ))
  blk000000da (
    .I0(sig00000074),
    .I1(sig00000070),
    .I2(sig0000006c),
    .I3(sig00000068),
    .I4(sig00000067),
    .I5(sig00000066),
    .O(sig00000025)
  );
  LUT6 #(
    .INIT ( 64'hFF00CCCCF0F0AAAA ))
  blk000000db (
    .I0(sig00000075),
    .I1(sig00000071),
    .I2(sig0000006d),
    .I3(sig00000069),
    .I4(sig00000067),
    .I5(sig00000066),
    .O(sig00000026)
  );
  LUT6 #(
    .INIT ( 64'hFF00CCCCF0F0AAAA ))
  blk000000dc (
    .I0(sig00000076),
    .I1(sig00000072),
    .I2(sig0000006e),
    .I3(sig0000006a),
    .I4(sig00000067),
    .I5(sig00000066),
    .O(sig00000027)
  );
  LUT3 #(
    .INIT ( 8'h41 ))
  blk000000dd (
    .I0(sig0000009c),
    .I1(sig00000041),
    .I2(sig00000007),
    .O(sig00000008)
  );
  LUT4 #(
    .INIT ( 16'h4414 ))
  blk000000de (
    .I0(sig0000009c),
    .I1(sig00000040),
    .I2(sig00000041),
    .I3(sig00000007),
    .O(sig00000097)
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  blk000000df (
    .I0(sig00000040),
    .I1(sig00000041),
    .I2(sig00000007),
    .O(sig00000002)
  );
  LUT3 #(
    .INIT ( 8'h56 ))
  blk000000e0 (
    .I0(sig00000063),
    .I1(sig00000062),
    .I2(sig0000003b),
    .O(sig00000039)
  );
  LUT4 #(
    .INIT ( 16'h5410 ))
  blk000000e1 (
    .I0(sig00000065),
    .I1(sig00000064),
    .I2(sig0000000b),
    .I3(sig0000000a),
    .O(sig00000029)
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  blk000000e2 (
    .I0(sig00000065),
    .I1(sig00000064),
    .I2(sig0000000a),
    .O(sig00000028)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000e3 (
    .I0(sig00000062),
    .I1(sig0000003b),
    .O(sig0000003a)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000e4 (
    .I0(a[0]),
    .I1(a[15]),
    .O(sig00000088)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000e5 (
    .I0(a[10]),
    .I1(a[15]),
    .O(sig00000092)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000e6 (
    .I0(a[11]),
    .I1(a[15]),
    .O(sig00000093)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000e7 (
    .I0(a[12]),
    .I1(a[15]),
    .O(sig00000094)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000e8 (
    .I0(a[13]),
    .I1(a[15]),
    .O(sig00000095)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000e9 (
    .I0(a[14]),
    .I1(a[15]),
    .O(sig00000096)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000ea (
    .I0(a[1]),
    .I1(a[15]),
    .O(sig00000089)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000eb (
    .I0(a[2]),
    .I1(a[15]),
    .O(sig0000008a)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000ec (
    .I0(a[3]),
    .I1(a[15]),
    .O(sig0000008b)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000ed (
    .I0(a[4]),
    .I1(a[15]),
    .O(sig0000008c)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000ee (
    .I0(a[5]),
    .I1(a[15]),
    .O(sig0000008d)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000ef (
    .I0(a[6]),
    .I1(a[15]),
    .O(sig0000008e)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000f0 (
    .I0(a[7]),
    .I1(a[15]),
    .O(sig0000008f)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000f1 (
    .I0(a[8]),
    .I1(a[15]),
    .O(sig00000090)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000f2 (
    .I0(a[9]),
    .I1(a[15]),
    .O(sig00000091)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  blk000000f3 (
    .I0(sig000000ce),
    .I1(sig000000cf),
    .I2(sig00000067),
    .O(sig00000066)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  blk000000f4 (
    .I0(sig00000067),
    .I1(sig000000cf),
    .O(sig000000bc)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  blk000000f5 (
    .I0(sig000000cd),
    .I1(sig000000ce),
    .O(sig000000bd)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  blk000000f6 (
    .I0(sig00000067),
    .I1(sig000000cd),
    .O(sig000000c8)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk000000f7 (
    .I0(sig00000087),
    .I1(sig00000086),
    .I2(sig00000085),
    .I3(sig00000084),
    .O(sig000000c9)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk000000f8 (
    .I0(sig00000083),
    .I1(sig00000082),
    .I2(sig00000081),
    .I3(sig00000080),
    .O(sig000000ca)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk000000f9 (
    .I0(sig0000007d),
    .I1(sig0000007c),
    .I2(sig0000007f),
    .I3(sig0000007e),
    .O(sig000000cb)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk000000fa (
    .I0(sig0000007b),
    .I1(sig0000007a),
    .I2(sig00000079),
    .I3(sig00000078),
    .O(sig000000cc)
  );
  LUT4 #(
    .INIT ( 16'h4E44 ))
  blk000000fb (
    .I0(ce),
    .I1(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/mant_op [8]),
    .I2(sig0000009c),
    .I3(sig00000042),
    .O(sig000000f6)
  );
  LUT4 #(
    .INIT ( 16'h4E44 ))
  blk000000fc (
    .I0(ce),
    .I1(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/mant_op [9]),
    .I2(sig0000009c),
    .I3(sig00000043),
    .O(sig000000f7)
  );
  LUT4 #(
    .INIT ( 16'h4E44 ))
  blk000000fd (
    .I0(ce),
    .I1(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/mant_op [10]),
    .I2(sig0000009c),
    .I3(sig00000044),
    .O(sig000000f8)
  );
  LUT4 #(
    .INIT ( 16'h4E44 ))
  blk000000fe (
    .I0(ce),
    .I1(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/mant_op [12]),
    .I2(sig0000009c),
    .I3(sig00000046),
    .O(sig000000fa)
  );
  LUT4 #(
    .INIT ( 16'h4E44 ))
  blk000000ff (
    .I0(ce),
    .I1(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/mant_op [13]),
    .I2(sig0000009c),
    .I3(sig00000047),
    .O(sig000000fb)
  );
  LUT4 #(
    .INIT ( 16'h4E44 ))
  blk00000100 (
    .I0(ce),
    .I1(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/mant_op [11]),
    .I2(sig0000009c),
    .I3(sig00000045),
    .O(sig000000f9)
  );
  LUT4 #(
    .INIT ( 16'h4E44 ))
  blk00000101 (
    .I0(ce),
    .I1(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/mant_op [14]),
    .I2(sig0000009c),
    .I3(sig00000048),
    .O(sig000000fc)
  );
  LUT4 #(
    .INIT ( 16'h4E44 ))
  blk00000102 (
    .I0(ce),
    .I1(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/mant_op [15]),
    .I2(sig0000009c),
    .I3(sig00000049),
    .O(sig000000fd)
  );
  LUT4 #(
    .INIT ( 16'h4E44 ))
  blk00000103 (
    .I0(ce),
    .I1(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/mant_op [16]),
    .I2(sig0000009c),
    .I3(sig0000004a),
    .O(sig000000fe)
  );
  LUT4 #(
    .INIT ( 16'h4E44 ))
  blk00000104 (
    .I0(ce),
    .I1(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/mant_op [17]),
    .I2(sig0000009c),
    .I3(sig0000004b),
    .O(sig000000ff)
  );
  LUT4 #(
    .INIT ( 16'h4E44 ))
  blk00000105 (
    .I0(ce),
    .I1(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/mant_op [18]),
    .I2(sig0000009c),
    .I3(sig0000004c),
    .O(sig00000100)
  );
  LUT4 #(
    .INIT ( 16'h4E44 ))
  blk00000106 (
    .I0(ce),
    .I1(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/mant_op [19]),
    .I2(sig0000009c),
    .I3(sig0000004d),
    .O(sig00000101)
  );
  LUT4 #(
    .INIT ( 16'h4E44 ))
  blk00000107 (
    .I0(ce),
    .I1(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/mant_op [21]),
    .I2(sig0000009c),
    .I3(sig0000004f),
    .O(sig00000103)
  );
  LUT4 #(
    .INIT ( 16'h4E44 ))
  blk00000108 (
    .I0(ce),
    .I1(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/mant_op [22]),
    .I2(sig0000009c),
    .I3(sig00000050),
    .O(sig00000104)
  );
  LUT4 #(
    .INIT ( 16'h4E44 ))
  blk00000109 (
    .I0(ce),
    .I1(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/mant_op [20]),
    .I2(sig0000009c),
    .I3(sig0000004e),
    .O(sig00000102)
  );
  LUT3 #(
    .INIT ( 8'hF1 ))
  blk0000010a (
    .I0(sig00000106),
    .I1(sig00000105),
    .I2(sig0000010d),
    .O(sig00000107)
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  blk0000010b (
    .I0(sig00000106),
    .I1(sig00000105),
    .O(sig00000108)
  );
  LUT3 #(
    .INIT ( 8'h20 ))
  blk0000010c (
    .I0(ce),
    .I1(sig0000010d),
    .I2(sig0000010e),
    .O(sig0000010a)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  blk0000010d (
    .I0(operation_nd),
    .I1(sig0000010f),
    .O(sig00000110)
  );
  LUT5 #(
    .INIT ( 32'h002A00AA ))
  blk0000010e (
    .I0(sig0000003d),
    .I1(sig0000003e),
    .I2(sig0000003f),
    .I3(sig0000009c),
    .I4(sig00000002),
    .O(sig0000009a)
  );
  LUT3 #(
    .INIT ( 8'h7F ))
  blk0000010f (
    .I0(sig0000003d),
    .I1(sig0000003f),
    .I2(sig0000003e),
    .O(sig00000111)
  );
  LUT6 #(
    .INIT ( 64'h0000AAAA0000A6AA ))
  blk00000110 (
    .I0(sig0000003c),
    .I1(sig00000040),
    .I2(sig00000007),
    .I3(sig00000041),
    .I4(sig0000009c),
    .I5(sig00000111),
    .O(sig0000009b)
  );
  LUT4 #(
    .INIT ( 16'hFF51 ))
  blk00000111 (
    .I0(sig0000006a),
    .I1(sig00000068),
    .I2(sig00000069),
    .I3(sig0000006b),
    .O(sig00000112)
  );
  LUT6 #(
    .INIT ( 64'h11110100DDDDCDCC ))
  blk00000112 (
    .I0(sig0000006f),
    .I1(sig000000ce),
    .I2(sig0000006d),
    .I3(sig0000006c),
    .I4(sig0000006e),
    .I5(sig00000112),
    .O(sig000000c0)
  );
  LUT4 #(
    .INIT ( 16'hFF51 ))
  blk00000113 (
    .I0(sig00000076),
    .I1(sig00000074),
    .I2(sig00000075),
    .I3(sig00000077),
    .O(sig00000113)
  );
  LUT6 #(
    .INIT ( 64'h2222020077775755 ))
  blk00000114 (
    .I0(sig000000cf),
    .I1(sig00000073),
    .I2(sig00000071),
    .I3(sig00000070),
    .I4(sig00000072),
    .I5(sig00000113),
    .O(sig000000be)
  );
  LUT4 #(
    .INIT ( 16'hFFAB ))
  blk00000115 (
    .I0(sig0000006b),
    .I1(sig00000069),
    .I2(sig00000068),
    .I3(sig0000006a),
    .O(sig00000114)
  );
  LUT6 #(
    .INIT ( 64'h01010100CDCDCDCC ))
  blk00000116 (
    .I0(sig0000006e),
    .I1(sig000000ce),
    .I2(sig0000006f),
    .I3(sig0000006c),
    .I4(sig0000006d),
    .I5(sig00000114),
    .O(sig000000c1)
  );
  LUT4 #(
    .INIT ( 16'hFFAB ))
  blk00000117 (
    .I0(sig00000076),
    .I1(sig00000075),
    .I2(sig00000074),
    .I3(sig00000077),
    .O(sig00000115)
  );
  LUT6 #(
    .INIT ( 64'h0404040037373733 ))
  blk00000118 (
    .I0(sig00000073),
    .I1(sig000000cf),
    .I2(sig00000072),
    .I3(sig00000070),
    .I4(sig00000071),
    .I5(sig00000115),
    .O(sig000000bf)
  );
  FDE   blk00000119 (
    .C(clk),
    .CE(ce),
    .D(sig0000009b),
    .Q(\U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/exp_op[7] )
  );
  FDE   blk0000011a (
    .C(clk),
    .CE(ce),
    .D(sig0000009a),
    .Q(\NlwRenamedSignal_U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/exp_op [6])
  );
  FDE   blk0000011b (
    .C(clk),
    .CE(ce),
    .D(sig00000099),
    .Q(\U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/exp_op[3] )
  );
  FDE   blk0000011c (
    .C(clk),
    .CE(ce),
    .D(sig00000098),
    .Q(\U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/exp_op[2] )
  );
  FDE   blk0000011d (
    .C(clk),
    .CE(ce),
    .D(sig00000097),
    .Q(\U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/exp_op[1] )
  );
  FDE   blk0000011e (
    .C(clk),
    .CE(ce),
    .D(sig00000008),
    .Q(\U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/exp_op[0] )
  );
  FDR #(
    .INIT ( 1'b1 ))
  blk0000011f (
    .C(clk),
    .D(sig00000116),
    .R(sclr),
    .Q(sig0000010f)
  );
  LUT2 #(
    .INIT ( 4'hE ))
  blk00000120 (
    .I0(sig0000010f),
    .I1(ce),
    .O(sig00000116)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk00000121 (
    .I0(sig00000054),
    .O(sig00000117)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk00000122 (
    .I0(sig00000053),
    .O(sig00000118)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk00000123 (
    .I0(sig00000052),
    .O(sig00000119)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk00000124 (
    .I0(sig00000051),
    .O(sig0000011a)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk00000125 (
    .I0(sig0000005f),
    .O(sig0000011b)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk00000126 (
    .I0(sig0000005e),
    .O(sig0000011c)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk00000127 (
    .I0(sig0000005d),
    .O(sig0000011d)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk00000128 (
    .I0(sig0000005c),
    .O(sig0000011e)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk00000129 (
    .I0(sig0000005b),
    .O(sig0000011f)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk0000012a (
    .I0(sig0000005a),
    .O(sig00000120)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk0000012b (
    .I0(sig00000059),
    .O(sig00000121)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk0000012c (
    .I0(sig00000058),
    .O(sig00000122)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk0000012d (
    .I0(sig00000057),
    .O(sig00000123)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk0000012e (
    .I0(sig00000056),
    .O(sig00000124)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk0000012f (
    .I0(sig00000055),
    .O(sig00000125)
  );
  FDS #(
    .INIT ( 1'b0 ))
  blk00000130 (
    .C(clk),
    .D(sig00000126),
    .S(sclr),
    .Q(sig0000010e)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000131 (
    .C(clk),
    .D(sig00000127),
    .Q(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/HND_SHK/RDY )
  );
  LUT4 #(
    .INIT ( 16'h5410 ))
  blk00000132 (
    .I0(sig00000067),
    .I1(sig000000cf),
    .I2(sig0000006c),
    .I3(sig00000068),
    .O(sig0000001d)
  );
  LUT4 #(
    .INIT ( 16'h5410 ))
  blk00000133 (
    .I0(sig00000067),
    .I1(sig000000cf),
    .I2(sig0000006f),
    .I3(sig0000006b),
    .O(sig00000020)
  );
  LUT4 #(
    .INIT ( 16'h5410 ))
  blk00000134 (
    .I0(sig00000067),
    .I1(sig000000cf),
    .I2(sig0000006d),
    .I3(sig00000069),
    .O(sig0000001e)
  );
  LUT4 #(
    .INIT ( 16'h5410 ))
  blk00000135 (
    .I0(sig00000067),
    .I1(sig000000cf),
    .I2(sig0000006e),
    .I3(sig0000006a),
    .O(sig0000001f)
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  blk00000136 (
    .I0(sig00000067),
    .I1(sig000000cf),
    .I2(sig0000006b),
    .O(sig0000001c)
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  blk00000137 (
    .I0(sig00000067),
    .I1(sig000000cf),
    .I2(sig0000006a),
    .O(sig0000001b)
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  blk00000138 (
    .I0(sig00000067),
    .I1(sig000000cf),
    .I2(sig00000068),
    .O(sig00000019)
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  blk00000139 (
    .I0(sig00000067),
    .I1(sig000000cf),
    .I2(sig00000069),
    .O(sig0000001a)
  );
  LUT6 #(
    .INIT ( 64'h5140FBEA51405140 ))
  blk0000013a (
    .I0(sig00000067),
    .I1(sig000000cf),
    .I2(sig0000006c),
    .I3(sig00000070),
    .I4(sig000000ce),
    .I5(sig00000068),
    .O(sig00000021)
  );
  LUT6 #(
    .INIT ( 64'h5140FBEA51405140 ))
  blk0000013b (
    .I0(sig00000067),
    .I1(sig000000cf),
    .I2(sig0000006f),
    .I3(sig00000073),
    .I4(sig000000ce),
    .I5(sig0000006b),
    .O(sig00000024)
  );
  LUT6 #(
    .INIT ( 64'h5140FBEA51405140 ))
  blk0000013c (
    .I0(sig00000067),
    .I1(sig000000cf),
    .I2(sig0000006d),
    .I3(sig00000071),
    .I4(sig000000ce),
    .I5(sig00000069),
    .O(sig00000022)
  );
  LUT6 #(
    .INIT ( 64'h5140FBEA51405140 ))
  blk0000013d (
    .I0(sig00000067),
    .I1(sig000000cf),
    .I2(sig0000006e),
    .I3(sig00000072),
    .I4(sig000000ce),
    .I5(sig0000006a),
    .O(sig00000023)
  );
  LUT5 #(
    .INIT ( 32'h44441444 ))
  blk0000013e (
    .I0(sig0000009c),
    .I1(sig0000003f),
    .I2(sig00000040),
    .I3(sig00000041),
    .I4(sig00000007),
    .O(sig00000098)
  );
  LUT6 #(
    .INIT ( 64'h4444444414444444 ))
  blk0000013f (
    .I0(sig0000009c),
    .I1(sig0000003e),
    .I2(sig0000003f),
    .I3(sig00000040),
    .I4(sig00000041),
    .I5(sig00000007),
    .O(sig00000099)
  );
  LUT5 #(
    .INIT ( 32'h15051000 ))
  blk00000140 (
    .I0(sclr),
    .I1(sig0000010e),
    .I2(ce),
    .I3(sig0000010c),
    .I4(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/HND_SHK/RDY ),
    .O(sig00000127)
  );
  LUT4 #(
    .INIT ( 16'hA2AA ))
  blk00000141 (
    .I0(sig0000010e),
    .I1(ce),
    .I2(sclr),
    .I3(sig0000010d),
    .O(sig00000126)
  );
  INV   blk00000142 (
    .I(sig00000061),
    .O(sig00000009)
  );
  INV   blk00000143 (
    .I(sig00000105),
    .O(sig00000109)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk00000144 (
    .A0(NlwRenamedSig_OI_result[0]),
    .A1(NlwRenamedSig_OI_result[0]),
    .A2(NlwRenamedSig_OI_result[0]),
    .A3(NlwRenamedSig_OI_result[0]),
    .CE(ce),
    .CLK(clk),
    .D(sig00000066),
    .Q(sig00000128),
    .Q15(NLW_blk00000144_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000145 (
    .C(clk),
    .CE(ce),
    .D(sig00000128),
    .Q(sig00000062)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk00000146 (
    .A0(NlwRenamedSig_OI_result[0]),
    .A1(NlwRenamedSig_OI_result[0]),
    .A2(NlwRenamedSig_OI_result[0]),
    .A3(NlwRenamedSig_OI_result[0]),
    .CE(ce),
    .CLK(clk),
    .D(sig00000060),
    .Q(sig00000129),
    .Q15(NLW_blk00000146_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000147 (
    .C(clk),
    .CE(ce),
    .D(sig00000129),
    .Q(sig0000009c)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk00000148 (
    .A0(NlwRenamedSig_OI_result[0]),
    .A1(NlwRenamedSig_OI_result[0]),
    .A2(NlwRenamedSig_OI_result[0]),
    .A3(NlwRenamedSig_OI_result[0]),
    .CE(ce),
    .CLK(clk),
    .D(sig00000067),
    .Q(sig0000012a),
    .Q15(NLW_blk00000148_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000149 (
    .C(clk),
    .CE(ce),
    .D(sig0000012a),
    .Q(sig00000063)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk0000014a (
    .A0(NlwRenamedSig_OI_result[0]),
    .A1(sig00000001),
    .A2(NlwRenamedSig_OI_result[0]),
    .A3(NlwRenamedSig_OI_result[0]),
    .CE(ce),
    .CLK(clk),
    .D(sig0000010b),
    .Q(sig0000012b),
    .Q15(NLW_blk0000014a_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000014b (
    .C(clk),
    .CE(ce),
    .D(sig0000012b),
    .Q(sig0000010c)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk0000014c (
    .A0(NlwRenamedSig_OI_result[0]),
    .A1(NlwRenamedSig_OI_result[0]),
    .A2(sig00000001),
    .A3(NlwRenamedSig_OI_result[0]),
    .CE(ce),
    .CLK(clk),
    .D(a[15]),
    .Q(sig0000012c),
    .Q15(NLW_blk0000014c_Q15_UNCONNECTED)
  );
  FDE   blk0000014d (
    .C(clk),
    .CE(ce),
    .D(sig0000012c),
    .Q(\U0/op_inst/FLT_PT_OP/FIX_TO_FLT_OP.SPD.OP/OP/sign_op )
  );

// synthesis translate_on

endmodule

// synthesis translate_off

`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

// synthesis translate_on
