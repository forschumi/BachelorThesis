`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:07:49 04/25/2015 
// Design Name: 
// Module Name:    INS_quat_tb 
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
//`include "F:/quadrotor/prj_INS/qrc/src/INS_quat.v"

module INS_quat_tb;

parameter HPERIOD = 32'h3A83126F, t = 20;

reg clk, rst, in_quat_en;
reg [31:0] in_q0, in_q1, in_q2, in_q3,
				in_wx, in_wy, in_wz;


initial begin
	clk = 1'b1;
	rst = 1'b1;
	in_q0 = 32'd0; 
	in_q1 = 32'd0; 
	in_q2 = 32'd0;	
	in_q3 = 32'd0; 
	in_wx = 32'd0; 
	in_wy = 32'd0;
	in_wz = 32'd0;
	in_quat_en = 1'b0;
end

always #(t/2) clk = ~clk;

initial begin
	#(t*8)
		rst = 1'b0;
	#(t*2)
		rst = 1'b1;
	#t
		in_q0 = 32'h3F800000;
		in_q1 = 32'h40000000;
		in_q2 = 32'h40400000;
		in_q3 = 32'h40800000; 
		in_wx = 32'h3F800000;
		in_wy = 32'h40000000;
		in_wz = 32'h40400000;
	#(t)
		in_quat_en = 1'b1;
	#(t*5)
		in_quat_en = 1'b0;
	#(t*550)
		in_q0 = 32'h40800000;
		in_q1 = 32'h40400000;
		in_q2 = 32'h40000000;
		in_q3 = 32'h3F800000; 
		in_wx = 32'h40400000;
		in_wy = 32'h40000000;
		in_wz = 32'h3F800000;
	#(t)
		in_quat_en = 1'b1;
	#(t*5)
		in_quat_en = 1'b0;	
end


/*wire [31:0] out_q0, out_q1, out_q2, out_q3;
wire out_quat_finish;
INS_quat u1 (
	.clk(clk)					,		//时钟信号
	.rst(rst)					,		//复位信号，低电平有效
	.in_quat_en(in_quat_en)	,		//四元数更新使能信号
	.in_q0(in_q0)				,		//前次更新后Q0
	.in_q1(in_q1)				,		//前次更新后Q1
	.in_q2(in_q2)				,		//前次更新后Q2
	.in_q3(in_q3)				,		//前次更新后Q3
	.in_wx(in_wx)				, 		//陀螺仪WX修正值
	.in_wy(in_wy)				,		//陀螺仪WY修正值
	.in_wz(in_wz)				,		//陀螺仪WZ修正值
	.out_q0(out_q0)			,		//本次更新后Q0
	.out_q1(out_q1)			,		//本次更新后Q1
	.out_q2(out_q2)			,		//本次更新后Q2
	.out_q3(out_q3)			,		//本次更新后Q3
	.out_quat_finish(out_quat_finish)		//四元数更新完毕，高电平有效
);*/

//-------------------------------------------------------------------------

