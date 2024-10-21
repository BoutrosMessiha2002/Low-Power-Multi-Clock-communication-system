module sys_ctrl(
  input CLK,
  input RST,
  input [15:0] ALU_OUT,
  input OUT_Valid,
  input FIFO_FULL,
  output reg [3:0] ALU_FUN,
  output reg ALU_EN,
  output reg CLK_EN,
  output reg [3:0] Address,
  output reg WrEn,
  output reg RdEn,
  output reg [7:0] WrData,
  input [7:0] RdData,
  input RdData_Valid,
  input [7:0] RX_P_DATA,
  input RX_D_VLD,
  output reg [7:0] TX_P_DATA,
  output reg TX_D_VLD,
  output reg clk_div_en);
  
  parameter IDLE=4'b0000;
  parameter RF_WR_ADD=4'b0001;
  parameter RF_WR_DATA=4'b0011;
  parameter RF_RD_ADD=4'b0010;
  parameter OP_A=4'b0110;
  parameter OP_B=4'b0111;
  parameter ALU_FUN_STATE=4'b0101;
  parameter RD_OUT=4'b0100;
  parameter ALU_RD_OUT_LSB=4'b1100;
  parameter DATA_READ=4'b1101;
  parameter ALU_RD_OUT_MSB=4'b1110;
  parameter ALU_OPER_W_NOP_CMD=4'b1111;
  
  reg [3:0] current_state;
  reg [3:0] next_state;
  reg [7:0] read_from_reg;
  reg [3:0] stored_addr;
  reg [3:0] stored_func;
  reg [3:0] stored_data;
 wire addr_c;
  
  always @(posedge CLK or negedge RST)
  begin
    if(!RST)
      current_state<=IDLE;
    else
      current_state<=next_state;
  end
  
  always @(*)
  begin
    case (current_state)
     IDLE:
     begin
       if(RX_P_DATA==8'hAA)
         next_state=RF_WR_ADD;
       else if(RX_P_DATA==8'hBB)
         next_state=RF_RD_ADD;
       else if(RX_P_DATA==8'hCC)
         next_state=OP_A;
       else if(RX_P_DATA==8'hDD)
         next_state=ALU_FUN_STATE;
       else
         next_state=IDLE;
     end
     
     RF_WR_ADD:
     begin
       if(RX_D_VLD)
         next_state=RF_WR_DATA;
       else
         next_state=RF_WR_ADD;
     end
     
     RF_WR_DATA:
     begin
       if(RX_D_VLD)
         next_state=IDLE;
       else
         next_state=RF_WR_DATA;
     end
     
     RF_RD_ADD:
     begin
      if(RX_D_VLD) 
     next_state=DATA_READ;
   else
     next_state=RF_RD_ADD;
   end
    DATA_READ:
    begin
      if(RdData_Valid)
        next_state=RD_OUT;
      else
        next_state=DATA_READ;
    end
     OP_A:
     begin
       if(RX_D_VLD)
         next_state=OP_B;
       else
         next_state=OP_A;
     end
     
     OP_B:
     begin
       if(RX_D_VLD)
         next_state=ALU_FUN_STATE;
       else
         next_state=OP_B;
     end
     
     ALU_FUN_STATE:
     if(RX_D_VLD)
     next_state=ALU_RD_OUT_LSB;
   else
     next_state=ALU_FUN_STATE;
     
     RD_OUT:
     begin
     if(!FIFO_FULL&&RdData_Valid)
       next_state=IDLE;
     else
       next_state=RD_OUT;
   end
   
   ALU_RD_OUT_LSB:
     begin
     if(OUT_Valid&&!FIFO_FULL)
       next_state=ALU_RD_OUT_MSB;
     else
       next_state=ALU_RD_OUT_LSB;
   end
   
   ALU_RD_OUT_MSB:
     begin
     if(OUT_Valid&&!FIFO_FULL)
       next_state=IDLE;
     else
       next_state=ALU_RD_OUT_MSB;
   end
   ALU_OPER_W_NOP_CMD:
   begin
   if(RX_D_VLD)
     next_state=ALU_FUN_STATE;
   else
     next_state=ALU_OPER_W_NOP_CMD;
 end
 default:
 next_state=IDLE;
   endcase
  end
  
    always @(*)
  begin
    ALU_EN=1'b0;
    ALU_FUN=4'b1000;   
    WrEn=1'b0;
    RdEn=1'b0;
    Address=4'b0;
    WrData=8'b0;
    TX_P_DATA=8'b0;
    TX_D_VLD=1'b0;
    clk_div_en=1'b1;
    CLK_EN=1'b0;
    stored_data=8'b0;
    stored_func=4'b1000;
    
    case (current_state)
    IDLE:
    begin
    ALU_EN=1'b0;
    ALU_FUN=4'b1000;   
    WrEn=1'b0;
    RdEn=1'b0;
    Address=4'b0;
    WrData=8'b0;
    TX_P_DATA=8'b0;
    TX_D_VLD=1'b0;
    clk_div_en=1'b1;
    end
    RF_WR_ADD:
    begin
      WrEn=1'b0;
    end
    RF_WR_DATA:
    begin
      WrEn=1'b1;
      WrData=RX_P_DATA;
      Address=stored_addr;
      stored_data=RX_P_DATA;
     end
     
     DATA_READ:
     begin
       RdEn=1'b1;
       Address=stored_addr;
        end
    RD_OUT:
    begin
        Address=stored_addr;
        read_from_reg=RdData;   
      if(!FIFO_FULL&&RdData_Valid)
        begin
               TX_P_DATA 	= RdData;
					     TX_D_VLD = 1'b1;
					     end
					     else
					       TX_D_VLD=1'b0;
          
   end
   
   OP_A:
   begin
  
     if(RX_D_VLD)
       begin
   WrEn=1'b1;
   Address=8'h00;
   WrData=RX_P_DATA;
 end
   end
   
   OP_B:
   begin
     
  if(RX_D_VLD)
       begin
   WrEn=1'b1;
   Address=8'h01;
   WrData=RX_P_DATA;
 end
   end
   
   ALU_FUN_STATE:
   begin
    
     if(RX_D_VLD)
       begin
     ALU_EN=1'b1;
     CLK_EN=1'b1;
     ALU_FUN=RX_P_DATA;
     stored_func=RX_P_DATA;
   end
   end
   
    ALU_RD_OUT_LSB:
    begin
     
     ALU_EN=1'b1;
     CLK_EN=1'b1;
     ALU_FUN=stored_func;
      if(!FIFO_FULL&&OUT_Valid)
        begin
               TX_P_DATA 	= ALU_OUT[7:0];
					     TX_D_VLD = 1'b1;
					     end
					     else
					       TX_D_VLD=1'b0;

    end
    
    ALU_RD_OUT_MSB:
    begin
 
       ALU_EN=1'b1;
     CLK_EN=1'b1;
     
      if(!FIFO_FULL&&OUT_Valid)
        begin
               TX_P_DATA 	= ALU_OUT[15:8];
					     TX_D_VLD = 1'b1;
					     ALU_FUN=4'b1000;
					     end
					     else
					       TX_D_VLD=1'b0;
					       ALU_FUN=stored_func;
    end

    
    endcase
  end
  always @(posedge CLK or negedge RST)
		begin
			if(!RST)
				stored_addr <= 4'b0;
			else if(addr_c)
				stored_addr <= RX_P_DATA; 
		end
		
  assign addr_c= ( (current_state == RF_WR_ADD) ||
													 (current_state == RF_RD_ADD)  );

endmodule


