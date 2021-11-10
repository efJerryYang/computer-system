



/*
 `timescale 1ns / 1ps        //时钟信号的精度和周期
 
module decoder_38(input [2:0] data_i,       //输入数据
                  input [2:0] en_i,         //使能端，高低有效看要求，这里�??0�??1位低有效�??2位高有效
                  output reg [7:0] data_o); //输出的八位数�??
 always @(*) begin
 if (en_i[0] || en_i[1] || !en_i[2])  //注意�??下，译码器一般默认是低有效，�??以全1相当于使能端无效
 data_o = 8'b1111_1111;
 else
 case (data_i)
 3'b000: data_o = 8'b1111_1110;
 3'b001: data_o = 8'b1111_1101;
 3'b010: data_o = 8'b1111_1011;
 3'b011: data_o = 8'b1111_0111;
 3'b100: data_o = 8'b1110_1111;
 3'b101: data_o = 8'b1101_1111;
 3'b110: data_o = 8'b1011_1111;
 3'b111: data_o = 8'b0111_1111;
 endcase
 end
 endmodule
 
 */
