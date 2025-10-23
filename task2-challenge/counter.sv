module counter #(
    parameter WIDTH = 8
) (
    input logic clk,
    input logic rst,
    input logic en,
    input logic ctrl, // Challenge: control signal to switch direction
    output logic [WIDTH-1:0] count
);

always_ff @(posedge clk, posedge rst) begin // Challenge 2: make it asynchronous
    if (rst) count <= {WIDTH{1'b0}};
    else begin
        if (!ctrl) count <= count + {{WIDTH-1{1'b0}}, en};
        else count <= count - {{WIDTH-1{1'b0}}, en}; // Decrement when ctrl is high
    end
    // Task 1: At the rising edge of the clock, if reset is inactive and enable is 1, 
    // the counter increments by 1; otherwise, it holds its current value.
end

endmodule
