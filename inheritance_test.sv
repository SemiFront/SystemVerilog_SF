class parent_class;
	bit [31:0] a;
	bit [31:0] b; 
endclass

class child_class extends parent_class;
	bit [31:0] c;
endclass

module inhertance_test;
	initial begin
		child_class d = new();
		d.a = 10;
		d.b = 20;
		d.c = d.a + d.b;
		$display("Value of a = %0d,Value of b = %0d, Value of c = %0d", d.a, d.b,d.c);
	end 
endmodule 
