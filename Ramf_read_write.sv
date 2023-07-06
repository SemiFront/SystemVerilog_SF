module ramf(
	input clk,
	input [7:0] address,
	input [7:0] data_in,
	input rd,
	input wr,
	output reg [7:0] data_out);
	
	reg [7:0] mem [7:0];
	int fd;
	
	always@(posedge clk) begin
		if (wr) begin
  mem[address] <= data_in;
  end
	end
	always@* begin 
		if (rd) begin
  data_out = mem[address];
  end
	end
endmodule

module ramf_tb;
	reg clk = 0;
	reg [7:0] address;
	reg [7:0] data_in;
	reg rd;
	reg wr;
	wire [7:0] data_out;
	int fp;
	int fp1;
	
	ramf uut(clk,address,data_in,rd,wr,data_out);
	
	always #5 clk = ~clk;
	
	initial begin 
		address = 0;
		data_in = 0;
		rd = 0;
		wr = 0;
		#100
		fp = $fopen("data.txt","r");
		fp1 = $fopen("write.txt","w");
		address = 0;
		wr = 1;
		$fscanf(fp,"%d",data_in);
		rd = 1; 
		
		#100
		address = 1;
		wr = 1;
		$fscanf(fp,"%d",data_in);
		$fdisplay (fp1, "%d",data_out);
		#100
		rd = 1; 
		$fdisplay (fp1, "%d",data_out);
		#100
		$fclose(fp);
		$fclose(fp1);
		$display("Data read from memory at address %d: %d",address, data_out);
		
		$finish;
	end
endmodule 
