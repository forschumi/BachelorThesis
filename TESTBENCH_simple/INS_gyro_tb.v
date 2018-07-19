`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:01:38 04/24/2015 
// Design Name: 
// Module Name:    INS_gyro_tb 
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
//`include "F:/quadrotor/prj_INS/qrc/src/INS_gyro.v"
module INS_gyro_tb;

parameter Kp = 32'h41200000, Ki = 32'h3A83126F;

reg clk, rst, in_gyro_en;
reg [31:0] in_gyrox, in_gyroy, in_gyroz,	
           in_exa, in_eya, in_eza,
           in_exm, in_eym, in_ezm,	
           in_exi, in_eyi, in_ezi;	

parameter t = 20;

initial begin
	clk = 1'b1;
	rst = 1'b1;
	in_gyrox = 32'd0; 
	in_gyroy = 32'd0; 
	in_gyroz = 32'd0;	
	in_exa = 32'd0; 
	in_eya = 32'd0; 
	in_eza = 32'd0;
	in_exm = 32'd0;
	in_eym = 32'd0;
	in_ezm = 32'd0;
	in_exi = 32'd0;
	in_eyi = 32'd0;
	in_ezi = 32'd0;
	in_gyro_en = 1'b0;
end

always #(t/2) clk = ~clk;

initial begin
	#(t*8)
		rst = 1'b0;
	#(t*2)
		rst = 1'b1;
	#t
		in_gyrox = 32'h3F800000; 
		in_gyroy = 32'h40000000; 
		in_gyroz = 32'h40400000;	
		in_exa = 32'h3F800000; 
		in_eya = 32'h40000000; 
		in_eza = 32'h40400000;
		in_exm = 32'h3F800000;
		in_eym = 32'h40000000;
		in_ezm = 32'h40400000;
		in_exi = 32'h3F800000;
		in_eyi = 32'h40000000;
		in_ezi = 32'h40400000;
	#(t)
		in_gyro_en = 1'b1;
	#(t*5)
		in_gyro_en = 1'b0;
	#(t*300)
		in_gyrox = 32'h3F800000; 
		in_gyroy = 32'h3F800000; 
		in_gyroz = 32'h3F800000;	
		in_exa = 32'h0; 
		in_eya = 32'h0; 
		in_eza = 32'h0;
		in_exm = 32'h0;
		in_eym = 32'h0;
		in_ezm = 32'h0;
		in_exi = 32'h0;
		in_eyi = 32'h0;
		in_ezi = 32'h0;
	#(t)
		in_gyro_en = 1'b1;
	#(t*5)
		in_gyro_en = 1'b0;
end


/*wire [31:0] out_exi, out_eyi, out_ezi,
            out_wx, out_wy, out_wz;
wire out_gyro_finish;	
INS_gyro u1(
	.clk(clk)									,		//时钟信号
	.rst(rst)									,		//复位信号，低电平有效
	.in_gyro_en(in_gyro_en)					,		//陀螺仪使能信号
	.in_gyrox(in_gyrox)						,		//陀螺仪X轴测量值
	.in_gyroy(in_gyroy)						,		//陀螺仪Y轴测量值
	.in_gyroz(in_gyroz)						,		//陀螺仪Z轴测量值
	.in_exa(in_exa)							,		//加速度计X轴测量误差值
	.in_eya(in_eya)							,		//加速度计Y轴测量误差值
	.in_eza(in_eza)							,		//加速度计Z轴测量误差值
	.in_exm(in_exm)							,		//电子罗盘X轴测量误差值
	.in_eym(in_eym)							,		//电子罗盘Y轴测量误差值
	.in_ezm(in_ezm)							,		//电子罗盘Z轴测量误差值
	.in_exi(in_exi)							,		//电子罗盘X轴前次积分误差值
	.in_eyi(in_eyi)							,		//电子罗盘Y轴前次积分误差值
	.in_ezi(in_ezi)							,		//电子罗盘Z轴前次积分误差值
	.out_exi(out_exi)							,		//电子罗盘X轴本次积分误差值
	.out_eyi(out_eyi)							,		//电子罗盘Y轴本次积分误差值
	.out_ezi(out_ezi)							,		//电子罗盘Z轴本次积分误差值
	.out_wx(out_wx)							,		//陀螺仪X轴测量修正值
	.out_wy(out_wy)							,		//陀螺仪Y轴测量修正值
	.out_wz(out_wz)							,		//陀螺仪Z轴测量修正值
	.out_gyro_finish(out_gyro_finish)			//陀螺仪误差修正完毕，高电平有效
);*/

