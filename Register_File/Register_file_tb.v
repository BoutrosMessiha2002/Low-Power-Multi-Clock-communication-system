module Register_file_tb();

reg CLK_tb;
reg RST_tb;
reg WrEn_tb;
reg RdEn_tb;
reg [15:0] WrData_tb;
reg [2:0] Address_tb;
wire [15:0] RdData_tb;

Register_file Reg(
.CLK(CLK_tb),
.RST(RST_tb),
.WrEn(WrEn_tb),
.RdEn(RdEn_tb),
.WrData(WrData_tb),
.Address(Address_tb),
.RdData(RdData_tb)
);

always #5 CLK_tb=~CLK_tb;

initial
begin
  RST_tb=0;
  CLK_tb=0;
  WrEn_tb=0;
  RdEn_tb=0;
  WrData_tb=16'b0;
  Address_tb=3'b0;
#3
RST_tb=1;
Address_tb=3'b011;
WrEn_tb=1;
WrData_tb=16'd35;
#10
Address_tb=3'b001;
WrData_tb=16'd102;
#10
RdEn_tb=1;
WrEn_tb=0;
Address_tb=3'b011;
$display("TEST CASE 1, reading from address 3");
#10
if(RdData_tb==16'd35)
  $display("TEST CASE 1 PASSED");
else
  $display("TEST CASE 1 FAILED");
$display("TEST CASE 2, reading from address 1");
Address_tb=3'b001;
#10
if(RdData_tb==16'd102)
  $display("TEST CASE 2 PASSED");
else
  $display("TEST CASE 2 FAILED");
  RdEn_tb=0;
  WrEn_tb=1;
  Address_tb=3'b111;
  WrData_tb=16'd143;
  #10
  WrEn_tb=0;
  RdEn_tb=1;
  #10
  $display("TEST CASE 3, writing & reading from address 7");
  if(RdData_tb==16'd143)
    $display("TEST CASE 3 PASSED");
    else
      $display("TEST CASE 3 FAILED");
      RdEn_tb=0;
  WrEn_tb=1;
  Address_tb=3'b010;
  WrData_tb=16'd27;
  #10
  WrEn_tb=0;
  RdEn_tb=1;
  #10
  $display("TEST CASE 4, writing & reading from address 2");
  if(RdData_tb==16'd27)
    $display("TEST CASE 4 PASSED");
    else
      $display("TEST CASE 4 FAILED");
end
endmodule