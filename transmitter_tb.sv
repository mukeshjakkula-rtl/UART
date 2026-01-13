module transmitter_tb();

  reg clk;
  reg rst;
  reg [7:0]data;
  reg tx_valid;
  wire tx_out;


transmitter dut(.clk(clk),
		.rst(rst),
		.data(data),
		.tx_valid(tx_valid),
		.tx_out(tx_out));



  initial begin
     clk = 1'b0;
     rst = 1'b0;
#10  rst = 1'b1;
  end 
always #10 clk = ~clk;


initial begin
   tx_valid = 1'b1;
   data = 8'hdd;
end 

initial begin
   $dumpfile("wave.vcd");
   $dumpvars(0,transmitter_tb);
end 

initial #10500 $finish;

endmodule 
