module random_tb ();
integer testval;
integer out;
//integer i;
initial begin
  out = $fopen("randtest.txt","w");
  $fdisplay(out, "testval = %h", $random(testval));
  $fdisplay(out, "testval = %h", $random(testval));
  $fdisplay(out, "testval = %h", $random(testval));
  

end

endmodule