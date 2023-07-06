/*module tb;
	bit [7:0] m_data;
	initial begin
		m_data = 8'hA2;
		
		for (int i = 0; i < $size(m_data); i++) begin
			$display ("m_data[%0d] = %b", i, m_data[i]);
		end
	end
endmodule 
*/

/*module unpacked;
	byte stack[8];
	initial begin 
		foreach (stack[i]) begin
			stack[i] = $random;
			$display ("Assign 0x%0h to index %0d", stack[i], i);
		end
		$display ("stack = %p", stack);
	end
endmodule 
*/
// Unpacked array example
/*module UnpackedArrayExample;
  // Unpacked array of 4 elements, each of which is a 2-bit vector
  logic [1:0] unpacked_array [3:0];

  initial begin
    // Assigning values to the elements of the unpacked array
    unpacked_array[0] = 2'b00;
    unpacked_array[1] = 2'b01;
    unpacked_array[2] = 2'b10;
    unpacked_array[3] = 2'b11;

    // Printing the elements of the unpacked array
    for (int i = 0; i < 4; i++)
      $display("Unpacked Array[%0d]: %b", i, unpacked_array[i]);
  end
endmodule
*/

/*module fixed_array;
	int a[4];
	int b[4][2];
	initial begin
	$display("size of array is %d",a.size());
		a = '{1,2,3,4};
		b = '{'{1,0},'{2,0},'{3,0},'{4,0}};
		
		for (int i=0;i<4;i++)begin	
			$display("a[%0d]=%0d",i,a[i]);
		end
		for (int i=0; i<4;i++) begin
			for (int j=0; j<2; j++)begin
				$display("b[%0d][%0d]=%0d",i,j,b[i][j]);
			end
		end
	end
endmodule
*/
module dyanmic_array;
int a[];
initial begin
	$display("size of array is %d",a.size());
	a = new[4];
	$display("size of array is %d",a.size());
	a = '{1,2,3,4};
		for(int i=0;i<4;i++) begin
			$display("a[%0d]=%0d",i,a[i]);
		end
		a = new[10];
		$display("size of array is %d",a.size());
	end
endmodule 
