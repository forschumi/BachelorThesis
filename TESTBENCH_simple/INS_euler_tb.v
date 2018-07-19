`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:53:37 04/26/2015 
// Design Name: 
// Module Name:    INS_euler_tb 
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
//`include "F:/quadrotor/prj_INS/qrc_32/src/INS_euler.v"

module INS_euler_tb;

reg clk, rst, in_euler_en;
reg [31:0] in_c11, in_c12, in_c13, in_c23, in_c33;

parameter t = 20;

initial begin
	clk = 1'b1;
	rst = 1'b1;
	in_c11 = 32'h0;
	in_c12 = 32'h0;
	in_c13 = 32'h0;
	in_c23 = 32'h0;
	in_c33 = 32'h0;
	in_euler_en = 'b0;
end

always #(t/2) clk = ~clk;

initial begin
	#(t*8)
		rst = 1'b0;
	#(t*2)
		rst = 1'b1;
	#(t*5)
		in_c11 = 32'h40000000;
		in_c12 = 32'hBF800000;
		in_c13 = 32'hBF000000;
		in_c23 = 32'hC0000000;
		in_c33 = 32'h3F800000;
	#t
		in_euler_en = 1'b1;
	#(t)
		in_euler_en = 1'b0;
/*	#(t*500)
		in_c11 = 32'h3F800000;
		in_c12 = 32'hBFDDB3D7;
		in_c13 = 32'h3F400000;
		in_c23 = 32'h3FDDB3D7;
		in_c33 = 32'h3F800000;
	#t
		in_euler_en = 1'b1;
	#t
		in_euler_en = 1'b0;*/
end

/*wire [31:0] out_pitch, out_roll, out_yaw;
wire out_euler_finish;
INS_euler u1(
	.clk(clk)										,		//时钟信号
	.rst(rst)										,		//复位信号，低电平有效
	.in_euler_en(in_euler_en)					,		//姿态角解算使能信号
	.in_c11(in_c11)								,		//当前更新的C11
	.in_c12(in_c12)								,		//当前更新的C12
	.in_c13(in_c13)								,		//当前更新的C13
	.in_c23(in_c23)								,		//当前更新的C23
	.in_c33(in_c33)								,		//当前更新的C33
	.out_pitch(out_pitch)						,     //本次解算的俯仰角
	.out_roll(out_roll)							,     //本次解算的横滚角
	.out_yaw(out_yaw)								,     //本次解算的航向角
	.out_euler_finish(out_euler_finish)				//姿态角解算完毕，高电平有效
);*/
//---------------------------------------------------
reg [31:0] out_pitch, out_roll, out_yaw;
reg out_euler_finish;
parameter 		IDLE					=	7'd0,
               START					=	7'd1,
               EULER_1				=	7'd2,
               EULER_1_TMP			=	7'd3,
               EULER_1_1			=	7'd4,
//               EULER_1_1_TMP		=	7'd5,
               EULER_2_0			=	7'd6,
//               EULER_2_0_TMP	   =	7'd7,
               EULER_2			   =	7'd8,
               EULER_2_TMP		   =	7'd9,
               EULER_2_1		   =	7'd10,
//               EULER_2_1_TMP	   =	7'd11,
               EULER_3_0		   =	7'd12,
//               EULER_3_0_TMP	   =	7'd13,
               EULER_3			   =	7'd14,
               EULER_3_TMP		   =	7'd15,
               EULER_3_1		   =	7'd16,
//               EULER_3_1_TMP	   =	7'd17,
               EULER_4_0		   =	7'd18,
//               EULER_4_0_TMP	   =	7'd19,
               EULER_4           =	7'd20,
               EULER_4_TMP	   	=	7'd21,
               EULER_4_1		   =	7'd22,
//               EULER_4_1_TMP	   =	7'd23,
               EULER_5_0		   =	7'd24,
//               EULER_5_0_TMP	   =	7'd25,
               EULER_5        	=	7'd26,
               EULER_5_TMP	   	=	7'd27,
               EULER_5_1		   =	7'd28,
