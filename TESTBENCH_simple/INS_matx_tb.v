`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:46:24 04/25/2015 
// Design Name: 
// Module Name:    INS_matx_tb 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
//`include "F:/quadrotor/prj_INS/qrc/src/INS_matx.v"

module INS_matx_tb;

reg clk, rst, in_matx_en;
reg [31:0] in_q0, in_q1, in_q2, in_q3;			  

parameter t = 20;

initial begin
	clk = 1'b1;
	rst = 1'b1;
	in_q0 = 32'd0; 
	in_q1 = 32'd0; 
	in_q2 = 32'd0;	
	in_q3 = 32'd0; 
	in_matx_en = 1'b0;
end

always #(t/2) clk = ~clk;

initial begin
	#(t*8)
		rst = 1'b0;
	#(t*2)
		rst = 1'b1;
	#t
		in_q0 = 32'h3f800000;
		in_q1 = 32'h40000000;
		in_q2 = 32'h40400000;
		in_q3 = 32'h40800000; 
	#(t)
		in_matx_en = 1'b1;
	#(t)
		in_matx_en = 1'b0;
end


/*wire [31:0] out_c11, out_c12, out_c13,
			  out_c21, out_c22, out_c23,
			  out_c31, out_c32, out_c33;
wire out_matx_finish;
INS_matx u1 (
	clk				,		//时钟信号
	rst				,		//复位信号，低电平有效
	in_matx_en		,		//姿态矩阵更新使能信号
	in_q0				,		//当前更新的Q0
	in_q1				,		//当前更新的Q1
	in_q2				,		//当前更新的Q2
	in_q3				,		//当前更新的Q3
	out_c11			,		//本次更新后C11
	out_c12			,		//本次更新后C12
	out_c13			,		//本次更新后C13
	out_c21			,		//本次更新后C21
	out_c22			,		//本次更新后C22
	out_c23			,		//本次更新后C23
	out_c31			,		//本次更新后C31
	out_c32			,		//本次更新后C32
	out_c33			,		//本次更新后C33
	out_matx_finish			//姿态矩阵更新完毕，高电平有效
);*/

//--------------------------------------------------------------

reg [31:0] out_c11, out_c12, out_c13,
			  out_c21, out_c22, out_c23,
			  out_c31, out_c32, out_c33;
reg out_matx_finish;

parameter IDLE			=		7'd0,
          START		=     7'd1,
          Q1Q1			=     7'd2,
          Q1Q1_TMP	=     7'd3,
          Q1Q1_1		=     7'd4,