//------------------------------------------------------

reg [31:0] out_exi, out_eyi, out_ezi,
            out_wx, out_wy, out_wz;
reg out_gyro_finish;	
parameter IDLE    		= 		7'd0,
			 START       	=		7'd1,
			 GX          	=		7'd2,
			 GX_TMP  		=		7'd3,
			 GX_1        	=		7'd4,
			 GY_0        	=		7'd5,
			 GY          	=		7'd6,
			 GY_TMP  		= 		7'd7,
			 GY_1        	= 		7'd8,
			 GZ_0        	= 		7'd9,
			 GZ          	= 		7'd10,
			 GZ_TMP  		= 		7'd11,
			 GZ_1        	= 		7'd12,
			 EX_0        	= 		7'd13,
			 EX		    	= 		7'd14,
			 EX_TMP  		=		7'd15,
			 EX_1        	=		7'd16,
			 EY_0        	= 		7'd17,
			 EY				= 		7'd18,
			 EY_TMP  		= 		7'd19,
			 EY_1        	= 		7'd20,
			 EZ_0        	= 		7'd21,
			 EZ		    	= 		7'd22,
			 EZ_TMP  		= 		7'd23,
			 EZ_1        	= 		7'd24,
			 EXP_0       	= 		7'd25,
			 EXP         	= 		7'd26,
			 EXP_TMP  		= 		7'd27,
			 EXP_1       	= 		7'd28,
			 EYP_0       	= 		7'd29,
			 EYP         	= 		7'd30,
			 EYP_TMP			=		7'd31,
			 EYP_1       	=		7'd32,
			 EZP_0       	=		7'd33,
			 EZP         	=		7'd34,
			 EZP_TMP 		=		7'd35,
			 EZP_1       	=		7'd36,
			 EI_0        	=		7'd37,
			 EI          	=		7'd38,
			 EI_TMP 			=	  	7'd39,
			 EI_1        	=	  	7'd40,
			 EXI_0       	= 		7'd41,		
          EXI         	=		7'd42,
          EXI_TMP 	   =		7'd43,
          EXI_1         =		7'd44,
          EYI_0         =		7'd45,
          EYI           =		7'd46,
          EYI_TMP		   = 		7'd47,      
          EYI_1         = 		7'd48,
          EZI_0         = 		7'd49,
          EZI				= 		7'd50,	
          EZI_TMP		   =		7'd51,
          EZI_1         =		7'd52,
          WX_E_0        =		7'd53,      
          WX_E          =		7'd54,
          WX_E_TMP	   =		7'd55,
          WX_E_1      	=		7'd56,	
          WX_0          = 		7'd57,
          WX            = 		7'd58,
          WX_TMP		   = 		7'd59,
          WX_1        	= 		7'd60,	
          WY_E_0        = 		7'd61,
          WY_E          =		7'd62,
          WY_E_TMP	   =		7'd63,
          WY_E_1        =		7'd64,
          WY_0          =		7'd65,
          WY			   =		7'd66,
          WY_TMP		   =		7'd67,
          WY_1          = 		7'd68,
          WZ_E_0        = 		7'd69,
          WZ_E          = 		7'd70,
          WZ_E_TMP		= 		7'd71,
          WZ_E_1        =		7'd72,
          WZ_0          =		7'd73,
          WZ			   =		7'd74,
          WZ_TMP		   =		7'd75,
          WZ_1          =		7'd76,
          LAST_0        =		7'd77,
          LAST          = 		7'd78,
          LAST_TMP	   = 		7'd79,
          END	         = 		7'd80;

reg [6:0] c_state, n_state;

always @ (posedge clk or negedge rst) begin
	if(!rst) begin
			c_state <= IDLE;
		end	
		else begin
			c_state <= n_state;
	end
end
	
