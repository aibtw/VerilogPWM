module PWM(
	input start, stop, clk, reset,
	input [15:0]PERIOD, ACTIVE,
	output pulse
	);
	
	wire loadReg, loadCNT, isEq0, isEq1;
	
	datapath DP(PERIOD, ACTIVE, loadReg, loadCNT, clk, reset, isEq0, isEq1);
	cu	CU(clk, reset, isEq0, isEq1, start, stop, loadReg, loadCNT, pulse);
	
endmodule
//failed in wv8 because the counter doesn't load with correct value but loads with 0.
//Also, the registers get loaded only for one cycle then they become 0.
//Reason: in cu state0, we keep loading the registers all the time, so if it loads with 10 and then you make the 10 to zero it will load zero in next cycly
// Edits: keep the value of regs and don't change it in simulation until the start comes
// Changed S2 to set CNTload to true if going to 3 and in 3 we make it 0.
//