//               EULER_5_1_TMP	   =	7'd29,
               EULER_6_0		   =	7'd30,
//               EULER_6_0_TMP	   =	7'd31,
               EULER_6        	=	7'd32,
               EULER_6_TMP	   	=	7'd33,
               EULER_6_1		   =	7'd34,
//               EULER_6_1_TMP		=	7'd35,
					EULER_7_0			=	7'd36,
//					EULER_7_0_TMP	   =	7'd37,
					EULER_7        	=	7'd38,
					EULER_7_TMP    	=	7'd39,
					EULER_7_1			=	7'd40,
//					EULER_7_1_TMP	   =	7'd41,
					EULER_8_0		   =	7'd42,
//					EULER_8_0_TMP	   =	7'd43,
					EULER_8        	=	7'd44,
					EULER_8_TMP	   	=	7'd45,
					EULER_8_1		   =	7'd46,
//					EULER_8_1_TMP	   =	7'd47,
					EULER_9_0		   =	7'd48,
//					EULER_9_0_TMP	   =	7'd49,
					EULER_9        	=	7'd50,
					EULER_9_TMP	   	=	7'd51,
					EULER_9_1		   =	7'd52,
//					EULER_9_1_TMP	   =	7'd53,
					EULER_10_0		   =	7'd54,
//					EULER_10_0_TMP	   =	7'd55,
					EULER_10       	=	7'd56,
					EULER_10_TMP   	=	7'd57,
					EULER_10_1		   =	7'd58,
//					EULER_10_1_TMP	   =	7'd59,
					EULER_11_0			=	7'd60,
//					EULER_11_0_TMP	   =	7'd61,
					EULER_11       	=	7'd62,
					EULER_11_TMP   	=	7'd63,
					EULER_11_1		   =	7'd64,
//					EULER_11_1_TMP	   =	7'd65,
					EULER_12_0		   =	7'd66,
//					EULER_12_0_TMP	   =	7'd67,
					EULER_12       	=	7'd68,
					EULER_12_TMP   	=	7'd69,
					EULER_12_1			=	7'd70,
//					EULER_12_1_TMP	   =	7'd71,
					EULER_13_0		   =	7'd72,
//					EULER_13_0_TMP	   =	7'd73,
					EULER_13       	=	7'd74,
					EULER_13_TMP   	=	7'd75,
					EULER_13_1		   =	7'd76,
//					EULER_13_1_TMP	   =	7'd77,
					EULER_14_0		   =	7'd78,
//					EULER_14_0_TMP	   =	7'd79,
					EULER_14       	=	7'd80,
					EULER_14_TMP   	=	7'd81,
					EULER_15       	=	7'd82,
					EULER_15_TMP   	=	7'd83,
					EULER_15_1		   =	7'd84,
//					EULER_15_1_TMP	   =	7'd85,
					EULER_16_0		   =	7'd86,
//					EULER_16_0_TMP	   =	7'd87,
					EULER_16       	=	7'd88,
					EULER_16_TMP   	=	7'd89,
					EULER_17				=	7'd90,
					EULER_17_TMP	   =	7'd91,
					EULER_17_1		   =	7'd92,
//					EULER_17_1_TMP	   =	7'd93,
					END_0		   		=	7'd94,
//					END_0_TMP	   	=	7'd95,
					END				   =	7'd96,
					END_TMP				=	7'd97,
					FINISH				=	7'd98;
					
reg [6:0] c_state, n_state;

always @ (posedge clk or negedge rst) begin
	if(!rst) begin
			c_state <= IDLE;
		end	
		else begin
			c_state <= n_state;
	end
end

wire add_end, mult_end, sqrt_end, div_end, sub_end, equl_end, less_end, atan_end;

always @ (c_state or in_euler_en or add_end or mult_end or sqrt_end or div_end or sub_end or equl_end or less_end or atan_end) begin
	case(c_state)
		IDLE				: 	begin
									if(in_euler_en) n_state = START;
									else n_state = IDLE;
								end				
		START				:  n_state = EULER_1;
		EULER_1			:  n_state = EULER_1_TMP;			
		EULER_1_TMP		:  n_state = EULER_1_1;	
		EULER_1_1		:  n_state = EULER_2_0;
