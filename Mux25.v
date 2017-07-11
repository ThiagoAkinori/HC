module Mux25(Reg1, Reg2, RegCtr, RegOut);
    input[4:0] Reg1, Reg2;
    input RegCtr;
    output reg RegOut;
    
    always @(*)begin
    
        if(RegCtr)
            RegOut = Reg1;
        else
            RegOut = Reg2;
        
    end
    
endmodule