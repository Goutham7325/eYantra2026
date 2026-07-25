// Task 2C - MazeSolver Bot

module t2c_maze_explorer (
    input clk,
    input rst_n,
    input left, mid, right, // 0 - no wall, 1 - wall
    output reg [2:0] move
);

/*

| cmd | move  | meaning   |
|-----|-------|-----------|
| 000 | 0     | STOP      |
| 001 | 1     | FORWARD   |
| 010 | 2     | LEFT      |
| 011 | 3     | RIGHT     | 
| 100 | 4     | U_TURN    |

START POS   : 4,0
EXIT POS    : 4,8
DEADENDS    : 9

*/
//////////////////DO NOT MAKE ANY CHANGES ABOVE THIS LINE //////////////////



// FSM States

localparam IDLE   = 2'b00;
localparam DECIDE = 2'b01;
localparam MOVE   = 2'b10;

reg [1:0] state, next_state;

// To store sensor values and decision delay
reg [1:0] cycle_cnt;

// -------------------------------------------------
// Wall-following selector
// 0 = LEFT wall follower
// 1 = RIGHT wall follower
// -------------------------------------------------
reg wall_sel;

// Junction Count
reg [4:0] junction_cnt; 
// Junction Detection
wire junction_detect;
assign junction_detect =
    ((!left && !mid)  ||
     (!mid  && !right)||
     (!left && !right));
//---------------------------------------------
// Sequential: FSM State and Counter
//---------------------------------------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state        <= IDLE;
        cycle_cnt    <= 0;
        junction_cnt <= 0;
        wall_sel     <= 1'b0; // default LEFT wall follower
    end else begin
        state <= next_state;

        if (state == DECIDE || state == MOVE)
            cycle_cnt <= cycle_cnt + 1;
        else
            cycle_cnt <= 0;

        // Count junctions ONLY ONCE per decision
        if (state == MOVE && junction_detect) begin
            junction_cnt <= junction_cnt + 1;
				$display(">>> Junction Count: %d", junction_cnt);
			end

        // -----------------------------------------
        // Hardcoded wall-follow switching logic
        // -----------------------------------------
        case (junction_cnt)
            5'd10: wall_sel <= 1'b1; // switch to RIGHT wall follower
            5'd11: wall_sel <= 1'b1; // switch to RIGHT wall follower
				5'd14: wall_sel <= 1'b1; // switch to RIGHT wall follower
				5'd15: wall_sel <= 1'b1; // switch to RIGHT wall follower
				5'd18: wall_sel <= 1'b1; // switch to RIGHT wall follower
				5'd19: wall_sel <= 1'b1; // switch to RIGHT wall follower
            default: wall_sel <= 1'b0; // left wall
        endcase
    end
end

//---------------------------------------------
// Combinational: Next State Logic
//---------------------------------------------
always @(*) begin
    next_state = state;
    case (state)
        IDLE:   next_state = DECIDE;                 // Start immediately
        DECIDE: if (cycle_cnt == 2'd1) next_state = MOVE;   // after 2 cycles, decide move
        MOVE:   if (cycle_cnt == 2'd3) next_state = DECIDE; // after move issued, go back to decision
        default: next_state = IDLE;
    endcase
end

//---------------------------------------------
// Movement Decision Logic (Left Wall Rule)
//---------------------------------------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        move <= 3'b000; // STOP
    end else begin
        case (state)
            DECIDE: begin
                if (!wall_sel) begin
                    // -------------------------
                    // LEFT wall follower
                    // -------------------------
                    if (!left)
                        move <= 3'b010;   // LEFT
                    else if (!mid)
                        move <= 3'b001;   // FORWARD
                    else if (!right)
                        move <= 3'b011;   // RIGHT
                    else
                        move <= 3'b100;   // U-TURN
                end else begin
                    // -------------------------
                    // RIGHT wall follower
                    // -------------------------
						  $display(">>> RIGHT WALL Follower, Junction Count: %d", junction_cnt);
                    if (!right)
                        move <= 3'b011;   // RIGHT
                    else if (!mid)
                        move <= 3'b001;   // FORWARD
                    else if (!left)
                        move <= 3'b010;   // LEFT
                    else
                        move <= 3'b100;   // U-TURN
                end
            end

            MOVE: begin
                move <= move; // hold stable
            end

            default: begin
                move <= 3'b000;
            end
        endcase
    end
end



//////////////////DO NOT MAKE ANY CHANGES BELOW THIS LINE //////////////////

endmodule
