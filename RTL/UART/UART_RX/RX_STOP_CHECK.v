module stop_check(
  input stp_chk_en,
  input sampled_bit,
  output reg stp_err,
  input CLK,
  input RST
  );
  
   always @(*)
  begin
   if(stp_chk_en)
     begin
       if(sampled_bit!=1'b1)
         stp_err=1'b1;
       else
         stp_err=1'b0;
         end
         else
           stp_err=1'b0;
end
endmodule



