module ALU (
  input wire [7:0] A,
  input wire [7:0] B,
  input wire [3:0] ALU_FUN,
  input wire clk,
  output reg [15:0] ALU_OUT,
  output reg Arith_Flag,
  output reg Logic_Flag,
  output reg CMP_Flag,
  output reg Shift_Flag,
  output reg [15:0] result,
  output reg carry);
  
  
  always @(posedge clk)
  begin
    ALU_OUT<=result;
  end
  
  always @(posedge clk)
  begin
    if(ALU_FUN==0||ALU_FUN==1||ALU_FUN==2||ALU_FUN==3)
      begin
        Arith_Flag<=1'b1;
      end
    else
      begin
        Arith_Flag<=1'b0;
   end
     if(ALU_FUN==4||ALU_FUN==5||ALU_FUN==6||ALU_FUN==7||ALU_FUN==8||ALU_FUN==9)
        begin
        Logic_Flag<=1'b1;
      end
    else
      begin
        Logic_Flag<=1'b0;
      end
      
     if(ALU_FUN==10||ALU_FUN==11||ALU_FUN==12)
        begin
        CMP_Flag<=1'b1;
      end
    else
      begin
        CMP_Flag<=1'b0;
      end
     if(ALU_FUN==13||ALU_FUN==14)
         begin
        Shift_Flag<=1'b1;
      end
    else
      begin
        Shift_Flag<=1'b0;
      end
    end
  
  always @(*)
  begin
    case(ALU_FUN)
        4'b0000:
        begin
        result=A+B;
        if(result>255)
          carry=1;
        else
          carry=0;
      end
       4'b0001:
        begin
        result=A-B;
        if(A<B)
          carry=1;
        else
          carry=0;
      end
       4'b0010:
        begin
        result=A*B;
       
      end
       4'b0011:
        begin
        result=A/B;
       
      end
       4'b0100:
        begin
        result=A&B;
        
      end
       4'b0101:
        begin
        result=A|B;
       
      end
       4'b0110:
        begin
        result= ~(A&B);
        
      end
       4'b0111:
        begin
        result=~(A|B);
       
      end
       4'b1000:
        begin
        result=A^B;
       
      end
       4'b1001:
        begin
        result=~(A^B);
        
      end
       4'b1010:
        begin
        if(A==B)
          begin
        result=16'b1;
      end
      else
        begin
        result=16'b0;
      end
       
      end
       4'b1011:
        begin
       if(A>B)
         begin
         result=16'd2;
       end
       else
         begin
         result=16'b0;
       end
       
      end
       4'b1100:
        begin
        if(A<B)
          begin
            result=16'd3;
          end
        else
          begin
            result=16'b0;
          end
        
      end
       4'b1101:
        begin
        result=A>>1;
      
      end
       4'b1110:
        begin
        result=A<<1;
    
      end
       default:
       begin
         result=16'b0;
       end
    endcase
  end
endmodule
      
  
