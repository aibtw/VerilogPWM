
module cu(input clk, reset, 
	input isEq0, isEq1, start, stop,
	output reg loadReg, loadCNT, pulse);
	
	reg[1:0] state;
	reg[1:0] nextState;
	
	initial begin
		state <= 2'b00;
		
	end
	
	always @(posedge clk or posedge reset) begin
		if(reset) begin
			state <= 2'b00;
		end
		else begin
			state <= nextState;
		end
	end
	
	always @(*) begin
		nextState = 2'b00;
		loadReg = 1'b0;
		loadCNT = 1'b0;
		pulse = 1'b1;

		case(state)
			0:begin
				loadReg = 1;
				loadCNT = 0;
				pulse = 1'bz;
				if(start) begin
					loadCNT = 1;
					nextState = 1;
				end
			end
			
			1: begin
				pulse = 0;
				loadReg = 0;
				loadCNT = 0;
				if(stop)
					nextState = 0; // go to idle state
				else if(isEq1)
					nextState = 2;	// go to active state
				else
					nextState = 1;	// stay in low state
			end
			
			2: begin
				pulse = 1;
				if(stop)
					nextState = 0; // go to idle state
				else if(isEq0) begin
					nextState = 1; // go to reload state
					loadCNT = 1;
				end
				else
					nextState = 2; // stay in active state
				
			end
			
//			3:begin
//				loadCNT = 0;
//				if(stop)
//					nextState = 0; // go to idle state
//				else
//					nextState = 1; // go to low state
//			end
		endcase 
	end
	
	
endmodule
//tested in wv6
