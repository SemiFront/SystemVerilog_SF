module tb;
	int fd;
	string line;
	
	initial begin
		
		fd = $fopen ("trial.txt", "w");
		
		for (int i = 0; i < 100; i++) begin
			$fdisplay (fd, "Iteration = %0d", i);
		end
		
		$fclose(fd);
    end
endmodule 
	
	
