module filereadwrite(clk,we,dout,din,address);
	input clk;
	input we;
	input [31:0]din;
	input [4:0]address;
	output reg [31:0]dout;
	
	reg [31:0] mem [0:25];
	
	initial begin
		$readmemh("text.txt",mem,0,25);
	end
	
	always @(posedge clk) begin
		if (we)
			mem[address] <= din;
		else
			dout <= mem[address];
	end
endmodule 

module tb_fileread;
	reg clk;
	reg we;
	reg [4:0] address;
	reg [31:0] din;
	wire [31:0] dout;
	
	filereadwrite uut(
		.clk(clk),
		.we(we),
		.dout(dout),
		.address(address),
		.din(din)
	);
	
	initial begin
		clk = 0; we = 1;
		address = 0; din = 0;
		#100 we = 0;
		#100 address = 5'd1;
		#110 address = 5'd1;
		#120 address = 5'd2;
		#130 address = 5'd3;
		#140 address = 5'd4;
		#150 address = 5'd25;
		#10 $finish;
	end
	
	always #5 clk = ~clk;
	
	initial begin 
		$monitor("Data : %0h", dout);
	end
endmodule
