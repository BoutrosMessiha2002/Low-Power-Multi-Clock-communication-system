module FIFO_MEM_CTRL #(parameter DATA_WIDTH=8)(
  input [DATA_WIDTH-1:0] wdata,
  input wclken,
  input [2:0] waddr,
  input wclk,
  input [2:0] raddr,
  output [DATA_WIDTH-1:0] rdata,
  input wfull,
  input RST
  );
  reg [DATA_WIDTH-1:0] write_reg [7:0];//FIFO depth=6 so I chose 8  
  integer i;
  always @(posedge wclk or negedge RST)
  begin
    if(!RST)
      begin
        for(i=0;i<DATA_WIDTH;i=i+1)
      write_reg[i]<='b0;
    end  
  else if(wclken)
      begin
        write_reg[waddr]<=wdata;
      end
  end
  assign rdata=write_reg[raddr];
endmodule






