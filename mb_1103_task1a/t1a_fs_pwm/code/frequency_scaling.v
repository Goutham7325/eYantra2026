
module frequency_scaling (
    input clk_50M,
    output reg clk_3125KHz
);

initial begin
    clk_3125KHz = 0;
end
//////////////////DO NOT MAKE ANY CHANGES ABOVE THIS LINE //////////////////

reg [3:0] counter= 7;

always @(posedge clk_50M) begin
    if (counter == 7) begin
        clk_3125KHz <= ~clk_3125KHz; // Toggle output clock every 8 input clock cycles
        counter <= 0;   // Reset counter
    end else begin
        counter <= counter + 1; // Increment counter
    end
end

//////////////////DO NOT MAKE ANY CHANGES BELOW THIS LINE //////////////////

endmodule