wire add_end, mult_end;	
always @ (c_state or in_gyro_en or add_end or mult_end) begin
	case(c_state)
		IDLE				: 	begin
									if(in_gyro_en) n_state = START;
									else n_state = IDLE;
								end		
		START       	:	n_state =   GX               ;
		GX          	:	n_state =   GX_TMP             ;
		GX_TMP  			:	n_state = 	GX_1;
		GX_1        	:	n_state =   GY_0             ;
		GY_0        	:	begin
									if(mult_end)
										n_state = GY;
									else
										n_state = GY_0;
								end
		GY          	:	n_state =   GY_TMP             ;
		GY_TMP  			:	n_state =   GY_1;
		GY_1        	:	n_state =   GZ_0             ;
		GZ_0        	:	begin
									if(mult_end)
										n_state = GZ;
									else
										n_state = GZ_0;
								end
		GZ          	:	n_state =   GZ_TMP             ;
		GZ_TMP  			:	n_state = 	GZ_1;
		GZ_1        	:	n_state =   EX_0             ;
		EX_0        	:	begin
									if(mult_end)
										n_state = EX;
									else
										n_state = EX_0;
								end
		EX		    		:	n_state =   EX_TMP             ;
		EX_TMP  			:	n_state = 	EX_1;
		EX_1        	:	n_state =   EY_0             ;
		EY_0        	:	begin
									if(add_end)
										n_state = EY;
									else
										n_state = EY_0;
								end
		EY					:	n_state =   EY_TMP             ;
		EY_TMP  			:	n_state = 	EY_1;
		EY_1        	:	n_state =   EZ_0             ;
		EZ_0        	:	begin
									if(add_end)
										n_state = EZ;
									else
										n_state = EZ_0;
								end
		EZ		    		:	n_state =   EZ_TMP             ;
		EZ_TMP  			:	n_state = 	EZ_1;
		EZ_1        	:	n_state =   EXP_0            ;
		EXP_0       	: 	begin
									if(add_end)
										n_state = EXP;
									else
										n_state = EXP_0;
								end
		EXP         	: 	n_state =   EXP_TMP            ;
		EXP_TMP  		:	n_state = 	EXP_1;
		EXP_1       	:	n_state =   EYP_0            ;
		EYP_0       	:	begin
									if(mult_end)
										n_state = EYP;
									else
										n_state = EYP_0;
								end
		EYP         	:	n_state =   EYP_TMP            ;
		EYP_TMP			:	n_state = 	EYP_1;
		EYP_1       	:	n_state =   EZP_0            ;
		EZP_0       	:	begin
									if(mult_end)
										n_state = EZP;
									else
										n_state = EZP_0;
								end
		EZP         	:	n_state =   EZP_TMP            ;
		EZP_TMP 			:	n_state = 	EZP_1;
		EZP_1       	:	n_state =   EI_0             ;
		EI_0        	:	begin
									if(mult_end)
										n_state = EI;
									else
										n_state = EI_0;
								end
		EI          	:	n_state =   EI_TMP             ;
		EI_TMP 			: 	n_state = 	EI_1;	
		EI_1        	:	n_state =   EXI_0            ;
		EXI_0       	:	begin
									if(mult_end)
										n_state = EXI;
									else
										n_state = EXI_0;
								end
		EXI         	:	n_state =   EXI_TMP            ;
		EXI_TMP 			:	n_state = 	EXI_1;
		EXI_1       	:	n_state =   EYI_0            ;
		EYI_0       	:	begin
									if(add_end)
										n_state = EYI;
									else
										n_state = EYI_0;
								end
		EYI         	:	n_state =   EYI_TMP            ;
		EYI_TMP			:	n_state = 	EYI_1;
		EYI_1       	:	n_state =   EZI_0            ;
		EZI_0       	:  begin
									if(add_end)
										n_state = EZI;
									else
										n_state = EZI_0;
								end
		EZI				:  n_state =   EZI_TMP            ;
		EZI_TMP			:	n_state =	EZI_1;
		EZI_1       	:	n_state =   WX_E_0           ;
		WX_E_0      	:  begin
									if(add_end)
										n_state = WX_E;
									else
										n_state = WX_E_0;
								end
		WX_E        	:	n_state =   WX_E_TMP           ;
		WX_E_TMP			:	n_state = 	WX_E_1;
		WX_E_1      	:	n_state =   WX_0             ;
		WX_0        	:	begin
									if(add_end)
										n_state = WX;
									else
										n_state = WX_0;
								end
		WX          	:	n_state =   WX_TMP             ;
		WX_TMP			:	n_state = 	WX_1;
		WX_1        	:	n_state =   WY_E_0           ;
		WY_E_0      	:	begin
									if(add_end)
										n_state = WY_E;
									else
										n_state = WY_E_0;
								end
		WY_E        	:	n_state =   WY_E_TMP           ;
		WY_E_TMP			:	n_state = 	WY_E_1;
		WY_E_1      	:	n_state =   WY_0             ;
		WY_0        	:	begin
									if(add_end)
										n_state = WY;
									else
										n_state = WY_0;
								end
		WY					:	n_state =   WY_TMP             ;
		WY_TMP			:	n_state = 	WY_1;
		WY_1        	:	n_state =   WZ_E_0           ;
		WZ_E_0      	:	begin
									if(add_end)
										n_state = WZ_E;
									else
										n_state = WZ_E_0;
								end
		WZ_E        	:	n_state =   WZ_E_TMP           ;
		WZ_E_TMP			:	n_state = 	WZ_E_1;
		WZ_E_1      	:	n_state =   WZ_0             ;
		WZ_0        	:	begin
									if(add_end)
										n_state = WZ;
									else
										n_state = WZ_0;
								end
		WZ					:	n_state =   WZ_TMP             ;
		WZ_TMP			:  n_state = 	WZ_1;
		WZ_1        	:	n_state =   LAST_0           ;
		LAST_0      	:	begin
									if(add_end)
										n_state = LAST;
									else
										n_state = LAST_0;
								end
		LAST        	:	n_state =   LAST_TMP	        ;
		LAST_TMP			:  n_state = 	END;
		END	        	: 	n_state = 	IDLE             ;
		default			:  n_state = 	IDLE             ;
	endcase
