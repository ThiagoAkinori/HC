module twotobin_conv(twocomplement, sign, binary);

    input[31:0] twocomplement;
    output reg sign;
    output reg[31:0] binary;
    
    always@(*) begin
        sign = twocomplement[31];
        
        if (sign == 1)
            binary = ~(twocomplement-1);
        else
            binary = twocomplement;
    end
endmodule