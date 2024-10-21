module FIFO_WR(
  input winc,
  input wclk,
  input wrst_n,
  input [3:0] wq2_rptr,
  input [3:0] wptr_gray,
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
    else if(winc&&!wfull)
      begin
      wptr<=wptr+1;
        end
end
  assign waddr=wptr[2:0];
 assign wfull=(wptr_gray[3]!=wq2_rptr[3])&&(wptr_gray[2]!=wq2_rptr[2])&&(wptr_gray[1:0]==wq2_rptr[1:0]);
  assign wclken=winc&!(wfull);

 
endmodule

