`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:27:04 04/24/2015 
// Design Name: 
// Module Name:    INS_mag_tb 
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
//`include "F:/quadrotor/prj_INS/qrc/src/INS_mag.v"
module INS_mag_tb;

reg clk, rst, in_mag_en;
reg [31:0] in_magx, in_magy, in_magz;
reg [31:0] in_c11, in_c12, in_c13,
				in_c21, in_c22, in_c23,
				in_c31, in_c32, in_c33;



parameter t = 20;

initial begin
	clk = 1'b1;
	rst = 1'b1;
	in_magx = 32'd0;
	in_magy = 32'd0;
	in_magz = 32'd0;
	in_c11 = 32'd0;
	in_c12 = 32'd0;
	in_c13 = 32'd0;
	in_c21 = 32'd0;
	in_c22 = 32'd0;
	in_c23 = 32'd0;
	in_c31 = 32'd0;
	in_c32 = 32'd0;
	in_c33 = 32'd0;
	in_mag_en = 1'b0;
end

always #(t/2) clk = ~clk;

initial begin
	#(t*8)
		rst = 1'b0;
	#(t*2)
		rst = 1'b1;
	#t
		in_magx = 32'h40000000;
		in_magy = 32'h40000000;
		in_magz = 32'h40000000;
		in_c11 = 32'h3F800000;
		in_c12 = 32'h3F800000;
		in_c13 = 32'h3F800000;
		in_c21 = 32'h40000000;
		in_c22 = 32'h40000000;
		in_c23 = 32'h40000000;
		in_c31 = 32'h40400000;
		in_c32 = 32'h40400000;
		in_c33 = 32'h40400000;
	#(t)
		in_mag_en = 1'b1;
	#(t*5)
		in_mag_en = 1'b0;
end


/*wire out_mag_finish;
wire [31:0] out_exm, out_eym, out_ezm;
INS_mag u1(
   .clk(clk)			,		//时钟信号
	.rst(rst)			,		//复位信号，低电平有效
	.in_mag_en(in_mag_en)	,		//电子罗盘使能信号
	.in_magx(in_magx)		,		//电子罗盘X轴测量值
	.in_magy(in_magy)		,		//电子罗盘Y轴测量值
	.in_magz(in_magz)		,		//电子罗盘Z轴测量值
	.in_c11(in_c11)		, 		//姿态矩阵C11更新值
	.in_c12(in_c12)		,		//姿态矩阵C12更新值
	.in_c13(in_c13)		,		//姿态矩阵C13更新值
	.in_c21(in_c21)		, 		//姿态矩阵C21更新值
	.in_c22(in_c22)		,		//姿态矩阵C22更新值
	.in_c23(in_c23)		,		//姿态矩阵C23更新值
	.in_c31(in_c31)		, 		//姿态矩阵C31更新值
	.in_c32(in_c32)		,		//姿态矩阵C32更新值
	.in_c33(in_c33)		,		//姿态矩阵C33更新值
	.out_exm(out_exm)		,		//电子罗盘X轴测量误差值
	.out_eym(out_eym)		,		//电子罗盘Y轴测量误差值
	.out_ezm(out_ezm)		,		//电子罗盘Z轴测量误差值
	.out_mag_finish(out_mag_finish)			//电子罗盘误差处理完毕，高电平有效
);*/

//----------------------------------------------------------------
wire [31:0] in_magx_inv;
assign in_magx_inv = {(~in_magx[31]), in_magx[30:0]};
reg out_mag_finish;
reg [31:0] out_exm, out_eym, out_ezm;

