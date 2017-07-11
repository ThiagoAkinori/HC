module Mux32(In1, In2, Ctr, Out);
    input[31:0] In1, In2;
    input Ctr;
    output reg[31:0] Out;
    
    always@(*)begin
    
        if(Ctr==0)
            Out=In1;
        else 
            Out=In2;
    
    end
    
endmodule