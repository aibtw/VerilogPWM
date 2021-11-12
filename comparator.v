module comparator(
	input [15:0]x,y,
	output isEqual
	);
	
	assign isEqual = (x==y);
	
endmodule
// Tested with waveform 2
