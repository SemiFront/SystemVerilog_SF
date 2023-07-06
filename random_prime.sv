module top;
  class a;
   randc int num;
    int rang1=1;
    int rang2=200;
    constraint c{ num inside {[rang1:rang2]};}
  endclass
 
  a handlee;
  int value;
  int i;
  int count;
  initial begin
    handlee = new();
    repeat(200) begin
      count = 0; // Initialize count for each iteration
      handlee.randomize();
      value = handlee.num;
      for (i = 1; i <= value; i = i + 1) begin
        if (value % i == 0) begin
          count = count + 1;
        end
      end
      if (count == 2) begin
        $display("num=%d", value);
      end
    end
  end
endmodule
