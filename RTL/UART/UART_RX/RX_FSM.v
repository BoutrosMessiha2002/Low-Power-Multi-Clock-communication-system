module FSM(
  input RX_IN,
  input PAR_EN,
  input [5:0] edge_cnt,
  input [3:0] bit_cnt,
  input par_err,
  input strt_glitch,
  input stp_err,
  input CLK,
  input RST,
  input [5:0] prescale,
  output reg dat_samp_en,
  output reg enable,
  output reg par_chk_en,
  output reg strt_chk_en,
  output reg stp_chk_en,
  output reg deser_en,
  output reg data_valid,
  output reg from_parity
  );
  parameter IDLE=3'b000;
  parameter START=3'b001;
  parameter DATA=3'b011;
  parameter PARITY=3'b010;
  parameter STOP=3'b110;
  parameter VALID=3'b111;
  
  parameter ON=1'b1;
  parameter CORRECT=1'b1;
  parameter INCORRECT=1'b0;
  parameter OFF=1'b0;
  
  reg [2:0] current_state;
  reg [2:0] next_state;
  wire edge_6;
  wire edge_14;
  wire edge_30;
  wire edge_7;
  wire edge_15;
  wire edge_31;
  wire data_valid_c;
  reg delay_parity;
  reg error_detected;

  
  
  always @(posedge CLK or negedge RST)
  begin
    if(!RST)
      current_state<=IDLE;
    else
      current_state<=next_state;
  end
  /*
  The importance of this always block is that if I want to enable parity for the next frame, or 
  disable it, I want this signal to come one clock after the start bit of the second  frame, 
  to prevent any miscalculation that may lead to data error.
  */
  always @(posedge CLK or negedge RST)
  begin
    if(!RST)
      delay_parity<=1'b0;
    else if(PAR_EN)
      delay_parity<=1'b1;
    else
      delay_parity<=1'b0;
  end
  /*
  This always block duty is to make data_valid 0 all along the frame if a single error is
  detected, and returns to one if there's another frame coming or if there's nothing.
  */
  always @(posedge CLK or negedge RST) begin
    if (!RST)
      error_detected <= 1'b0;
    else if (strt_glitch || stp_err || par_err)
      error_detected <= 1'b1;  
    else if ((!RX_IN&&(current_state==START))||(RX_IN&&current_state==IDLE))
      error_detected <= 1'b0;  
  end

  always @(*)
  begin
    case (current_state)
      IDLE:
      begin
      if(!RX_IN)
        begin
        next_state=START;
        enable=ON;
        dat_samp_en=ON;
      end
      else
        begin
        next_state=IDLE;
        enable=OFF;
        dat_samp_en=OFF;
      end
      end
      
      START:
      begin
        if(edge_cnt==prescale-1)
          begin
            enable=ON;
        dat_samp_en=ON;
        next_state=DATA;
      end
        else
          begin
          enable=ON;
        dat_samp_en=ON;
        next_state=START;
      end
      end
          
      DATA:
      begin
          if(edge_cnt==prescale-1&&bit_cnt==4'd8)
            begin
              if(delay_parity)
                begin
                next_state=PARITY;
                enable=ON;
        dat_samp_en=ON;
      end
              else
                begin
                  enable=ON;
        dat_samp_en=ON;
                next_state=STOP;
              end
              end
            else
              begin
                enable=ON;
        dat_samp_en=ON;
              next_state=DATA;
            end
      end
      
      PARITY:
      if(edge_cnt==prescale-1)
        begin
        next_state=STOP;
        enable=ON;
        dat_samp_en=ON;
      end
      else
        begin
      next_state=PARITY;
      enable=ON;
        dat_samp_en=ON;
      end
      
     STOP: begin
        if (RX_IN && edge_cnt == prescale-1)
          begin
            enable=ON;
          next_state = IDLE;
          dat_samp_en=OFF;
      end  // Transition directly to START state
        else if (!RX_IN && edge_cnt == prescale-1)
          begin
          enable=ON;
        dat_samp_en=ON;
          next_state = START;
        end  // Transition directly to START state
        else
          begin
            enable=ON;
        dat_samp_en=ON;
          next_state = STOP;
        end
       
      
end
 default:
        begin
          next_state=IDLE;
          dat_samp_en=OFF;
        enable=OFF;
        
end
    endcase
  end
      
  always @(*)
  begin
        
        par_chk_en=OFF;
        strt_chk_en=OFF;
        stp_chk_en=OFF;
        deser_en=OFF;
        from_parity=OFF;
        
    case (current_state)
        
      IDLE:
      begin
        
        par_chk_en=OFF;
        strt_chk_en=OFF;
        stp_chk_en=OFF;
        deser_en=OFF;
      end
      
      START:
      begin
         if(edge_6||edge_14||edge_30)
        strt_chk_en=ON;
      else
        strt_chk_en=OFF;
       
      end
      
      DATA:
      begin
     
        if((edge_7||edge_15||edge_31))
        deser_en=ON;
        else
        deser_en=OFF;  
             
      end
      
      PARITY:
      begin
        
         if(edge_6||edge_14||edge_30)
        par_chk_en=ON;
      else
        par_chk_en=OFF;
      
        from_parity=ON;
      end
      
      STOP:
      begin
        
        if(edge_7||edge_15||edge_31)
        stp_chk_en=ON;
      else
        stp_chk_en=OFF;
      
      end
      
       
  endcase
    end
    always @ (posedge CLK or negedge RST)
    begin
      
if(!RST)
      
  data_valid<=1'b0;
    
  else
    
    data_valid<=data_valid_c;
    end
    assign data_valid_c=(!error_detected&&!stp_err&&!strt_glitch&&!par_err)&&((bit_cnt==4'd9&&!PAR_EN||bit_cnt==4'd10&&PAR_EN)&&(edge_cnt==prescale-1));
    
    assign edge_6=(edge_cnt==5'd6&&prescale==6'd8);
    assign edge_14=(edge_cnt==5'd14&&prescale==6'd16);
    assign edge_30=(edge_cnt==5'd30&&prescale==6'd32);
    
    assign edge_7=(edge_cnt==5'd7&&prescale==6'd8);
    assign edge_15=(edge_cnt==5'd15&&prescale==6'd16);
    assign edge_31=(edge_cnt==5'd31&&prescale==6'd32);
    
  
  
  
endmodule




