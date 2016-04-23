module boothlogic(a,b,prod,clk);
input a,b,clk;
output prod;
reg[7:0] a,b;
reg[15:0] prod;
reg clk;
reg[7:0] temp1,temp2,temp3;
reg[3:0] count;
reg implicit;
always@(posedge clk)
begin
temp1<=8'b0;
temp2<=a;
temp3<=b;
implicit <=1'b0;
count<=4'b0;
case({temp2[0]},implicit)
2'b0_1 : {temp1, temp3, implicit} <= {sum[7], sum, Q};
2'b1_0 : {temp1, temp3, impilicit} <= {difference[7], difference, Q};
default: {temp1, temp3, implicit} <= {A[7], A, Q};
endcase
count <= count + 1'b1;
end



end