parameter IDLE					  =		8'd0,
			 START				  = 		8'd1,
			 MX_SQR  	        = 		8'd2,
			 MX_SQR_TMP			  = 		8'd3,
			 MX_SQR_1	        = 		8'd4,
			 MY_SQR_0	        = 		8'd5,
			 MY_SQR  	        = 		8'd6,
			 MY_SQR_TMP			  = 		8'd7,
			 MY_SQR_1	        = 		8'd8,
			 MZ_SQR_0	        =		8'd9,
			 MZ_SQR  	        =		8'd10,
			 MZ_SQR_TMP			  = 		8'd11,
			 MZ_SQR_1	        = 		8'd12,
			 M_ADD_0		        = 		8'd13,
			 M_ADD   	        = 		8'd14,
			 M_ADD_TMP			  = 		8'd15,
			 M_ADD_1		        = 		8'd16,
			 M_NORM_0	        = 		8'd17,
			 M_NORM		        = 		8'd18,
			 M_NORM_TMP			  =		8'd19,
			 M_NORM_1	        =		8'd20,
			 MX_NORM_0	        = 		8'd21,
			 MX_NORM 	        = 		8'd22,
			 MX_NORM_TMP		  = 		8'd23,
			 MX_NORM_1	        = 		8'd24,
			 MY_NORM_0	        = 		8'd25,
			 MY_NORM 	        = 		8'd26,
			 MY_NORM_TMP		  = 		8'd27,
			 MY_NORM_1	        = 		8'd28,
			 MZ_NORM_0	        =		8'd29,
			 MZ_NORM 	        =		8'd30,
			 MZ_NORM_TMP		  = 		8'd31,
			 MZ_NORM_1	        = 		8'd32,
			 HX_L_0		        = 		8'd33,
			 HX_L		        	  = 		8'd34,
			 HX_L_TMP			  = 		8'd35,
			 HX_L_1		        = 		8'd36,
			 HX_C_0		        = 		8'd37,
			 HX_C		           = 		8'd38,
			 HX_C_TMP			  =		8'd39,
			 HX_C_1		        =		8'd40,
			 HX_R_0		        = 		8'd41,
			 HX_R		       	  = 		8'd42,
			 HX_R_TMP			  = 		8'd43,	 
			 HX_R_1		        = 		8'd44,
			 HY_L_0		        = 		8'd45,
			 HY_L		        	  = 		8'd46,
			 HY_L_TMP           = 		8'd47,
			 HY_L_1		        = 		8'd48,
			 HY_C_0		        =		8'd49,
			 HY_C		           =		8'd50,
			 HY_C_TMP			  = 		8'd51,
			 HY_C_1		        = 		8'd52,
			 HY_R_0		        = 		8'd53,
			 HY_R		           = 		8'd54,
			 HY_R_TMP			  = 		8'd55,
			 HY_R_1		        = 		8'd56,
			 BZ_L_0		        = 		8'd57,
			 BZ_L		           = 		8'd58,
			 BZ_L_TMP			  =		8'd59,
			 BZ_L_1		        =		8'd60,
			 BZ_C_0		        = 		8'd61,
			 BZ_C		        	  = 		8'd62,
			 BZ_C_TMP			  = 		8'd63,
			 BZ_C_1		        = 		8'd64,
			 BZ_R_0		        = 		8'd65,
			 BZ_R		        	  = 		8'd66,
			 BZ_R_TMP			  = 		8'd67,
			 BZ_R_1		        = 		8'd68,
			 BX_HX_0		        =		8'd69,
			 BX_HX		        =		8'd70,
          BX_HX_TMP			  = 		8'd71,
          BX_HX_1		        = 		8'd72,
          BX_HY_0		        = 		8'd73,
          BX_HY		        = 		8'd74,
          BX_HY_TMP			  = 		8'd75,
          BX_HY_1		        = 		8'd76,
          BX_ADD_0	        = 		8'd77,
          BX_ADD		        = 		8'd78,
          BX_ADD_TMP			  =		8'd79,
          BX_ADD_1	        =		8'd80,
          BX_SQRT_0	        = 		8'd81,
          BX_SQRT            = 		8'd82,
          BX_SQRT_TMP        = 		8'd83,
          BX_SQRT_1	        = 		8'd84,
          WX_0		           = 		8'd85,
          WX			        = 		8'd86,
          WX_TMP			     = 		8'd87,
          WX_1		           = 		8'd88,
          WY_L_0		        =		8'd89,
          WY_L		       	  = 		8'd90,
          WY_L_TMP		 	  = 		8'd91,
          WY_L_1		    	  = 		8'd92,
          WY_R_0		    	  = 		8'd93,
          WY_R		       	  =		8'd94,
          WY_R_TMP		 	  =		8'd95,
          WY_R_1		    	  = 		8'd96,
          WZ_L_0		    	  = 		8'd97,
          WZ_L		       	  = 		8'd98,
          WZ_L_TMP		 	  = 		8'd99,
          WZ_L_1		    	  = 		8'd100,
          WZ_R_0		    	  = 		8'd101,
          WZ_R		       	  = 		8'd102,
          WZ_R_TMP		 	  = 		8'd103,
          WZ_R_1		    	  =		8'd104,
          EZM_L_0		    	  =		8'd105,
          EZM_L		    	  = 		8'd106,
          EZM_L_TMP      	  = 	 	8'd107,
          EZM_L_1		    	  = 		8'd108,
          EZM_R_0		    	  = 		8'd109,
          EZM_R		    	  = 		8'd110,
          EZM_R_TMP		 	  = 		8'd111,
          EZM_R_1		    	  = 		8'd112,
          EXM_L_0		    	  = 		8'd113,
          EXM_L		     	  =		8'd114,
          EXM_L_TMP			  =		8'd115,
          EXM_L_1		    	  =		8'd116,
          EXM_R_0		    	  = 		8'd117,
          EXM_R		    	  = 		8'd118,
          EXM_R_TMP			  = 		8'd119,
          EXM_R_1		    	  = 		8'd120,
          EYM_L_0		    	  = 		8'd121,
          EYM_L		    	  = 		8'd122,
          EYM_L_TMP			  = 		8'd123,
          EYM_L_1		    	  = 		8'd124,
          EYM_R_0		    	  =		8'd125,
          EYM_R		    	  =		8'd126,
          EYM_R_TMP			  = 		8'd127,
          EYM_R_1		    	  = 	 	8'd128,
          EYM_0		    	  = 		8'd129,
          EYM			    	  = 		8'd130,
          EYM_TMP			 	  = 		8'd131,
          EYM_1		    	  = 		8'd132,
          LAST_0		    	  = 		8'd133,
          LAST		       	  = 		8'd134,
          LAST_TMP			  =		8'd135,
          END			    	  =   	8'd136;
                                
