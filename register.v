module register (
	input [15:0]d,
	input load, clk,
	output reg [15:0]q);
	
	always @(posedge clk) begin
		if(load)
			q <= d;
	end
endmodule
//Tested waveform 3