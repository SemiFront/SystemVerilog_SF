/*class Adder;
  int A; 
  int B;
	
	function void set_AB(int ValA, int ValB);
		A = ValA;
		B = ValB;
	endfunction
	
	function int CalAdd();
		return A + B;
	endfunction
	
endclass

module add;
  initial begin 
	Adder ad = new();
	
	ad.set_AB(3, 2);
	
    $display("ValA: %0d,ValB: %0d,Sum: %0d",ad.A,ad.B,ad.CalAdd);
  end
endmodule*/

class Person;
  string name;
  int age;
  string occupation;
  
  // Parameterized constructor
  function new(string _name, int _age, string _occupation);
    name = _name;
    age = _age;
    occupation = _occupation;
  endfunction
  
  // Method to display person's information
  function void displayInfo();
    $display("Name: %s", name);
    $display("Age: %d", age);
    $display("Occupation: %s", occupation);
  endfunction
endclass

module Testbench;
  initial begin
    // Creating an object of the Person class using constructor
    Person john = new("John Doe", 30, "Software Engineer");

    // Displaying John's information
    john.displayInfo();
    
    $finish;  // End the simulation
  end
endmodule