//			 Q1Q1_2		=		7'd77,
          Q2Q2_0		=     7'd5,
          Q2Q2			=     7'd6,
          Q2Q2_TMP	=     7'd7,
          Q2Q2_1		=     7'd8,
          Q3Q3_0		=     7'd9,
          Q3Q3	      =		7'd10,
          Q3Q3_TMP	=     7'd11,
          Q3Q3_1		=     7'd12,
          Q0Q1_0		=     7'd13,
          Q0Q1			=     7'd14,
          Q0Q1_TMP	=     7'd15,
          Q0Q1_1		=     7'd16,
          Q0Q2_0		=     7'd17,
          Q0Q2			=     7'd18,
			 Q0Q2_TMP	=     7'd19,	
			 Q0Q2_1		=		7'd20,
			 Q0Q3_0		=     7'd21,
			 Q0Q3			=     7'd22,
			 Q0Q3_TMP	=     7'd23,	
			 Q0Q3_1		=     7'd24,
			 Q1Q2_0		=     7'd25,
			 Q1Q2			=     7'd26,
			 Q1Q2_TMP	=     7'd27,	
			 Q1Q2_1		=     7'd28,
			 Q1Q3_0		=     7'd29,
			 Q1Q3			=		7'd30,
			 Q1Q3_TMP	=     7'd31,	
			 Q1Q3_1		=     7'd32,
			 Q2Q3_0		=     7'd33,
			 Q2Q3			=     7'd34,
			 Q2Q3_TMP	=     7'd35,	
			 Q2Q3_1		=     7'd36,
			 C_1_0		=     7'd37,	
			 C_1			=     7'd38,
			 C_1_TMP		=     7'd39,
			 C_1_1		=		7'd40,	
			 C_2_0		=     7'd41,	
			 C_2			=     7'd42,
			 C_2_TMP		=     7'd43,
			 C_2_1		=     7'd44,	
			 C_3_0		=     7'd45,	
			 C_3			=     7'd46,
			 C_3_TMP		=     7'd47,
			 C_3_1		=     7'd48,	
			 C_4_0		=     7'd49,	
			 C_4			=		7'd50,
			 C_4_TMP		=     7'd51,
			 C_4_1		=     7'd52,	
			 C_5_0		=     7'd53,	
			 C_5			=     7'd54,
			 C_5_TMP		=     7'd55,
			 C_5_1		=     7'd56,	
			 C_6_0		=     7'd57,	
			 C_6			=     7'd58,
			 C_6_TMP		=     7'd59,
			 C_6_1		=		7'd60,	
			 C_7_0		=     7'd61,	
			 C_7			=     7'd62,
			 C_7_TMP		=     7'd63,
			 C_7_1		=     7'd64,	
          C_8_0		=     7'd65,	
          C_8			=     7'd66,
          C_8_TMP		=     7'd67,
          C_8_1		=     7'd68,	
          C_9_0		=     7'd69,	
          C_9			=		7'd70,	
          C_9_TMP		=     7'd71,	
          C_9_1		=     7'd72,	
          LAST_0		=     7'd73,
          LAST			=     7'd74,	
          LAST_TMP	=     7'd75,		
          END			=     7'd76;

reg [6:0] c_state, n_state;

always @ (posedge clk or negedge rst) begin
	if(!rst) begin
			c_state <= IDLE;
		end
		else	begin
			c_state <= n_state;
	end
end

wire mult_end, add_end, sub_end;
always @ (c_state or in_matx_en or mult_end or add_end or sub_end) begin
	case(c_state) 
		IDLE			:	begin
								if(in_matx_en) n_state = START;
								else n_state = IDLE;
							end	   	
		START			:	n_state = Q1Q1;
		Q1Q1			:	n_state = Q1Q1_TMP;
		Q1Q1_TMP		:	n_state = Q1Q1_1;
		Q1Q1_1		:	n_state = Q2Q2_0;	
