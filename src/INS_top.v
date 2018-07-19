`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:16:11 04/21/2015 
// Design Name: 
// Module Name:    INS_top 
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
module INS_top(
	clk				,			//	input  clk
	rst				,			//	input  rst
	in_accx			,			//	input  [31 : 0] accx
	in_accy			,			//	input  [31 : 0] accy
	in_accz			,			//	input  [31 : 0] accz
	in_gyrox			,			//	input  [31 : 0] gyrox
	in_gyroy			,			//	input  [31 : 0] gyroy
	in_gyroz			,			//	input  [31 : 0] gyroz
	in_magx			,			//	input  [31 : 0] magx
	in_magy			,			//	input  [31 : 0] magy
	in_magz			,			//	input  [31 : 0] magz
	in_data_en		,			//	input  data_en
	out_pitch		,			//	output [31 : 0] pitch
	out_roll			,			//	output [31 : 0] roll
	out_yaw			,			//	output [31 : 0] yaw
	c_c11				, 			//	output [31 : 0] c11
	c_c12				, 			//	output [31 : 0] c12
	c_c13				,			//	output [31 : 0] c13
	c_c21				, 			//	output [31 : 0] c21
	c_c22				, 			//	output [31 : 0] c22
	c_c23				,			//	output [31 : 0] c23
	c_c31				, 			//	output [31 : 0] c31
	c_c32				, 			//	output [31 : 0] c32
	c_c33				,			//	output [31 : 0] c33
	out_INS_finish				// output INS_finish
);

input clk, rst, in_data_en;
input [31:0] in_accx, in_accy, in_accz;
input [31:0] in_gyrox, in_gyroy, in_gyroz;
input [31:0] in_magx, in_magy, in_magz;
output reg [31:0] out_pitch, out_roll, out_yaw;
output reg [31:0] c_c11, c_c12, c_c13,
						c_c21, c_c22, c_c23,
						c_c31, c_c32, c_c33;
output reg out_INS_finish;

wire acc_finish, mag_finish, gyro_finish, quat_finish, matx_finish, euler_finish;

parameter	IDLE					=		5'd0,
				INS_ACC_MAG_P		=		5'd1,
				INS_ACC_MAG			=		5'd2,
				INS_ACC_MAG_TMP	=		5'd3,
				INS_GYRO_P			=		5'd4,
				INS_GYRO				=		5'd5,
				INS_GYRO_TMP		=		5'd6,
				INS_QUAT_P			=		5'd7,
				INS_QUAT				=		5'd8,
				INS_QUAT_TMP		=		5'd9,
				INS_MATX_P			=		5'd10,
				INS_MATX				=		5'd11,
				INS_MATX_TMP		=		5'd12,
				INS_EULER_P			=		5'd13,
				INS_EULER			=		5'd14,
				INS_EULER_TMP		=		5'd15,
				LAST				   =		5'd16,
				LAST_TMP				=		5'd17,
				END	    			=		5'd18,
				END_TMP				=		5'd19,
				FINISH				=		5'd20;

reg [4:0] c_state, n_state;

always @ (posedge clk or negedge rst) begin
	if(!rst) begin
			c_state <= IDLE;
		end	
		else begin
			c_state <= n_state;
	end
end

always @ (c_state or in_data_en or acc_finish or mag_finish or gyro_finish or quat_finish or matx_finish or euler_finish) begin
	case(c_state)
		IDLE					:	begin
										if(in_data_en)
											n_state = INS_ACC_MAG_P;
										else
											n_state = IDLE;
									end
		INS_ACC_MAG_P		:	n_state = INS_ACC_MAG;							
		INS_ACC_MAG			:	n_state = INS_ACC_MAG_TMP;	
		INS_ACC_MAG_TMP	:	begin		
										if(acc_finish && mag_finish)
											n_state = INS_GYRO_P;
										else
											n_state = INS_ACC_MAG_TMP;
									end
		INS_GYRO_P			:	n_state = INS_GYRO;								
		INS_GYRO				:	n_state = INS_GYRO_TMP;
		INS_GYRO_TMP		:	begin		
										if(gyro_finish)
											n_state = INS_QUAT_P;
										else
											n_state = INS_GYRO_TMP;
									end							
		INS_QUAT_P			:	n_state = INS_QUAT;								
		INS_QUAT				:	n_state = INS_QUAT_TMP;
		INS_QUAT_TMP		:	begin		
										if(quat_finish)
											n_state = INS_MATX_P;
										else
											n_state = INS_QUAT_TMP;
									end											
		INS_MATX_P			:	n_state = INS_MATX;								
		INS_MATX				:	n_state = INS_MATX_TMP;
		INS_MATX_TMP		:	begin		
										if(matx_finish)
											n_state = INS_EULER_P;
										else
											n_state = INS_MATX_TMP;
									end							
		INS_EULER_P			:	n_state = INS_EULER;								
		INS_EULER			:	n_state = INS_EULER_TMP;
		INS_EULER_TMP		:	begin		
										if(euler_finish)
											n_state = LAST;
										else
											n_state = INS_EULER_TMP;
									end							
		LAST					:	n_state = LAST_TMP;
		LAST_TMP				:	n_state = END;							
		END					:	n_state = END_TMP;
		END_TMP				:	n_state = FINISH;
		FINISH				:	n_state = IDLE;
		default				:	n_state = IDLE;									
	endcase
end

reg acc_start, mag_start, gyro_start, quat_start, matx_start, euler_start;
reg [31:0] c_q0, c_q1, c_q2, c_q3,
			  c_exi, c_eyi, c_ezi;			  
wire [31:0] exa, eya, eza, 
			   exm, eym, ezm;
wire [31:0] wx, wy, wz; 
wire [31:0] p_exi, p_eyi, p_ezi,			  
				p_q0, p_q1, p_q2, p_q3,
				p_c11, p_c12, p_c13,
				p_c21, p_c22, p_c23,
				p_c31, p_c32, p_c33;
wire [31:0] out_pitch_tmp, out_roll_tmp, out_yaw_tmp;

always @ (posedge clk or negedge rst) begin
	if(!rst) begin
			out_pitch <= 32'h0;
			out_roll <= 32'h0;
			out_yaw <= 32'h0;
			c_exi <= 32'h0;
			c_eyi <= 32'h0;
			c_ezi <= 32'h0;
			acc_start <= 1'b0;
			mag_start <= 1'b0;
			gyro_start <= 1'b0;
			quat_start <= 1'b0;
			matx_start <= 1'b0;
			euler_start <= 1'b0;
			c_q0 <= 32'h3f800000;
			c_q1 <= 32'h0;
			c_q2 <= 32'h0;
			c_q3 <= 32'h0;
			c_c11 <= 32'h3f800000;
			c_c12 <= 32'h0;
			c_c13 <= 32'h0;
			c_c21 <= 32'h0;
			c_c22 <= 32'h3f800000;
			c_c23 <= 32'h0;
			c_c31 <= 32'h0;
			c_c32 <= 32'h0;
			c_c33 <= 32'h3f800000;
			out_INS_finish <= 1'b0;
		end
		else begin
			case(c_state)
				IDLE					:	begin
												if(in_data_en) begin
														out_INS_finish <= 1'b0;
													end
													else begin
														out_INS_finish <= out_INS_finish;
												end
											end
				INS_ACC_MAG_P		:	begin
												acc_start <= 1'b1;							
												mag_start <= 1'b1;
											end
				INS_ACC_MAG			:	begin
												acc_start <= 1'b0;							
												mag_start <= 1'b0;
											end	
				INS_GYRO_P			:	gyro_start <= 1'b1;								
				INS_GYRO				:	gyro_start <= 1'b0;						
				INS_QUAT_P			:	quat_start <= 1'b1;								
				INS_QUAT				:	quat_start <= 1'b0;										
				INS_MATX_P			:	matx_start <= 1'b1;								
				INS_MATX				:	matx_start <= 1'b0;					
				INS_EULER_P			:	euler_start <= 1'b1;							
				INS_EULER			:	euler_start <= 1'b0;						
				LAST					:	begin
												c_exi <= p_exi;
												c_eyi <= p_eyi;
												c_ezi <= p_ezi;
												c_q0 <= p_q0; 
												c_q1 <= p_q1; 
												c_q2 <= p_q2; 
												c_q3 <= p_q3; 
												c_c11 <= p_c11;
												c_c12 <= p_c12;
												c_c13 <= p_c13;
												c_c21 <= p_c21;
												c_c22 <= p_c22;
												c_c23 <= p_c23;
												c_c31 <= p_c31;
												c_c32 <= p_c32;
												c_c33 <= p_c33;									
											end							
				END					:	begin
											out_pitch <= out_pitch_tmp;
											out_roll <= out_roll_tmp;
											out_yaw <= out_yaw_tmp;
										end
				FINISH				:	out_INS_finish <= 1'b1;
				default				:	begin
												acc_start <= acc_start;
												mag_start <= mag_start;
												gyro_start <= gyro_start;
												quat_start <= quat_start;
												matx_start <= matx_start;
												euler_start <= euler_start;
											end									
			endcase
	end
end
//----------------------------------------------------------------------
INS_acc u1(
	.clk(clk)									,		//	input  clk
	.rst(rst)									,		//	input  rst
	.in_acc_en(acc_start)					,		//	input  acc_en
	.in_accx(in_accx)							,		//	input [31 : 0] accx
	.in_accy(in_accy)							,		//	input [31 : 0] accy
	.in_accz(in_accz)							,		//	input [31 : 0] accz
	.in_c13(c_c13)								,		//	input [31 : 0] c13
	.in_c23(c_c23)								,		//	input [31 : 0] c23
	.in_c33(c_c33)								,		//	input [31 : 0] c33
	.out_exa(exa)								,		//	output [31 : 0] exa
	.out_eya(eya)								,		//	output [31 : 0] eya
	.out_eza(eza)								,		//	output [31 : 0] eza
	.out_acc_finish(acc_finish)					//	output acc_finish
);	
	
INS_mag u2(	
   .clk(clk)								,		//	input clk
	.rst(rst)								,		//	input rst
	.in_mag_en(mag_start)				,		//	input mag_en
	.in_magx(in_magx)						,		//	input [31 : 0] magx
	.in_magy(in_magy)						,		//	input [31 : 0] magy
	.in_magz(in_magz)						,		//	input [31 : 0] magz
	.in_c11(c_c11)							, 		//	input [31 : 0] c11
	.in_c12(c_c12)							,		//	input [31 : 0] c12
	.in_c13(c_c13)							,		//	input [31 : 0] c13
	.in_c21(c_c21)							, 		//	input [31 : 0] c21
	.in_c22(c_c22)							,		//	input [31 : 0] c22
	.in_c23(c_c23)							,		//	input [31 : 0] c23
	.in_c31(c_c31)							, 		//	input [31 : 0] c31
	.in_c32(c_c32)							,		//	input [31 : 0] c32
	.in_c33(c_c33)							,		//	input [31 : 0] c33
	.out_exm(exm)							,		//	output [31 : 0] exm
	.out_eym(eym)							,		//	output [31 : 0] eym
	.out_ezm(ezm)							,		//	output [31 : 0] ezm
	.out_mag_finish(mag_finish)				//	output [31 : 0] mag_finish	
); 

INS_gyro u3(
	.clk(clk)								,		//	input clk
	.rst(rst)								,		//	input rst
	.in_gyro_en(gyro_start)				,		//	input gyro_en
	.in_gyrox(in_gyrox)					,		//	input [31 : 0] gyrox
	.in_gyroy(in_gyroy)					,		//	input [31 : 0] gyroy
	.in_gyroz(in_gyroz)					,		//	input [31 : 0] gyroz
	.in_exa(exa)							,		//	input [31 : 0] exa
	.in_eya(eya)							,		//	input [31 : 0] eya
	.in_eza(eza)							,		//	input [31 : 0] eza
	.in_exm(exm)							,		//	input [31 : 0] exm
	.in_eym(eym)							,		//	input [31 : 0] eym
	.in_ezm(ezm)							,		//	input [31 : 0] ezm
	.in_exi(c_exi)							,		//	input [31 : 0] exi
	.in_eyi(c_eyi)							,		//	input [31 : 0] eyi
	.in_ezi(c_ezi)							,		//	input [31 : 0] ezi
	.out_exi(p_exi)						,		//	output [31 : 0] exi
	.out_eyi(p_eyi)						,		//	output [31 : 0] eyi
	.out_ezi(p_ezi)						,		//	output [31 : 0] ezi
	.out_wx(wx)								,		//	output [31 : 0] wx
	.out_wy(wy)								,		//	output [31 : 0] wy
	.out_wz(wz)								,		//	output [31 : 0] wz
	.out_gyro_finish(gyro_finish)				//	output gyro_finish
); 
   
INS_quat u4 (
	.clk(clk)								,		//	input clk
	.rst(rst)								,		//	input rst
	.in_quat_en(quat_start)				,		//	input quat_en
	.in_q0(c_q0)							,		//	input q0
	.in_q1(c_q1)							,		//	input q1
	.in_q2(c_q2)							,		//	input q2
	.in_q3(c_q3)							,		//	input q3
	.in_wx(wx)								, 		//	input [31 : 0] wx
	.in_wy(wy)								,		//	input [31 : 0] wy
	.in_wz(wz)								,		//	input [31 : 0] wz
	.out_q0(p_q0)							,		//	output [31 : 0] q0
	.out_q1(p_q1)							,		//	output [31 : 0] q1
	.out_q2(p_q2)							,		//	output [31 : 0] q2
	.out_q3(p_q3)							,		//	output [31 : 0] q3
	.out_quat_finish(quat_finish)				//	output quat_finish
);

INS_matx u5 (
	.clk(clk)								,		//	input clk
	.rst(rst)								,		//	input rst
	.in_matx_en(matx_start)				,		//	input matx_en
	.in_q0(p_q0)							,		//	input [31 : 0] q0
	.in_q1(p_q1)							,		//	input [31 : 0] q1
	.in_q2(p_q2)							,		//	input [31 : 0] q2
	.in_q3(p_q3)							,		//	input [31 : 0] q3
	.out_c11(p_c11)						,		//	output [31 : 0] c11
	.out_c12(p_c12)						,		//	output [31 : 0] c12
	.out_c13(p_c13)						,		//	output [31 : 0] c13
	.out_c21(p_c21)						,		//	output [31 : 0] c21
	.out_c22(p_c22)						,		//	output [31 : 0] c22
	.out_c23(p_c23)						,		//	output [31 : 0] c23
	.out_c31(p_c31)						,		//	output [31 : 0] c31
	.out_c32(p_c32)						,		//	output [31 : 0] c32
	.out_c33(p_c33)						,		//	output [31 : 0] c33
	.out_matx_finish(matx_finish)				//	output [31 : 0] matx_finish	
);

INS_euler u6(
	.clk(clk)								,		//	input clk
	.rst(rst)								,		//	input rst
	.in_euler_en(euler_start)			,		//	input euler_en
	.in_c11(p_c11)							,		//	input [31 : 0] c11
	.in_c12(p_c12)							,		//	input [31 : 0] c12
	.in_c13(p_c13)							,		//	input [31 : 0] c13
	.in_c23(p_c23)							,		//	input [31 : 0] c23
	.in_c33(p_c33)							,		//	input [31 : 0] c33
	.out_pitch(out_pitch_tmp)			,     //	output [31 : 0] pitch
	.out_roll(out_roll_tmp)				,     //	output [31 : 0] roll
	.out_yaw(out_yaw_tmp)				,     //	output [31 : 0] yaw
	.out_euler_finish(euler_finish)			//	output [31 : 0] euler_finish
); 

endmodule
