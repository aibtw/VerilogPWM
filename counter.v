module counter(
	input [15:0]d,
	input load, clk, reset,
	output reg [15:0]c);
	
	always @(posedge clk or posedge reset) begin
		if(reset) begin
			c <= 16'h0000; 
		end
		else if (load) begin
			c <= d;
		end
		else
			c <= c - 16'h0001;
	end
endmodule
