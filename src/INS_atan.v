`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:24:27 04/25/2015 
// Design Name: 
// Module Name:    INS_atan 
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
module INS_atan(
	clk			,	// input clk
	rst			,	// input rst
	en				,	// input en
	a				,	// input [31:0] a
	b				,	// input [31:0] b
	result		,	// output [31:0] result
	atan_finish		// output atan_finish
);

input clk, rst, en;
input [31:0] a, b;
output reg atan_finish;
output reg [31:0] result;

parameter IDLE  		= 		6'd0,
			 START		= 		6'd1,
			 s1  			= 		6'd2,
			 s1_TMP  	= 		6'd3,
			 s2  			= 		6'd4,
			 s2_TMP  	= 		6'd5,
			 s3  			= 		6'd6,
			 s3_TMP  	= 		6'd7,
			 s4  			= 		6'd8,
			 s4_TMP  	= 		6'd9,
			 s5 			= 		6'd10,
			 s5_TMP  	= 		6'd11,
			 s6  			= 		6'd12,
			 s6_TMP  	= 		6'd13,
			 s7  			= 		6'd14,
			 s7_TMP  	= 		6'd15,
			 s8  			= 		6'd16,
			 s8_TMP  	= 		6'd17,
			 s9  			= 		6'd18,
			 s9_TMP  	= 		6'd19,
			 s10 			= 		6'd20,
			 s10_TMP  	= 		6'd21,
			 s11  		= 		6'd22,
			 s11_TMP  	= 		6'd23,
			 LAST  		= 		6'd24,
			 LAST_TMP  	= 		6'd25,
			 END 			= 		6'd26,
			 END_TMP  	= 		6'd27,
			 FINISH		= 		6'd28;
			 
reg [5:0] c_state, n_state;

always @ (posedge clk or negedge rst) begin
	if(!rst) begin
			c_state <= IDLE;
		end
		else begin
			c_state <= n_state;
	end
end

wire li_end, il_end, atan_end;

always @ (c_state or en or li_end or il_end or atan_end) begin
	case(c_state)
		IDLE		:	if(en) 
							n_state = START;
						else
							n_state = IDLE;
		START		:	n_state = s1; 					
		s1  		:	n_state = s1_TMP;
		s1_TMP	:  n_state = s2;
		s2  		:	n_state = s2_TMP;
		s2_TMP	:  n_state = s3;	
		s3  		:  begin
							if(li_end)
								n_state = s3_TMP;
							else 
								n_state = s3;
						end 
		s3_TMP	:	n_state = s4; 	
		s4  		:  n_state = s4_TMP; 
		s4_TMP	:  n_state = s5; 
		s5  		:  n_state = s5_TMP;  
		s5_TMP	:  n_state = s6;
		s6  		:  begin
							if(li_end)
								n_state = s6_TMP;
							else 
								n_state = s6;
						end 		
		s6_TMP	:  n_state = s7;
		s7  		:  n_state = s7_TMP; 		
		s7_TMP	:  n_state = s8;
		s8  		:  n_state = s8_TMP; 
		s8_TMP	:  n_state = s9;	
		s9  		:  begin
							if(atan_end)
								n_state = s9_TMP;
							else 
								n_state = s9;
						end 		
		s9_TMP	:  n_state = s10;
		s10 		:  n_state = s10_TMP;
		s10_TMP	:  n_state = s11;
		s11  		:	n_state = s11_TMP;  		
		s11_TMP	:  n_state = LAST;
		LAST 		:	begin
							if(il_end)
								n_state = LAST_TMP;
							else 
								n_state = LAST;
						end  		
		LAST_TMP	:  n_state = END;
		END 		:  n_state = END_TMP;
		END_TMP	:	n_state = FINISH;
		FINISH	:	n_state = IDLE;
		default  :  n_state = IDLE;
	endcase        
end

reg sclr, ce;
reg li_start, il_start, atan_start;
reg [31:0] li_in;
wire [15:0] li_out;
reg [15:0] il_in;
wire [31:0] il_out;
reg [15:0] atan_in_a, atan_in_b;
wire [15:0] atan_out;

always @ (posedge clk or negedge rst) begin
	if(!rst) begin
			result <= 32'h0;
			atan_finish <= 1'b0;
			li_start <= 1'b0;
			il_start <= 1'b0;
			atan_start <= 1'b0;
			atan_in_a <= 16'h0;
			atan_in_b <= 16'h0;
			li_in <= 32'h0;
			il_in <= 16'h0;
			sclr <= 1'b1;
			ce <= 1'b0;
		end
		else begin
			case(c_state)
				IDLE			:	begin
										if(en) begin										
												li_start <= 1'b0;
												il_start <= 1'b0;
												atan_start <= 1'b0;
												atan_in_a <= 16'h0;
												atan_in_b <= 16'h0;
												li_in <= 32'h0;
												il_in <= 16'h0;
												sclr <= 1'b1;
												ce <= 1'b0;
												atan_finish <= 1'b0;
											end
											else begin
												atan_in_a <= 16'h0;
												atan_in_b <= 16'h0;
												li_in <= 32'h0;
												il_in <= 16'h0;
												sclr <= 1'b1;
												ce <= 1'b0;
												atan_finish <= 1'b0;
										end
									end
				START			:  begin
										sclr <= 1'b0;
										ce <= 1'b1;
									end
				s1				:	begin
										li_in <= a;
									end
				s2				:	begin
										li_start <= 1'b1;
									end
				s3				:	begin
										li_start <= 1'b0;
									end
				s4				:	begin
										atan_in_a <= li_out;
										li_in <= b;
									end						
				s5				:	begin
										li_start <= 1'b1;
									end					
				s6				:	begin
										li_start <= 1'b0;
									end
				s7				:	begin
										atan_in_b <= li_out;
									end					
				s8				:	begin
										atan_start <= 1'b1;
									end	
				s9				:	begin
										atan_start <= 1'b0;
									end					
				s10			:	begin
										il_in <= atan_out;
									end
				s11			:	begin
										il_start <= 1'b1;
									end
				LAST			:	begin
										il_start <= 1'b0;
									end
				END			:	begin					
										result <= il_out;
									end
				FINISH		:	begin
										atan_finish <= 1'b1;
									end
				default		:  begin
										li_start <= li_start;
										il_start <= il_start;
										atan_start <= atan_start;
										atan_in_a <= atan_in_a;
										atan_in_b <= atan_in_b;
										li_in <= li_in;
										il_in <= il_in;
									end							
			endcase			
	end
end

fl32tofi16 t1 (
  .a(li_in), // input [31 : 0] a
  .operation_nd(li_start), // input operation_nd
  .clk(clk), // input clk
  .sclr(sclr), // input sclr
  .ce(ce), // input ce
  .result(li_out), // output [15 : 0] result
  .rdy(li_end) // output rdy
);


atan t2 (
  .x_in(atan_in_a), // input [15 : 0] x_in
  .y_in(atan_in_b), // input [15 : 0] y_in
  .nd(atan_start), // input nd
  .phase_out(atan_out), // output [15 : 0] phase_out
  .rdy(atan_end), // output rdy
  .clk(clk), // input clk
  .ce(ce), // input ce
  .sclr(sclr) // input sclr
);

fi16tofl32 t3 (
  .a(il_in), // input [15 : 0] a
  .operation_nd(il_start), // input operation_nd
  .clk(clk), // input clk
  .sclr(sclr), // input sclr
  .ce(ce), // input ce
  .result(il_out), // output [31 : 0] result
  .rdy(il_end) // output rdy
);

endmodule
