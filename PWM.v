module PWM(
	input start, stop, clk, reset,
	input [15:0]PERIOD, ACTIVE,
	output pulse
	);
	
	wire loadReg, loadCNT, isEq0, isEq1;
	
	datapath DP(PERIOD, ACTIVE, loadReg, loadCNT, clk, reset, isEq0, isEq1);
	cu	CU(clk, reset, isEq0, isEq1, start, stop, loadReg, loadCNT, pulse);
	
endmodule
