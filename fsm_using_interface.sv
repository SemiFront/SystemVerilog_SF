//Declared the interface
interface DInterface;
	logic s_in,clk,reset;
	logic out;
endinterface : DInterface

module fsm_det(DInterface intd);
	
	parameter idle = 2'b00,
			S1   = 2'b01,
			S2   = 2'b10,
			S3   = 2'b11;
			
	reg [1:0]present_state,next_state;
	
	always@(posedge intd.clk,posedge intd.reset) begin
		if(intd.reset)
			present_state <= idle;
		else 
			present_state <= next_state;
		end
		
	always@(present_state,intd.s_in) begin
		case(present_state)
			idle : if (intd.s_in == 1)
						next_state = S1;
					else
						next_state = idle;
			S1   : if (intd.s_in == 0)
						next_state = S2;
					else 
						next_state = S1;
			S2   : if (intd.s_in == 0)
						next_state = S3;
					else 
						next_state = S1;
			S3   : if (intd.s_in == 1)
						next_state = S1;
					else 
						next_state = idle; 
			default : next_state = idle;
		endcase
		end
	assign intd.out = (present_state == S3) ? 1'b1: 1'b0;
endmodule

module fsm_det_tb;
	DInterface intd();
	
	fsm_det dut(intd);

	initial begin
		intd.clk = 0;
		forever #5 intd.clk = ~ intd.clk;
	end 
		
	initial begin
		intd.reset = 1;
		intd.s_in =0;
		#30
		intd.reset = 0;
		intd.s_in = 1;
		#30
		intd.reset = 0;
		intd.s_in = 0;
		#30
		intd.reset = 0;
		intd.s_in = 0;
		#30
		intd.reset = 0;
		intd.s_in = 1;
		#30
		intd.reset = 0;
		intd.s_in = 1;
		#30
		intd.reset = 0;
		intd.s_in = 0;
		#30
		intd.reset = 0;
		intd.s_in = 0;
	end
endmodule

//top level module 
module topfsm;
	DInterface intd();
	
	fsm_det dut(intd);
	
	fsm_det_tb tb();
	
	initial begin 
		tb.intd = intd;
	end
endmodule