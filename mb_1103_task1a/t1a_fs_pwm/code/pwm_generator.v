
module pwm_generator(
    input clk_3125KHz,
    input [3:0] duty_cycle,
    output reg clk_195KHz, pwm_signal
);

initial begin
    clk_195KHz = 0; pwm_signal = 1;
end


//////////////////DO NOT MAKE ANY CHANGES ABOVE THIS LINE //////////////////


reg [3:0] pwm_count = 0;          
reg [3:0] clk_count = 7;  

// Clock divider for 195KHz clock from 3.125 MHz input clock
always @(posedge clk_3125KHz) begin
    if (clk_count == 7) begin
        clk_195KHz <= ~clk_195KHz; // Toggle output clock every 8 input clock cycles
        clk_count <= 0; // Reset counter
    end else begin
        clk_count <= clk_count + 1; // Increment counter
    end
end

// PWM Generation
always @(posedge clk_3125KHz) begin
    if (duty_cycle == 0) begin
        pwm_signal <= 0;        
        pwm_count <= 0;       
    end else begin
        if (pwm_count >= duty_cycle) begin // If count is greater or equal to duty cycle, set PWM Low
            pwm_signal = 0;
            if (pwm_count >= 16) begin    // If count exceeds full period, reset count and set PWM High
                pwm_signal = 1;
                pwm_count = 0;
            end else begin
                pwm_count <= pwm_count + 1; // Increment PWM count
            end
        end else begin
            pwm_signal = 1;
            pwm_count <= pwm_count + 1;
        end
    end
end

//////////////////DO NOT MAKE ANY CHANGES BELOW THIS LINE //////////////////

endmodule
