
module datapath(
	input [15:0] periodIn, activeIn,
	input loadReg, loadCNT, clk, reset,
	output isEq0, isEq1
);
	
	wire [15:0]count;
	wire [15:0]PERIOD;
	wire [15:0]ACTIVE;
	wire isEqual;
	
	register COMP0(periodIn, loadReg, clk, PERIOD);
	register COMP1(activeIn, loadReg, clk, ACTIVE);
	
	comparator cmp0(16'h0000, count, isEq0);	// indicates underflow. The PWM output signal becomes 0 and counter is reloaded.
	comparator cmp1(ACTIVE, count, isEq1);		// indicates the start of active time. The PWM output signal becomes 1.

	counter CNT(PERIOD-4'h0001,loadCNT, clk, reset, count); // -1 because cu will waste 1 cycle on loading.
	
	
endmodule