//		EULER_1_1_TMP	:  n_state = EULER_2_0;
		EULER_2_0		:  begin
									if(sub_end)
										n_state = EULER_2;			
									else	
										n_state = EULER_2_0;
								end
//		EULER_2_0_TMP	:  n_state = EULER_2;
		EULER_2			:  n_state = EULER_2_TMP;			
		EULER_2_TMP		:  n_state = EULER_2_1;
		EULER_2_1		:  n_state = EULER_3_0;
//		EULER_2_1_TMP	:  n_state = EULER_3_0;
		EULER_3_0		:  begin
									if(sub_end)
										n_state = EULER_3;			
									else	
										n_state = EULER_3_0;
								end
//		EULER_3_0_TMP	:  n_state = EULER_3;
		EULER_3			:  n_state = EULER_3_TMP;			
		EULER_3_TMP		:  n_state = EULER_3_1; 
		EULER_3_1		:  n_state = EULER_4_0;
//		EULER_3_1_TMP	:  n_state = EULER_4_0;
		EULER_4_0		:  begin
									if(sqrt_end)
										n_state = EULER_4;			
									else	
										n_state = EULER_4_0;
								end
//		EULER_4_0_TMP	:  n_state = EULER_4;
		EULER_4        :  n_state = EULER_4_TMP;	      
		EULER_4_TMP	   :  n_state = EULER_4_1;  		
		EULER_4_1		:  n_state = EULER_5_0;
//		EULER_4_1_TMP	:  n_state = EULER_5_0;	
		EULER_5_0		:  begin
									if(atan_end)
										n_state = EULER_5;			
									else	
										n_state = EULER_5_0;	
								end
//		EULER_5_0_TMP	:  n_state = EULER_5;
		EULER_5        :  n_state = EULER_5_TMP;	      
		EULER_5_TMP	   :  n_state = EULER_5_1;           
		EULER_5_1		:  n_state = EULER_6_0;
//		EULER_5_1_TMP	:  n_state = EULER_6_0;	
		EULER_6_0		:  begin
									if(sqrt_end)
										n_state = EULER_6;			
									else	
										n_state = EULER_6_0;	
								end
//		EULER_6_0_TMP	:  n_state = EULER_6;
		EULER_6        :  n_state = EULER_6_TMP;       
		EULER_6_TMP	   :  n_state = EULER_6_1;          
		EULER_6_1		:  n_state = EULER_7_0;
//		EULER_6_1_TMP	:  n_state = EULER_7_0;	
		EULER_7_0		:  begin
									if(div_end)
										n_state = EULER_7;			
									else	
										n_state = EULER_7_0;	
								end
//		EULER_7_0_TMP	:  n_state = EULER_7;
		EULER_7        :  n_state = EULER_7_TMP;       
		EULER_7_TMP    :  n_state = EULER_7_1;           
		EULER_7_1		:  n_state = EULER_8_0;
//		EULER_7_1_TMP	:  n_state = EULER_8_0;	
		EULER_8_0		:  begin
									if(div_end)
										n_state = EULER_8;			
									else	
										n_state = EULER_8_0;	
								end
//		EULER_8_0_TMP	:  n_state = EULER_8;
		EULER_8        :  n_state = EULER_8_TMP;	      
		EULER_8_TMP	   :  n_state = EULER_8_1;           
		EULER_8_1		:  n_state = EULER_9_0;
//		EULER_8_1_TMP	:  n_state = EULER_9_0;	
		EULER_9_0		:  begin
									if(add_end)
										n_state = EULER_9;			
									else	
										n_state = EULER_9_0;	
								end
//		EULER_9_0_TMP	:  n_state = EULER_9;
		EULER_9        :  n_state = EULER_9_TMP;	      
		EULER_9_TMP	   :  n_state = EULER_9_1;          
		EULER_9_1		:  n_state = EULER_10_0;