reg [7:0] c_state, n_state;

always @ (posedge clk or negedge rst) begin
	if(!rst) begin
			c_state <= IDLE;
		end	
		else begin
			c_state <= n_state;
	end
end

wire add_end, mult_end, sqrt_end, div_end, sub_end;			 
always @ (c_state or in_mag_en or add_end or mult_end or sqrt_end or div_end or sub_end) begin
	case(c_state)
		IDLE					  : 	begin
											if(in_mag_en) n_state = START;
											else n_state = IDLE;
										end				
		START					  :	n_state = 	MX_SQR  	;
		MX_SQR  	        	  :	n_state =   MX_SQR_TMP	;
		MX_SQR_TMP			  :	n_state =   MX_SQR_1	;
		MX_SQR_1	        	  :	n_state =   MY_SQR_0	;
		MY_SQR_0	        	  :	begin
											if(mult_end)
												n_state = MY_SQR;
											else
												n_state = MY_SQR_0;
										end
		MY_SQR  	        	  :	n_state =   MY_SQR_TMP	;
		MY_SQR_TMP			  :	n_state =   MY_SQR_1	;
		MY_SQR_1	           :	n_state =   MZ_SQR_0	;
		MZ_SQR_0	           :	begin
											if(mult_end)
												n_state = MZ_SQR;
											else
												n_state = MZ_SQR_0;
										end
		MZ_SQR  	           :	n_state =   MZ_SQR_TMP	;
		MZ_SQR_TMP			  :	n_state =   MZ_SQR_1	;
		MZ_SQR_1	           :	n_state =   M_ADD_0		;
		M_ADD_0		        : 	begin
											if(add_end)
												n_state = M_ADD;
											else
												n_state = M_ADD_0;
										end
		M_ADD   	           : 	n_state =   M_ADD_TMP	;
		M_ADD_TMP			  :	n_state =   M_ADD_1		;
		M_ADD_1		        :	n_state =   M_NORM_0	;
		M_NORM_0	           :	begin
											if(add_end)
												n_state = M_NORM;
											else
												n_state = M_NORM_0;
										end
		M_NORM		        :	n_state =   M_NORM_TMP	;
		M_NORM_TMP			  :	n_state =   M_NORM_1	;
		M_NORM_1	           :	n_state =   MX_NORM_0	;
		MX_NORM_0	        :	begin
											if(sqrt_end)
												n_state = MX_NORM;
											else
												n_state = MX_NORM_0;
										end
		MX_NORM 	           :	n_state =   MX_NORM_TMP	;
		MX_NORM_TMP			  :	n_state =   MX_NORM_1	;
		MX_NORM_1	        :	n_state =   MY_NORM_0	;
		MY_NORM_0	        :	begin
											if(div_end)
												n_state = MY_NORM;
											else
												n_state = MY_NORM_0;
										end
		MY_NORM 	           :	n_state =   MY_NORM_TMP	;
		MY_NORM_TMP			  :	n_state =   MY_NORM_1	;
		MY_NORM_1	        :	n_state =   MZ_NORM_0	;
		MZ_NORM_0	        :	begin
											if(div_end)
												n_state = MZ_NORM;
											else
												n_state = MZ_NORM_0;
										end
		MZ_NORM 	           :	n_state =   MZ_NORM_TMP	;
		MZ_NORM_TMP			  :	n_state =   MZ_NORM_1	;
		MZ_NORM_1	        :	n_state =   HX_L_0		;
		HX_L_0		        :	begin
											if(div_end)
												n_state = HX_L;
											else
												n_state = HX_L_0;
										end
		HX_L		           :	n_state =   HX_L_TMP	;
		HX_L_TMP				  :	n_state =   HX_L_1		;
		HX_L_1		        :	n_state =   HX_C_0		;
		HX_C_0		        :	begin
											if(mult_end)
												n_state = HX_C;
											else
												n_state = HX_C_0;
										end
		HX_C		           :	n_state =   HX_C_TMP	;
		HX_C_TMP				  :	n_state =   HX_C_1		;
		HX_C_1		        :	n_state =   HX_R_0		;
		HX_R_0		        :	begin
											if(mult_end)
												n_state = HX_R;
											else
												n_state = HX_R_0;
										end
		HX_R		           :	n_state =   HX_R_TMP	;
		HX_R_TMP			     :	n_state =   HX_R_1		;
		HX_R_1		        :	n_state =   HY_L_0		;
		HY_L_0		        :	begin
											if(add_end)
												n_state = HY_L;
											else
												n_state = HY_L_0;
										end
		HY_L		           :	n_state =   HY_L_TMP    ;
		HY_L_TMP            :	n_state =   HY_L_1		;
		HY_L_1		        :	n_state =   HY_C_0		;
		HY_C_0		        :	begin
											if(add_end)
												n_state = HY_C;
											else
												n_state = HY_C_0;
										end
		HY_C		           :	n_state =   HY_C_TMP	;
		HY_C_TMP			     :	n_state =   HY_C_1		;
		HY_C_1		        :	n_state =   HY_R_0		;
		HY_R_0		        :	begin
											if(mult_end)
												n_state = HY_R;
											else
												n_state = HY_R_0;
										end
		HY_R		        	  :	n_state =   HY_R_TMP	;
		HY_R_TMP				  :	n_state =   HY_R_1		;
		HY_R_1		        :	n_state =   BZ_L_0		;
		BZ_L_0		        :	begin
											if(add_end)
												n_state = BZ_L;
											else
												n_state = BZ_L_0;
										end
		BZ_L		           :	n_state =   BZ_L_TMP	;
		BZ_L_TMP			     :	n_state =   BZ_L_1		;
		BZ_L_1		        :	n_state =   BZ_C_0		;
		BZ_C_0		        :	begin
											if(add_end)
												n_state = BZ_C;
											else
												n_state = BZ_C_0;
										end
		BZ_C		           :	n_state =   BZ_C_TMP	;
		BZ_C_TMP				  :	n_state =   BZ_C_1		;
		BZ_C_1		        :	n_state =   BZ_R_0		;
		BZ_R_0		        :	begin
											if(mult_end)
												n_state = BZ_R;
											else
												n_state = BZ_R_0;
										end
		BZ_R		           :	n_state =   BZ_R_TMP	;
		BZ_R_TMP			     :	n_state =   BZ_R_1		;
		BZ_R_1		        :	n_state =   BX_HX_0		;
		BX_HX_0		        :	begin
											if(add_end)
												n_state = BX_HX;
											else
												n_state = BX_HX_0;
										end
		BX_HX		           :   n_state =   BX_HX_TMP	;
		BX_HX_TMP			  :	n_state =   BX_HX_1		;
		BX_HX_1		        :	n_state =   BX_HY_0		;
		BX_HY_0		        :	begin
											if(add_end)
												n_state = BX_HY;
											else
												n_state = BX_HY_0;
										end
		BX_HY		           :	n_state =   BX_HY_TMP	;
		BX_HY_TMP			  :	n_state =   BX_HY_1		;
		BX_HY_1		        :	n_state =   BX_ADD_0	;
		BX_ADD_0	           :	begin
											if(mult_end)
												n_state = BX_ADD;
											else
												n_state = BX_ADD_0;
										end
		BX_ADD		        :	n_state =   BX_ADD_TMP	;
		BX_ADD_TMP			  :	n_state =   BX_ADD_1	;
		BX_ADD_1	        	  :	n_state =   BX_SQRT_0	;
		BX_SQRT_0	        :	begin
											if(add_end)
												n_state = BX_SQRT;
											else
												n_state = BX_SQRT_0;
										end
		BX_SQRT             :	n_state =   BX_SQRT_TMP ;
		BX_SQRT_TMP         : 	n_state =   BX_SQRT_1	;
		BX_SQRT_1	        : 	n_state =   WX_0		;
		WX_0		       	  :	begin
											if(sqrt_end)
												n_state = WX;
											else
												n_state = WX_0;
										end
		WX			           :	n_state =   WX_TMP		;
		WX_TMP			     :	n_state =   WX_1		;
		WX_1		           :	n_state =   WY_L_0		;
		WY_L_0		        :	begin
											if(mult_end)
												n_state = WY_L;
											else
												n_state = WY_L_0;
										end
		WY_L		        	  :	n_state =   WY_L_TMP	;
		WY_L_TMP				  :	n_state =   WY_L_1		;
		WY_L_1		        :	n_state =   WY_R_0		;
		WY_R_0		        :	begin
											if(add_end)
												n_state = WY_R;
											else
												n_state = WY_R_0;
										end
		WY_R		        	  :	n_state =   WY_R_TMP	;
		WY_R_TMP				  :	n_state =   WY_R_1		;
		WY_R_1		        :	n_state =   WZ_L_0		;
		WZ_L_0		        :	begin
											if(mult_end)
												n_state = WZ_L;
											else
												n_state = WZ_L_0;
										end
		WZ_L		        	  :	n_state =   WZ_L_TMP	;
		WZ_L_TMP			     :	n_state =   WZ_L_1		;
		WZ_L_1		        :	n_state =   WZ_R_0		;
		WZ_R_0		        :	begin
											if(add_end)
												n_state = WZ_R;
											else
												n_state = WZ_R_0;
										end
		WZ_R		           :	n_state =   WZ_R_TMP	;
		WZ_R_TMP			     :	n_state =   WZ_R_1		;
		WZ_R_1		        :	n_state =   EZM_L_0		;
		EZM_L_0		        :	begin
											if(mult_end)
												n_state = EZM_L;
											else
												n_state = EZM_L_0;
										end
		EZM_L		           :	n_state =   EZM_L_TMP   ;
		EZM_L_TMP           :	n_state =   EZM_L_1		;
		EZM_L_1		        :	n_state =   EZM_R_0		;
		EZM_R_0		        :	begin
											if(add_end)
												n_state = EZM_R;
											else
												n_state = EZM_R_0;
										end
		EZM_R		           :	n_state =   EZM_R_TMP	;
		EZM_R_TMP			  :	n_state =   EZM_R_1		;
		EZM_R_1		        :	n_state =   EXM_L_0		;
		EXM_L_0		        :	begin
											if(mult_end)
												n_state = EXM_L;
											else
												n_state = EXM_L_0;
										end
		EXM_L		           :	n_state =   EXM_L_TMP	;
		EXM_L_TMP			  :	n_state =   EXM_L_1		;
		EXM_L_1		        :	n_state =   EXM_R_0		;
		EXM_R_0		        :	begin
											if(sub_end)
												n_state = EXM_R;
											else
												n_state = EXM_R_0;
										end
		EXM_R		           :	n_state =   EXM_R_TMP	;
		EXM_R_TMP			  :	n_state =   EXM_R_1		;
		EXM_R_1		        :	n_state =   EYM_L_0		;
		EYM_L_0		        :	begin
											if(mult_end)
												n_state = EYM_L;
											else
												n_state = EYM_L_0;
										end
		EYM_L		           :	n_state =   EYM_L_TMP	;
		EYM_L_TMP			  :	n_state =   EYM_L_1		;
		EYM_L_1		        :	n_state =   EYM_R_0		;
		EYM_R_0		        :	begin
											if(sub_end)
												n_state = EYM_R;
											else
												n_state = EYM_R_0;
										end
		EYM_R		           :	n_state =   EYM_R_TMP	;
		EYM_R_TMP			  :	n_state =   EYM_R_1		;
		EYM_R_1		        :	n_state =   EYM_0		;
		EYM_0		      	  :	begin
											if(mult_end)
												n_state = EYM;
											else
												n_state = EYM_0;
										end
		EYM			        :	n_state =   EYM_TMP		;
		EYM_TMP			     :	n_state =   EYM_1		;
		EYM_1		        	  :	n_state =   LAST_0		;
		LAST_0		        :	begin
											if(sub_end)
												n_state = LAST;
											else
												n_state = LAST_0;
										end
		LAST		      		:	n_state =   LAST_TMP	;
		LAST_TMP					:	n_state =   END			;
		END			   		:	n_state = 	IDLE        ;
      default					:	n_state = 	IDLE        ;
	endcase