reg [31:0] out_q0, out_q1, out_q2, out_q3;
reg out_quat_finish;
parameter IDLE				=	7'd0,
			 START			=	7'd1,
			 Q0_1        	=	7'd2,
			 Q0_1_TMP    	=	7'd3,
			 Q0_1_1      	=	7'd4,
			 Q0_2_0      	=	7'd5,
			 Q0_2				=	7'd6,
			 Q0_2_TMP 		=	7'd7,
			 Q0_2_1   		=	7'd8,
			 Q0_3_0   		=	7'd9,
			 Q0_3				=	7'd10,
			 Q0_3_TMP		=	7'd11,
			 Q0_3_1  		=	7'd12,
			 Q0_4_0  		=	7'd13,
			 Q0_4				=	7'd14,
			 Q0_4_TMP 		=	7'd15,
			 Q0_4_1   		=	7'd16,
			 Q0_5_0   		=	7'd17,
			 Q0_5				=	7'd18,
			 Q0_5_TMP    	=	7'd19,
			 Q0_5_1      	=	7'd20,
			 Q1_1_0      	=	7'd21,
			 Q1_1        	=	7'd22,
			 Q1_1_TMP    	=	7'd23,
			 Q1_1_1      	=	7'd24,
			 Q1_2_0      	=	7'd25,
			 Q1_2				=	7'd26,
			 Q1_2_TMP    	=	7'd27,
			 Q1_2_1      	=	7'd28,
			 Q1_3_0      	=	7'd29,
			 Q1_3				=	7'd30,
			 Q1_3_TMP    	=	7'd31,
			 Q1_3_1      	=	7'd32,
			 Q1_4_0      	=	7'd33,
			 Q1_4				=	7'd34,
			 Q1_4_TMP    	=	7'd35,
			 Q1_4_1      	=	7'd36,
			 Q1_5_0      	=	7'd37,
			 Q1_5				=	7'd38,
			 Q1_5_TMP    	=	7'd39,
			 Q1_5_1      	=	7'd40,
			 Q2_1_0      	=	7'd41,
			 Q2_1        	=	7'd42,
			 Q2_1_TMP    	=	7'd43,
			 Q2_1_1      	=	7'd44,
			 Q2_2_0      	=	7'd45,
			 Q2_2				=	7'd46,
			 Q2_2_TMP    	=	7'd47,
			 Q2_2_1      	=	7'd48,
			 Q2_3_0      	=	7'd49,
			 Q2_3				=	7'd50,
			 Q2_3_TMP    	=	7'd51,
			 Q2_3_1      	=	7'd52,
			 Q2_4_0      	=	7'd53,
			 Q2_4				=	7'd54,
			 Q2_4_TMP    	=	7'd55,
			 Q2_4_1      	=	7'd56,
			 Q2_5_0      	=	7'd57,
			 Q2_5				=	7'd58,
			 Q2_5_TMP    	=	7'd59,
			 Q2_5_1      	=	7'd60,
			 Q3_1_0      	=	7'd61,
			 Q3_1        	=	7'd62,
			 Q3_1_TMP    	=	7'd63,
          Q3_1_1      	=	7'd64,
          Q3_2_0		   =	7'd65,
          Q3_2		      =	7'd66,
          Q3_2_TMP      =	7'd67,
          Q3_2_1        =	7'd68,
          Q3_3_0        =	7'd69,
          Q3_3		      =	7'd70,
          Q3_3_TMP      =	7'd71,
          Q3_3_1        =	7'd72,
          Q3_4_0        =	7'd73,
          Q3_4		      =	7'd74,
          Q3_4_TMP      =	7'd75,
          Q3_4_1        =	7'd76,
          Q3_5_0        =	7'd77,
          Q3_5          =	7'd78,
          Q3_5_TMP      =	7'd79,
          Q3_5_1        =	7'd80,
          Q0_SQR_0      =	7'd81,
          Q0_SQR        =	7'd82,
          Q0_SQR_TMP    =	7'd83,
          Q0_SQR_1      =	7'd84,
          Q1_SQR_0      =	7'd85,
          Q1_SQR		   =	7'd86,
          Q1_SQR_TMP    =	7'd87,
          Q1_SQR_1      =	7'd88,
          Q2_SQR_0      =	7'd89,
          Q2_SQR        =	7'd90,
          Q2_SQR_TMP    =	7'd91,
          Q2_SQR_1      =	7'd92,
          Q3_SQR_0      =	7'd93,
          Q3_SQR		   =	7'd94,
          Q3_SQR_TMP    =	7'd95,
          Q3_SQR_1      =	7'd96,
          Q_ADD_0       =	7'd97,
          Q_ADD		   =	7'd98,
          Q_ADD_TMP     =	7'd99,
          Q_ADD_1       =	7'd100,
          Q_SQRT_0      =	7'd101,
          Q_SQRT        =	7'd102,
          Q_SQRT_TMP    =	7'd103,
          Q_SQRT_1      =	7'd104,
          Q0_NORM_0     =	7'd105,
          Q0_NORM       =	7'd106,
          Q0_NORM_TMP   =	7'd107,
          Q0_NORM_1     =	7'd108,
          Q1_NORM_0     =	7'd109,
          Q1_NORM		   =	7'd110,
          Q1_NORM_TMP   =	7'd111,
          Q1_NORM_1     =	7'd112,
          Q2_NORM_0     =	7'd113,
          Q2_NORM		   =	7'd114,
          Q2_NORM_TMP   =	7'd115,
          Q2_NORM_1     =	7'd116,
          Q3_NORM_0     =	7'd117,
          Q3_NORM		   =	7'd118,
          Q3_NORM_TMP   =	7'd119,
          Q3_NORM_1     =	7'd120,
          LAST_0        =	7'd121,
          LAST          =	7'd122,
          LAST_TMP      =	7'd123,
          END           =	7'd124;
			 
reg [6:0] c_state, n_state;

always @ (posedge clk or negedge rst) begin
	if(!rst) begin
			c_state <= IDLE;
		end
		else	begin
			c_state <= n_state;
	end
end			 

