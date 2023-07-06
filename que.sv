module queue_example;
  int num_q[$];
    
  initial begin
    for(int i = 0; i < 10; i++) num_q.push_back(i);
    $display("--- Before shuffle ---");
    foreach(num_q[i]) $display("num_q[%0d] = %0d", i, num_q[i]);
    num_q.shuffle();
    $display("----------------------");
    $display("--- After shuffle ---");
    foreach(num_q[i]) $display("num_q[%0d] = %0d", i, num_q[i]);
  end
endmodule