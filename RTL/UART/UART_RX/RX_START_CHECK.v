module strt_check(
  input strt_chk_en,
  input sampled_bit,
  output reg strt_glitch,
  input CLK,
  input RST
  );
  
  always @(*)
  begin
    if(strt_chk_en)
      begin
        if(sampled_bit!=1'b0)
          strt_glitch=1'b1;
        else
          strt_glitch=1'b0;
        end
      else
        strt_glitch=1'b0;
  end
endmodule