wire add_end, mult_end, sqrt_end, div_end, sub_end;	
always @ (c_state or in_quat_en or add_end or mult_end or sqrt_end or div_end or sub_end) begin
	case(c_state) 
		IDLE				 :		begin
										if(in_quat_en) n_state = START;
										else n_state = IDLE;
									end			
		START				 :		n_state =	Q0_1        ;
		Q0_1            :		n_state =	Q0_1_TMP    ;
		Q0_1_TMP        :		n_state =	Q0_1_1      ;
		Q0_1_1          :		n_state =	Q0_2_0      ;
		Q0_2_0          :		begin
										if(mult_end)
											n_state =	Q0_2;
										else
											n_state =	Q0_2_0;
									end
		Q0_2				 :		n_state =	Q0_2_TMP    ;
		Q0_2_TMP        :		n_state =	Q0_2_1      ;
		Q0_2_1          :		n_state =	Q0_3_0      ;
		Q0_3_0          :		begin
										if(mult_end)
											n_state =	Q0_3;
										else
											n_state =	Q0_3_0;
									end
		Q0_3				 :		n_state =	Q0_3_TMP    ;
		Q0_3_TMP        :		n_state =	Q0_3_1      ;
		Q0_3_1          :		n_state =	Q0_4_0      ;
		Q0_4_0          :  	begin
										if(add_end)
											n_state =	Q0_4;
										else
											n_state =	Q0_4_0;
									end
		Q0_4				 :  	n_state =	Q0_4_TMP    ;
		Q0_4_TMP        :  	n_state =	Q0_4_1      ;
		Q0_4_1          :  	n_state =	Q0_5_0      ;
		Q0_5_0          :  	begin
										if(add_end)
											n_state =	Q0_5;
										else
											n_state =	Q0_5_0;
									end
		Q0_5				 :  	n_state =	Q0_5_TMP    ;
		Q0_5_TMP        :  	n_state =	Q0_5_1      ;
		Q0_5_1          :  	n_state =	Q1_1_0      ;
		Q1_1_0          :  	begin
										if(mult_end)
											n_state =	Q1_1;
										else
											n_state =	Q1_1_0;
									end
		Q1_1            :  	n_state =	Q1_1_TMP    ;
		Q1_1_TMP        :  	n_state =	Q1_1_1      ;
		Q1_1_1          :  	n_state =	Q1_2_0      ;
		Q1_2_0          :  	begin
										if(sub_end)
											n_state =	Q1_2;
										else
											n_state =	Q1_2_0;
									end
		Q1_2				 :  	n_state =	Q1_2_TMP    ;
		Q1_2_TMP        :  	n_state =	Q1_2_1      ;
		Q1_2_1          :  	n_state =	Q1_3_0      ;
		Q1_3_0          :  	begin
										if(mult_end)
											n_state =	Q1_3;
										else
											n_state =	Q1_3_0;
									end
		Q1_3				 :  	n_state =	Q1_3_TMP    ;
		Q1_3_TMP        :  	n_state =	Q1_3_1      ;
		Q1_3_1          :  	n_state =	Q1_4_0      ;
		Q1_4_0          :  	begin
										if(add_end)
											n_state =	Q1_4;
										else
											n_state =	Q1_4_0;
									end
		Q1_4				 :  	n_state =	Q1_4_TMP    ;
		Q1_4_TMP        :  	n_state =	Q1_4_1      ;
		Q1_4_1          :  	n_state =	Q1_5_0      ;
		Q1_5_0          :  	begin
										if(sub_end)
											n_state =	Q1_5;
										else
											n_state =	Q1_5_0;
									end
		Q1_5				 :  	n_state =	Q1_5_TMP    ;
		Q1_5_TMP        :  	n_state =	Q1_5_1      ;
		Q1_5_1          :  	n_state =	Q2_1_0      ;
		Q2_1_0          :  	begin
										if(mult_end)
											n_state =	Q2_1;
										else
											n_state =	Q2_1_0;
									end
		Q2_1            :  	n_state =	Q2_1_TMP    ;
		Q2_1_TMP        :  	n_state =	Q2_1_1      ;
		Q2_1_1          :  	n_state =	Q2_2_0      ;
		Q2_2_0          :  	begin
										if(add_end)
											n_state =	Q2_2;
										else
											n_state =	Q2_2_0;
									end
		Q2_2				 :  	n_state =	Q2_2_TMP    ;
		Q2_2_TMP        :  	n_state =	Q2_2_1      ;
		Q2_2_1          :  	n_state =	Q2_3_0      ;
		Q2_3_0          :  	begin
										if(mult_end)
											n_state =	Q2_3;
										else
											n_state =	Q2_3_0;
									end
		Q2_3				 :  	n_state =	Q2_3_TMP    ;
		Q2_3_TMP        :  	n_state =	Q2_3_1      ;
		Q2_3_1          :  	n_state =	Q2_4_0      ;
		Q2_4_0          :  	begin
										if(sub_end)
											n_state =	Q2_4;
										else
											n_state =	Q2_4_0;
									end
		Q2_4				 :  	n_state =	Q2_4_TMP    ;
		Q2_4_TMP        :  	n_state =	Q2_4_1      ;
		Q2_4_1          :  	n_state =	Q2_5_0      ;
		Q2_5_0          :  	begin
										if(add_end)
											n_state =	Q2_5;
										else
											n_state =	Q2_5_0;
									end
		Q2_5				 :  	n_state =	Q2_5_TMP    ;
		Q2_5_TMP        :  	n_state =	Q2_5_1      ;
		Q2_5_1          :  	n_state =	Q3_1_0      ;
		Q3_1_0          :  	begin
										if(mult_end)
											n_state =	Q3_1;
										else
											n_state =	Q3_1_0;
									end
		Q3_1            :  	n_state =	Q3_1_TMP    ;
		Q3_1_TMP        :  	n_state =	Q3_1_1      ;
		Q3_1_1          :  	n_state =	Q3_2_0		;
		Q3_2_0		    :	   begin
										if(add_end)
											n_state =	Q3_2;
										else
											n_state =	Q3_2_0;
									end
		Q3_2				 :		n_state =	Q3_2_TMP    ;
		Q3_2_TMP        :		n_state =	Q3_2_1      ;
		Q3_2_1          :		n_state =	Q3_3_0      ;
		Q3_3_0          :		begin
										if(mult_end)
											n_state =	Q3_3;
										else
											n_state =	Q3_3_0;
									end
		Q3_3				 :		n_state =	Q3_3_TMP    ;
		Q3_3_TMP        :		n_state =	Q3_3_1      ;
		Q3_3_1          :		n_state =	Q3_4_0      ;
		Q3_4_0          :		begin
										if(add_end)
											n_state =	Q3_4;
										else
											n_state =	Q3_4_0;
									end
		Q3_4			    :		n_state =	Q3_4_TMP    ;
		Q3_4_TMP        :		n_state =	Q3_4_1      ;
		Q3_4_1          :		n_state =	Q3_5_0      ;
		Q3_5_0          : 	begin
										if(sub_end)
											n_state =	Q3_5;
										else
											n_state =	Q3_5_0;
									end
		Q3_5            : 	n_state =	Q3_5_TMP    ;
		Q3_5_TMP        : 	n_state =	Q3_5_1      ;
		Q3_5_1          : 	n_state =	Q0_SQR_0    ;
		Q0_SQR_0        : 	begin
										if(mult_end)
											n_state =	Q0_SQR;
										else
											n_state =	Q0_SQR_0;
									end
		Q0_SQR          : 	n_state =	Q0_SQR_TMP  ;
		Q0_SQR_TMP      : 	n_state =	Q0_SQR_1    ;
		Q0_SQR_1        : 	n_state =	Q1_SQR_0    ;
		Q1_SQR_0        : 	begin
										if(add_end)
											n_state =	Q1_SQR;
										else
											n_state =	Q1_SQR_0;
									end
		Q1_SQR			 : 	n_state =	Q1_SQR_TMP  ;
		Q1_SQR_TMP      : 	n_state =	Q1_SQR_1    ;
		Q1_SQR_1        : 	n_state =	Q2_SQR_0    ;
		Q2_SQR_0        : 	begin
										if(mult_end)
											n_state =	Q2_SQR;
										else
											n_state =	Q2_SQR_0;
									end
		Q2_SQR          : 	n_state =	Q2_SQR_TMP  ;
		Q2_SQR_TMP      : 	n_state =	Q2_SQR_1    ;
		Q2_SQR_1        : 	n_state =	Q3_SQR_0    ;
		Q3_SQR_0        : 	begin
										if(add_end)
											n_state =	Q3_SQR;
										else
											n_state =	Q3_SQR_0;
									end
		Q3_SQR			 : 	n_state =	Q3_SQR_TMP  ;
		Q3_SQR_TMP      : 	n_state =	Q3_SQR_1    ;
		Q3_SQR_1        : 	n_state =	Q_ADD_0     ;
		Q_ADD_0         : 	begin
										if(add_end)
											n_state =	Q_ADD;
										else
											n_state =	Q_ADD_0;
									end
		Q_ADD			    : 	n_state =	Q_ADD_TMP   ;
		Q_ADD_TMP       : 	n_state =	Q_ADD_1     ;
		Q_ADD_1         : 	n_state =	Q_SQRT_0    ;
		Q_SQRT_0        : 	begin
										if(add_end)
											n_state =	Q_SQRT;
										else
											n_state =	Q_SQRT_0;
									end
		Q_SQRT          : 	n_state =	Q_SQRT_TMP  ;
		Q_SQRT_TMP      : 	n_state =	Q_SQRT_1    ;
		Q_SQRT_1        : 	n_state =	Q0_NORM_0   ;
		Q0_NORM_0       : 	begin
										if(sqrt_end)
											n_state =	Q0_NORM;
										else
											n_state =	Q0_NORM_0;
									end
		Q0_NORM         : 	n_state =	Q0_NORM_TMP ;
		Q0_NORM_TMP     : 	n_state =	Q0_NORM_1   ;
		Q0_NORM_1       : 	n_state =	Q1_NORM_0   ;
		Q1_NORM_0       : 	begin
										if(div_end)
											n_state =	Q1_NORM;
										else
											n_state =	Q1_NORM_0;
									end
		Q1_NORM			 : 	n_state =	Q1_NORM_TMP ;
		Q1_NORM_TMP     : 	n_state =	Q1_NORM_1   ;
		Q1_NORM_1       : 	n_state =	Q2_NORM_0   ;
		Q2_NORM_0       : 	begin
										if(div_end)
											n_state =	Q2_NORM;
										else
											n_state =	Q2_NORM_0;
									end
		Q2_NORM			 : 	n_state =	Q2_NORM_TMP ;
		Q2_NORM_TMP     : 	n_state =	Q2_NORM_1   ;
		Q2_NORM_1       : 	n_state =	Q3_NORM_0   ;
		Q3_NORM_0       : 	begin
										if(div_end)
											n_state =	Q3_NORM;
										else
											n_state =	Q3_NORM_0;
									end
		Q3_NORM			 : 	n_state =	Q3_NORM_TMP ;
		Q3_NORM_TMP     : 	n_state =	Q3_NORM_1   ;
		Q3_NORM_1       : 	n_state =	LAST_0      ;
		LAST_0          : 	begin
										if(div_end)
											n_state =	LAST;
										else
											n_state =	LAST_0;
									end
		LAST            : 	n_state =	LAST_TMP    ;
		LAST_TMP        : 	n_state =	END         ;
		END             : 	n_state =	IDLE        ;
		default         : 	n_state =	IDLE        ;
	endcase
