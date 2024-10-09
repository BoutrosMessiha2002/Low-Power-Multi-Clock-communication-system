


module TX_FSM(
  input ser_done,
  input PAR_EN,
  input Data_Valid,
  input CLK,
  input RST,
  output reg ser_en,
  output reg busy,
  output reg [1:0] mux_sel);
  
  parameter IDLE= 3'b000;
  parameter START= 3'b001;
  parameter SERIAL= 3'b011;
  parameter STOP=3'b010;
  parameter PARITY=3'b110;
  reg [2:0] current_state;
  reg [2:0] next_state;
    
  always @(posedge CLK or negedge RST)
  begin
    if(!RST)
      current_state<=IDLE;
    else
      current_state<=next_state;
    end
    
    always @(*)
    begin
      ser_en=1'b0;
      mux_sel=2'b01;
      busy=1'b0;
      next_state=IDLE;
      case(current_state)
       IDLE:
       begin
       if(Data_Valid)
         begin
           next_state=START;
            mux_sel=2'b00;
            busy=1'b1;
            ser_en=1'b0;
         end
         else
           begin
             next_state=IDLE;
           end
        end
        START:
        begin
          next_state=SERIAL;
          mux_sel=2'b10;
          busy=1'b1;
          ser_en=1'b1;
        end
            SERIAL:
            begin
              if(ser_done)
                begin
                  if(PAR_EN)
                    begin
                      next_state=PARITY;
                       busy=1'b1;
                       ser_en=1'b0;
                       mux_sel=2'b11;
                    end
                  else 
                    begin
                      next_state=STOP;
                      busy=1'b0;
                      ser_en=1'b0;
                      mux_sel=2'b01;  
                    end
                  end
                  else
                    begin
                      next_state=SERIAL;
                      mux_sel=2'b10;
                      busy=1'b1;
                      ser_en=1'b1;
                    end
            end
          PARITY:
          begin
            next_state=STOP;
            busy=1'b0;
            ser_en=1'b0;
            mux_sel=2'b01;  
          end
          STOP:
            begin
              if(Data_Valid)
                begin
                next_state=START;
                 mux_sel=2'b00;
                 busy=1'b1;
                 ser_en=1'b0;
               end
              else
                begin
            next_state=IDLE;
          end
        end
      endcase
    end
    endmodule
  
