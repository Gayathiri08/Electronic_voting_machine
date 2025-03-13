module tb_VotingMachine();

reg a, b, c, clk, rst, voting,clock;
wire o0,o1,o2,A,B,C,D,E,F,G,d1,d2,d3;

VotingMachine dut (a,b,c,clk,rst,o0,o1,o2,voting,clock,A,B,C,D,E,F,G,d1,d2,d3);

initial
   begin
   rst=1;clk=1;clock=1;
   end
   
always begin #5 clk=~clk;clock=~clock;end

initial
   begin
   #10 rst=0;voting=1;
   #10 a=1;b=0;c=0;
   #10 a=0;b=1;c=0;
   #10 a=0;b=1;c=0;
   #10 a=0;b=0;c=1;
   #10 voting=0;
   end
   
endmodule



module tb_SevenSegmentLED();

reg clock;
reg [3:0] in;
wire a, b, c, d, e, f, g;
SevenSegment dut (in, clock, a, b, c, d, e,f,g);

initial
  begin
  clock=1;
  end
always begin #5 clock=-clock;end
initial
   begin
   #10 in=4'b0000;
   #10 in=4'b0001;
   #10 in=4'b0010;
   #10 in=4'b0011;
   #10 in=4'b0100;
   #10 in=4'b0101;
   #10 in=4'b0110;
   #10 in=4'b0111;
   #10 in=4'b1000;
   #10 in=4'b1001;
   end

endmodule