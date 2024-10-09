module FIFO_WR(
  input winc,
  input wclk,
  input wrst_n,
  input [3:0] wq2_rptr,
  output  wfull,
  output [2:0] waddr,
  output reg [3:0] wptr,
  output  wclken
  );
  
  always @(posedge wclk or negedge wrst_n)
  begin
    if(!wrst_n)
      begin
        wptr<=4'b0;

      end
    else if(winc)
      begin
      wptr<=wptr+1;
        end
end
  assign waddr=wptr[2:0];
 assign wfull=(wptr[3]!=wq2_rptr[3])&&(wptr[2:0]==wq2_rptr[2:0]);
  assign wclken=winc&!(wfull);

 
endmodule

