module clock_divider(
  input i_ref_clk,
  input i_rst_n,
  input i_clk_en,
  input [7:0] i_div_ratio,
  output reg o_div_clk);
  
  wire odd;
  wire [4:0] half_period;
  reg [4:0] counter;
  reg flag;
  wire clock_check;
  always @ (posedge i_ref_clk or negedge i_rst_n)
  begin
    if(!i_rst_n)
      begin
      counter<=5'b1; 
      o_div_clk<=1'b0;
      flag<=1'b0;
    end
  else if(!clock_check)
    begin
      o_div_clk<=i_ref_clk;
    end
  else if(clock_check && !odd && counter==half_period)
    begin
    o_div_clk<=!o_div_clk;
    counter<=5'b1;  
    end 
  else if(clock_check&&((odd&&!flag&&counter==half_period)||(odd&&flag&&counter==half_period+1)))
  begin
  flag<=!flag;
  o_div_clk<=!o_div_clk;
  counter<=5'b1;
end
else
counter<=counter+5'b1;      
  end
  always @ (negedge i_ref_clk or negedge i_rst_n)
  begin
    if (!i_rst_n)
    begin
      o_div_clk <= 1'b0;
    end
    else if (!clock_check)
    begin
      o_div_clk <= i_ref_clk; 
    end
  end
    

assign half_period=(i_div_ratio>>1'b1);
assign odd=(i_div_ratio[0]);
assign clock_check=i_clk_en&&(i_div_ratio!=8'b0)&&(i_div_ratio!=8'b1);


endmodule


