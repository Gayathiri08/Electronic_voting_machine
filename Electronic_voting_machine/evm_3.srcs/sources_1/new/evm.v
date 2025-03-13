`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/25/2024 07:33:19 PM
// Design Name: 
// Module Name: evm
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module
SevenSegment(in,clock,a,b,c,d,e,f,g);
input clock;
input [3:0]in;
output reg a,b,c,d,e,f,g;
integer i;
always@(posedge clock)
begin
if(in==4'b0000)
begin
a=0;b=0;c=0;d=0;e=0;f=0;g=1;
end
else if(in==4'b0001)
begin
a=1;b=0;c=0;d=1;e=1;f=1;g=1;
end
else if(in==4'b0010)
begin
a=0;b=0;c=1;d=0;e=0;f=1;g=0;
end
else if(in==4'b0011)
begin
a=0;b=0;c=0;d=0;e=1;f=1;g=0;
end
else if(in==4'b0100)
begin
a=1;b=0;c=0;d=1;e=1;f=0;g=0;
end
else if(in==4'b0101)
begin
a=0;b=1;c=0;d=0;e=1;f=0;g=0;
end
else if(in==4'b0110)
begin
a=0;b=1;c=0;d=0;e=0;f=0;g=0;
end
else if(in==4'b0111)
begin
a=0;b=0;c=0;d=1;e=1;f=1;g=1;
end
else if(in==4'b1000)
begin
a=0;b=0;c=0;d=0;e=0;f=0;g=0;
end
else if(in==4'b1001)
begin
a=0;b=0;c=0;d=0;e=1;f=0;g=0;
end
else
i=0;
end
endmodule

//now main module starts
module
VotingMachine(a,b,c,clk,rst,o0,o1,o2,voting,
clock,A,B,C,D,E,F,G,d1,d2,d3);
input a,b,c,clk,voting,rst,clock;
output reg o0,o1,o2,d1,d2,d3;
output A,B,C,D,E,F,G;
integer i=0;integer j;
reg [3:0]cv[2:0];
reg [3:0]vote;
always@(posedge clk)
begin
if(rst)
begin
cv[0]=4'b0000;
cv[1]=4'b0000;
cv[2]=4'b0000;
o0=0;
o1=0;
o2=0;
end
else
begin
if (voting) //voting starts
begin
if(a==1 & b==0 & c==0)
begin
cv[2]=cv[2]+4'b0001;
end
else if(b==1 & a==0 & c==0)
begin
cv[1]=cv[1]+4'b0001;
end
else if(c==1 & a==0 & b==0)
begin
cv[0]=cv[0]+4'b0001;
end
else
j=0;
end
else //result display
begin
if(cv[0]>cv[1])
begin
if(cv[0]>cv[2])
begin
o0=1;
o1=0;
o2=0;
end
else if(cv[0]==cv[2])
begin
o0=1;
o1=0;
o2=1;
end
else
begin
o0=0;
o1=0;
o2=1;
end
end
else if(cv[0]==cv[1])
begin
if(cv[0]>cv[2])
begin
o0=1;
o1=1;
o2=0;
end
else if(cv[0]==cv[2])
begin
o0=1;
o1=1;
o2=1;
end
else
begin
o0=0;
o1=0;
o2=1;
end
end
else
begin
if(cv[1]>cv[2])
begin
o0=0;
o1=1;
o2=0;
end
else if(cv[1]==cv[2])
begin
o0=0;
o1=1;
o2=1;
end
else
begin
o0=0;
o1=0;
o2=1;
end
end
end
end
end
always@(posedge clock)
begin
if (~voting)
begin
if(i>0 & i<100000)
begin
d1=1;
d2=0;
d3=0;
i=i+1;
vote=cv[2];
end
else if(i>99999 & i<200000)
begin
d1=0;
d2=1;
d3=0;
i=i+1;
vote=cv[1];
end
else if(i>199999 & i<300000)
begin
d1=0;
d2=0;
d3=1;
i=i+1;
vote=cv[0];
end
else
i=1;
end
else
begin
d1=0;
d2=0;
d3=0;
end
end
SevenSegment
LED(vote,clock,A,B,C,D,E,F,G);
endmodule