module FIFO_top(
  input [7:0] wdata,
  input winc,
  input wclk,
  input wrst_n,
  input rclk,
  input rrst_n,
  input rinc,
  output [7:0] rdata,
  output rempty,
  output wfull
  );
  
  wire [3:0] wptr;
  wire [3:0] rq2_wptr;
  wire [2:0] waddr;
  wire [2:0] raddr;
  wire [3:0] rptr;
  wire [3:0] wq2_rptr;
  wire wclken;
  
  FIFO_RD U_FIFO_RD(
  .rclk(rclk),
  .rrst_n(rrst_n),
  .rinc(rinc),
  .rempty(rempty),
  .raddr(raddr),
  .rptr(rptr),
  .rq2_wptr(rq2_wptr)
  );
  
  FIFO_WR U_FIFO_WR(
  .wclk(wclk),
  .wrst_n(wrst_n),
  .winc(winc),
  .wfull(wfull),
  .waddr(waddr),
  .wptr(wptr),
  .wq2_rptr(wq2_rptr),
  .wclken(wclken)
  );
  
  FIFO_MEM_CTRL U_FIFO_MEM_CTRL(
  .wdata(wdata),
  .wclken(wclken),
  .waddr(waddr),
  .wclk(wclk),
  .raddr(raddr),
  .rdata(rdata),
  .wfull(wfull),
  .RST(wrst_n)
  );
  
  DF_SYNC U_DF_SYNC_RD(
  .CLK(rclk),
  .RST(rrst_n),
  .ASYNC(wptr),
  .SYNC(rq2_wptr)
  );
  
  BIT_SYNC U_DF_SYNC_WR(
  .CLK(wclk),
  .RST(wrst_n),
  .ASYNC(rptr),
  .SYNC(wq2_rptr)
  );
  
endmodule
  

