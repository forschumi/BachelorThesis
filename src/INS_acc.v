`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:43:41 04/22/2015 
// Design Name: 
// Module Name:    INS_acc 
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
module INS_acc(
	clk				,		//	input  clk
	rst				,		//	input  rst
	in_acc_en		,		//	input  acc_en
	in_accx			,		//	input [31 : 0] accx
	in_accy			,		//	input [31 : 0] accy
	in_accz			,		//	input [31 : 0] accz
	in_c13			,		//	input [31 : 0] c13
	in_c23			,		//	input [31 : 0] c23
	in_c33			,		//	input [31 : 0] c33
	out_exa			,		//	output [31 : 0] exa
	out_eya			,		//	output [31 : 0] eya
	out_eza			,		//	output [31 : 0] eza
	out_acc_finish			//	output acc_finish
);

input clk, rst, in_acc_en;
input [31:0] in_accx, in_accy, in_accz;
input [31:0] in_c13, in_c23, in_c33;
output reg [31:0] out_exa, out_eya, out_eza;
output reg out_acc_finish;

parameter IDLE    		= 		7'd0,
			 START	  		= 		7'd1,
			 AX_SQR  		= 		7'd2,
			 AX_SQR_TMP		= 		7'd3,
			 AX_SQR_1		= 		7'd4,
			 AY_SQR_0		= 		7'd5,
			 AY_SQR  		= 		7'd6,
			 AY_SQR_TMP		= 		7'd7,
			 AY_SQR_1	 	= 		7'd8,
			 AZ_SQR_0		=		7'd9,
			 AZ_SQR  		=		7'd10,
			 AZ_SQR_TMP		= 		7'd11,
			 AZ_SQR_1		= 		7'd12,
			 A_ADD_0			= 		7'd13,
			 A_ADD   		= 		7'd14,
			 A_ADD_TMP		= 		7'd15,
			 A_ADD_1			= 		7'd16,
			 A_NORM_0		= 		7'd17,
			 A_NORM			= 		7'd18,
			 A_NORM_TMP		= 		7'd19,
			 A_NORM_1		= 		7'd20,
			 AX_NORM_0		= 		7'd21,
			 AX_NORM 		= 		7'd22,
			 AX_NORM_TMP	= 		7'd23,
			 AX_NORM_1		= 		7'd24,
			 AY_NORM_0		=		7'd25,
			 AY_NORM 		=		7'd26,
			 AY_NORM_TMP	=		7'd27,
			 AY_NORM_1		=		7'd28,
			 AZ_NORM_0		=	  	7'd29,
			 AZ_NORM 		= 		7'd30,
			 AZ_NORM_TMP	= 		7'd31,
			 AZ_NORM_1		= 		7'd32,
			 EZA_L_0			= 		7'd33,
          EZA_L		   = 		7'd34,
          EZA_L_TMP     = 		7'd35,
          EZA_L_1		   = 		7'd36,
          EZA_R_0		   = 		7'd37,
          EZA_R		   = 		7'd38,
          EZA_R_TMP	   =		7'd39,
          EZA_R_1			= 		7'd40,
          EXA_L_0		   = 		7'd41,
          EXA_L		   = 		7'd42,
          EXA_L_TMP	   = 		7'd43,
          EXA_L_1		   = 		7'd44,
          EXA_R_0		   = 		7'd45,
          EXA_R		   = 		7'd46,
          EXA_R_TMP	   = 		7'd47,
          EXA_R_1		   = 		7'd48,
          EYA_L_0		   =		7'd49,
          EYA_L			= 		7'd50,
          EYA_L_TMP	   = 		7'd51,
          EYA_L_1		   = 		7'd52,
          EYA_R_0		   = 		7'd53,
          EYA_R		   = 		7'd54,
          EYA_R_TMP	   = 		7'd55,
          EYA_R_1		   = 		7'd56,
          EYA_0		   = 		7'd57,
          EYA			   = 		7'd58,
          EYA_TMP		   =		7'd59,
          EYA_1			= 		7'd60,
          LAST_0		   = 		7'd61,
          LAST		      = 		7'd62,
          LAST_TMP	   = 		7'd63,
          END			   = 		7'd64,
			 END_TMP			=		7'd65,
			 FINISH			=		7'd66;
			 
reg [6:0] c_state, n_state;

always @ (posedge clk or negedge rst) begin
	if(!rst) begin
			c_state <= IDLE;
		end	
		else begin
			c_state <= n_state;
	end
end

wire add_end, mult_end, sqrt_end, div_end, sub_end;			 
always @ (c_state or in_acc_en or add_end or mult_end or sqrt_end or div_end or sub_end) begin
	case(c_state)
		IDLE			: 	begin
								if(in_acc_en) n_state = START;
								else n_state = IDLE;
							end				
		START	  		:	n_state = 	AX_SQR;
		AX_SQR  		:	n_state = 	AX_SQR_TMP;			
		AX_SQR_TMP	:	n_state = 	AX_SQR_1;          
		AX_SQR_1		:	n_state =   AY_SQR_0;            
		AY_SQR_0		:	begin
								if(mult_end)
									n_state = AY_SQR;
								else
									n_state = AY_SQR_0;
							end
		AY_SQR  		:	n_state =   AY_SQR_TMP;            
		AY_SQR_TMP	:	n_state = 	AY_SQR_1;          
		AY_SQR_1		:	n_state =   AZ_SQR_0;            
		AZ_SQR_0		:	begin
								if(mult_end)
									n_state = AZ_SQR;
								else
									n_state = AZ_SQR_0;
							end           
		AZ_SQR  		:	n_state =   AZ_SQR_TMP;            
		AZ_SQR_TMP	:	n_state = 	AZ_SQR_1;          
		AZ_SQR_1		:	n_state =   A_ADD_0;            
		A_ADD_0		: 	begin
								if(add_end)
									n_state = A_ADD;
								else
									n_state = A_ADD_0;
							end           
		A_ADD   		: 	n_state =   A_ADD_TMP;            
		A_ADD_TMP	:	n_state = 	A_ADD_1;          
		A_ADD_1		:	n_state =   A_NORM_0;            
		A_NORM_0		:	begin
								if(add_end)
									n_state = A_NORM;
								else
									n_state = A_NORM_0;
							end           
		A_NORM		:	n_state =   A_NORM_TMP;            
		A_NORM_TMP	:	n_state = 	A_NORM_1;          
		A_NORM_1		:	n_state =   AX_NORM_0;            
		AX_NORM_0   :	begin
								if(sqrt_end)
									n_state = AX_NORM;
								else
									n_state = AX_NORM_0;
							end          
		AX_NORM 		:	n_state =   AX_NORM_TMP;            
		AX_NORM_TMP	:	n_state = 	AX_NORM_1;          
		AX_NORM_1   :	n_state =   AY_NORM_0;            
		AY_NORM_0   :	begin
								if(div_end)
									n_state = AY_NORM;
								else
									n_state = AY_NORM_0;
							end           
		AY_NORM 		:	n_state =   AY_NORM_TMP;            
		AY_NORM_TMP	:	n_state = 	AY_NORM_1;          
		AY_NORM_1   :	n_state =   AZ_NORM_0;            
		AZ_NORM_0   :	begin
								if(div_end)
									n_state = AZ_NORM;
								else
									n_state = AZ_NORM_0;
							end           
		AZ_NORM 		:	n_state =   AZ_NORM_TMP;            
		AZ_NORM_TMP	:   n_state = 	AZ_NORM_1;          
		AZ_NORM_1   :   n_state =   EZA_L_0;            
		EZA_L_0		:	begin
								if(div_end)
									n_state = EZA_L;
								else
									n_state = EZA_L_0;
							end          
		EZA_L			:   n_state =   EZA_L_TMP;            
		EZA_L_TMP   :	n_state =   EZA_L_1;            
		EZA_L_1		:	n_state =   EZA_R_0;            
		EZA_R_0		:	begin
								if(mult_end)
									n_state = EZA_R;
								else
									n_state = EZA_R_0;
							end          
		EZA_R			:	n_state =   EZA_R_TMP;            
		EZA_R_TMP	:	n_state = 	EZA_R_1;          
		EZA_R_1		:	n_state =   EXA_L_0;            
		EXA_L_0		:	begin
								if(mult_end)
									n_state = EXA_L;
								else
									n_state = EXA_L_0;
							end           
		EXA_L			:	n_state =   EXA_L_TMP;            
		EXA_L_TMP	:	n_state = 	EXA_L_1;          
		EXA_L_1		:	n_state =   EXA_R_0;            
		EXA_R_0		:	begin
								if(sub_end)
									n_state = EXA_R;
								else
									n_state = EXA_R_0;
							end          
		EXA_R			:	n_state =   EXA_R_TMP;            
		EXA_R_TMP	: 	n_state = 	EXA_R_1;          
		EXA_R_1		: 	n_state =   EYA_L_0;            
		EYA_L_0		:	begin
								if(mult_end)
									n_state = EYA_L;
								else
									n_state = EYA_L_0;
							end           
		EYA_L			:	n_state =   EYA_L_TMP;            
		EYA_L_TMP	:	n_state = 	EYA_L_1;          
		EYA_L_1		:	n_state =   EYA_R_0;            
		EYA_R_0		:	begin
								if(sub_end)
									n_state = EYA_R;
								else
									n_state = EYA_R_0;
							end           
		EYA_R			:	n_state =   EYA_R_TMP;            
		EYA_R_TMP	:	n_state = 	EYA_R_1;          
		EYA_R_1		:	n_state =   EYA_0;            
		EYA_0			:	begin
								if(mult_end)
									n_state = EYA;
								else
									n_state = EYA_0;
							end          
		EYA			:	n_state =   EYA_TMP;            
		EYA_TMP		:	n_state = 	EYA_1;          
		EYA_1			:	n_state =   LAST_0;            
		LAST_0		:	begin
								if(sub_end)
									n_state = LAST;
								else
									n_state = LAST_0;
							end          
		LAST			:	n_state =   LAST_TMP;            
		LAST_TMP		:	n_state = 	END;          
		END			:	n_state =   END_TMP;
		END_TMP		:	n_state =   FINISH;
		FINISH		:	n_state =   IDLE;
		default		:	n_state = 	IDLE;
	endcase
end

reg sclr, ce;
reg [31:0] out_exa_tmp, out_eya_tmp, out_eza_tmp;
reg [31:0] norm_accx_tmp, norm_accy_tmp, norm_accz_tmp;
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
			out_exa_tmp <= 32'h0;
			out_eya_tmp <= 32'h0;
			out_eza_tmp <= 32'h0;
			norm_accx_tmp <= 32'h0;
			norm_accy_tmp <= 32'h0;
			norm_accz_tmp <= 32'h0;
			out_exa <= 32'h0; 
			out_eya <= 32'h0; 
			out_eza <= 32'h0;
			out_acc_finish <= 1'b0;
			add_start <= 1'b0;
			mult_start <= 1'b0;
			sqrt_start <= 1'b0;
			div_start <= 1'b0;
			sub_start <= 1'b0;
			sclr <= 1'b1;
			ce <= 1'b0;
			mult_in_a <= 32'h0;
			mult_in_b <= 32'h0;
			add_in_a <= 32'h0;
			add_in_b <= 32'h0;
			div_in_a <= 32'h0;
			div_in_b <= 32'h0;
			sqrt_in <= 32'h0;
			sub_in_a <= 32'h0;
			sub_in_b <= 32'h0;
		end
	else begin
			case(c_state)
				IDLE			:	begin
										if(in_acc_en) begin
												add_start <= 1'b0;
												mult_start <= 1'b0;
												sqrt_start <= 1'b0;
												div_start <= 1'b0;
												sub_start <= 1'b0;
												sclr <= 1'b1;
												ce <= 1'b0;
												out_acc_finish <= 1'b0;	
												mult_in_a <= 32'h0;
												mult_in_b <= 32'h0;
												add_in_a <= 32'h0;
												add_in_b <= 32'h0;
												div_in_a <= 32'h0;
												div_in_b <= 32'h0;
												sqrt_in <= 32'h0;
												sub_in_a <= 32'h0;
												sub_in_b <= 32'h0;
											end
											else begin
												add_start <= 1'b0;
												mult_start <= 1'b0;
												sqrt_start <= 1'b0;
												div_start <= 1'b0;
												sub_start <= 1'b0;
												sclr <= 1'b1;
												ce <= 1'b0;
												out_acc_finish <= out_acc_finish;	
												mult_in_a <= 32'h0;
												mult_in_b <= 32'h0;
												add_in_a <= 32'h0;
												add_in_b <= 32'h0;
												div_in_a <= 32'h0;
												div_in_b <= 32'h0;
												sqrt_in <= 32'h0;
												sub_in_a <= 32'h0;
												sub_in_b <= 32'h0;
										end
									end					
				START			:	begin
//										out_acc_finish <= 1'b0;	
										sclr <= 1'b0;
										ce <= 1'b1;															
									end
				AX_SQR  		:	begin
										mult_in_a <= in_accx;		// accx
										mult_in_b <= in_accx;		//	accx							
									end
				AX_SQR_1		:	begin
										mult_start <= 1'b1;							
									end
				AY_SQR_0		:	begin
										mult_start <= 1'b0;							
									end
				AY_SQR  		:	begin	
										add_in_a <= mult_out;			//	accx^2
										mult_in_a <= in_accy;		//	accy
										mult_in_b <= in_accy;		//	accy							
									end	
				AY_SQR_1		:	begin
										mult_start <= 1'b1;							
									end
				AZ_SQR_0		:	begin
										mult_start <= 1'b0;							
									end
				AZ_SQR  		:	begin	
										add_in_b <= mult_out;			//	accy^2
										mult_in_a <= in_accz;		//	accz
										mult_in_b <= in_accz;		//	accz							
									end	
				AZ_SQR_1		:	begin
										add_start <= 1'b1;	
										mult_start <= 1'b1;							
									end
				A_ADD_0		:	begin
										add_start <= 1'b0;	
										mult_start <= 1'b0;							
									end
				A_ADD   		:	begin	
										add_in_a <= add_out;				//	accx^2 + accy^2
										add_in_b <= mult_out;			//	accz^2						
									end
				A_ADD_1		:	begin
										add_start <= 1'b1;							
									end
				A_NORM_0		:	begin
										add_start <= 1'b0;							
									end
				A_NORM		:	begin
										sqrt_in <= add_out;           // accx^2 + accy^2 + accz^2
									end
				A_NORM_1		:	begin
										sqrt_start <= 1'b1;							
									end
				AX_NORM_0	:	begin
										sqrt_start <= 1'b0;							
									end
				AX_NORM 		:	begin
										div_in_a <= in_accx;		// accx
										div_in_b <= sqrt_out;			// sqrt( accx^2 + accy^2 + accz^2 )
									end
				AX_NORM_1	:	begin
										div_start <= 1'b1;							
										end
				AY_NORM_0	:	begin
										div_start <= 1'b0;							
									end
				AY_NORM 		:	begin
										norm_accx_tmp <= div_out;		// accx/sqrt( accx^2 + accy^2 + accz^2 )
										div_in_a <= in_accy;		// accy
										div_in_b <= sqrt_out;			// sqrt( accx^2 + accy^2 + accz^2 )
									end
				AY_NORM_1	:	begin
										div_start <= 1'b1;							
									end
				AZ_NORM_0	:	begin
										div_start <= 1'b0;							
									end
				AZ_NORM 		:	begin
									   norm_accy_tmp <= div_out;		// accy/sqrt( accx^2 + accy^2 + accz^2 )
										div_in_a <= in_accz;		// accz
										div_in_b <= sqrt_out;			// sqrt( accx^2 + accy^2 + accz^2 )
									end	
				AZ_NORM_1	:	begin
										div_start <= 1'b1;							
									end
				EZA_L_0		:	begin
										div_start <= 1'b0;							
									end
				EZA_L			:	begin
									   norm_accz_tmp <= div_out;		// accy/sqrt( accx^2 + accy^2 + accz^2 )
										mult_in_a <= norm_accx_tmp;	// accx
										mult_in_b <= in_c23;		// c23
									end
				EZA_L_1		:	begin
										mult_start <= 1'b1;							
									end
				EZA_R_0		:	begin
										mult_start <= 1'b0;							
									end
				EZA_R			:	begin
										sub_in_a <= mult_out;			// accx*c23
										mult_in_a <= norm_accy_tmp;	// accy
										mult_in_b <= in_c13;		// c13
									end
				EZA_R_1		:	begin
										mult_start <= 1'b1;							
									end
				EXA_L_0		:	begin
										mult_start <= 1'b0;							
									end
				EXA_L			:	begin
										sub_in_b <= mult_out;			// accy*c13
										mult_in_b <= in_c33;		// c33
									end
				EXA_L_1		:	begin
										sub_start <= 1'b1;	
										mult_start <= 1'b1;							
									end
				EXA_R_0		:	begin
										sub_start <= 1'b0;	
										mult_start <= 1'b0;							
									end
				EXA_R			:	begin
										out_eza_tmp <= sub_out;			// eza = accx*c23 - accy*c13
										sub_in_a <= mult_out;			// accy * c33
										mult_in_a <= norm_accz_tmp;	// accz
										mult_in_b <= in_c23;		// c23
									end
				EXA_R_1		:	begin	
										mult_start <= 1'b1;							
									end
				EYA_L_0		:	begin	
										mult_start <= 1'b0;							
									end
				EYA_L			:	begin
										sub_in_b <= mult_out;			// accz*c23
										mult_in_b <= in_c13;		// c13
									end
				EYA_L_1		:	begin
										sub_start <= 1'b1;	
										mult_start <= 1'b1;							
									end
				EYA_R_0		:	begin
										sub_start <= 1'b0;	
										mult_start <= 1'b0;							
									end
				EYA_R			:	begin
										out_exa_tmp <= sub_out;			// exa = accy*c33 - accz*c23
										sub_in_a <= mult_out;			// accz*c13
										mult_in_a <= norm_accx_tmp;	// accx
										mult_in_b <= in_c33;		// c33
									end
				EYA_R_1		:	begin	
										mult_start <= 1'b1;							
									end
				EYA_0			:	begin	
										mult_start <= 1'b0;							
									end
				EYA			:	begin
										sub_in_b <= mult_out;			// accx*c33
									end
				EYA_1			:	begin	
										sub_start <= 1'b1;							
									end
				LAST_0		:	begin	
										sub_start <= 1'b0;							
									end
				LAST			:	begin
										out_eya_tmp <= sub_out;			// eya = accz*c13 - accx*c33
									end
				END			:	begin
										out_exa <= out_exa_tmp;
										out_eya <= out_eya_tmp;
										out_eza <= out_eza_tmp;
									end
				FINISH		:	out_acc_finish <= 1'b1;
				default		:  begin
										add_start <= add_start;
										mult_start <= mult_start;
										sqrt_start <= sqrt_start;
										div_start <= div_start;
										sub_start <= sub_start;
										mult_in_a <= mult_in_a;
										mult_in_b <= mult_in_b;
										add_in_a <= add_in_a;
										add_in_b <= add_in_b;
										sqrt_in <= sqrt_in;
										div_in_a <= div_in_a;
										div_in_b <= div_in_b;
										sub_in_a <= sub_in_a;
										sub_in_b <= sub_in_b;
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
