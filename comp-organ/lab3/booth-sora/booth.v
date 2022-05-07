module booth (
    input  wire        clk  ,
    input  wire        rst_n,
    input  wire [15:0] x    ,
    input  wire [15:0] y    ,
    input  wire        start,
    output reg  [31:0] z    ,
    output wire        busy 
);

reg[3:0] cn;
reg sign_d;
reg busy_reg;
reg [16:0] savex;
reg [16:0] savey;

wire [16:0] px = {savex[15],savex[15:0]};
wire [16:0] nx = (~px)+1;
wire [16:0] opt = {savey[15:0],1'b0};
wire cn_end = {cn == 15};
wire [16:0] pz = {sign_d,z[31:16]} + px;
wire [16:0] nz = {sign_d,z[31:16]} + nx;

assign busy = busy_reg;



always @(posedge clk, negedge rst_n) begin
    if(~rst_n|| start) begin
        cn <= 4'h0;
    end
    else if (busy) begin
        if (~cn_end) begin
            cn <= cn + 1;
        end
    end
end

always @(posedge clk, negedge rst_n) begin
    if(~rst_n) begin
        savex <= 0;
        savey <= 0;
    end
    else if(start) begin
        savex <= x;
        savey <= y;
    end
end


always @(posedge clk, negedge rst_n) begin
    if(~rst_n) begin
        busy_reg <= 1'b0;
    end
    else begin
        if(start) begin
            busy_reg <= 1'b1;
            end
            else if(cn_end) begin
                busy_reg <= 1'b0;
            end
        end
end

always @(posedge clk, negedge rst_n) begin
    if(~rst_n||start)begin
        z[31:0] <= 0;
        sign_d <=0;
    end
    else begin
        if(busy) begin
            case({opt[cn+1],opt[cn]})
                2'b01:begin
                    // wire [16:0] pz = {sign_d,z[31:16]} + px;
                    {sign_d,z[31:0]} <= {pz[16],pz[16:0], z[15:1]};
                end
                2'b10:begin
                    // wire [16:0] nz = {sign_d,z[31:16]} + nx;
                    {sign_d,z[31:0]} <= {nz[16],nz[16:0], z[15:1]};
                end
                default:z[31:0] <= {sign_d,z[31:1]};
            endcase
        end
    end
end


endmodule