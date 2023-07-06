module top; 

class obj;
	int A;
	int B; 
	
	function new(int a,int b);
		A = a; 
		B = b; 
	endfunction
endclass

class container;
	int C;
	int D;
	obj obj_h;
endclass

	obj obj_hh1;
	container container_h;
	container container_h1;
	
	initial begin
	
		obj_hh1 =new(5,10);
		container_h = new();
		container_h.obj_h = new(2,4);
		
		$display("Initial value");
		$display("value of C : %0d",container_h.C);
		$display("value of D : %0d",container_h.D);
		$display("value of A : %0d",obj_hh1.A);
		$display("value of B : %0d",obj_hh1.B);
		
		$display("value of A : %0d",container_h.obj_h.A);
		$display("value of B : %0d",container_h.obj_h.B);
	end

	
	initial begin
		container_h.C = 23;
		container_h.D = 24;
		container_h.obj_h.A = 25;
		container_h.obj_h.B = 26;
		
		$display("displaying container_h values after updating");
		$display("value of C : %0d",container_h.C);
	    $display("value of D : %0d",container_h.D);
		
		$display("value of A : %0d",container_h.obj_h.A);
	    $display("value of B : %0d",container_h.obj_h.B);
	end
	
	/*initial begin
		container_h1 = new container_h;
		
		container_h1.C = 33;
		container_h1.D = 34;
		container_h1.obj_h.A = 35;
		container_h1.obj_h.B = 36;
		
		$display("updated value container_h1 display with h1");
		
		$display("value of C : %0d",container_h1.C);
		$display("value of D : %0d",container_h1.D);
		
		$display("value of A : %0d",container_h1.obj_h.A);
		$display("value of B : %0d",container_h1.obj_h.B);
		
		$display("updated value container_h display with h");
		
		$display("value of C : %0d",container_h.C);
		$display("value of D : %0d",container_h.D);
		
		$display("value of A : %0d",container_h.obj_h.A);
		$display("value of B : %0d",container_h.obj_h.B);
	end */
	
	
	initial begin
		container_h1 = new();
		container_h1.C = container_h.C;
		container_h1.D = container_h.D;
		container_h1.obj_h = new(7,8);
		container_h1.obj_h.A = container_h.obj_h.A;
		container_h1.obj_h.B = container_h.obj_h.B;
		
		container_h1.C = 40;
		container_h1.D = 41;
		container_h1.obj_h.A = 42;
		container_h1.obj_h.B = 43;

		$display("updated value container_h1 display with h1");
		
		$display("value of C : %0d",container_h1.C);
		$display("value of D : %0d",container_h1.D);
		
		$display("value of A : %0d",container_h1.obj_h.A);
		$display("value of B : %0d",container_h1.obj_h.B);
		
		$display("updated value container_h display with h");
		
		$display("value of C : %0d",container_h.C);
		$display("value of D : %0d",container_h.D);
		
		$display("value of A : %0d",container_h.obj_h.A);
		$display("value of B : %0d",container_h.obj_h.B);		
		
	end
		
	
	
endmodule
		
		
		
		
		
		
		
		
		
		

	
	
		
		


		


	
	
	
	
	
