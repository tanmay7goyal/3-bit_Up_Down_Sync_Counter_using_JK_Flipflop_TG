module sync_jk_3bit (
    input clk,
    input rst,
    input ud,         // 1 = Up, 0 = Down
    output reg q2,
    output reg q1,
    output reg q0
);

// J and K equations (combinational)
wire j2 =  ud ? (q1 & q0) : (~q1 & ~q0);
wire k2 =  j2;        // symmetric for up/down

wire j1 =  ud ? q0 : ~q0;
wire k1 =  j1;        // symmetric

wire j0 = 1'b1;
wire k0 = 1'b1;

// JK flip-flop synchronous update
always @(posedge clk) begin
    if (rst) begin
        q2 <= 0;
        q1 <= 0;
        q0 <= 0;
    end else begin
        q2 <= (j2 & ~q2) | (~k2 & q2);
        q1 <= (j1 & ~q1) | (~k1 & q1);
        q0 <= (j0 & ~q0) | (~k0 & q0);
    end
end

endmodule