end

reg sclr, ce;
reg [31:0] in_q0_tmp, in_q1_tmp, in_q2_tmp, in_q3_tmp,
			  in_wx_tmp, in_wy_tmp, in_wz_tmp;
reg [31:0] out_q0_tmp, out_q1_tmp, out_q2_tmp, out_q3_tmp;
reg [31:0] norm_q0_tmp, norm_q1_tmp, norm_q2_tmp, norm_q3_tmp;
reg add_start, mult_start, sqrt_start, div_start, sub_start;
reg [31:0] mult_in_a, mult_in_b;
wire [31:0] mult_out;
reg [31:0] add_in_a, add_in_b;
wire [31:0] add_out;
reg [31:0] sqrt_in;
wire [31:0] sqrt_out;
reg [31:0] div_in_a, div_in_b;
wire [31:0] div_out;
reg [31:0] sub_in_a, sub_in_b;
wire [31:0] sub_out;

always @ (posedge clk or negedge rst) begin
	if(!rst) begin
			in_q0_tmp <= 32'h0;
			in_q1_tmp <= 32'h0;
			in_q2_tmp <= 32'h0;
			in_q3_tmp <= 32'h0;
			in_wx_tmp <= 32'h0;
			in_wy_tmp <= 32'h0;
			in_wz_tmp <= 32'h0;
			out_q0_tmp <= 32'h0;
			out_q1_tmp <= 32'h0;
			out_q2_tmp <= 32'h0;
			out_q3_tmp <= 32'h0;
			norm_q0_tmp <= 32'h0;
			norm_q1_tmp <= 32'h0;
			norm_q2_tmp <= 32'h0;
			norm_q3_tmp <= 32'h0;
			out_q0 <= 32'h0;	
			out_q1 <= 32'h0;	
			out_q2 <= 32'h0;	
			out_q3 <= 32'h0;	
			out_quat_finish <= 1'b0;
			mult_in_a <= 32'h0;
			mult_in_b <= 32'h0;
			add_in_a <= 32'h0;
			add_in_b <= 32'h0;
			div_in_a <= 32'h0;
			div_in_b <= 32'h0;
			sqrt_in <= 32'h0;
			sub_in_a <= 32'h0;
			sub_in_b <= 32'h0;
			add_start <= 1'b0;
			mult_start <= 1'b0;
			sqrt_start <= 1'b0;
			div_start <= 1'b0;
			sub_start <= 1'b0;
			sclr <= 1'b1;
			ce <= 1'b0;
		end
	else begin
			case(c_state)
				IDLE			:	begin
										if(in_quat_en) begin
												in_q0_tmp <= in_q0;
												in_q1_tmp <= in_q1;
												in_q2_tmp <= in_q2;
												in_q3_tmp <= in_q3;
												in_wx_tmp <= in_wx;
												in_wy_tmp <= in_wy;
												in_wz_tmp <= in_wz;
												mult_in_a <= 32'h0;
												mult_in_b <= 32'h0;
												add_in_a <= 32'h0;
												add_in_b <= 32'h0;
												div_in_a <= 32'h0;
												div_in_b <= 32'h0;
												sqrt_in <= 32'h0;
												sub_in_a <= 32'h0;
												sub_in_b <= 32'h0;
												sclr <= 1'b1;
												ce <= 1'b0;
											end
											else begin
												mult_in_a <= 32'h0;
												mult_in_b <= 32'h0;
												add_in_a <= 32'h0;
												add_in_b <= 32'h0;
												div_in_a <= 32'h0;
												div_in_b <= 32'h0;
												sqrt_in <= 32'h0;
												sub_in_a <= 32'h0;
												sub_in_b <= 32'h0;
												sclr <= 1'b1;
												ce <= 1'b0;
										end
									end					
				START			:	begin
										out_quat_finish <= 1'b0;
										sclr <= 1'b0;
										ce <= 1'b1;						
									end
				Q0_1  		:	begin
										mult_in_a <= in_q1_tmp;		// q1
										mult_in_b <= in_wx_tmp;		//	wx							
									end
				Q0_1_1		:	begin
										mult_start <= 1'b1;						
									end
				Q0_2_0		:	begin
										mult_start <= 1'b0;						
									end
				Q0_2			:	begin
										add_in_a <= mult_out;		// q1*wx
										mult_in_a <= in_q2_tmp;		// q2
										mult_in_b <= in_wy_tmp;		// wy
									end								
				Q0_2_1		:	begin
										mult_start <= 1'b1;						
									end
				Q0_3_0		:	begin
										mult_start <= 1'b0;						
									end
				Q0_3			:	begin
										add_in_b <= mult_out;		// q2*wy
										mult_in_a <= in_q3_tmp;		// q3
										mult_in_b <= in_wz_tmp;		// wz
									end					
				Q0_3_1		:	begin
										mult_start <= 1'b1;
										add_start <= 1'b1;
									end
				Q0_4_0		:	begin
										mult_start <= 1'b0;	
										add_start <= 1'b0;
									end
				Q0_4			:	begin
										add_in_a <= add_out;			// q1*wx + q2*wy
										add_in_b <= mult_out;		// q3*wz
									end					
				Q0_4_1		:	begin
										add_start <= 1'b1;
									end
				Q0_5_0		:	begin	
										add_start <= 1'b0;
									end
				Q0_5			:	begin
										mult_in_a <= HPERIOD;		// 0.5*T
										mult_in_b <= add_out;		// q1*wx + q2*wy + q3*wz
									end					
				Q0_5_1		:	begin
										mult_start <= 1'b1;
									end
				Q1_1_0		:	begin
										mult_start <= 1'b0;	
									end
				Q1_1  		:	begin
										sub_in_a <= in_q0_tmp;		// q0
										sub_in_b <= mult_out;		// 0.5*(q1*wx + q2*wy + q3*wz)*T
										mult_in_a <= in_q0_tmp;		// q0
										mult_in_b <= in_wx_tmp;		//	wx							
									end
				Q1_1_1		:	begin
										mult_start <= 1'b1;
										sub_start <= 1'b1;
									end
				Q1_2_0		:	begin
										sub_start <= 1'b0;
										mult_start <= 1'b0;	
									end
				Q1_2			:	begin
										out_q0_tmp <= sub_out;		// q0 = q0 - 0.5*(q1*wx + q2*wy + q3*wz)*T
										add_in_a <= mult_out;		// q0*wx
										mult_in_a <= in_q2_tmp;		// q2
										mult_in_b <= in_wy_tmp;		// wz
									end								
				Q1_2_1		:	begin
										mult_start <= 1'b1;
									end
				Q1_3_0		:	begin
										mult_start <= 1'b0;	
									end
				Q1_3			:	begin
										add_in_b <= mult_out;		// q2*wz
										mult_in_a <= in_q3_tmp;		// q3
										mult_in_b <= in_wy_tmp;		// wy
									end					
				Q1_3_1		:	begin
										mult_start <= 1'b1;
										add_start <= 1'b1;
									end
				Q1_4_0		:	begin
										add_start <= 1'b0;
										mult_start <= 1'b0;	
									end
				Q1_4			:	begin
										sub_in_a <= add_out;			// q0*wx + q2*wz
										sub_in_b <= mult_out;		// q3*wy
									end					
				Q1_4_1		:	begin
										sub_start <= 1'b1;
									end
				Q1_5_0		:	begin
										sub_start <= 1'b0;
									end
				Q1_5			:	begin
										mult_in_a <= HPERIOD;		// 0.5*T
										mult_in_b <= sub_out;		// q0*wx + q2*wz - q3*wy
									end					
				Q1_5_1		:	begin
										mult_start <= 1'b1;
									end
				Q2_1_0		:	begin
										mult_start <= 1'b0;	
									end
				Q2_1  		:	begin
										add_in_a <= in_q1_tmp;		// q1
										add_in_b <= mult_out;		// 0.5*(q0*wx + q2*wz - q3*wy)*T
										mult_in_a <= in_q0_tmp;		// q0
										mult_in_b <= in_wy_tmp;		//	wy							
									end
				Q2_1_1		:	begin
										mult_start <= 1'b1;
										add_start <= 1'b1;
									end
				Q2_2_0		:	begin
										add_start <= 1'b0;
										mult_start <= 1'b0;	
									end
				Q2_2			:	begin
										out_q1_tmp <= add_out;		// q1 = q1 + 0.5*(q0*wx + q2*wz - q3*wy)*T
										sub_in_a <= mult_out;		// q0*wy
										mult_in_a <= in_q1_tmp;		// q1
										mult_in_b <= in_wz_tmp;		// wz
									end								
				Q2_2_1		:	begin
										mult_start <= 1'b1;
									end
				Q2_3_0		:	begin
										mult_start <= 1'b0;	
									end
				Q2_3			:	begin
										sub_in_b <= mult_out;		// q1*wz
										mult_in_a <= in_q3_tmp;		// q3
										mult_in_b <= in_wx_tmp;		// wx
									end					
				Q2_3_1		:	begin
										mult_start <= 1'b1;
										sub_start <= 1'b1;
									end
				Q2_4_0		:	begin
										sub_start <= 1'b0;
										mult_start <= 1'b0;	
									end
				Q2_4			:	begin
										add_in_a <= sub_out;			// q0*wy - q1*wz
										add_in_b <= mult_out;		// q3*wx
									end					
				Q2_4_1		:	begin
										add_start <= 1'b1;
									end
				Q2_5_0		:	begin
										add_start <= 1'b0;	
									end
				Q2_5			:	begin
										mult_in_a <= HPERIOD;		// 0.5*T
										mult_in_b <= add_out;		// q0*wy - q1*wz + q3*wx
									end					
				Q2_5_1		:	begin
										mult_start <= 1'b1;
									end
				Q3_1_0		:	begin
										mult_start <= 1'b0;	
									end
				Q3_1  		:	begin
										add_in_a <= in_q2_tmp;		// q2
										add_in_b <= mult_out;		// 0.5*(q0*wy - q1*wz + q3*wx)*T
										mult_in_a <= in_q0_tmp;		// q0
										mult_in_b <= in_wz_tmp;		//	wz					
									end
				Q3_1_1		:	begin
										mult_start <= 1'b1;
										add_start <= 1'b1;
									end
				Q3_2_0		:	begin
										add_start <= 1'b0;
										mult_start <= 1'b0;	
									end
				Q3_2			:	begin
										out_q2_tmp <= add_out;		// q2 = q2 + 0.5*(q0*wy - q1*wz + q3*wx)*T
										add_in_a <= mult_out;		// q0*wz
										mult_in_a <= in_q1_tmp;		// q1
										mult_in_b <= in_wy_tmp;		// wy
									end								
				Q3_2_1		:	begin
										mult_start <= 1'b1;
									end
				Q3_3_0		:	begin
										mult_start <= 1'b0;	
									end
				Q3_3			:	begin
										add_in_b <= mult_out;		// q1*wy
										mult_in_a <= in_q3_tmp;		// q2
										mult_in_b <= in_wx_tmp;		// wx
									end					
				Q3_3_1		:	begin
										add_start <= 1'b1;
										mult_start <= 1'b1;
									end
				Q3_4_0		:	begin
										add_start <= 1'b0;
										mult_start <= 1'b0;										
									end
				Q3_4			:	begin
										sub_in_a <= add_out;			// q0*wz + q1*wy
										sub_in_b <= mult_out;		// q2*wx
									end					
				Q3_4_1		:	begin
										sub_start <= 1'b1;
									end
				Q3_5_0		:	begin
										sub_start <= 1'b0;
									end
				Q3_5			:	begin
										mult_in_a <= HPERIOD;		// 0.5*T
										mult_in_b <= sub_out;		// q0*wz + q1*wy - q2*wx
									end
				Q3_5_1		:	begin
										mult_start <= 1'b1;
									end
				Q0_SQR_0		:	begin
										mult_start <= 1'b0;	
									end
				Q0_SQR		:  begin
										add_in_a <= in_q3_tmp;		// q3
										add_in_b <= mult_out;		// 0.5*(q0*wz + q1*wy - q2*wx)*T
										mult_in_a <= out_q0_tmp;	// q0
										mult_in_b <= out_q0_tmp;	// q0
									end
				Q0_SQR_1		:	begin
										add_start <= 1'b1;
										mult_start <= 1'b1;
									end
				Q1_SQR_0		:	begin
										add_start <= 1'b0;
										mult_start <= 1'b0;	
									end
				Q1_SQR		:  begin
										out_q3_tmp <= add_out;		// q3 = q3 + 0.5*(q0*wz + q1*wy - q2*wx)*T
										add_in_a <= mult_out;		// q0^2
										mult_in_a <= out_q1_tmp;	// q1
										mult_in_b <= out_q1_tmp;	// q1
									end					
				Q1_SQR_1		:	begin
										mult_start <= 1'b1;
									end
				Q2_SQR_0		:	begin
										mult_start <= 1'b0;	
									end
				Q2_SQR		:	begin					
										add_in_b <= mult_out;		// q1^2
										mult_in_a <= out_q2_tmp;	// q2
										mult_in_b <= out_q2_tmp;	// q2
									end
				Q2_SQR_1		:	begin
										add_start <= 1'b1;
										mult_start <= 1'b1;
									end
				Q3_SQR_0		:	begin
										add_start <= 1'b0;
										mult_start <= 1'b0;	
									end
				Q3_SQR		:	begin					
										add_in_a <= add_out;			// q0^2 + q1^2
										add_in_b <= mult_out;		// q2^2
										mult_in_a <= out_q3_tmp;	// q3
										mult_in_b <= out_q3_tmp;	// q3
									end					
				Q3_SQR_1		:	begin
										add_start <= 1'b1;
										mult_start <= 1'b1;
									end
				Q_ADD_0		:	begin
										add_start <= 1'b0;
										mult_start <= 1'b0;	
									end
				Q_ADD			:	begin					
										add_in_a <= add_out;			// q0^2 + q1^2 + q2^2
										add_in_b <= mult_out;		// q3^2
									end					
				Q_ADD_1		:	begin
										add_start <= 1'b1;
									end
				Q_SQRT_0		:	begin
										add_start <= 1'b0;	
									end
				Q_SQRT		:	begin					
										sqrt_in <= add_out;			// q0^2 + q1^2 + q2^2 + q3^2
									end
				Q_SQRT_1		:	begin
										sqrt_start <= 1'b1;
									end
				Q0_NORM_0	:	begin
										sqrt_start <= 1'b0;	
									end
				Q0_NORM		:	begin					
										div_in_a <= out_q0_tmp;		// q0
										div_in_b <= sqrt_out;		// sqrt(q0^2 + q1^2 + q2^2 + q3^2)
									end
				Q0_NORM_1	:	begin
										div_start <= 1'b1;
									end
				Q1_NORM_0	:	begin
										div_start <= 1'b0;	
									end
				Q1_NORM		:	begin	
										norm_q0_tmp <= div_out;		//	q0/sqrt(q0^2 + q1^2 + q2^2 + q3^2)
										div_in_a <= out_q1_tmp;		// q1
									end					
				Q1_NORM_1	:	begin
										div_start <= 1'b1;
									end
				Q2_NORM_0	:	begin
										div_start <= 1'b0;	
									end
				Q2_NORM		:	begin					
										norm_q1_tmp <= div_out;		//	q1/sqrt(q0^2 + q1^2 + q2^2 + q3^2)
										div_in_a <= out_q2_tmp;		// q2
									end					
				Q2_NORM_1	:	begin
										div_start <= 1'b1;
									end
				Q3_NORM_0	:	begin
										div_start <= 1'b0;	
									end
				Q3_NORM		:	begin					
										norm_q2_tmp <= div_out;		//	q2/sqrt(q0^2 + q1^2 + q2^2 + q3^2)
										div_in_a <= out_q3_tmp;		// q3
									end					
				Q3_NORM_1	:	begin
										div_start <= 1'b1;
									end
				LAST_0		:	begin
										div_start <= 1'b0;	
									end
				LAST			:	begin					
										norm_q3_tmp <= div_out;		// q3/sqrt(q0^2 + q1^2 + q2^2 + q3^2)
									end
				END			:	begin					
										out_q0 <= norm_q0_tmp;			
										out_q1 <= norm_q1_tmp;			
										out_q2 <= norm_q2_tmp;			
										out_q3 <= norm_q3_tmp;			
										out_quat_finish <= 1'b1;									
									end
				default		:  begin
										mult_in_a <= mult_in_a;
										mult_in_b <= mult_in_b;
										add_in_a <= add_in_a;
										add_in_b <= add_in_b;
										sqrt_in <= sqrt_in;
										div_in_a <= div_in_a;
										div_in_b <= div_in_b;
										sub_in_a <= sub_in_a;
										sub_in_b <= sub_in_b;
										add_start <= add_start; 
										mult_start <= mult_start;
										sqrt_start <= sqrt_start;
										div_start <= div_start;
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

sqrt u3 (
  .a(sqrt_in), // input [31 : 0] a
  .operation_nd(sqrt_start), // input operation_nd
  .clk(clk), // input clk
  .sclr(sclr), // input sclr
  .ce(ce), // input ce
  .result(sqrt_out), // output [31 : 0] result
  .rdy(sqrt_end) // output rdy
);

div u4 (
  .a(div_in_a), // input [31 : 0] a
  .b(div_in_b), // input [31 : 0] b
  .operation_nd(div_start), // input operation_nd
  .clk(clk), // input clk
  .sclr(sclr), // input sclr
  .ce(ce), // input ce
  .result(div_out), // output [31 : 0] result
  .rdy(div_end) // output rdy
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