end		

parameter DEG2RAD = 32'h3C8EFA36;

reg sclr, ce;
reg [31:0] in_gyrox_tmp, in_gyroy_tmp, in_gyroz_tmp,	
			  in_gyrox_tmp_tmp, in_gyroy_tmp_tmp, in_gyroz_tmp_tmp,
           in_exa_tmp, in_eya_tmp, in_eza_tmp,
           in_exm_tmp, in_eym_tmp, in_ezm_tmp,	
           in_exi_tmp, in_eyi_tmp, in_ezi_tmp;
reg [31:0] out_wx_tmp, out_wy_tmp, out_wz_tmp;
reg [31:0] ex_tmp, ey_tmp, ez_tmp,
			  out_exi_tmp, out_eyi_tmp, out_ezi_tmp,
			  exp_tmp, eyp_tmp, ezp_tmp;
reg add_start, mult_start;
reg [31:0] mult_in_a, mult_in_b;
wire [31:0] mult_out;
reg [31:0] add_in_a, add_in_b;
wire [31:0] add_out;

always @ (posedge clk or negedge rst) begin
	if(!rst) begin
			in_gyrox_tmp <= 32'h0;
			in_gyroy_tmp <= 32'h0;
			in_gyroz_tmp <= 32'h0;
			in_gyrox_tmp_tmp <= 32'h0;
			in_gyroy_tmp_tmp <= 32'h0;
			in_gyroz_tmp_tmp <= 32'h0;
			in_exa_tmp <= 32'h0;
			in_eya_tmp <= 32'h0;
			in_eza_tmp <= 32'h0;
			in_exm_tmp <= 32'h0;
			in_eym_tmp <= 32'h0;
			in_ezm_tmp <= 32'h0;
			in_exi_tmp <= 32'h0;
			in_eyi_tmp <= 32'h0;
			in_ezi_tmp <= 32'h0;
			ex_tmp <= 32'h0;
			ey_tmp <= 32'h0;
			ez_tmp <= 32'h0;
			out_exi_tmp <= 32'h0; 
			out_eyi_tmp <= 32'h0; 
			out_ezi_tmp <= 32'h0;
			exp_tmp <= 32'h0; 
			eyp_tmp <= 32'h0; 
			ezp_tmp <= 32'h0;
			out_wx_tmp <= 32'h0; 
			out_wy_tmp <= 32'h0; 
			out_wz_tmp <= 32'h0;
			out_wx <= 32'h0;
			out_wy <= 32'h0;
			out_wz <= 32'h0;
			out_exi <= 32'h0;
			out_eyi <= 32'h0;
			out_ezi <= 32'h0;
			out_gyro_finish <= 1'b0;
			add_start <= 1'b0;
			mult_start <= 1'b0;
			sclr <= 1'b1;
			ce <= 1'b0;
			add_in_a <= 32'h0;
			add_in_b <= 32'h0;
			mult_in_a <= 32'h0;
			mult_in_b <= 32'h0;
		end
	else begin
		case(c_state)
			IDLE			:	begin
										if(in_gyro_en) begin
												in_gyrox_tmp_tmp <= in_gyrox;
												in_gyroy_tmp_tmp <= in_gyroy;
												in_gyroz_tmp_tmp <= in_gyroz;
												in_exa_tmp <= in_exa;
												in_eya_tmp <= in_eya;
												in_eza_tmp <= in_eza;
												in_exm_tmp <= in_exm;
												in_eym_tmp <= in_eym;
												in_ezm_tmp <= in_ezm;
												in_exi_tmp <= in_exi;
												in_eyi_tmp <= in_eyi;
												in_ezi_tmp <= in_ezi;
												sclr <= 1'b1;
												ce <= 1'b0;
												add_start <= 1'b0;
												mult_start <= 1'b0;
												mult_in_a <= 32'h0;
												mult_in_b <= 32'h0;
												add_in_a <= 32'h0;
												add_in_b <= 32'h0;
											end
											else begin
												sclr <= 1'b1;
												ce <= 1'b0;
												add_start <= 1'b0;
												mult_start <= 1'b0;
												mult_in_a <= 32'h0;
												mult_in_b <= 32'h0;
												add_in_a <= 32'h0;
												add_in_b <= 32'h0;
										end
									end
				START			:	begin
										out_gyro_finish <= 1'b0;
										sclr <= 1'b0;
										ce <= 1'b1;
									end
				GX				:	begin
										mult_in_b <= DEG2RAD;					// pi/180
										mult_in_a <= in_gyrox_tmp_tmp;		
									end
				GX_1			:	begin
										mult_start <= 1'b1;	
									end
				GY_0			:	begin
										mult_start <= 1'b0;	
									end
				GY				:	begin
										in_gyrox_tmp <= mult_out;				// gyrox
										mult_in_b <= DEG2RAD;					// pi/180
										mult_in_a <= in_gyroy_tmp_tmp;
									end
				GY_1			:	begin
										mult_start <= 1'b1;	
									end
				GZ_0			:	begin
										mult_start <= 1'b0;	
									end
				GZ				:	begin
										in_gyroy_tmp <= mult_out;				// gyroy
										mult_in_b <= DEG2RAD;					// pi/180
										mult_in_a <= in_gyroz_tmp_tmp;
									end
				GZ_1			:	begin
										mult_start <= 1'b1;	
									end
				EX_0			:	begin
										mult_start <= 1'b0;	
									end
				EX		  		:  begin
										in_gyroz_tmp <= mult_out;				// gyroz
										add_in_a <= in_exa_tmp;					// exa
										add_in_b <= in_exm_tmp;					// exm
									end			
				EX_1			:	begin
										add_start <= 1'b1;	
									end
				EY_0			:	begin
										add_start <= 1'b0;	
									end
				EY				:	begin			
										ex_tmp <= add_out;						// ex = exa + exm
										add_in_a <= in_eya_tmp;					// eya
										add_in_b <= in_eym_tmp;					// eym
									end			
				EY_1			:	begin
										add_start <= 1'b1;	
									end
				EZ_0			:	begin
										add_start <= 1'b0;	
									end
				EZ				:	begin			
										ey_tmp <= add_out;						// ey = eya + eym
										add_in_a <= in_eza_tmp;					// eza
										add_in_b <= in_ezm_tmp;					// ezm
									end			
				EZ_1			:	begin
										add_start <= 1'b1;	
									end
				EXP_0			:	begin
										add_start <= 1'b0;	
									end
				EXP			:	begin			
										ez_tmp <= add_out;						// ez = eza + ezm
										mult_in_a <= Kp;							// kp
										mult_in_b <= ex_tmp;						// ex
									end
				EXP_1			:	begin
										mult_start <= 1'b1;	
									end
				EYP_0			:	begin
										mult_start <= 1'b0;	
									end
				EYP			:	begin
										exp_tmp <= mult_out;						// exp = kp*ex
										mult_in_b <= ey_tmp;						// ey
									end
				EYP_1			:	begin
										mult_start <= 1'b1;	
									end
				EZP_0			:	begin
										mult_start <= 1'b0;	
									end
				EZP			:	begin
										eyp_tmp <= mult_out;						// eyp = kp*ey
										mult_in_b <= ez_tmp;						// ez
									end
				EZP_1			:	begin
										mult_start <= 1'b1;	
									end
				EI_0			:	begin
										mult_start <= 1'b0;	
									end
				EI				:	begin
										ezp_tmp <= mult_out;						// ezp = kp*ez
										mult_in_a <= Ki;							// ki
										mult_in_b <= ex_tmp;						// ex
									end
				EI_1			:	begin
										mult_start <= 1'b1;	
									end
				EXI_0			:	begin
										mult_start <= 1'b0;	
									end
				EXI			:	begin					
										add_in_a <= mult_out;					// ki*ex
										add_in_b <= in_exi_tmp;					// exi_in
										mult_in_b <= ey_tmp;						// ey
									end
				EXI_1			:	begin
										mult_start <= 1'b1;	
										add_start <= 1'b1;	
									end
				EYI_0			:	begin
										mult_start <= 1'b0;	
										add_start <= 1'b0;	
									end
				EYI			:	begin
										out_exi_tmp <= add_out;					// exi = exi_in + ki*ex
										add_in_a <= mult_out;					// ki*ey
										add_in_b <= in_eyi_tmp;					// eyi_in
										mult_in_b <= ez_tmp;						// ez
									end
				EYI_1			:	begin
										mult_start <= 1'b1;	
										add_start <= 1'b1;	
									end
				EZI_0			:	begin
										mult_start <= 1'b0;	
										add_start <= 1'b0;	
									end
				EZI			:	begin
										out_eyi_tmp <= add_out;					// eyi = eyi_in + ki*ey
										add_in_a <= mult_out;					// ki*ez
										add_in_b <= in_ezi_tmp;					// ezi_in
									end					
				EZI_1			:	begin	
										add_start <= 1'b1;	
									end
				WX_E_0		:	begin
										add_start <= 1'b0;	
									end
				WX_E			:	begin					
										out_ezi_tmp <= add_out;					// ezi = ezi_in + ki*ez
										add_in_a <= exp_tmp;						// exp
										add_in_b <= out_exi_tmp;				// exi
									end
				WX_E_1		:	begin	
										add_start <= 1'b1;	
									end
				WX_0			:	begin
										add_start <= 1'b0;	
									end
				WX				:	begin					
										add_in_a <= add_out;						// exp + exi
										add_in_b <= in_gyrox_tmp;				// gyrox
									end
				WX_1			:	begin	
										add_start <= 1'b1;	
									end
				WY_E_0		:	begin
										add_start <= 1'b0;	
									end
				WY_E			:	begin		
										out_wx_tmp <= add_out;					// wx = gyrox + exp + exi
										add_in_a <= eyp_tmp;						// eyp
										add_in_b <= out_eyi_tmp;            // eyi
									end                                    
				WY_E_1		:	begin	
										add_start <= 1'b1;	
									end
				WY_0			:	begin
										add_start <= 1'b0;	
									end
				WY				:	begin					                     
										add_in_a <= add_out;                // eyp + eyi
										add_in_b <= in_gyroy_tmp;           // gyroy
									end					                     
				WY_1			:	begin	
										add_start <= 1'b1;	
									end
				WZ_E_0		:	begin
										add_start <= 1'b0;	
									end
				WZ_E			:	begin		                              
										out_wy_tmp <= add_out;              // wy = gyroy + eyp + eyi
										add_in_a <= ezp_tmp;						// ezp
										add_in_b <= out_ezi_tmp;            // ezi
									end                                    
				WZ_E_1		:	begin	
										add_start <= 1'b1;	
									end
				WZ_0			:	begin
										add_start <= 1'b0;	
									end
				WZ				:	begin					                     
										add_in_a <= add_out;                // ezp + ezi
										add_in_b <= in_gyroz_tmp;           // gyroz
									end						                  
				WZ_1			:	begin	
										add_start <= 1'b1;	
									end
				LAST_0		:	begin
										add_start <= 1'b0;	
									end
				LAST			:	begin					                     
										out_wz_tmp <= add_out;              // wz = gyroz + ezp + ezi
									end
				END			:	begin
										out_exi <= out_exi_tmp;
										out_eyi <= out_eyi_tmp;
										out_ezi <= out_ezi_tmp;
										out_wx <= out_wx_tmp;
										out_wy <= out_wy_tmp;
										out_wz <= out_wz_tmp;
										out_gyro_finish <= 1'b1;
									end
				default		:  begin
										mult_in_a <= mult_in_a;
										mult_in_b <= mult_in_b;
										add_in_a <= add_in_a;
										add_in_b <= add_in_b;
										mult_start <= mult_start;
										add_start <= add_start;
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

endmodule
