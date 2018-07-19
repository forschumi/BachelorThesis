////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.68d
//  \   \         Application: netgen
//  /   /         Filename: fl32tofi16.v
// /___/   /\     Timestamp: Wed Apr 29 19:20:46 2015
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog F:/quadrotor/prj_INS/qrc_32/INS_prj/ipcore_dir/tmp/_cg/fl32tofi16.ngc F:/quadrotor/prj_INS/qrc_32/INS_prj/ipcore_dir/tmp/_cg/fl32tofi16.v 
// Device	: 7z020clg400-1
// Input file	: F:/quadrotor/prj_INS/qrc_32/INS_prj/ipcore_dir/tmp/_cg/fl32tofi16.ngc
// Output file	: F:/quadrotor/prj_INS/qrc_32/INS_prj/ipcore_dir/tmp/_cg/fl32tofi16.v
// # of Modules	: 1
// Design Name	: fl32tofi16
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

module fl32tofi16 (
  operation_nd, clk, sclr, ce, rdy, a, result
)/* synthesis syn_black_box syn_noprune=1 */;
  input operation_nd;
  input clk;
  input sclr;
  input ce;
  output rdy;
  input [31 : 0] a;
  output [15 : 0] result;
  
  // synthesis translate_off
  
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
  wire sig0000012d;
  wire sig0000012e;
  wire sig0000012f;
  wire sig00000130;
  wire sig00000131;
  wire sig00000132;
  wire sig00000133;
  wire sig00000134;
  wire sig00000135;
  wire sig00000136;
  wire sig00000137;
  wire sig00000138;
  wire NLW_blk00000008_O_UNCONNECTED;
  wire NLW_blk00000090_O_UNCONNECTED;
  wire NLW_blk000000b1_O_UNCONNECTED;
  wire NLW_blk00000141_Q15_UNCONNECTED;
  wire NLW_blk00000143_Q15_UNCONNECTED;
  wire NLW_blk00000145_Q15_UNCONNECTED;
  wire NLW_blk00000147_Q15_UNCONNECTED;
  wire NLW_blk00000149_Q15_UNCONNECTED;
  wire NLW_blk0000014b_Q15_UNCONNECTED;
  wire [15 : 0] \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT ;
  assign
    result[15] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [15],
    result[14] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [14],
    result[13] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [13],
    result[12] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [12],
    result[11] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [11],
    result[10] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [10],
    result[9] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [9],
    result[8] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [8],
    result[7] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [7],
    result[6] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [6],
    result[5] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [5],
    result[4] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [4],
    result[3] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [3],
    result[2] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [2],
    result[1] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [1],
    result[0] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [0],
    rdy = \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/HND_SHK/RDY ;
  VCC   blk00000001 (
    .P(sig00000001)
  );
  GND   blk00000002 (
    .G(sig00000002)
  );
  MUXCY   blk00000003 (
    .CI(sig00000001),
    .DI(sig00000002),
    .S(sig00000009),
    .O(sig00000003)
  );
  MUXCY   blk00000004 (
    .CI(sig00000003),
    .DI(sig00000002),
    .S(sig0000000a),
    .O(sig00000004)
  );
  MUXCY   blk00000005 (
    .CI(sig00000004),
    .DI(sig00000002),
    .S(sig0000000b),
    .O(sig00000005)
  );
  MUXCY   blk00000006 (
    .CI(sig00000005),
    .DI(sig00000002),
    .S(sig0000000c),
    .O(sig00000006)
  );
  MUXCY   blk00000007 (
    .CI(sig00000006),
    .DI(sig00000002),
    .S(sig0000000d),
    .O(sig00000007)
  );
  MUXCY   blk00000008 (
    .CI(sig00000007),
    .DI(sig00000002),
    .S(sig00000008),
    .O(NLW_blk00000008_O_UNCONNECTED)
  );
  MUXCY   blk00000009 (
    .CI(sig0000004a),
    .DI(sig00000002),
    .S(sig00000048),
    .O(sig00000049)
  );
  MUXCY   blk0000000a (
    .CI(sig00000001),
    .DI(sig00000002),
    .S(sig00000047),
    .O(sig0000004a)
  );
  MUXCY   blk0000000b (
    .CI(sig00000001),
    .DI(sig00000002),
    .S(sig0000004e),
    .O(sig0000004c)
  );
  MUXCY   blk0000000c (
    .CI(sig0000004c),
    .DI(sig00000002),
    .S(sig0000004f),
    .O(sig0000004d)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000000d (
    .C(clk),
    .CE(ce),
    .D(sig000000ac),
    .Q(sig00000025)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000000e (
    .C(clk),
    .CE(ce),
    .D(sig000000ab),
    .Q(sig00000026)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000000f (
    .C(clk),
    .CE(ce),
    .D(a[31]),
    .Q(sig000000ca)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000010 (
    .C(clk),
    .CE(ce),
    .D(sig00000054),
    .Q(sig000000a9)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000011 (
    .C(clk),
    .CE(ce),
    .D(sig00000085),
    .Q(sig00000074)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000012 (
    .C(clk),
    .CE(ce),
    .D(sig00000049),
    .Q(sig000000cb)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000013 (
    .C(clk),
    .CE(ce),
    .D(sig0000004d),
    .Q(sig0000004b)
  );
  FDE   blk00000014 (
    .C(clk),
    .CE(ce),
    .D(sig00000050),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [15])
  );
  FDE   blk00000015 (
    .C(clk),
    .CE(ce),
    .D(sig00000064),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [14])
  );
  FDE   blk00000016 (
    .C(clk),
    .CE(ce),
    .D(sig00000063),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [13])
  );
  FDE   blk00000017 (
    .C(clk),
    .CE(ce),
    .D(sig00000062),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [12])
  );
  FDE   blk00000018 (
    .C(clk),
    .CE(ce),
    .D(sig00000061),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [11])
  );
  FDE   blk00000019 (
    .C(clk),
    .CE(ce),
    .D(sig00000060),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [10])
  );
  FDE   blk0000001a (
    .C(clk),
    .CE(ce),
    .D(sig0000005f),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [9])
  );
  FDE   blk0000001b (
    .C(clk),
    .CE(ce),
    .D(sig0000005e),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [8])
  );
  FDE   blk0000001c (
    .C(clk),
    .CE(ce),
    .D(sig0000005d),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [7])
  );
  FDE   blk0000001d (
    .C(clk),
    .CE(ce),
    .D(sig0000005c),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [6])
  );
  FDE   blk0000001e (
    .C(clk),
    .CE(ce),
    .D(sig0000005b),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [5])
  );
  FDE   blk0000001f (
    .C(clk),
    .CE(ce),
    .D(sig0000005a),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [4])
  );
  FDE   blk00000020 (
    .C(clk),
    .CE(ce),
    .D(sig00000059),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [3])
  );
  FDE   blk00000021 (
    .C(clk),
    .CE(ce),
    .D(sig00000058),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [2])
  );
  FDE   blk00000022 (
    .C(clk),
    .CE(ce),
    .D(sig00000057),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [1])
  );
  FDE   blk00000023 (
    .C(clk),
    .CE(ce),
    .D(sig00000056),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [0])
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000024 (
    .C(clk),
    .CE(ce),
    .D(a[22]),
    .Q(sig000000c9)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000025 (
    .C(clk),
    .CE(ce),
    .D(a[21]),
    .Q(sig000000c8)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000026 (
    .C(clk),
    .CE(ce),
    .D(a[20]),
    .Q(sig000000c7)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000027 (
    .C(clk),
    .CE(ce),
    .D(a[19]),
    .Q(sig000000c6)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000028 (
    .C(clk),
    .CE(ce),
    .D(a[18]),
    .Q(sig000000c5)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000029 (
    .C(clk),
    .CE(ce),
    .D(a[17]),
    .Q(sig000000c4)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000002a (
    .C(clk),
    .CE(ce),
    .D(a[16]),
    .Q(sig000000c3)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000002b (
    .C(clk),
    .CE(ce),
    .D(a[15]),
    .Q(sig000000c2)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000002c (
    .C(clk),
    .CE(ce),
    .D(a[14]),
    .Q(sig000000c1)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000002d (
    .C(clk),
    .CE(ce),
    .D(a[13]),
    .Q(sig000000c0)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000002e (
    .C(clk),
    .CE(ce),
    .D(a[12]),
    .Q(sig000000bf)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000002f (
    .C(clk),
    .CE(ce),
    .D(a[11]),
    .Q(sig000000be)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000030 (
    .C(clk),
    .CE(ce),
    .D(a[10]),
    .Q(sig000000bd)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000031 (
    .C(clk),
    .CE(ce),
    .D(a[9]),
    .Q(sig000000bc)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000032 (
    .C(clk),
    .CE(ce),
    .D(a[8]),
    .Q(sig000000bb)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000033 (
    .C(clk),
    .CE(ce),
    .D(a[7]),
    .Q(sig000000ba)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000034 (
    .C(clk),
    .CE(ce),
    .D(a[6]),
    .Q(sig000000b9)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000035 (
    .C(clk),
    .CE(ce),
    .D(a[5]),
    .Q(sig000000b8)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000036 (
    .C(clk),
    .CE(ce),
    .D(a[4]),
    .Q(sig000000b7)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000037 (
    .C(clk),
    .CE(ce),
    .D(a[3]),
    .Q(sig000000b6)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000038 (
    .C(clk),
    .CE(ce),
    .D(a[2]),
    .Q(sig000000b5)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000039 (
    .C(clk),
    .CE(ce),
    .D(a[1]),
    .Q(sig000000b4)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000003a (
    .C(clk),
    .CE(ce),
    .D(a[0]),
    .Q(sig000000b3)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000003b (
    .C(clk),
    .CE(ce),
    .D(a[30]),
    .Q(sig000000b2)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000003c (
    .C(clk),
    .CE(ce),
    .D(sig0000000e),
    .Q(sig000000b1)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000003d (
    .C(clk),
    .CE(ce),
    .D(sig0000000f),
    .Q(sig000000b0)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000003e (
    .C(clk),
    .CE(ce),
    .D(sig00000010),
    .Q(sig000000af)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000003f (
    .C(clk),
    .CE(ce),
    .D(sig00000011),
    .Q(sig000000ae)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000040 (
    .C(clk),
    .CE(ce),
    .D(sig00000012),
    .Q(sig000000ad)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000041 (
    .C(clk),
    .CE(ce),
    .D(sig00000013),
    .Q(sig000000ac)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000042 (
    .C(clk),
    .CE(ce),
    .D(sig00000014),
    .Q(sig000000ab)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000043 (
    .C(clk),
    .CE(ce),
    .D(sig00000055),
    .Q(sig000000aa)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000044 (
    .C(clk),
    .CE(ce),
    .D(sig00000053),
    .Q(sig000000cd)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000045 (
    .C(clk),
    .CE(ce),
    .D(sig00000052),
    .Q(sig000000cc)
  );
  MUXF8   blk00000046 (
    .I0(sig000000d5),
    .I1(sig000000d4),
    .S(sig00000002),
    .O(sig000000d3)
  );
  MUXF7   blk00000047 (
    .I0(sig0000012d),
    .I1(sig0000012e),
    .S(sig000000de),
    .O(sig000000d4)
  );
  MUXF7   blk00000048 (
    .I0(sig0000012f),
    .I1(sig00000130),
    .S(sig000000de),
    .O(sig000000d5)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000049 (
    .C(clk),
    .CE(ce),
    .D(sig000000ad),
    .Q(sig000000e1)
  );
  MUXCY   blk0000004a (
    .CI(sig000000f1),
    .DI(sig00000002),
    .S(sig00000002),
    .O(sig000000f0)
  );
  MUXCY   blk0000004b (
    .CI(sig000000f2),
    .DI(sig00000002),
    .S(sig000000d2),
    .O(sig000000f1)
  );
  MUXCY   blk0000004c (
    .CI(sig000000f3),
    .DI(sig00000002),
    .S(sig000000d1),
    .O(sig000000f2)
  );
  MUXCY   blk0000004d (
    .CI(sig000000f4),
    .DI(sig00000002),
    .S(sig000000d0),
    .O(sig000000f3)
  );
  MUXCY   blk0000004e (
    .CI(sig000000f5),
    .DI(sig00000002),
    .S(sig000000cf),
    .O(sig000000f4)
  );
  MUXCY   blk0000004f (
    .CI(sig00000001),
    .DI(sig00000002),
    .S(sig000000ce),
    .O(sig000000f5)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000050 (
    .C(clk),
    .CE(ce),
    .D(sig000000f0),
    .Q(sig000000eb)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000051 (
    .C(clk),
    .CE(ce),
    .D(sig000000f1),
    .Q(sig000000ec)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000052 (
    .C(clk),
    .CE(ce),
    .D(sig000000f2),
    .Q(sig000000ea)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000053 (
    .C(clk),
    .CE(ce),
    .D(sig000000f3),
    .Q(sig000000ed)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000054 (
    .C(clk),
    .CE(ce),
    .D(sig000000f4),
    .Q(sig000000ee)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000055 (
    .C(clk),
    .CE(ce),
    .D(sig000000f5),
    .Q(sig000000ef)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000056 (
    .C(clk),
    .CE(ce),
    .D(sig000000d3),
    .Q(sig000000a6)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000057 (
    .C(clk),
    .CE(ce),
    .D(sig00000001),
    .Q(sig000000e4)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000058 (
    .C(clk),
    .CE(ce),
    .D(sig000000d6),
    .Q(sig000000df)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000059 (
    .C(clk),
    .CE(ce),
    .D(sig000000d7),
    .Q(sig000000e0)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000005a (
    .C(clk),
    .CE(ce),
    .D(sig000000d8),
    .Q(sig000000e5)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000005b (
    .C(clk),
    .CE(ce),
    .D(sig000000d9),
    .Q(sig000000e3)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000005c (
    .C(clk),
    .CE(ce),
    .D(sig000000da),
    .Q(sig000000e7)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000005d (
    .C(clk),
    .CE(ce),
    .D(sig000000db),
    .Q(sig000000e8)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000005e (
    .C(clk),
    .CE(ce),
    .D(sig000000dc),
    .Q(sig000000e9)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000005f (
    .C(clk),
    .CE(ce),
    .D(sig000000dd),
    .Q(sig000000e6)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000060 (
    .C(clk),
    .CE(ce),
    .D(sig00000027),
    .Q(sig00000015)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000061 (
    .C(clk),
    .CE(ce),
    .D(sig00000028),
    .Q(sig00000016)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000062 (
    .C(clk),
    .CE(ce),
    .D(sig00000029),
    .Q(sig00000017)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000063 (
    .C(clk),
    .CE(ce),
    .D(sig0000002a),
    .Q(sig00000018)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000064 (
    .C(clk),
    .CE(ce),
    .D(sig0000002b),
    .Q(sig00000019)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000065 (
    .C(clk),
    .CE(ce),
    .D(sig0000002c),
    .Q(sig0000001a)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000066 (
    .C(clk),
    .CE(ce),
    .D(sig0000002d),
    .Q(sig0000001b)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000067 (
    .C(clk),
    .CE(ce),
    .D(sig0000002e),
    .Q(sig0000001c)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000068 (
    .C(clk),
    .CE(ce),
    .D(sig0000002f),
    .Q(sig0000001d)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000069 (
    .C(clk),
    .CE(ce),
    .D(sig00000030),
    .Q(sig0000001e)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000006a (
    .C(clk),
    .CE(ce),
    .D(sig00000031),
    .Q(sig0000001f)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000006b (
    .C(clk),
    .CE(ce),
    .D(sig00000032),
    .Q(sig00000020)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000006c (
    .C(clk),
    .CE(ce),
    .D(sig00000033),
    .Q(sig00000021)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000006d (
    .C(clk),
    .CE(ce),
    .D(sig00000034),
    .Q(sig00000022)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000006e (
    .C(clk),
    .CE(ce),
    .D(sig00000035),
    .Q(sig00000023)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000006f (
    .C(clk),
    .CE(ce),
    .D(sig00000036),
    .Q(sig00000024)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000070 (
    .C(clk),
    .CE(ce),
    .D(sig00000037),
    .Q(sig000000a5)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000071 (
    .C(clk),
    .CE(ce),
    .D(sig00000038),
    .Q(sig000000a4)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000072 (
    .C(clk),
    .CE(ce),
    .D(sig00000039),
    .Q(sig000000a3)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000073 (
    .C(clk),
    .CE(ce),
    .D(sig0000003a),
    .Q(sig000000a2)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000074 (
    .C(clk),
    .CE(ce),
    .D(sig0000003b),
    .Q(sig000000a1)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000075 (
    .C(clk),
    .CE(ce),
    .D(sig0000003c),
    .Q(sig000000a0)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000076 (
    .C(clk),
    .CE(ce),
    .D(sig0000003d),
    .Q(sig0000009f)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000077 (
    .C(clk),
    .CE(ce),
    .D(sig0000003e),
    .Q(sig0000009e)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000078 (
    .C(clk),
    .CE(ce),
    .D(sig0000003f),
    .Q(sig0000009d)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000079 (
    .C(clk),
    .CE(ce),
    .D(sig00000040),
    .Q(sig0000009c)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000007a (
    .C(clk),
    .CE(ce),
    .D(sig00000041),
    .Q(sig0000009b)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000007b (
    .C(clk),
    .CE(ce),
    .D(sig00000042),
    .Q(sig0000009a)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000007c (
    .C(clk),
    .CE(ce),
    .D(sig00000043),
    .Q(sig00000099)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000007d (
    .C(clk),
    .CE(ce),
    .D(sig00000044),
    .Q(sig00000098)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000007e (
    .C(clk),
    .CE(ce),
    .D(sig00000045),
    .Q(sig00000097)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000007f (
    .C(clk),
    .CE(ce),
    .D(sig00000046),
    .Q(sig00000096)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000080 (
    .C(clk),
    .CE(ce),
    .D(sig000000a5),
    .Q(sig00000093)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000081 (
    .C(clk),
    .CE(ce),
    .D(sig000000a4),
    .Q(sig00000092)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000082 (
    .C(clk),
    .CE(ce),
    .D(sig000000a3),
    .Q(sig00000091)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000083 (
    .C(clk),
    .CE(ce),
    .D(sig000000a2),
    .Q(sig00000090)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000084 (
    .C(clk),
    .CE(ce),
    .D(sig000000a1),
    .Q(sig0000008f)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000085 (
    .C(clk),
    .CE(ce),
    .D(sig000000a0),
    .Q(sig0000008e)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000086 (
    .C(clk),
    .CE(ce),
    .D(sig0000009f),
    .Q(sig0000008d)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000087 (
    .C(clk),
    .CE(ce),
    .D(sig0000009e),
    .Q(sig0000008c)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000088 (
    .C(clk),
    .CE(ce),
    .D(sig0000009d),
    .Q(sig0000008b)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000089 (
    .C(clk),
    .CE(ce),
    .D(sig0000009c),
    .Q(sig0000008a)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000008a (
    .C(clk),
    .CE(ce),
    .D(sig0000009b),
    .Q(sig00000089)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000008b (
    .C(clk),
    .CE(ce),
    .D(sig0000009a),
    .Q(sig00000088)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000008c (
    .C(clk),
    .CE(ce),
    .D(sig00000099),
    .Q(sig00000087)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000008d (
    .C(clk),
    .CE(ce),
    .D(sig00000098),
    .Q(sig00000086)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000008e (
    .C(clk),
    .CE(ce),
    .D(sig00000097),
    .Q(sig00000094)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000008f (
    .C(clk),
    .CE(ce),
    .D(sig00000096),
    .Q(sig00000095)
  );
  XORCY   blk00000090 (
    .CI(sig000000f7),
    .LI(sig00000002),
    .O(NLW_blk00000090_O_UNCONNECTED)
  );
  XORCY   blk00000091 (
    .CI(sig000000f9),
    .LI(sig0000012c),
    .O(sig000000f6)
  );
  MUXCY   blk00000092 (
    .CI(sig000000f9),
    .DI(sig00000002),
    .S(sig0000012c),
    .O(sig000000f7)
  );
  XORCY   blk00000093 (
    .CI(sig000000fb),
    .LI(sig00000073),
    .O(sig000000f8)
  );
  MUXCY   blk00000094 (
    .CI(sig000000fb),
    .DI(sig00000002),
    .S(sig00000073),
    .O(sig000000f9)
  );
  XORCY   blk00000095 (
    .CI(sig000000fd),
    .LI(sig00000072),
    .O(sig000000fa)
  );
  MUXCY   blk00000096 (
    .CI(sig000000fd),
    .DI(sig00000002),
    .S(sig00000072),
    .O(sig000000fb)
  );
  XORCY   blk00000097 (
    .CI(sig000000ff),
    .LI(sig00000071),
    .O(sig000000fc)
  );
  MUXCY   blk00000098 (
    .CI(sig000000ff),
    .DI(sig00000002),
    .S(sig00000071),
    .O(sig000000fd)
  );
  XORCY   blk00000099 (
    .CI(sig00000101),
    .LI(sig00000070),
    .O(sig000000fe)
  );
  MUXCY   blk0000009a (
    .CI(sig00000101),
    .DI(sig00000002),
    .S(sig00000070),
    .O(sig000000ff)
  );
  XORCY   blk0000009b (
    .CI(sig00000103),
    .LI(sig0000006f),
    .O(sig00000100)
  );
  MUXCY   blk0000009c (
    .CI(sig00000103),
    .DI(sig00000002),
    .S(sig0000006f),
    .O(sig00000101)
  );
  XORCY   blk0000009d (
    .CI(sig00000105),
    .LI(sig0000006e),
    .O(sig00000102)
  );
  MUXCY   blk0000009e (
    .CI(sig00000105),
    .DI(sig00000002),
    .S(sig0000006e),
    .O(sig00000103)
  );
  XORCY   blk0000009f (
    .CI(sig00000107),
    .LI(sig0000006d),
    .O(sig00000104)
  );
  MUXCY   blk000000a0 (
    .CI(sig00000107),
    .DI(sig00000002),
    .S(sig0000006d),
    .O(sig00000105)
  );
  XORCY   blk000000a1 (
    .CI(sig00000109),
    .LI(sig0000006c),
    .O(sig00000106)
  );
  MUXCY   blk000000a2 (
    .CI(sig00000109),
    .DI(sig00000002),
    .S(sig0000006c),
    .O(sig00000107)
  );
  XORCY   blk000000a3 (
    .CI(sig0000010b),
    .LI(sig0000006b),
    .O(sig00000108)
  );
  MUXCY   blk000000a4 (
    .CI(sig0000010b),
    .DI(sig00000002),
    .S(sig0000006b),
    .O(sig00000109)
  );
  XORCY   blk000000a5 (
    .CI(sig0000010d),
    .LI(sig0000006a),
    .O(sig0000010a)
  );
  MUXCY   blk000000a6 (
    .CI(sig0000010d),
    .DI(sig00000002),
    .S(sig0000006a),
    .O(sig0000010b)
  );
  XORCY   blk000000a7 (
    .CI(sig0000010f),
    .LI(sig00000069),
    .O(sig0000010c)
  );
  MUXCY   blk000000a8 (
    .CI(sig0000010f),
    .DI(sig00000002),
    .S(sig00000069),
    .O(sig0000010d)
  );
  XORCY   blk000000a9 (
    .CI(sig00000111),
    .LI(sig00000068),
    .O(sig0000010e)
  );
  MUXCY   blk000000aa (
    .CI(sig00000111),
    .DI(sig00000002),
    .S(sig00000068),
    .O(sig0000010f)
  );
  XORCY   blk000000ab (
    .CI(sig00000113),
    .LI(sig00000067),
    .O(sig00000110)
  );
  MUXCY   blk000000ac (
    .CI(sig00000113),
    .DI(sig00000002),
    .S(sig00000067),
    .O(sig00000111)
  );
  XORCY   blk000000ad (
    .CI(sig00000115),
    .LI(sig00000066),
    .O(sig00000112)
  );
  MUXCY   blk000000ae (
    .CI(sig00000115),
    .DI(sig00000002),
    .S(sig00000066),
    .O(sig00000113)
  );
  XORCY   blk000000af (
    .CI(sig00000116),
    .LI(sig00000065),
    .O(sig00000114)
  );
  MUXCY   blk000000b0 (
    .CI(sig00000116),
    .DI(sig00000002),
    .S(sig00000065),
    .O(sig00000115)
  );
  XORCY   blk000000b1 (
    .CI(sig00000001),
    .LI(sig00000051),
    .O(NLW_blk000000b1_O_UNCONNECTED)
  );
  MUXCY   blk000000b2 (
    .CI(sig00000001),
    .DI(sig00000002),
    .S(sig00000051),
    .O(sig00000116)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000b3 (
    .C(clk),
    .CE(ce),
    .D(sig000000f6),
    .Q(sig00000084)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000b4 (
    .C(clk),
    .CE(ce),
    .D(sig000000f8),
    .Q(sig00000083)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000b5 (
    .C(clk),
    .CE(ce),
    .D(sig000000fa),
    .Q(sig00000082)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000b6 (
    .C(clk),
    .CE(ce),
    .D(sig000000fc),
    .Q(sig00000081)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000b7 (
    .C(clk),
    .CE(ce),
    .D(sig000000fe),
    .Q(sig00000080)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000b8 (
    .C(clk),
    .CE(ce),
    .D(sig00000100),
    .Q(sig0000007f)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000b9 (
    .C(clk),
    .CE(ce),
    .D(sig00000102),
    .Q(sig0000007e)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000ba (
    .C(clk),
    .CE(ce),
    .D(sig00000104),
    .Q(sig0000007d)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000bb (
    .C(clk),
    .CE(ce),
    .D(sig00000106),
    .Q(sig0000007c)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000bc (
    .C(clk),
    .CE(ce),
    .D(sig00000108),
    .Q(sig0000007b)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000bd (
    .C(clk),
    .CE(ce),
    .D(sig0000010a),
    .Q(sig0000007a)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000be (
    .C(clk),
    .CE(ce),
    .D(sig0000010c),
    .Q(sig00000079)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000bf (
    .C(clk),
    .CE(ce),
    .D(sig0000010e),
    .Q(sig00000078)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000c0 (
    .C(clk),
    .CE(ce),
    .D(sig00000110),
    .Q(sig00000077)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000c1 (
    .C(clk),
    .CE(ce),
    .D(sig00000112),
    .Q(sig00000076)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000c2 (
    .C(clk),
    .CE(ce),
    .D(sig00000114),
    .Q(sig00000075)
  );
  FDRE #(
    .INIT ( 1'b0 ))
  blk000000c3 (
    .C(clk),
    .CE(sig0000011c),
    .D(sig00000119),
    .R(sclr),
    .Q(sig00000120)
  );
  FDSE #(
    .INIT ( 1'b1 ))
  blk000000c4 (
    .C(clk),
    .CE(sig0000011c),
    .D(sig0000011b),
    .S(sclr),
    .Q(sig00000117)
  );
  FDSE #(
    .INIT ( 1'b1 ))
  blk000000c5 (
    .C(clk),
    .CE(sig0000011c),
    .D(sig0000011a),
    .S(sclr),
    .Q(sig00000118)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000c6 (
    .C(clk),
    .CE(ce),
    .D(sig00000123),
    .Q(sig0000011e)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  blk000000c7 (
    .I0(sig00000026),
    .I1(sig00000025),
    .I2(sig00000022),
    .I3(sig00000020),
    .I4(sig00000021),
    .I5(sig00000023),
    .O(sig00000045)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  blk000000c8 (
    .I0(sig00000026),
    .I1(sig00000025),
    .I2(sig00000021),
    .I3(sig0000001f),
    .I4(sig00000020),
    .I5(sig00000022),
    .O(sig00000044)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  blk000000c9 (
    .I0(sig00000026),
    .I1(sig00000025),
    .I2(sig00000017),
    .I3(sig00000015),
    .I4(sig00000016),
    .I5(sig00000018),
    .O(sig0000003a)
  );
  LUT4 #(
    .INIT ( 16'h5410 ))
  blk000000ca (
    .I0(sig00000025),
    .I1(sig00000026),
    .I2(sig00000016),
    .I3(sig00000015),
    .O(sig00000038)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  blk000000cb (
    .I0(sig00000026),
    .I1(sig00000025),
    .I2(sig00000018),
    .I3(sig00000016),
    .I4(sig00000017),
    .I5(sig00000019),
    .O(sig0000003b)
  );
  LUT5 #(
    .INIT ( 32'h73625140 ))
  blk000000cc (
    .I0(sig00000025),
    .I1(sig00000026),
    .I2(sig00000016),
    .I3(sig00000017),
    .I4(sig00000015),
    .O(sig00000039)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  blk000000cd (
    .I0(sig00000026),
    .I1(sig00000025),
    .I2(sig00000023),
    .I3(sig00000021),
    .I4(sig00000022),
    .I5(sig00000024),
    .O(sig00000046)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  blk000000ce (
    .I0(sig00000026),
    .I1(sig00000025),
    .I2(sig0000001a),
    .I3(sig00000018),
    .I4(sig00000019),
    .I5(sig0000001b),
    .O(sig0000003d)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  blk000000cf (
    .I0(sig00000026),
    .I1(sig00000025),
    .I2(sig00000019),
    .I3(sig00000017),
    .I4(sig00000018),
    .I5(sig0000001a),
    .O(sig0000003c)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  blk000000d0 (
    .I0(sig00000026),
    .I1(sig00000025),
    .I2(sig0000001b),
    .I3(sig00000019),
    .I4(sig0000001a),
    .I5(sig0000001c),
    .O(sig0000003e)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  blk000000d1 (
    .I0(sig00000026),
    .I1(sig00000025),
    .I2(sig0000001c),
    .I3(sig0000001a),
    .I4(sig0000001b),
    .I5(sig0000001d),
    .O(sig0000003f)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  blk000000d2 (
    .I0(sig00000026),
    .I1(sig00000025),
    .I2(sig0000001d),
    .I3(sig0000001b),
    .I4(sig0000001c),
    .I5(sig0000001e),
    .O(sig00000040)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  blk000000d3 (
    .I0(sig00000026),
    .I1(sig00000025),
    .I2(sig0000001e),
    .I3(sig0000001c),
    .I4(sig0000001d),
    .I5(sig0000001f),
    .O(sig00000041)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  blk000000d4 (
    .I0(sig00000026),
    .I1(sig00000025),
    .I2(sig0000001f),
    .I3(sig0000001d),
    .I4(sig0000001e),
    .I5(sig00000020),
    .O(sig00000042)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  blk000000d5 (
    .I0(sig00000026),
    .I1(sig00000025),
    .I2(sig00000020),
    .I3(sig0000001e),
    .I4(sig0000001f),
    .I5(sig00000021),
    .O(sig00000043)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  blk000000d6 (
    .I0(sig000000ad),
    .I1(sig000000ae),
    .I2(sig000000c1),
    .I3(sig000000c9),
    .I4(sig000000c5),
    .I5(sig000000bd),
    .O(sig00000034)
  );
  LUT5 #(
    .INIT ( 32'h73625140 ))
  blk000000d7 (
    .I0(sig000000ae),
    .I1(sig000000ad),
    .I2(sig000000c5),
    .I3(sig000000c1),
    .I4(sig000000c9),
    .O(sig00000030)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  blk000000d8 (
    .I0(sig000000ad),
    .I1(sig000000ae),
    .I2(sig000000c0),
    .I3(sig000000c8),
    .I4(sig000000c4),
    .I5(sig000000bc),
    .O(sig00000035)
  );
  LUT5 #(
    .INIT ( 32'h73625140 ))
  blk000000d9 (
    .I0(sig000000ae),
    .I1(sig000000ad),
    .I2(sig000000c4),
    .I3(sig000000c0),
    .I4(sig000000c8),
    .O(sig00000031)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  blk000000da (
    .I0(sig000000ad),
    .I1(sig000000ae),
    .I2(sig000000bf),
    .I3(sig000000c7),
    .I4(sig000000c3),
    .I5(sig000000bb),
    .O(sig00000036)
  );
  LUT5 #(
    .INIT ( 32'h73625140 ))
  blk000000db (
    .I0(sig000000ae),
    .I1(sig000000ad),
    .I2(sig000000c3),
    .I3(sig000000bf),
    .I4(sig000000c7),
    .O(sig00000032)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk000000dc (
    .I0(a[15]),
    .I1(a[14]),
    .I2(a[13]),
    .I3(a[12]),
    .O(sig0000000c)
  );
  LUT3 #(
    .INIT ( 8'h54 ))
  blk000000dd (
    .I0(sig000000ae),
    .I1(sig000000c6),
    .I2(sig000000ad),
    .O(sig0000002b)
  );
  LUT4 #(
    .INIT ( 16'h3BC4 ))
  blk000000de (
    .I0(sig000000a6),
    .I1(sig00000095),
    .I2(sig00000094),
    .I3(sig00000085),
    .O(sig00000051)
  );
  LUT4 #(
    .INIT ( 16'h5410 ))
  blk000000df (
    .I0(sig000000ae),
    .I1(sig000000ad),
    .I2(sig000000c5),
    .I3(sig000000c9),
    .O(sig0000002c)
  );
  LUT4 #(
    .INIT ( 16'h5410 ))
  blk000000e0 (
    .I0(sig000000ae),
    .I1(sig000000ad),
    .I2(sig000000c3),
    .I3(sig000000c7),
    .O(sig0000002e)
  );
  LUT4 #(
    .INIT ( 16'h5410 ))
  blk000000e1 (
    .I0(sig000000ae),
    .I1(sig000000ad),
    .I2(sig000000c4),
    .I3(sig000000c8),
    .O(sig0000002d)
  );
  LUT5 #(
    .INIT ( 32'hFDECB9A8 ))
  blk000000e2 (
    .I0(sig000000ae),
    .I1(sig000000ad),
    .I2(sig000000c6),
    .I3(sig000000be),
    .I4(sig000000c2),
    .O(sig00000033)
  );
  LUT4 #(
    .INIT ( 16'h5E54 ))
  blk000000e3 (
    .I0(sig000000ad),
    .I1(sig000000c2),
    .I2(sig000000ae),
    .I3(sig000000c6),
    .O(sig0000002f)
  );
  LUT5 #(
    .INIT ( 32'hF8080888 ))
  blk000000e4 (
    .I0(sig00000084),
    .I1(sig00000074),
    .I2(ce),
    .I3(sig000000a7),
    .I4(sig000000a8),
    .O(sig00000050)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk000000e5 (
    .I0(a[19]),
    .I1(a[18]),
    .I2(a[16]),
    .I3(a[17]),
    .O(sig0000000d)
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  blk000000e6 (
    .I0(sig00000025),
    .I1(sig00000026),
    .I2(sig00000015),
    .O(sig00000037)
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  blk000000e7 (
    .I0(sig000000ae),
    .I1(sig000000ad),
    .I2(sig000000c7),
    .O(sig0000002a)
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  blk000000e8 (
    .I0(sig000000ae),
    .I1(sig000000ad),
    .I2(sig000000c8),
    .O(sig00000029)
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  blk000000e9 (
    .I0(sig000000ae),
    .I1(sig000000ad),
    .I2(sig000000c9),
    .O(sig00000028)
  );
  LUT3 #(
    .INIT ( 8'h01 ))
  blk000000ea (
    .I0(a[20]),
    .I1(a[21]),
    .I2(a[22]),
    .O(sig00000008)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk000000eb (
    .I0(a[0]),
    .I1(a[1]),
    .I2(a[2]),
    .I3(a[3]),
    .O(sig00000009)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk000000ec (
    .I0(a[4]),
    .I1(a[5]),
    .I2(a[6]),
    .I3(a[7]),
    .O(sig0000000a)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk000000ed (
    .I0(a[8]),
    .I1(a[9]),
    .I2(a[10]),
    .I3(a[11]),
    .O(sig0000000b)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000ee (
    .I0(sig00000094),
    .I1(sig00000085),
    .O(sig00000065)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000ef (
    .I0(sig0000008f),
    .I1(sig00000085),
    .O(sig0000006f)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000f0 (
    .I0(sig00000090),
    .I1(sig00000085),
    .O(sig00000070)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000f1 (
    .I0(sig00000091),
    .I1(sig00000085),
    .O(sig00000071)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000f2 (
    .I0(sig00000092),
    .I1(sig00000085),
    .O(sig00000072)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000f3 (
    .I0(sig00000093),
    .I1(sig00000085),
    .O(sig00000073)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000f4 (
    .I0(sig00000086),
    .I1(sig00000085),
    .O(sig00000066)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000f5 (
    .I0(sig00000087),
    .I1(sig00000085),
    .O(sig00000067)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000f6 (
    .I0(sig00000088),
    .I1(sig00000085),
    .O(sig00000068)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000f7 (
    .I0(sig00000089),
    .I1(sig00000085),
    .O(sig00000069)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000f8 (
    .I0(sig0000008a),
    .I1(sig00000085),
    .O(sig0000006a)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000f9 (
    .I0(sig0000008b),
    .I1(sig00000085),
    .O(sig0000006b)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000fa (
    .I0(sig0000008c),
    .I1(sig00000085),
    .O(sig0000006c)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000fb (
    .I0(sig0000008d),
    .I1(sig00000085),
    .O(sig0000006d)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000fc (
    .I0(sig0000008e),
    .I1(sig00000085),
    .O(sig0000006e)
  );
  LUT2 #(
    .INIT ( 4'h1 ))
  blk000000fd (
    .I0(sig000000ae),
    .I1(sig000000ad),
    .O(sig00000027)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000fe (
    .I0(a[27]),
    .I1(a[26]),
    .O(sig00000055)
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  blk000000ff (
    .I0(a[23]),
    .I1(a[24]),
    .I2(a[25]),
    .I3(a[26]),
    .O(sig00000047)
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  blk00000100 (
    .I0(a[27]),
    .I1(a[28]),
    .I2(a[29]),
    .I3(a[30]),
    .O(sig00000048)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk00000101 (
    .I0(a[23]),
    .I1(a[24]),
    .I2(a[25]),
    .I3(a[26]),
    .O(sig0000004e)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk00000102 (
    .I0(a[27]),
    .I1(a[28]),
    .I2(a[29]),
    .I3(a[30]),
    .O(sig0000004f)
  );
  LUT5 #(
    .INIT ( 32'h011155FF ))
  blk00000103 (
    .I0(sig000000c7),
    .I1(sig000000c8),
    .I2(sig000000c9),
    .I3(sig000000ab),
    .I4(sig000000ac),
    .O(sig000000d8)
  );
  LUT5 #(
    .INIT ( 32'h011155FF ))
  blk00000104 (
    .I0(sig000000c3),
    .I1(sig000000c4),
    .I2(sig000000c5),
    .I3(sig000000ab),
    .I4(sig000000ac),
    .O(sig000000d9)
  );
  LUT5 #(
    .INIT ( 32'h011155FF ))
  blk00000105 (
    .I0(sig000000bf),
    .I1(sig000000c0),
    .I2(sig000000c1),
    .I3(sig000000ab),
    .I4(sig000000ac),
    .O(sig000000da)
  );
  LUT5 #(
    .INIT ( 32'h011155FF ))
  blk00000106 (
    .I0(sig000000bb),
    .I1(sig000000bc),
    .I2(sig000000bd),
    .I3(sig000000ab),
    .I4(sig000000ac),
    .O(sig000000db)
  );
  LUT5 #(
    .INIT ( 32'h011155FF ))
  blk00000107 (
    .I0(sig000000b7),
    .I1(sig000000b8),
    .I2(sig000000b9),
    .I3(sig000000ab),
    .I4(sig000000ac),
    .O(sig000000dc)
  );
  LUT5 #(
    .INIT ( 32'h011155FF ))
  blk00000108 (
    .I0(sig000000b3),
    .I1(sig000000b4),
    .I2(sig000000b5),
    .I3(sig000000ab),
    .I4(sig000000ac),
    .O(sig000000dd)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk00000109 (
    .I0(sig000000b3),
    .I1(sig000000b4),
    .I2(sig000000b5),
    .I3(sig000000b6),
    .O(sig000000ce)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk0000010a (
    .I0(sig000000b7),
    .I1(sig000000b8),
    .I2(sig000000b9),
    .I3(sig000000ba),
    .O(sig000000cf)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk0000010b (
    .I0(sig000000bb),
    .I1(sig000000bc),
    .I2(sig000000bd),
    .I3(sig000000be),
    .O(sig000000d0)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk0000010c (
    .I0(sig000000bf),
    .I1(sig000000c0),
    .I2(sig000000c1),
    .I3(sig000000c2),
    .O(sig000000d1)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk0000010d (
    .I0(sig000000c3),
    .I1(sig000000c4),
    .I2(sig000000c5),
    .I3(sig000000c6),
    .O(sig000000d2)
  );
  LUT3 #(
    .INIT ( 8'hF1 ))
  blk0000010e (
    .I0(sig00000118),
    .I1(sig00000117),
    .I2(sig00000120),
    .O(sig00000119)
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  blk0000010f (
    .I0(sig00000118),
    .I1(sig00000117),
    .O(sig0000011a)
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  blk00000110 (
    .I0(ce),
    .I1(sig00000121),
    .I2(sig00000120),
    .O(sig0000011c)
  );
  LUT3 #(
    .INIT ( 8'hEC ))
  blk00000111 (
    .I0(ce),
    .I1(sclr),
    .I2(sig00000121),
    .O(sig0000011d)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  blk00000112 (
    .I0(operation_nd),
    .I1(sig00000122),
    .O(sig00000123)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk00000113 (
    .I0(a[8]),
    .I1(a[9]),
    .I2(a[7]),
    .I3(a[6]),
    .I4(a[5]),
    .I5(a[4]),
    .O(sig00000124)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk00000114 (
    .I0(a[2]),
    .I1(a[3]),
    .I2(a[22]),
    .I3(a[21]),
    .I4(a[20]),
    .I5(a[1]),
    .O(sig00000125)
  );
  LUT3 #(
    .INIT ( 8'h01 ))
  blk00000115 (
    .I0(a[10]),
    .I1(a[11]),
    .I2(a[0]),
    .O(sig00000126)
  );
  LUT5 #(
    .INIT ( 32'h80000000 ))
  blk00000116 (
    .I0(sig0000000d),
    .I1(sig0000000c),
    .I2(sig00000125),
    .I3(sig00000126),
    .I4(sig00000124),
    .O(sig00000054)
  );
  LUT3 #(
    .INIT ( 8'hFE ))
  blk00000117 (
    .I0(sig000000b1),
    .I1(sig000000b0),
    .I2(sig000000af),
    .O(sig00000127)
  );
  LUT6 #(
    .INIT ( 64'hFBFFFBF3FAFFEAC0 ))
  blk00000118 (
    .I0(sig0000004b),
    .I1(sig000000b2),
    .I2(sig000000ca),
    .I3(sig000000a9),
    .I4(sig000000cb),
    .I5(sig00000127),
    .O(sig00000052)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  blk00000119 (
    .I0(sig000000a9),
    .I1(sig0000004b),
    .O(sig00000128)
  );
  LUT6 #(
    .INIT ( 64'h00000000AAABAAAA ))
  blk0000011a (
    .I0(sig000000b2),
    .I1(sig000000af),
    .I2(sig000000b0),
    .I3(sig000000b1),
    .I4(sig000000cb),
    .I5(sig00000128),
    .O(sig00000053)
  );
  LUT5 #(
    .INIT ( 32'h2A7F7F7F ))
  blk0000011b (
    .I0(sig000000e1),
    .I1(sig000000e5),
    .I2(sig000000ec),
    .I3(sig000000ea),
    .I4(sig000000e3),
    .O(sig00000129)
  );
  LUT5 #(
    .INIT ( 32'h8880BBB3 ))
  blk0000011c (
    .I0(sig000000e4),
    .I1(sig000000e2),
    .I2(sig000000e1),
    .I3(sig000000eb),
    .I4(sig00000129),
    .O(sig000000d6)
  );
  LUT5 #(
    .INIT ( 32'hEA404040 ))
  blk0000011d (
    .I0(sig000000e2),
    .I1(sig000000e9),
    .I2(sig000000ef),
    .I3(sig000000e7),
    .I4(sig000000ed),
    .O(sig0000012a)
  );
  LUT6 #(
    .INIT ( 64'hFBBBEAAA51114000 ))
  blk0000011e (
    .I0(sig000000e1),
    .I1(sig000000e2),
    .I2(sig000000e8),
    .I3(sig000000ee),
    .I4(sig000000e6),
    .I5(sig0000012a),
    .O(sig000000d7)
  );
  FDR #(
    .INIT ( 1'b1 ))
  blk0000011f (
    .C(clk),
    .D(sig0000012b),
    .R(sclr),
    .Q(sig00000122)
  );
  LUT2 #(
    .INIT ( 4'hE ))
  blk00000120 (
    .I0(sig00000122),
    .I1(ce),
    .O(sig0000012b)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk00000121 (
    .I0(sig00000085),
    .O(sig0000012c)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk00000122 (
    .I0(sig000000e4),
    .O(sig0000012d)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk00000123 (
    .I0(sig000000e4),
    .O(sig0000012e)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk00000124 (
    .I0(sig000000e0),
    .O(sig0000012f)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk00000125 (
    .I0(sig000000df),
    .O(sig00000130)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  blk00000126 (
    .I0(ce),
    .I1(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/HND_SHK/RDY ),
    .I2(sig0000011f),
    .O(sig00000131)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk00000127 (
    .C(clk),
    .D(sig00000131),
    .R(sig0000011d),
    .Q(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/HND_SHK/RDY )
  );
  FDS #(
    .INIT ( 1'b0 ))
  blk00000128 (
    .C(clk),
    .D(sig00000132),
    .S(sclr),
    .Q(sig00000121)
  );
  LUT4 #(
    .INIT ( 16'hA2AA ))
  blk00000129 (
    .I0(sig00000121),
    .I1(ce),
    .I2(sclr),
    .I3(sig00000120),
    .O(sig00000132)
  );
  LUT6 #(
    .INIT ( 64'h5C4C5F5F5C4C5C4C ))
  blk0000012a (
    .I0(sig000000a7),
    .I1(sig00000079),
    .I2(ce),
    .I3(sig000000a8),
    .I4(sig00000074),
    .I5(sig00000084),
    .O(sig0000005a)
  );
  LUT6 #(
    .INIT ( 64'h5C4C5F5F5C4C5C4C ))
  blk0000012b (
    .I0(sig000000a7),
    .I1(sig00000078),
    .I2(ce),
    .I3(sig000000a8),
    .I4(sig00000074),
    .I5(sig00000084),
    .O(sig00000059)
  );
  LUT6 #(
    .INIT ( 64'h5C4C5F5F5C4C5C4C ))
  blk0000012c (
    .I0(sig000000a7),
    .I1(sig00000077),
    .I2(ce),
    .I3(sig000000a8),
    .I4(sig00000074),
    .I5(sig00000084),
    .O(sig00000058)
  );
  LUT6 #(
    .INIT ( 64'h5C4C5F5F5C4C5C4C ))
  blk0000012d (
    .I0(sig000000a7),
    .I1(sig00000076),
    .I2(ce),
    .I3(sig000000a8),
    .I4(sig00000074),
    .I5(sig00000084),
    .O(sig00000057)
  );
  LUT6 #(
    .INIT ( 64'h5C4C5F5F5C4C5C4C ))
  blk0000012e (
    .I0(sig000000a7),
    .I1(sig00000083),
    .I2(ce),
    .I3(sig000000a8),
    .I4(sig00000074),
    .I5(sig00000084),
    .O(sig00000064)
  );
  LUT6 #(
    .INIT ( 64'h5C4C5F5F5C4C5C4C ))
  blk0000012f (
    .I0(sig000000a7),
    .I1(sig00000082),
    .I2(ce),
    .I3(sig000000a8),
    .I4(sig00000074),
    .I5(sig00000084),
    .O(sig00000063)
  );
  LUT6 #(
    .INIT ( 64'h5C4C5F5F5C4C5C4C ))
  blk00000130 (
    .I0(sig000000a7),
    .I1(sig00000081),
    .I2(ce),
    .I3(sig000000a8),
    .I4(sig00000074),
    .I5(sig00000084),
    .O(sig00000062)
  );
  LUT6 #(
    .INIT ( 64'h5C4C5F5F5C4C5C4C ))
  blk00000131 (
    .I0(sig000000a7),
    .I1(sig00000080),
    .I2(ce),
    .I3(sig000000a8),
    .I4(sig00000074),
    .I5(sig00000084),
    .O(sig00000061)
  );
  LUT6 #(
    .INIT ( 64'h5C4C5F5F5C4C5C4C ))
  blk00000132 (
    .I0(sig000000a7),
    .I1(sig0000007e),
    .I2(ce),
    .I3(sig000000a8),
    .I4(sig00000074),
    .I5(sig00000084),
    .O(sig0000005f)
  );
  LUT6 #(
    .INIT ( 64'h5C4C5F5F5C4C5C4C ))
  blk00000133 (
    .I0(sig000000a7),
    .I1(sig0000007d),
    .I2(ce),
    .I3(sig000000a8),
    .I4(sig00000074),
    .I5(sig00000084),
    .O(sig0000005e)
  );
  LUT6 #(
    .INIT ( 64'h5C4C5F5F5C4C5C4C ))
  blk00000134 (
    .I0(sig000000a7),
    .I1(sig0000007c),
    .I2(ce),
    .I3(sig000000a8),
    .I4(sig00000074),
    .I5(sig00000084),
    .O(sig0000005d)
  );
  LUT6 #(
    .INIT ( 64'h5C4C5F5F5C4C5C4C ))
  blk00000135 (
    .I0(sig000000a7),
    .I1(sig0000007b),
    .I2(ce),
    .I3(sig000000a8),
    .I4(sig00000074),
    .I5(sig00000084),
    .O(sig0000005c)
  );
  LUT6 #(
    .INIT ( 64'h5C4C5F5F5C4C5C4C ))
  blk00000136 (
    .I0(sig000000a7),
    .I1(sig0000007a),
    .I2(ce),
    .I3(sig000000a8),
    .I4(sig00000074),
    .I5(sig00000084),
    .O(sig0000005b)
  );
  LUT6 #(
    .INIT ( 64'h5C4C5F5F5C4C5C4C ))
  blk00000137 (
    .I0(sig000000a7),
    .I1(sig0000007f),
    .I2(ce),
    .I3(sig000000a8),
    .I4(sig00000074),
    .I5(sig00000084),
    .O(sig00000060)
  );
  LUT6 #(
    .INIT ( 64'h5C4C5F5F5C4C5C4C ))
  blk00000138 (
    .I0(sig000000a7),
    .I1(sig00000075),
    .I2(ce),
    .I3(sig000000a8),
    .I4(sig00000074),
    .I5(sig00000084),
    .O(sig00000056)
  );
  INV   blk00000139 (
    .I(a[29]),
    .O(sig0000000e)
  );
  INV   blk0000013a (
    .I(a[28]),
    .O(sig0000000f)
  );
  INV   blk0000013b (
    .I(a[27]),
    .O(sig00000010)
  );
  INV   blk0000013c (
    .I(a[26]),
    .O(sig00000011)
  );
  INV   blk0000013d (
    .I(a[25]),
    .O(sig00000012)
  );
  INV   blk0000013e (
    .I(a[24]),
    .O(sig00000013)
  );
  INV   blk0000013f (
    .I(a[23]),
    .O(sig00000014)
  );
  INV   blk00000140 (
    .I(sig00000117),
    .O(sig0000011b)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk00000141 (
    .A0(sig00000001),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(ce),
    .CLK(clk),
    .D(sig000000cc),
    .Q(sig00000133),
    .Q15(NLW_blk00000141_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000142 (
    .C(clk),
    .CE(ce),
    .D(sig00000133),
    .Q(sig000000a7)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk00000143 (
    .A0(sig00000001),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(ce),
    .CLK(clk),
    .D(sig000000ca),
    .Q(sig00000134),
    .Q15(NLW_blk00000143_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000144 (
    .C(clk),
    .CE(ce),
    .D(sig00000134),
    .Q(sig00000085)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk00000145 (
    .A0(sig00000001),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(ce),
    .CLK(clk),
    .D(sig000000cd),
    .Q(sig00000135),
    .Q15(NLW_blk00000145_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000146 (
    .C(clk),
    .CE(ce),
    .D(sig00000135),
    .Q(sig000000a8)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk00000147 (
    .A0(sig00000002),
    .A1(sig00000001),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(ce),
    .CLK(clk),
    .D(sig0000011e),
    .Q(sig00000136),
    .Q15(NLW_blk00000147_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000148 (
    .C(clk),
    .CE(ce),
    .D(sig00000136),
    .Q(sig0000011f)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk00000149 (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(ce),
    .CLK(clk),
    .D(sig000000aa),
    .Q(sig00000137),
    .Q15(NLW_blk00000149_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000014a (
    .C(clk),
    .CE(ce),
    .D(sig00000137),
    .Q(sig000000de)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk0000014b (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(ce),
    .CLK(clk),
    .D(a[26]),
    .Q(sig00000138),
    .Q15(NLW_blk0000014b_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000014c (
    .C(clk),
    .CE(ce),
    .D(sig00000138),
    .Q(sig000000e2)
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
