`define False 0;
`define True 1;
module Tb(); 
integer a_input,b_input; 
integer sum;
integer sum_raw; 
reg status; 
  add a1(a_input,b_input,sum);  
initial
begin 
   repeat(10)
    begin  #1 a_input = $random; 
           b_input = $random;  
      sum_raw = a_input+b_input;
      compare();
      $monitor("a value = %h, b value = %h, sum_raw = %h,sum = %h; status = %d",a_input,b_input,sum_raw,sum,status);
  end 
end   
  task compare;
    if(add.sum == Tb.sum_raw)
      begin
        assign status = 1;
      end
    else
      assign status = 0;
  endtask
endmodule 