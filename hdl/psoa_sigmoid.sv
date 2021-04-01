// arquivo contendo a descricao sitetizavel

`timescale 1ns / 1ps

module psoa_sigmoid (
	input 	logic [15:0] x,
	input 	logic clk,
	output 	logic [15:0] f_x
);
	
	// sinais auxiliares
	logic [31:0] x1;
	logic [36:0] x2;
	logic [16:0] x3;
	logic [23:0] x4;
	logic [15:0] x5, x6;
	logic [15:0] x_in_temp;
	
	// teste
//	logic [4:0] x1;
//	logic [9:0] x2;
//	logic [16:0] x3;
//	logic [23:0] x4;
//	logic [15:0] x5, x6;
	// teste
	
	always @ (posedge clk) begin

		if (x >= 4096) begin

			f_x <= 1024;

		end else if ((x >= 0) && (x < 4096)) begin
			
			f_x <= x3 + x6;

		end
	
	end // always
	
	always @ (*) begin
		x_in_temp = x;
		x1 = x*x_in_temp;
		x2 = (x1<<5) + (x1<<2);
		x3 = -(x2>>20);
		
		// teste
//		x1 = x >> 10;
//		x2 = x1*x1;
//		x3 = -((x2<<5) + (x2<<2));
		// teste
		
		x4 = (x<<8) + (x<<3) + x;
		x5 = x4>>10;
		x6 = x5 + 515;
	end

endmodule