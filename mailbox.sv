module mail;
	mailbox vlsichaps = new();
	
	initial begin
	  bit [3:0] a; 
	  a = 10;
	  vlsichaps.put(a);
	  $display("data send is %d",a);
	  end
	  
	  initial begin 
	  bit [3:0] a;
	  vlsichaps.get(a);
	  $display("data receive is %d", a);
	  end	  
endmodule
