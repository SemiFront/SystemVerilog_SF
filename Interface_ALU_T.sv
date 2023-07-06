parameter N = 8;
parameter M = 16;
interface Dinter;
	logic [N-1:0]A;
	logic [N-1:0]B;
	logic [2:0]sel;
	logic [M-1:0]out;
endinterface : Dinter
	
module ALU_T (Dinter intd);/*(
	
	input [N-1:0]A,
	input [N-1:0]B,
	input [2:0]sel,
	output [M-1:0]out)*/;
	
	reg [N-1:0] ALU_R;
	assign intd.out = ALU_R;
	
	always@(*) begin
		case(intd.sel)
			4'b000: ALU_R = intd.A + intd.B; 
			4'b001: ALU_R = intd.A + intd.B;
			4'b010: ALU_R = intd.A + intd.B;
			4'b011: ALU_R = intd.A + intd.B;
			4'b100: ALU_R = intd.A + intd.B;
			4'b101: ALU_R = intd.A + intd.B;
			4'b110: ALU_R = intd.A + intd.B;
			4'b111: ALU_R = intd.A + intd.B;
			default: ALU_R = intd.A + intd.B;
		endcase
	end
endmodule

module ALU_TB;
	  
	 /* reg [N-1:0]A;
	  reg [N-1:0]B;
	  reg [2:0]sel;
	  wire[M-1:0]out;*/
	  
	  Dinter intd();
	  
	  ALU_T dut(intd);
	  
	  //ALU_T uut(A,B,sel,out);
	  
	  initial 
	    fork
			begin
			intd.A = 8'h0A;
			intd.B = 8'h02;
			intd.sel = 3'b000;
			#20 	
			intd.A = 8'h0B;
			intd.B = 8'h03;
			intd.sel = 3'b001;
			end
		join
		;
	initial begin
		$monitor("A = %b,B = %B,sel = %b,out = %b",intd.A,intd.B,intd.sel,intd.out);
	end
endmodule 