//		EULER_9_1_TMP	:  n_state = EULER_10_0;
		EULER_10_0		:  begin
									if(sqrt_end)
										n_state = EULER_10;			
									else	
										n_state = EULER_10_0;
								end
//		EULER_10_0_TMP	:  n_state = EULER_10;
		EULER_10       :  n_state = EULER_10_TMP;      
		EULER_10_TMP   :  n_state = EULER_10_1;          
		EULER_10_1		:  n_state = EULER_11_0;
//		EULER_10_1_TMP	:  n_state = EULER_11_0;
		EULER_11_0		:  begin
									if(sqrt_end)
										n_state = EULER_11;			
									else	
										n_state = EULER_11_0;
								end
//		EULER_11_0_TMP	:  n_state = EULER_11;
		EULER_11       :  n_state = EULER_11_TMP;       
		EULER_11_TMP   :  n_state = EULER_11_1;          
		EULER_11_1		:  n_state = EULER_12_0;
//		EULER_11_1_TMP	:  n_state = EULER_12_0;
		EULER_12_0		:  begin
									if(div_end)
										n_state = EULER_12;			
									else	
										n_state = EULER_12_0;
								end
//		EULER_12_0_TMP	:  n_state = EULER_12;
		EULER_12       :  n_state = EULER_12_TMP;      
		EULER_12_TMP   :  n_state = EULER_12_1;          
		EULER_12_1		:  n_state = EULER_13_0;
//		EULER_12_1_TMP	:  n_state = EULER_13_0;	
		EULER_13_0		:  begin
									if(div_end)
										n_state = EULER_13;			
									else	
										n_state = EULER_13_0;	
								end
//		EULER_13_0_TMP	:  n_state = EULER_13;
		EULER_13       :  n_state = EULER_13_TMP;      
		EULER_13_TMP   :  n_state = EULER_13_1;          
		EULER_13_1		:  n_state = EULER_14_0;
//		EULER_13_1_TMP	:  n_state = EULER_14_0;
		EULER_14_0		:  begin
									if(atan_end)
										n_state = EULER_14;			
									else	
										n_state = EULER_14_0;
								end
//		EULER_14_0_TMP	:  n_state = EULER_14;
		EULER_14       :  n_state = EULER_14_TMP;        
		EULER_14_TMP   :  n_state = EULER_15;         		
		EULER_15       :  n_state = EULER_15_TMP;      
		EULER_15_TMP   :  n_state = EULER_15_1;          
		EULER_15_1		:  n_state = EULER_16_0;
//		EULER_15_1_TMP	:  n_state = EULER_16_0;
		EULER_16_0		:  begin
									if(add_end)
										n_state = EULER_16;			
									else	
										n_state = EULER_16_0;
								end
//		EULER_16_0_TMP	:  n_state = EULER_16;
		EULER_16       :  n_state = EULER_16_TMP;      
		EULER_16_TMP   :  n_state = EULER_17;              
		EULER_17			:  n_state = EULER_17_TMP;
		EULER_17_TMP	:  n_state = EULER_17_1;
		EULER_17_1		:  n_state = END_0;
//		EULER_17_1_TMP	:  n_state = END_0;	
		END_0				:  begin
									if(mult_end)
										n_state = END;			
									else	
										n_state = END_0;	
								end							
//		END_0_TMP			:  n_state = END;				   
		END				:  n_state = END_TMP;
		END_TMP			:  n_state = FINISH;
		FINISH			:  n_state = IDLE;
		default			:  n_state = IDLE;
	endcase
end

parameter ZERO	= 32'h0,
			 ONE = 32'h3F800000,
			 RAD2DEG = 32'h42652EE1,
			 PI360 = 32'h40C90FDA,
			 PI180 = 32'h40490FDA,
			 PI270 = 32'h4096CBE4,
			 PI90 = 32'h3FC90FDA,
			 PI90n = 32'hBFC90FDA;

reg sclr, ce;
reg [31:0] in_c11_tmp, in_c12_tmp, in_c13_tmp,
			  in_c23_tmp, in_c33_tmp;
