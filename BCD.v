module BCD (binario, d0, d1, d2, d3, d4, d5, d6);
	input [31:0] binario;
	output reg [3:0] d0, d1, d2, d3, d4, d5, d6;
	integer i;

	always @ ( binario ) begin
		d6 = 4'b0;
		d5 = 4'b0;
		d4 = 4'b0;
		d3 = 4'b0;
		d2 = 4'b0;
		d1 = 4'b0;
		d0 = 4'b0;

		for(i=31; i>=0; i=i-1) begin
			if(d6 >= 5)
				d6 = d6 + 3;
			if(d5 >= 5)
				d5 = d5 + 3;
			if(d4 >= 5)
				d4 = d4 + 3;
			if(d3 >= 5)
				d3 = d3 + 3;
			if(d2 >= 5)
				d2 = d2 + 3;
			if (d1 >= 5)
				d1 = d1 + 3;
			if(d0 >=5)
				d0 = d0 + 3;

			d6 = d6 << 1;
			d6[0] = d5[3];
			d5 = d5 << 1;
			d5[0] = d4[3];
			d4 = d4 << 1;
			d4[0] = d3[3];
			d3 = d3 << 1;
			d3[0] = d2[3];
			d2 = d2 << 1;
			d2[0] = d1[3];
			d1 = d1 << 1;
			d1[0] = d0[3];
			d0 = d0 << 1;
			d0[0] = binario[i];
		end
	end
endmodule // BCD