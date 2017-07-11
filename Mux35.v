module Mux35(Reg1, Reg2, Reg3, RegCtr, RegOut);
    input[4:0] Reg1, Reg2, Reg3;
    input[1:0] RegCtr;
    output reg[4:0] RegOut;
    
    always @(*)begin
    
        case (RegCtr[1:0])
            2'b00: RegOut = Reg1;
            2'b01: RegOut = Reg2;
            2'b10: RegOut = Reg3;
            default: RegOut = 5'b00000;
        endcase
        
    end
    
endmodule