//		Q1Q1_2		:	n_state = Q2Q2_0;	
		Q2Q2_0		:	begin
								if(mult_end)
									n_state = Q2Q2;
								else
									n_state = Q2Q2_0;
							end
		Q2Q2			:	n_state = Q2Q2_TMP;					
		Q2Q2_TMP		:	n_state = Q2Q2_1;
		Q2Q2_1		:	n_state = Q3Q3_0;
		Q3Q3_0		:	begin
								if(mult_end)
									n_state = Q3Q3;
								else
									n_state = Q3Q3_0;
							end			
		Q3Q3	      :  n_state = Q3Q3_TMP;
		Q3Q3_TMP		:	n_state = Q3Q3_1;
		Q3Q3_1		:	n_state = Q0Q1_0;
		Q0Q1_0		:	begin
								if(mult_end)
									n_state = Q0Q1;
								else
									n_state = Q0Q1_0;
							end
		Q0Q1			:	n_state = Q0Q1_TMP;					
		Q0Q1_TMP		:	n_state = Q0Q1_1;
		Q0Q1_1		:	n_state = Q0Q2_0;
		Q0Q2_0		:	begin
								if(mult_end)
									n_state = Q0Q2;
								else
									n_state = Q0Q2_0;
							end
		Q0Q2			:	n_state = Q0Q2_TMP;					
		Q0Q2_TMP		:	n_state = Q0Q2_1;
		Q0Q2_1		:	n_state = Q0Q3_0;
		Q0Q3_0		:	begin
								if(mult_end)
									n_state = Q0Q3;
								else
									n_state = Q0Q3_0;
							end
		Q0Q3			:	n_state = Q0Q3_TMP;					
		Q0Q3_TMP		:	n_state = Q0Q3_1;
		Q0Q3_1		:	n_state = Q1Q2_0;
		Q1Q2_0		:	begin
								if(mult_end)
									n_state = Q1Q2;
								else
									n_state = Q1Q2_0;
							end
		Q1Q2			:	n_state = Q1Q2_TMP;					
		Q1Q2_TMP		:	n_state = Q1Q2_1;
		Q1Q2_1		:	n_state = Q1Q3_0;
		Q1Q3_0		:	begin
								if(mult_end)
									n_state = Q1Q3;
								else
									n_state = Q1Q3_0;
							end
		Q1Q3			:	n_state = Q1Q3_TMP;					
		Q1Q3_TMP		:	n_state = Q1Q3_1;
		Q1Q3_1		:	n_state = Q2Q3_0;
		Q2Q3_0		:	begin
								if(mult_end)
									n_state = Q2Q3;
								else
									n_state = Q2Q3_0;
							end
		Q2Q3			:	n_state = Q2Q3_TMP;					
		Q2Q3_TMP		:	n_state = Q2Q3_1;
		Q2Q3_1		:	n_state = C_1_0;
		C_1_0			:	begin
								if(add_end)
									n_state = C_1;
								else
									n_state = C_1_0;
							end
		C_1			:	n_state = C_1_TMP;					
		C_1_TMP		:	n_state = C_1_1;
		C_1_1			:	n_state = C_2_0;
		C_2_0			:	begin
								if(add_end)
									n_state = C_2;
								else
									n_state = C_2_0;
							end
		C_2			:	n_state = C_2_TMP;					
		C_2_TMP		:	n_state = C_2_1;
		C_2_1			:	n_state = C_3_0;
		C_3_0			:	begin
								if(add_end)
									n_state = C_3;
								else
									n_state = C_3_0;
							end
		C_3			:	n_state = C_3_TMP;					
		C_3_TMP		:	n_state = C_3_1;
		C_3_1			:	n_state = C_4_0;
		C_4_0			:	begin
								if(add_end)
									n_state = C_4;
								else
									n_state = C_4_0;
							end
		C_4			:	n_state = C_4_TMP;					
		C_4_TMP		:	n_state = C_4_1;
		C_4_1			:	n_state = C_5_0;
		C_5_0			:	begin
								if(add_end)
									n_state = C_5;
								else
									n_state = C_5_0;
							end
		C_5			:	n_state = C_5_TMP;					
		C_5_TMP		:	n_state = C_5_1;
		C_5_1			:	n_state = C_6_0;
		C_6_0			:	begin
								if(add_end)
									n_state = C_6;
								else
									n_state = C_6_0;
							end
		C_6			:	n_state = C_6_TMP;					
		C_6_TMP		:	n_state = C_6_1;
		C_6_1			:	n_state = C_7_0;
		C_7_0			:	begin
								if(sub_end)
									n_state = C_7;
								else
									n_state = C_7_0;
							end
		C_7			:	n_state = C_7_TMP;					
		C_7_TMP		:	n_state = C_7_1;
		C_7_1			:	n_state = C_8_0;
		C_8_0			:	begin
								if(mult_end)
									n_state = C_8;
								else
									n_state = C_8_0;
							end
		C_8			:	n_state = C_8_TMP;					
		C_8_TMP		:	n_state = C_8_1;
		C_8_1			:	n_state = C_9_0;
		C_9_0			:	begin
								if(mult_end)
									n_state = C_9;
								else
									n_state = C_9_0;
							end
		C_9			:	n_state = C_9_TMP;					
		C_9_TMP		:	n_state = C_9_1;
		C_9_1			:	n_state = LAST_0;
		LAST_0			:	begin
								if(mult_end)
									n_state = LAST;
								else
									n_state = LAST_0;
							end
		LAST			:	n_state = LAST_TMP;					
		LAST_TMP		:	n_state = END;	
		END			:  n_state = IDLE;
		default     :  n_state = IDLE;
	endcase
end

