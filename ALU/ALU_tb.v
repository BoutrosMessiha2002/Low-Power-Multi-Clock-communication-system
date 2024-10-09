module ALU_tb();
  reg [7:0] A_tb;
  reg [7:0] B_tb;
  reg [3:0] ALU_FUN_tb;
  reg clk_tb;
  wire [15:0] ALU_OUT_tb;
  wire Arith_Flag_tb;
  wire Logic_Flag_tb;
  wire CMP_Flag_tb;
  wire Shift_Flag_tb;
  wire carry_tb;
  
 
  ALU DUT(
  .A(A_tb),
  .B(B_tb),
  .ALU_FUN(ALU_FUN_tb),
  .clk(clk_tb),
  .ALU_OUT(ALU_OUT_tb),
  .Arith_Flag(Arith_Flag_tb),
  .Logic_Flag(Logic_Flag_tb),
  .CMP_Flag(CMP_Flag_tb),
  .Shift_Flag(Shift_Flag_tb),
  .carry(carry_tb));
  
  always #5 clk_tb=!clk_tb;
  initial
  begin
     $dumpfile("ALU_tb.vcg");
  $dumpvars;
    A_tb=8'b11011101;
    B_tb=8'b11011101;
    ALU_FUN_tb=4'd15;
    clk_tb=1'b0;
    $display("TEST CASE 1");
    #3
    ALU_FUN_tb=4'd0;
    #5
    if(ALU_OUT_tb==442&&Arith_Flag_tb==1&&carry_tb==1)
      $display("TEST CASE SUCCESS");
    else
      $display("TEST CASE FAIL");
    $display("TEST CASE 2");
    A_tb=7;
    B_tb=6;
    ALU_FUN_tb=4'd1;
    #10
    if(ALU_OUT_tb==1&&Arith_Flag_tb==1&&carry_tb==0)
      $display("TEST CASE SUCCESS");
    else
      $display("TEST CASE FAIL");
      $display("TEST CASE 3");
      A_tb=76;
      B_tb=4;
    ALU_FUN_tb=4'd2;
    #10
    if(ALU_OUT_tb==304&&Arith_Flag_tb==1)
      $display("TEST CASE SUCCESS");
    else
      $display("TEST CASE FAIL");
      $display("TEST CASE 4");
    ALU_FUN_tb=4'd3;
    #10
    if(ALU_OUT_tb==19&&Arith_Flag_tb==1)
      $display("TEST CASE SUCCESS");
    else
      $display("TEST CASE FAIL");
      $display("TEST CASE 5");
      A_tb=11;
      B_tb=1;
    ALU_FUN_tb=4'd4;
    #10
    if(ALU_OUT_tb==1&&Logic_Flag_tb==1)
      $display("TEST CASE SUCCESS");
    else
      $display("TEST CASE FAIL");
      $display("TEST CASE 6");
      A_tb=10;
      B_tb=5;
    ALU_FUN_tb=4'd5;
    #10
    if(ALU_OUT_tb==15&&Logic_Flag_tb==1)
      $display("TEST CASE SUCCESS");
    else
      $display("TEST CASE FAIL");
      $display("TEST CASE 7");
      ALU_FUN_tb=4'd6;
    #10
    if(ALU_OUT_tb==16'hFFFF&&Logic_Flag_tb==1)
      $display("TEST CASE SUCCESS");
    else
      $display("TEST CASE FAIL");
      $display("TEST CASE 8");
      ALU_FUN_tb=4'd7;
    #10
    if(ALU_OUT_tb==16'hFFF0&Logic_Flag_tb==1)
      $display("TEST CASE SUCCESS");
    else
      $display("TEST CASE FAIL");
      $display("TEST CASE 9");
      ALU_FUN_tb=4'd8;
    #10
    if(ALU_OUT_tb==15&&Logic_Flag_tb==1)
      $display("TEST CASE SUCCESS");
    else
      $display("TEST CASE FAIL");
      $display("TEST CASE 10");
      ALU_FUN_tb=4'd9;
    #10
    if(ALU_OUT_tb==16'hFFF0&&Logic_Flag_tb==1)
      $display("TEST CASE SUCCESS");
    else
      $display("TEST CASE FAIL");
      $display("TEST CASE 11");
      ALU_FUN_tb=4'd10;
      A_tb=5;
      B_tb=5;
    #10
    if(ALU_OUT_tb==1&&CMP_Flag_tb==1)
      $display("TEST CASE SUCCESS");
    else
      $display("TEST CASE FAIL");
      $display("TEST CASE 12");
      ALU_FUN_tb=4'd11;
      A_tb=7;
      B_tb=4;
    #10
    if(ALU_OUT_tb==2&&CMP_Flag_tb==1)
      $display("TEST CASE SUCCESS");
    else
      $display("TEST CASE FAIL");
      $display("TEST CASE 13");
      ALU_FUN_tb=4'd12;
      A_tb=4;
      B_tb=7;
    #10
    if(ALU_OUT_tb==3&&CMP_Flag_tb==1)
      $display("TEST CASE SUCCESS");
    else
      $display("TEST CASE FAIL");
      $display("TEST CASE 14");
      ALU_FUN_tb=4'd13;
      A_tb=8;
    #10
    if(ALU_OUT_tb==4&&Shift_Flag_tb==1)
      $display("TEST CASE SUCCESS");
    else
      $display("TEST CASE FAIL");
      $display("TEST CASE 15");
      ALU_FUN_tb=4'd14;
      A_tb=9;
    #10
    if(ALU_OUT_tb==18&&Shift_Flag_tb==1)
      $display("TEST CASE SUCCESS");
    else
      $display("TEST CASE FAIL");
      $display("TEST CASE 16");
      ALU_FUN_tb=4'd15;
      #10
      if(ALU_OUT_tb==0)
        $display("TEST CASE SUCCESS");
      else
        $display("TEST CASE FAIL");
  end
endmodule
    
      
    
  
  