reg [31:0] norm_c11_tmp, norm_c12_tmp, norm_c23_tmp, norm_c33_tmp;			  
reg [31:0] out_pitch_tmp, out_roll_tmp, out_yaw_tmp;
reg [31:0] out_pitch_deg, out_roll_deg;
reg [31:0] out_roll_main, out_yaw_main;
reg equl_c33_tmp, sign_c23_tmp, equl_c11_tmp, sign_c12_tmp, sign_yaw_tmp;
reg add_start, mult_start, sqrt_start, div_start, sub_start, equl_start, less_start, atan_start;
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
reg [31:0] atan_in_a, atan_in_b;
wire [31:0] atan_out;
reg [31:0] equl_in, less_in, equl_in0,less_in0;
wire equl_out, less_out;

always @ (posedge clk or negedge rst) begin
	if(!rst) begin
			in_c11_tmp <= 32'h0;
			in_c12_tmp <= 32'h0;
			in_c13_tmp <= 32'h0;
			in_c23_tmp <= 32'h0;
			in_c33_tmp <= 32'h0;
			norm_c11_tmp <= 32'h0;
			norm_c12_tmp <= 32'h0;
			norm_c23_tmp <= 32'h0;
			norm_c33_tmp <= 32'h0;	
			equl_c33_tmp <= 1'b0;
			sign_c23_tmp <= 1'b0;
			equl_c11_tmp <= 1'b0;
			sign_c12_tmp <= 1'b0;
			sign_yaw_tmp <= 1'b0;
			out_pitch_tmp <= 32'h0;
			out_roll_tmp <= 32'h0;
			out_yaw_tmp <= 32'h0;
			out_pitch_deg <= 32'h0;
			out_roll_deg <= 32'h0;
			out_roll_main <= 32'h0;
			out_yaw_main <= 32'h0;
			out_pitch <= 32'h0; 
			out_roll <= 32'h0; 
			out_yaw <= 32'h0;
			out_euler_finish <= 1'b0;
			mult_in_a <= 32'h0;
			mult_in_b <= 32'h0;
			add_in_a <= 32'h0;
			add_in_b <= 32'h0;
			div_in_a <= 32'h0;
			div_in_b <= 32'h0;
			sqrt_in <= 32'h0;
			sub_in_a <= 32'h0;
			sub_in_b <= 32'h0;
			atan_in_a <= 32'h0;
			atan_in_b <= 32'h0;
			equl_in <= 32'h0;
			less_in <= 32'h0;
			equl_in0<= 32'h0;
			less_in0<= 32'h0;
			add_start <= 1'b0;
			mult_start <= 1'b0;
			sqrt_start <= 1'b0;
			div_start <= 1'b0;
			sub_start <= 1'b0;
			equl_start <= 1'b0;
			less_start <= 1'b0;
			atan_start <= 1'b0;
			sclr <= 1'b1;
			ce <= 1'b0;
		end
	else begin
			case(c_state)
				IDLE			:	begin
										if(in_euler_en) begin
												in_c11_tmp <= in_c11;
												in_c12_tmp <= in_c12;
												in_c13_tmp <= in_c13;
												in_c23_tmp <= in_c23;
												in_c33_tmp <= in_c33;
												mult_in_a <= 32'h0;
												mult_in_b <= 32'h0;
												add_in_a <= 32'h0;
												add_in_b <= 32'h0;
												div_in_a <= 32'h0;
												div_in_b <= 32'h0;
												sqrt_in <= 32'h0;
												sub_in_a <= 32'h0;
												sub_in_b <= 32'h0;
												atan_in_a <= 32'h0;
												atan_in_b <= 32'h0;
												equl_in <= 32'h0;
												less_in <= 32'h0;
												equl_in0<= 32'h0;
												less_in0<= 32'h0;
												add_start <= 1'b0;
												mult_start <= 1'b0;
												sqrt_start <= 1'b0;
												div_start <= 1'b0;
												sub_start <= 1'b0;
												equl_start <= 1'b0;
												less_start <= 1'b0;
												atan_start <= 1'b0;
												out_euler_finish <= 1'b0;
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
												atan_in_a <= 32'h0;
												atan_in_b <= 32'h0;
												equl_in <= 32'h0;
												less_in <= 32'h0;
												equl_in0<= 32'h0;
												less_in0<= 32'h0;
												add_start <= 1'b0;
												mult_start <= 1'b0;
												sqrt_start <= 1'b0;
												div_start <= 1'b0;
												sub_start <= 1'b0;
												equl_start <= 1'b0;
												less_start <= 1'b0;
												atan_start <= 1'b0;
												out_euler_finish <= out_euler_finish;
												sclr <= 1'b1;
												ce <= 1'b0;
										end
									end
				START			:	begin					
