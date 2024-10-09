module parity_check(
  input par_chk_en,
  input sampled_bit,
  input PAR_TYP,
  input CLK,
  input RST,
 
input [7:0] P_DATA,
  output reg par_err
  );
  wire test_parity_even;
  wire test_parity_odd;
  parameter EVEN=1'b0;
  parameter ODD=1'b1;
  
  always @(posedge CLK or negedge RST)
  begin
    if(!RST)
      par_err<=1'b0;
    else if(par_chk_en)
      begin
        if(PAR_TYP==EVEN)
          begin
            if(sampled_bit==test_parity_even)
              par_err<=1'b0;
            else
              par_err<=1'b1;
          end
        else if(PAR_TYP==ODD)
          begin
            if(sampled_bit==test_parity_odd)
              par_err<=1'b0;
            else
              par_err<=1'b1;
          end
      end
      else
          par_err<=1'b0;
  end
  assign test_parity_even=^P_DATA;
  assign test_parity_odd=~(^P_DATA);
        
endmodule