end

reg sclr, ce;	
reg [31:0] in_magx_tmp, in_magy_tmp, in_magz_tmp, in_magx_tmp_inv,
			  in_c11_tmp, in_c12_tmp, in_c13_tmp,
			  in_c21_tmp, in_c22_tmp, in_c23_tmp,
			  in_c31_tmp, in_c32_tmp, in_c33_tmp;
reg [31:0] out_exm_tmp, out_eym_tmp, out_ezm_tmp;
reg [31:0] norm_magx_tmp, norm_magy_tmp, norm_magz_tmp;
reg [31:0] hx_tmp, hy_tmp;
reg [31:0] bx_tmp, bz_tmp;
reg [31:0] wx_tmp, wy_tmp, wz_tmp;
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
			in_magx_tmp <= 32'h0;
			in_magy_tmp <= 32'h0;
			in_magz_tmp <= 32'h0;
			in_magx_tmp_inv <= 32'h0;
			in_c11_tmp <= 32'h0;
			in_c12_tmp <= 32'h0;
			in_c13_tmp <= 32'h0;
			in_c21_tmp <= 32'h0;
			in_c22_tmp <= 32'h0;
			in_c23_tmp <= 32'h0;
			in_c31_tmp <= 32'h0;
			in_c32_tmp <= 32'h0;
			in_c33_tmp <= 32'h0;
			out_exm_tmp <= 32'h0;
			out_eym_tmp <= 32'h0;
			out_ezm_tmp <= 32'h0;
			norm_magx_tmp <= 32'h0;
			norm_magy_tmp <= 32'h0;
			norm_magz_tmp <= 32'h0;
			hx_tmp <= 32'h0;
			hy_tmp <= 32'h0;
			bx_tmp <= 32'h0;
			bz_tmp <= 32'h0;
			wx_tmp <= 32'h0;
			wy_tmp <= 32'h0;
			wz_tmp <= 32'h0;
			out_exm <= 32'h0; 
			out_eym <= 32'h0; 
			out_ezm <= 32'h0;
			out_mag_finish <= 1'b0;
			sclr <= 1'b1;
			ce <= 1'b0;
			add_start <= 1'b0;
			mult_start <= 1'b0;
			sqrt_start <= 1'b0;
			div_start <= 1'b0;
			sub_start <= 1'b0;
			add_in_a <= 32'h0;
			add_in_b <= 32'h0;
			mult_in_a <= 32'h0;
			mult_in_b <= 32'h0;
			div_in_a <= 32'h0;
			div_in_b <= 32'h0;
			sqrt_in <= 32'h0;
			sub_in_a <= 32'h0;
			sub_in_b <= 32'h0;
		end
	else begin
			case(c_state)
				IDLE			:	begin
										if(in_mag_en) begin
												in_magx_tmp <= in_magx;
												in_magy_tmp <= in_magy;
												in_magz_tmp <= in_magz;
												in_magx_tmp_inv <= in_magx_inv;
												in_c11_tmp <= in_c11;
												in_c12_tmp <= in_c12;
												in_c13_tmp <= in_c13;
												in_c21_tmp <= in_c21;
												in_c22_tmp <= in_c22;
												in_c23_tmp <= in_c23;
												in_c31_tmp <= in_c31;
												in_c32_tmp <= in_c32;
												in_c33_tmp <= in_c33;
												sclr <= 1'b1;
												ce <= 1'b0;
												add_in_a <= 32'h0;
												add_in_b <= 32'h0;											
												mult_in_a <= 32'h0;
												mult_in_b <= 32'h0;
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
												add_in_a <= 32'h0;
												add_in_b <= 32'h0;											
												mult_in_a <= 32'h0;
												mult_in_b <= 32'h0;
												div_in_a <= 32'h0;
												div_in_b <= 32'h0;
												sqrt_in <= 32'h0;
												sub_in_a <= 32'h0;
												sub_in_b <= 32'h0;
										end
									end					
				START			:	begin
										out_mag_finish <= 1'b0;
										sclr <= 1'b0;
										ce <= 1'b1;						
									end
				MX_SQR  		:	begin
										mult_in_a <= in_magx_tmp;		// magx
										mult_in_b <= in_magx_tmp;		//	magx							
									end
				MX_SQR_1		:	begin
										mult_start <= 1'b1;						
									end
				MY_SQR_0		:	begin
										mult_start <= 1'b0;						
									end
				MY_SQR  		:	begin	
										add_in_a <= mult_out;			//	magx^2
										mult_in_a <= in_magy_tmp;		//	magy
										mult_in_b <= in_magy_tmp;		//	magy							
									end	
				MY_SQR_1		:	begin
										mult_start <= 1'b1;						
									end
				MZ_SQR_0		:	begin
										mult_start <= 1'b0;						
									end
				MZ_SQR  		:	begin	
										add_in_b <= mult_out;			//	magy^2
										mult_in_a <= in_magz_tmp;		//	magz
										mult_in_b <= in_magz_tmp;		//	magz							
									end	
				MZ_SQR_1		:	begin
										add_start <= 1'b1;
										mult_start <= 1'b1;						
									end
				M_ADD_0		:	begin
										add_start <= 1'b0;
										mult_start <= 1'b0;						
									end
				M_ADD   		:	begin	
										add_in_a <= add_out;				//	magx^2 + magy^2
										add_in_b <= mult_out;			//	magz^2						
									end
				M_ADD_1		:	begin
										add_start <= 1'b1;					
									end
				M_NORM_0		:	begin
										add_start <= 1'b0;						
									end
				M_NORM		:	begin
										sqrt_in <= add_out;           // magx^2 + magy^2 + magz^2
									end
				M_NORM_1		:	begin
										sqrt_start <= 1'b1;					
									end
				MX_NORM_0	:	begin
										sqrt_start <= 1'b0;						
									end
				MX_NORM 		:	begin
										div_in_a <= in_magy_tmp;		// magy
										div_in_b <= sqrt_out;			// sqrt( magx^2 + magy^2 + magz^2 )
									end
				MX_NORM_1	:	begin
										div_start <= 1'b1;					
									end
				MY_NORM_0	:	begin
										div_start <= 1'b0;						
									end
				MY_NORM 		:	begin
										norm_magx_tmp <= div_out;		// magy/sqrt( magx^2 + magy^2 + magz^2 )
										div_in_a <= in_magx_tmp_inv;	// -magx
										div_in_b <= sqrt_out;			// sqrt( magx^2 + magy^2 + magz^2 )
									end
				MY_NORM_1	:	begin
										div_start <= 1'b1;					
									end
				MZ_NORM_0	:	begin
										div_start <= 1'b0;						
									end
				MZ_NORM 		:	begin
									   norm_magy_tmp <= div_out;		// -magx/sqrt( magx^2 + magy^2 + magz^2 )
										div_in_a <= in_magz_tmp;		// magz
										div_in_b <= sqrt_out;			// sqrt( magx^2 + magy^2 + magz^2 )
									end
				MZ_NORM_1	:	begin
										div_start <= 1'b1;					
									end
				HX_L_0		:	begin
										div_start <= 1'b0;						
									end
				HX_L			:	begin
									   norm_magz_tmp <= div_out;		// magz/sqrt( magx^2 + magy^2 + magz^2 )
										mult_in_a <= norm_magx_tmp;	// magx
										mult_in_b <= in_c11_tmp;		// c11
									end					
				HX_L_1		:	begin
										mult_start <= 1'b1;					
									end
				HX_C_0		:	begin
										mult_start <= 1'b0;						
									end
				HX_C			:	begin
										add_in_a <= mult_out;			// magx*c11
										mult_in_a <= norm_magy_tmp;	// magy
										mult_in_b <= in_c21_tmp;		// c21
									end
				HX_C_1		:	begin
										mult_start <= 1'b1;					
									end
				HX_R_0		:	begin
										mult_start <= 1'b0;						
									end
				HX_R			:	begin
										add_in_b <= mult_out;			// magy*c21
										mult_in_a <= norm_magz_tmp;	// magz
										mult_in_b <= in_c31_tmp;		// c31
									end
				HX_R_1		:	begin
										add_start <= 1'b1;
										mult_start <= 1'b1;					
									end
				HY_L_0		:	begin
										add_start <= 1'b0;
										mult_start <= 1'b0;						
									end
				HY_L			:  begin
										add_in_a <= add_out;				// magx*c11 +  magy*c21
										add_in_b <= mult_out;			// magz*c31
										mult_in_a <= norm_magx_tmp;	// magx
										mult_in_b <= in_c12_tmp;		// c12
									end
				HY_L_1		:	begin
										add_start <= 1'b1;
										mult_start <= 1'b1;					
									end
				HY_C_0		:	begin
										add_start <= 1'b0;
										mult_start <= 1'b0;						
									end
				HY_C			:	begin
										hx_tmp <= add_out;				// hx = magx*c11 +  magy*c21 + magz*c31
										add_in_a <= mult_out;			// magx*c12
										mult_in_a <= norm_magy_tmp;	// magy
										mult_in_b <= in_c22_tmp;		// c22
									end
				HY_C_1		:	begin
										mult_start <= 1'b1;					
									end
				HY_R_0		:	begin
										mult_start <= 1'b0;						
									end
				HY_R			:	begin
										add_in_b <= mult_out;			// magy*c22
										mult_in_a <= norm_magz_tmp;	// magz
										mult_in_b <= in_c32_tmp;		// c32
									end
				HY_R_1		:	begin
										add_start <= 1'b1;
										mult_start <= 1'b1;					
									end
				BZ_L_0		:	begin
										add_start <= 1'b0;
										mult_start <= 1'b0;						
									end
				BZ_L			:  begin
										add_in_a <= add_out;				// magx*c12 +  magy*c22
										add_in_b <= mult_out;			// magz*c32
										mult_in_a <= norm_magx_tmp;	// magx
										mult_in_b <= in_c13_tmp;		// c13
									end
				BZ_L_1		:	begin
										add_start <= 1'b1;
										mult_start <= 1'b1;					
									end
				BZ_C_0		:	begin
										add_start <= 1'b0;
										mult_start <= 1'b0;						
									end
				BZ_C			:	begin
										hy_tmp <= add_out;				// hy = magx*c12 +  magy*c22 + magz*c32
										add_in_a <= mult_out;			// magx*c13
										mult_in_a <= norm_magy_tmp;	// magy
										mult_in_b <= in_c23_tmp;		// c23
									end
				BZ_C_1		:	begin
										mult_start <= 1'b1;					
									end
				BZ_R_0		:	begin
										mult_start <= 1'b0;						
									end
				BZ_R			:	begin
										add_in_b <= mult_out;			// magy*c23
										mult_in_a <= norm_magz_tmp;	// magz
										mult_in_b <= in_c33_tmp;		// c33
									end					
				BZ_R_1		:	begin
										add_start <= 1'b1;
										mult_start <= 1'b1;					
									end
				BX_HX_0		:	begin
										add_start <= 1'b0;
										mult_start <= 1'b0;						
									end
				BX_HX			:  begin
										add_in_a <= add_out;				// magx*c13 +  magy*c23
										add_in_b <= mult_out;			// magz*c33
										mult_in_a <= hx_tmp;				// hx
										mult_in_b <= hx_tmp;				// hx
									end
				BX_HX_1		:	begin
										add_start <= 1'b1;
										mult_start <= 1'b1;					
									end
				BX_HY_0		:	begin
										add_start <= 1'b0;
										mult_start <= 1'b0;						
									end
				BX_HY			:	begin
										bz_tmp <= add_out;				// bz = magx*c13 +  magy*c23 + magz*c33
										add_in_a <= mult_out;			// hx^2
										mult_in_a <= hy_tmp;				// hy
										mult_in_b <= hy_tmp;				// hy
									end
				BX_HY_1		:	begin
										mult_start <= 1'b1;					
									end
				BX_ADD_0		:	begin
										mult_start <= 1'b0;						
									end
				BX_ADD		:	begin
										add_in_b <= mult_out;			// hy^2;
										mult_in_a <= bz_tmp;				// bz
										mult_in_b <= in_c13_tmp;		// c13
									end
				BX_ADD_1		:	begin
										add_start <= 1'b1;
										mult_start <= 1'b1;					
									end
				BX_SQRT_0	:	begin
										add_start <= 1'b0;
										mult_start <= 1'b0;						
									end
				BX_SQRT		:  begin
										sqrt_in <= add_out;				// hx^2 + hy^2
										add_in_a <= mult_out;			// bz*c13
									end
				BX_SQRT_1	:	begin
										sqrt_start <= 1'b1;					
									end
				WX_0			:	begin
										sqrt_start <= 1'b0;						
									end
				WX				:  begin
										bx_tmp <= sqrt_out;
										mult_in_a <= sqrt_out;			// bx
										mult_in_b <= in_c11_tmp;		// c11
									end
				WX_1			:	begin
										mult_start <= 1'b1;					
									end
				WY_L_0		:	begin
										mult_start <= 1'b0;						
									end
				WY_L			:  begin
										add_in_b <= mult_out;			// bx*c11
										mult_in_a <= bx_tmp;				// bx
										mult_in_b <= in_c21_tmp;		// c21
									end
				WY_L_1		:	begin
										add_start <= 1'b1;
										mult_start <= 1'b1;					
									end
				WY_R_0		:	begin
										add_start <= 1'b0;
										mult_start <= 1'b0;						
									end
				WY_R			:  begin					
										wx_tmp <= add_out;				// wx = bx*c11 + bz*c13
										add_in_a <= mult_out;			// bx*c21
										mult_in_a <= bz_tmp;				// bz
										mult_in_b <= in_c23_tmp;		// c23
									end
				WY_R_1		:	begin
										mult_start <= 1'b1;					
									end
				WZ_L_0		:	begin
										mult_start <= 1'b0;						
									end
				WZ_L			:	begin
										add_in_b <= mult_out;			// bz*c23
										mult_in_a <= bx_tmp;				// bx
										mult_in_b <= in_c31_tmp;		// c31
									end
				WZ_L_1		:	begin
										add_start <= 1'b1;
										mult_start <= 1'b1;					
									end
				WZ_R_0		:	begin
										add_start <= 1'b0;
										mult_start <= 1'b0;						
									end
				WZ_R			:	begin
										wy_tmp <= add_out;				// wy = bx*c21 + bz*c23
										add_in_a <= mult_out;			// bx*c31
										mult_in_a <= bz_tmp;				// bz
										mult_in_b <= in_c33_tmp;		// c33
									end									
				WZ_R_1		:	begin
										mult_start <= 1'b1;					
									end
				EZM_L_0		:	begin
										mult_start <= 1'b0;						
									end
				EZM_L			:	begin
									   add_in_b <= mult_out;			// bz*c33
										mult_in_a <= norm_magx_tmp;	// magx
										mult_in_b <= wy_tmp;				// wy
									end
				EZM_L_1		:	begin
										add_start <= 1'b1;
										mult_start <= 1'b1;					
									end
				EZM_R_0		:	begin
										add_start <= 1'b0;
										mult_start <= 1'b0;						
									end
				EZM_R			:	begin
										wz_tmp <= add_out;				// wz = bx*c31 + bz*c33
										sub_in_a <= mult_out;			// magx*wy
										mult_in_a <= norm_magy_tmp;	// magy
										mult_in_b <= wx_tmp;				// wx
									end
				EZM_R_1		:	begin
										mult_start <= 1'b1;					
									end
				EXM_L_0		:	begin
										mult_start <= 1'b0;						
									end
				EXM_L			:	begin
										sub_in_b <= mult_out;			// magy*wx
										mult_in_b <= wz_tmp;				// wz
									end
				EXM_L_1		:	begin
										sub_start <= 1'b1;
										mult_start <= 1'b1;					
									end
				EXM_R_0		:	begin
										sub_start <= 1'b0;
										mult_start <= 1'b0;						
									end
				EXM_R			:	begin
										out_ezm_tmp <= sub_out;			// ezm = magx*wy - magy*wx
										sub_in_a <= mult_out;			// magy*wz
										mult_in_a <= norm_magz_tmp;	// magz
										mult_in_b <= wy_tmp;				// wy
									end
				EXM_R_1		:	begin
										mult_start <= 1'b1;					
									end
				EYM_L_0		:	begin
										mult_start <= 1'b0;						
									end
				EYM_L			:	begin
										sub_in_b <= mult_out;			// magz*wy
										mult_in_b <= wx_tmp;				// wx
									end
				EYM_L_1		:	begin
										sub_start <= 1'b1;
										mult_start <= 1'b1;					
									end
				EYM_R_0		:	begin
										sub_start <= 1'b0;
										mult_start <= 1'b0;						
									end
				EYM_R			:	begin
										out_exm_tmp <= sub_out;			// exm = magy*wz - magz*wy
										sub_in_a <= mult_out;			// magz*wx
										mult_in_a <= norm_magx_tmp;	// magx
										mult_in_b <= wz_tmp;				// wz
									end
				EYM_R_1		:	begin
										mult_start <= 1'b1;					
									end
				EYM_0			:	begin
										mult_start <= 1'b0;						
									end
				EYM			:	begin
										sub_in_b <= mult_out;			// magx*wz
									end
				EYM_1		:	begin
										sub_start <= 1'b1;					
									end
				LAST_0		:	begin
										sub_start <= 1'b0;						
									end
				LAST			:	begin
										out_eym_tmp <= sub_out;			// eym = magz*wx - magx*wz
									end
				END			:	begin
										out_exm <= out_exm_tmp;
										out_eym <= out_eym_tmp;
										out_ezm <= out_ezm_tmp;
										out_mag_finish <= 1'b1;
									end
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
