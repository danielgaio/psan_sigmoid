// arquivo contendo a descricao sitetizavel

`timescale 1ns / 1ps

module psan_sigmoid (
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
	
	always @ (posedge clk) begin

		if (x >= 4096) begin

			f_x <= 1024;

		end else if ((x >= 0) && (x < 4096)) begin
			
			f_x <= x3 + x6;		// 17 bits + 16 bits

		end
	
	end // always
	
	always @ (*) begin
		x_in_temp = x;					// x_in_temp : 16 bits
		x1 = x*x_in_temp;				// x1 : 32 bits
		x2 = (x1<<5) + (x1<<2);	// x2 : 37 bits
		x3 = -(x2>>20);	 				// x3 : 17 bits
		
		x4 = (x<<8) + (x<<3) + x;	// x4 : 24 bits
		x5 = x4>>10;							// x5, x6 : 16 bits
		x6 = x5 + 515;
	end

endmodule