parameter ONE = 32'h3F800000,
			 TWO = 32'h40000000;

reg sclr, ce;
reg mult_start, add_start, sub_start;
reg [31:0] in_q0_tmp, in_q1_tmp, in_q2_tmp, in_q3_tmp;
reg [31:0] out_c11_tmp, out_c12_tmp, out_c13_tmp,
			  out_c21_tmp, out_c22_tmp, out_c23_tmp,
			  out_c31_tmp, out_c32_tmp, out_c33_tmp;
reg [31:0] q1q1_tmp, q2q2_tmp, q3q3_tmp, q1q3_tmp,
			  q0q1_tmp, q0q2_tmp, q0q3_tmp, q1q2_tmp, q2q3_tmp;		   
reg [31:0] tmp_c13_tmp, tmp_c21_tmp, tmp_c32_tmp;

reg [31:0] mult_in_a, mult_in_b;
wire [31:0] mult_out;
reg [31:0] add_in_a, add_in_b;
wire [31:0] add_out;
reg [31:0] sub_in_a, sub_in_b;
wire [31:0] sub_out;						

always @ (posedge clk or negedge rst) begin
	if(!rst) begin
			in_q0_tmp <= 32'h0;
			in_q1_tmp <= 32'h0;
			in_q2_tmp <= 32'h0;
			in_q3_tmp <= 32'h0;
			out_c11_tmp <= 32'h0;
			out_c12_tmp <= 32'h0;
			out_c13_tmp <= 32'h0;
			out_c21_tmp <= 32'h0;
			out_c22_tmp <= 32'h0;
			out_c23_tmp <= 32'h0;
			out_c31_tmp <= 32'h0;
			out_c32_tmp <= 32'h0;
			out_c33_tmp <= 32'h0;
			q1q1_tmp <= 32'h0;
			q2q2_tmp <= 32'h0;
			q3q3_tmp <= 32'h0;
			q0q1_tmp <= 32'h0;
			q0q2_tmp <= 32'h0;
			q0q3_tmp <= 32'h0;
			q1q2_tmp <= 32'h0;
			q1q3_tmp <= 32'h0;
			q2q3_tmp <= 32'h0;
			tmp_c13_tmp <= 32'h0;
			tmp_c21_tmp <= 32'h0;
			tmp_c32_tmp <= 32'h0;
			out_c11 <= 32'h0;
			out_c12 <= 32'h0;
			out_c13 <= 32'h0;
			out_c21 <= 32'h0;
			out_c22 <= 32'h0;
			out_c23 <= 32'h0;
			out_c31 <= 32'h0;
			out_c32 <= 32'h0;
			out_c33 <= 32'h0;
			out_matx_finish <= 1'h0;
			sclr <= 1'b1;
			ce <= 1'b0;
			mult_in_a <= 32'h0;
			mult_in_b <= 32'h0;
			mult_start <= 1'b0;
			add_in_a <= 32'h0;
			add_in_b <= 32'h0;
			add_start <= 1'b0;
			sub_in_a <= 32'h0;
			sub_in_b <= 32'h0;
			sub_start <= 1'b0;
		end
	else begin
		case(c_state)
			IDLE				:	begin
										if(in_matx_en) begin
												in_q0_tmp <= in_q0;
												in_q1_tmp <= in_q1;
												in_q2_tmp <= in_q2;
												in_q3_tmp <= in_q3;
												sclr <= 1'b1;
												ce <= 1'b0;
												mult_in_a <= 32'h0;
												mult_in_b <= 32'h0;
												mult_start <= 1'b0;
												add_in_a <= 32'h0;
												add_in_b <= 32'h0;
												add_start <= 1'b0;
												sub_in_a <= 32'h0;
												sub_in_b <= 32'h0;
												sub_start <= 1'b0;	
											end
											else begin
												sclr <= 1'b1;
												ce <= 1'b0;
												mult_in_a <= 32'h0;
												mult_in_b <= 32'h0;
												mult_start <= 1'b0;
												add_in_a <= 32'h0;
												add_in_b <= 32'h0;
												add_start <= 1'b0;
												sub_in_a <= 32'h0;
												sub_in_b <= 32'h0;
												sub_start <= 1'b0;
										end
									end					
			START			:	begin
									out_matx_finish <= 1'b0;
									sclr <= 1'b0;	
									ce <= 1'b1;	
								end
			Q1Q1			:	begin
									mult_in_a <= in_q1_tmp;		// q1
									mult_in_b <= in_q1_tmp;		//	q1		
								end
			Q1Q1_1		:	begin
									mult_start <= 1'b1;
								end
			Q2Q2_0		:	begin
									mult_start <= 1'b0;
								end
			Q2Q2			:	begin					
									q1q1_tmp <= mult_out;		// q1*q1
									mult_in_a <= in_q2_tmp;		// q2
									mult_in_b <= in_q2_tmp;		//	q2		
								end					
			Q2Q2_1		:	begin
									mult_start <= 1'b1;
								end
			Q3Q3_0		:	begin
									mult_start <= 1'b0;
								end			
			Q3Q3			:	begin					
									q2q2_tmp <= mult_out;		// q2*q2
									mult_in_a <= in_q3_tmp;		// q3
									mult_in_b <= in_q3_tmp;		//	q3		
								end
			Q3Q3_1		:	begin
									mult_start <= 1'b1;
								end
			Q0Q1_0		:	begin
									mult_start <= 1'b0;
								end
			Q0Q1			:	begin					
									q3q3_tmp <= mult_out;		// q3*q3
									mult_in_a <= in_q0_tmp;		// q0
									mult_in_b <= in_q1_tmp;		//	q1		
								end					
			Q0Q1_1		:	begin
									mult_start <= 1'b1;
								end
			Q0Q2_0		:	begin
									mult_start <= 1'b0;
								end
			Q0Q2			:	begin					
									q0q1_tmp <= mult_out;		// q0*q1									
									mult_in_a <= in_q0_tmp;		// q0
									mult_in_b <= in_q2_tmp;		//	q2		
								end					
			Q0Q2_1		:	begin
									mult_start <= 1'b1;
								end
			Q0Q3_0		:	begin
									mult_start <= 1'b0;
								end
			Q0Q3			:	begin					
									q0q2_tmp <= mult_out;		// q0*q2									
									mult_in_a <= in_q0_tmp;		// q0
									mult_in_b <= in_q3_tmp;		//	q3		
								end					
			Q0Q3_1		:	begin
									mult_start <= 1'b1;
								end
			Q1Q2_0		:	begin
									mult_start <= 1'b0;
								end
			Q1Q2			:	begin					
									q0q3_tmp <= mult_out;		// q0*q3									
									mult_in_a <= in_q1_tmp;		// q1
									mult_in_b <= in_q2_tmp;		//	q2		
								end
			Q1Q2_1		:	begin
									mult_start <= 1'b1;
								end
			Q1Q3_0		:	begin
									mult_start <= 1'b0;
								end
			Q1Q3			:	begin					
									q1q2_tmp <= mult_out;		// q1*q2									
									mult_in_a <= in_q1_tmp;		// q1
									mult_in_b <= in_q3_tmp;		//	q3		
								end					
			Q1Q3_1		:	begin
									mult_start <= 1'b1;
								end
			Q2Q3_0		:	begin
									mult_start <= 1'b0;
								end
			Q2Q3			:	begin					
									q1q3_tmp <= mult_out;		// q1*q3									
									mult_in_a <= in_q2_tmp;		// q2
									mult_in_b <= in_q3_tmp;		//	q3
									add_in_a <= q2q2_tmp;		// q2*q2
									add_in_b <= q3q3_tmp;		// q3*q3
								end					
			Q2Q3_1		:	begin
									mult_start <= 1'b1;
									add_start <= 1'b1;
								end
			C_1_0			:	begin
									mult_start <= 1'b0;
									add_start <= 1'b0;
								end
			C_1			:	begin					
									q2q3_tmp <= mult_out;		// q2*q3									
									mult_in_a <= add_out;		// q2*q2 + q3*q3
									mult_in_b <= TWO;				//	2
									add_in_a <= q1q2_tmp;		// q1*q2
									add_in_b <= q0q3_tmp;		// q0*q3
									sub_in_a <= q1q3_tmp;		// q1*q3
									sub_in_b <= q0q2_tmp;		// q0*q2
								end						
			C_1_1			:	begin
									mult_start <= 1'b1;
									add_start <= 1'b1;
									sub_start <= 1'b1;
								end
			C_2_0			:	begin
									mult_start <= 1'b0;
									add_start <= 1'b0;
									sub_start <= 1'b0;
								end
			C_2			:	begin					
									tmp_c13_tmp <= sub_out;		// q1*q3 - q0*q2
									sub_in_a <= ONE;				// 1
									sub_in_b <= mult_out;		// 2*(q2*q2 + q3*q3)									
									mult_in_a <= add_out;		// q1*q2 + q0*q3
									mult_in_b <= TWO;				//	2
									add_in_a <= q1q1_tmp;		// q1*q1
									add_in_b <= q3q3_tmp;		// q3*q3
								end						
			C_2_1			:	begin
									mult_start <= 1'b1;
									add_start <= 1'b1;
									sub_start <= 1'b1;
								end
			C_3_0			:	begin
									mult_start <= 1'b0;
									add_start <= 1'b0;
									sub_start <= 1'b0;
								end
			C_3			:	begin					
									out_c11_tmp <= sub_out;		// c11 = 1 - 2*(q2*q2 + q3*q3)
									out_c12_tmp <= mult_out;	// c12 = 2*(q1*q2 + q0*q3)									
									mult_in_a <= add_out;		// q1*q1 + q3*q3
									mult_in_b <= TWO;				//	2
									add_in_a <= q2q3_tmp;		// q2*q3
									add_in_b <= q0q1_tmp;		// q0*q1
									sub_in_a <= q1q2_tmp;		// q1*q2
									sub_in_b <= q0q3_tmp;		// q0*q3
								end					
			C_3_1			:	begin
									mult_start <= 1'b1;
									add_start <= 1'b1;
									sub_start <= 1'b1;
								end
			C_4_0			:	begin
									mult_start <= 1'b0;
									add_start <= 1'b0;
									sub_start <= 1'b0;
								end
			C_4			:	begin	
									tmp_c21_tmp <= sub_out;		// q1*q2 - q0*q3
									sub_in_a <= ONE;				// 1
									sub_in_b <= mult_out;		// 2*(q1*q1 + q3*q3)	
									mult_in_a <= add_out;		// q2*q3 + q0*q1
									mult_in_b <= TWO;				//	2
									add_in_a <= q1q1_tmp;		// q1*q1
									add_in_b <= q2q2_tmp;		// q2*q2
								end					
			C_4_1			:	begin
									mult_start <= 1'b1;
									add_start <= 1'b1;
									sub_start <= 1'b1;
								end
			C_5_0			:	begin
									mult_start <= 1'b0;
									add_start <= 1'b0;
									sub_start <= 1'b0;
								end
			C_5			:	begin					
									out_c22_tmp <= sub_out;		// c22 = 1 - 2*(q1*q1 + q3*q3)
									out_c23_tmp <= mult_out;	// c23 = 2*(q2*q3 + q0*q1)									
									mult_in_a <= add_out;		// q1*q1 + q2*q2
									mult_in_b <= TWO;				//	2
									add_in_a <= q1q3_tmp;		// q1*q3
									add_in_b <= q0q2_tmp;		// q0*q2
									sub_in_a <= q2q3_tmp;		// q2*q3
									sub_in_b <= q0q1_tmp;		// q0*q1
								end					
			C_5_1			:	begin
									mult_start <= 1'b1;
									add_start <= 1'b1;
									sub_start <= 1'b1;
								end
			C_6_0			:	begin
									mult_start <= 1'b0;
									add_start <= 1'b0;
									sub_start <= 1'b0;
								end
			C_6			:	begin					
									tmp_c32_tmp <= sub_out;		// q2*q3 - q0*q1
									sub_in_a <= ONE;				// 1
									sub_in_b <= mult_out;		// 2*(q1*q1 + q2*q2)	
									mult_in_a <= add_out;		// q1*q3 + q0*q2
									mult_in_b <= TWO;				//	2
								end					
			C_6_1			:	begin
									mult_start <= 1'b1;
									sub_start <= 1'b1;
								end
			C_7_0			:	begin
									mult_start <= 1'b0;
									sub_start <= 1'b0;
								end
			C_7			:	begin					
									out_c33_tmp <= sub_out;		// c33 = 1 - 2*(q1*q1 + q2*q2)
									out_c31_tmp <= mult_out;	// c31 = 2*(q1*q3 + q0*q2)	
									mult_in_a <= tmp_c13_tmp;	// q1*q3 - q0*q2
									mult_in_b <= TWO;				//	2
								end					
			C_7_1			:	begin
									mult_start <= 1'b1;
								end
			C_8_0			:	begin
									mult_start <= 1'b0;
								end
			C_8			:	begin					
									out_c13_tmp <= mult_out;	// c13 = 2*(q1*q3 - q0*q2)	
									mult_in_a <= tmp_c21_tmp;	// q1*q2 - q0*q3
									mult_in_b <= TWO;				//	2
								end					
			C_8_1			:	begin
									mult_start <= 1'b1;
								end
			C_9_0			:	begin
									mult_start <= 1'b0;
								end
			C_9			:	begin					
									out_c21_tmp <= mult_out;	// c13 = 2*(q1*q2 - q0*q3)	
									mult_in_a <= tmp_c32_tmp;	// q2*q3 - q0*q1
									mult_in_b <= TWO;				//	2
								end	
			C_9_1			:	begin
									mult_start <= 1'b1;
								end
			LAST_0		:	begin
									mult_start <= 1'b0;
								end
			LAST			:  begin					
									out_c32_tmp <= mult_out;	// c32 = 2*(q2*q3 - q0*q1)	
								end
			END			:	begin					
									out_c11 <= out_c11_tmp;
									out_c12 <= out_c12_tmp;
									out_c13 <= out_c13_tmp;
									out_c21 <= out_c21_tmp;
									out_c22 <= out_c22_tmp;
									out_c23 <= out_c23_tmp;
									out_c31 <= out_c31_tmp;
									out_c32 <= out_c32_tmp;
									out_c33 <= out_c33_tmp;
									out_matx_finish <= 1'b1;									
								end
			default		:  begin
									mult_in_a <= mult_in_a;
									mult_in_b <= mult_in_b;
									mult_start <= mult_start;
									add_in_a <= add_in_a;
									add_in_b <= add_in_b;
									add_start <= add_start;
									sub_in_a <= sub_in_a;
									sub_in_b <= sub_in_b;
									sub_start <= sub_start;	
								end					
		endcase
	end
end

mult u1 (
  .a(mult_in_a), // input [31 : 0] a
  .b(mult_in_b), // input [31 : 0] b
  .operation_nd(mult_start), // input operation_nd
  .clk(clk), // input clk
  .sclr(sclr), // input sclr
  .ce(ce), // input ce
  .result(mult_out), // output [31 : 0] result
  .rdy(mult_end) // output rdy
);

add u2 (
  .a(add_in_a), // input [31 : 0] a
  .b(add_in_b), // input [31 : 0] b
  .operation_nd(add_start), // input operation_nd
  .clk(clk), // input clk
  .sclr(sclr), // input sclr
  .ce(ce), // input ce
  .result(add_out), // output [31 : 0] result
  .rdy(add_end) // output rdy
);

sub u5 (
  .a(sub_in_a), // input [31 : 0] a
  .b(sub_in_b), // input [31 : 0] b
  .operation_nd(sub_start), // input operation_nd
  .clk(clk), // input clk
  .sclr(sclr), // input sclr
  .ce(ce), // input ce
  .result(sub_out), // output [31 : 0] result
  .rdy(sub_end) // output rdy
);

endmodule