//										out_euler_finish <= 1'b0;
										sclr <= 1'b0;
										ce <= 1'b1;
									end
				EULER_1		:	begin					
										sub_in_a <= ZERO;					// 0
										sub_in_b <= in_c13_tmp;			// c13
										mult_in_a <= in_c13_tmp;		// c13
										mult_in_b <= in_c13_tmp;		// c13
									end
				EULER_1_1	:	begin					
										sub_start <= 1'b1;
										mult_start <= 1'b1;
									end
				EULER_2_0	:	begin					
										sub_start <= 1'b0;
										mult_start <= 1'b0;
									end
				EULER_2		:	begin					
										atan_in_b <= sub_out;			// -c13
										sub_in_a <= ONE;					// 1
										sub_in_b <= mult_out;			// c13^2
										mult_in_a <= in_c23_tmp;		// c23
										mult_in_b <= in_c23_tmp;		// c23
									end
				EULER_2_1	:	begin					
										sub_start <= 1'b1;
										mult_start <= 1'b1;
									end
				EULER_3_0	:	begin					
										sub_start <= 1'b0;
										mult_start <= 1'b0;
									end
				EULER_3		:	begin					
										sqrt_in <= sub_out;				// 1 - c13^2
										add_in_a <= mult_out;			// c23^2
										mult_in_a <= in_c33_tmp;		// c33
										mult_in_b <= in_c33_tmp;		// c33
									end
				EULER_3_1	:	begin					
										sqrt_start <= 1'b1;
										mult_start <= 1'b1;
									end
				EULER_4_0	:	begin					
										sqrt_start <= 1'b0;
										mult_start <= 1'b0;
									end
				EULER_4		:	begin					
										atan_in_a <=sqrt_out;			// sqrt(1 - c13^2)
										add_in_b <= mult_out;			// c33^2
									end
				EULER_4_1	:	begin					
										add_start <= 1'b1;
										atan_start <= 1'b1;
									end
				EULER_5_0	:	begin					
										add_start <= 1'b0;
										atan_start <= 1'b0;
									end
				EULER_5		:	begin
										out_pitch_tmp <= atan_out;		// atan[-c13/sqrt(1 - c13^2)]
										sqrt_in <= add_out;				// c23^2 + c33^2
										mult_in_a <= in_c11_tmp;		// c11
										mult_in_b <= in_c11_tmp;		// c11
									end
				EULER_5_1	:	begin					
										sqrt_start <= 1'b1;
									end
				EULER_6_0	:	begin					
										sqrt_start  <= 1'b0;
									end
				EULER_6		:	begin
										div_in_a <= in_c23_tmp;			// c23
										div_in_b <= sqrt_out;			// sqrt(c23^2 + c33^2)										
									end					
				EULER_6_1	:	begin					
										mult_start <= 1'b1;
										div_start <= 1'b1;
									end
				EULER_7_0	:	begin					
										mult_start <= 1'b0;
										div_start <= 1'b0;
									end
				EULER_7		:	begin										
										norm_c23_tmp <= div_out;		// c23/sqrt(c23^2 + c33^2)
										add_in_a <= mult_out;			// c11^2
										mult_in_a <= in_c12_tmp;		// c12
										mult_in_b <= in_c12_tmp;		// c12 
										div_in_a <= in_c33_tmp;			// c33
										div_in_b <= sqrt_out;			// sqrt(c23^2 + c33^2)
									end					
				EULER_7_1	:	begin					
										mult_start <= 1'b1;
										div_start <= 1'b1;
									end
				EULER_8_0	:	begin					
										mult_start <= 1'b0;
										div_start <= 1'b0;
									end
				EULER_8		:	begin					
										norm_c33_tmp <= div_out;		// c33/sqrt(c23^2 + c33^2)
										add_in_b <= mult_out;			// c12^2	
										mult_in_a <= out_pitch_tmp;	// pitch
										mult_in_b <= RAD2DEG;			// 180/pi
									end									
				EULER_8_1	:	begin					
										mult_start <= 1'b1;
										add_start <= 1'b1;
									end
				EULER_9_0	:	begin					
										mult_start <= 1'b0;
										add_start <= 1'b0;
									end
				EULER_9		:	begin					
										out_pitch_deg <= mult_out;		//
										sqrt_in <= add_out;				// c11^2 + c12^2
										equl_in <= in_c33_tmp;			// c33
										less_in <= in_c23_tmp;			// c23
										atan_in_b <= norm_c23_tmp;		// c23
										atan_in_a <= norm_c33_tmp;		// c33
									end									
				EULER_9_1	:	begin					
										equl_start <= 1'b1;
										less_start <= 1'b1;
										sqrt_start <= 1'b1;									
									end
				EULER_10_0	:	begin					
										equl_start <= 1'b0;
										less_start <= 1'b0;
										sqrt_start <= 1'b0;									
									end
				EULER_10		:	begin	
										div_in_a <= in_c12_tmp;			// c12
										div_in_b <= sqrt_out;			// sqrt(c11^2 + c12^2)
										equl_c33_tmp <= equl_out;		// c33=0 ? 1 : 0
										sign_c23_tmp <= less_out;		// c23<0 ? 1 : 0
									end
				EULER_10_1	:	begin					
										div_start <= 1'b1;
										sqrt_start <= 1'b1;
										atan_start <= 1'b1;
									end
				EULER_11_0	:	begin					
										div_start <= 1'b0;
										sqrt_start <= 1'b0;
										atan_start <= 1'b0;
									end
				EULER_11		:	begin	
										norm_c12_tmp <= div_out;		// c12/sqrt(c11^2 + c12^2)
										div_in_a <= in_c11_tmp;			// c11
										div_in_b <= sqrt_out;			// sqrt(c11^2 + c12^2)
										equl_in <= in_c11_tmp;			// c11
										less_in <= in_c12_tmp;			// c12
										
									end
				EULER_11_1	:	begin					
										div_start <= 1'b1;
										equl_start <= 1'b1;
										less_start <= 1'b1;
									end
				EULER_12_0	:	begin					
										div_start <= 1'b0;
										equl_start <= 1'b0;
										less_start <= 1'b0;
									end
				EULER_12		:	begin										
										norm_c11_tmp <= div_out;		// c11/sqrt(c11^2 + c12^2)
										equl_c11_tmp <= equl_out;		// c11=0 ? 1 : 0
										sign_c12_tmp <= less_out;		// c12<0 ? 1 : 0
										div_in_a <= norm_c12_tmp;		// c12
										div_in_b <= div_out;				// c11
										atan_in_a <= div_out;			// c11
										atan_in_b <= norm_c12_tmp;		// c12
										out_roll_main <= atan_out;		// atan(c23/c33)
									end
				EULER_12_1	:	begin					
										div_start <= 1'b1;										
  								   end
				EULER_13_0	:	begin					
										div_start <= 1'b0;									
									end
				EULER_13		:	begin					
										less_in <= div_out;				// c12/c11
										if((equl_c33_tmp) && (sign_c23_tmp)) // c33=0 && c23<0
											out_roll_tmp <= PI90n;		// roll = -90
										if((equl_c33_tmp) && (!sign_c23_tmp))// c33=0 && c23>=0 
											out_roll_tmp <= PI90;		// roll = 90
										else 									// c33 != 0
											out_roll_tmp <= out_roll_main;	
									end
				EULER_13_1	:	begin					
										less_start <= 1'b1;
										atan_start <= 1'b1;
									end
				EULER_14_0	:	begin					
										less_start <= 1'b0;
										atan_start <= 1'b0;
									end
				EULER_14		:	begin					
										out_yaw_main <= atan_out;		// atan(c12/c11)
										sign_yaw_tmp <= less_out;		// c12/c11<0 ? 1 : 0
									end
				EULER_15		:	begin										
										mult_in_a <= out_roll_tmp;		// pitch
										mult_in_b <= RAD2DEG;			// 180/pi
										add_in_a <= out_yaw_main;		// yaw
										add_in_b <= PI360;				// 360
									end
				EULER_15_1	:	begin					
										mult_start <= 1'b1;
										add_start <= 1'b1;
									end
				EULER_16_0	:	begin					
										mult_start <= 1'b0;
										add_start <= 1'b0;
									end
				EULER_16		:	begin					
										out_roll_deg <= mult_out;		// roll
										if(sign_yaw_tmp)					// c12/c11<0
											out_yaw_tmp <= add_out;		// yaw + 360
										else if((equl_c11_tmp) && (sign_c12_tmp))	// c11=0 && c12<0
											out_yaw_tmp <= PI270;		// 270
										else if((equl_c11_tmp) && (!sign_c12_tmp))// c11=0 && c12>=0
											out_yaw_tmp <= PI90;			// 90
										else 
											out_yaw_tmp <= out_yaw_main;		
									end				
				EULER_17		:	begin					
										mult_in_a <= out_yaw_tmp;		// yaw
										mult_in_b <= RAD2DEG;			// 180/pi		
									end	
				EULER_17_1	:	begin					
										mult_start <= 1'b1;
									end
				END_0		:	begin					
										mult_start <= 1'b0;
									end				
				END			:	begin
										out_pitch <= out_pitch_deg;
										out_roll <= out_roll_deg;
										out_yaw <= mult_out;
									end
				FINISH		:	out_euler_finish <= 1'b1;
				default		:  begin
										mult_in_a <= mult_in_a;
										mult_in_b <= mult_in_b;
										mult_start <= mult_start;
										add_in_a <= add_in_a;
										add_in_b <= add_in_b;
										add_start <= add_start;
										div_in_a <= div_in_a;
										div_in_b <= div_in_b;
										div_start <= div_start;
										sqrt_in <= sqrt_in;
										sqrt_start <= sqrt_start;
										sub_in_a <= sub_in_a;
										sub_in_b <= sub_in_b;
										sub_start <= sub_start;
										atan_in_a <= atan_in_a;
										atan_in_b <= atan_in_b;
										atan_start <= atan_start;
										equl_in <= equl_in;
										equl_in0<= equl_in0;
										equl_start <= equl_start;
										less_in <= less_in;
										less_in0<= less_in0;
										less_start <= less_start;
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

INS_atan u6(
	.clk(clk), // input clk
	.rst(rst), // input rst
	.en(atan_start), // input en
	.a(atan_in_a), // input [31 : 0] a
	.b(atan_in_b), // input [31 : 0] b
	.result(atan_out), // output [31 : 0] result
	.atan_finish(atan_end) // output atan_finish
);

equl u7 (
  .a(equl_in), // input [31 : 0] a
  .b(equl_in0), // input [31 : 0] b
  .operation_nd(equl_start), // input operation_nd
  .clk(clk), // input clk
  .sclr(sclr), // input sclr
  .ce(ce), // input ce
  .result(equl_out), // output [0 : 0] result
  .rdy(equl_end) // output rdy
);

less u8 (
  .a(less_in), // input [31 : 0] a
  .b(less_in0), // input [31 : 0] b
  .operation_nd(less_start), // input operation_nd
  .clk(clk), // input clk
  .sclr(sclr), // input sclr
  .ce(ce), // input ce
  .result(less_out), // output [0 : 0] result
  .rdy(less_end) // output rdy
);

endmodule

