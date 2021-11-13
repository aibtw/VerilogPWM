module tb_PWM();
	
	// inputs
	reg clk, reset, start, stop;
	reg [15:0] PERIOD, ACTIVE;
	
	// outputs
	wire pulse;

	// instantiation                    
	PWM pwm (
		.clk(clk),
		.reset(reset),
		.start(start),
		.stop(stop),
		.PERIOD(PERIOD),
		.ACTIVE(ACTIVE),
		.pulse(pulse)
	);
	
	
	// clk
	always #5 clk = ~clk;
		initial begin
		// Initialize Inputs
		clk = 0;
		start = 0;
		stop = 0;
		PERIOD = 16'h0000;
		ACTIVE = 16'h0000;
		reset = 1;
		#5
		reset = 0;


		// First input: 6. Expected result is 8.
		#15
		PERIOD = 16'h000A;
		ACTIVE = 16'h0004;
		#15
		start = 1;
		#400
		stop = 1;
		#400
		
		$finish;

	end
	
	

endmodule
