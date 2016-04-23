module buffer1(ex,ey,sx1,sy1,mx,my,s,clk,ex1,ey1,mx1,my1,sn,sn1,sn2);
input [7:0]ex,ey;
input [23:0]mx,my;
input s,clk,sx1,sy1;
output reg [7:0]ex1,ey1;
output reg [23:0]mx1,my1;
output reg sn,sn1,sn2;
always@(posedge clk)
begin
sn1=sx1;
sn2=sy1;
ex1=ex;
ey1=ey;
mx1=mx;
my1=my;
sn=s;
end
endmodule
