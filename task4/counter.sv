module counter #(
    parameter WIDTH = 8
) (
    input logic clk,
    input logic rst,
    input logic ld,
    output logic [WIDTH-1:0] count
);

always_ff @(posedge clk, posedge rst) begin // Challenge 2: make it asynchronous
    if (rst) count <= {WIDTH{1'b0}};
    else begin
        if (ld)
            count <= count + {{WIDTH-1{1'b0}}, 1'b1};
    end
end

endmodule
