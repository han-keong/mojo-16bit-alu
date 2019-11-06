/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

/*
   Parameters:
     NUM_TEST_CASES = 16
     TEST_NAME = TestCasesROM.SHIFTER_TEST_NAME
     TEST_A = TestCasesROM.SHIFTER_TEST_A
     TEST_B = TestCasesROM.SHIFTER_TEST_B
     TEST_ALUFN = TestCasesROM.SHIFTER_TEST_ALUFN
     TEST_C = TestCasesROM.SHIFTER_TEST_C
     BYPASS_FAIL = 0
     NUM_TEST_SECS = 3
     NUM_FAIL_SECS = 1
     NUM_FAIL_BLINKS = 2
*/
module basic_tester_17 (
    input clk,
    input rst,
    input start,
    input [15:0] test_c,
    output reg [15:0] test_a,
    output reg [15:0] test_b,
    output reg [5:0] test_alufn,
    output reg [1:0] state,
    output reg [31:0] status
  );
  
  localparam NUM_TEST_CASES = 5'h10;
  localparam TEST_NAME = 512'h535241365352413553524134535241335352413253524131534852355348523453485233534852325348523153484c3553484c3453484c3353484c3253484c31;
  localparam TEST_A = 256'h7fff01119999ffff4000800001119999ffff8000800088809999ffff00010001;
  localparam TEST_B = 256'h000700090008000a000e000100090008000a000f000100090008000a000f0001;
  localparam TEST_ALUFN = 96'h8e38e38e3861861860820820;
  localparam TEST_C = 256'h00ff0000ff99ffff0001c00000000099003f0001400000009900fc0080000002;
  localparam BYPASS_FAIL = 1'h0;
  localparam NUM_TEST_SECS = 2'h3;
  localparam NUM_FAIL_SECS = 1'h1;
  localparam NUM_FAIL_BLINKS = 2'h2;
  
  
  localparam NUM_TEST_TIMER_CYCLES = 28'h8f0d180;
  
  localparam NUM_FAIL_TIMER_CYCLES = 26'h2faf080;
  
  reg [31:0] next_status;
  
  reg [27:0] M_display_test_timer_d, M_display_test_timer_q = 1'h0;
  reg [25:0] M_display_fail_timer_d, M_display_fail_timer_q = 1'h0;
  reg [1:0] M_fail_blink_ctr_d, M_fail_blink_ctr_q = 1'h0;
  reg [3:0] M_tester_ctr_d, M_tester_ctr_q = 1'h0;
  localparam IDLE_tester_state = 2'd0;
  localparam TEST_tester_state = 2'd1;
  localparam FAIL_tester_state = 2'd2;
  localparam DONE_tester_state = 2'd3;
  
  reg [1:0] M_tester_state_d, M_tester_state_q = IDLE_tester_state;
  
  always @* begin
    M_tester_state_d = M_tester_state_q;
    M_display_fail_timer_d = M_display_fail_timer_q;
    M_display_test_timer_d = M_display_test_timer_q;
    M_fail_blink_ctr_d = M_fail_blink_ctr_q;
    M_tester_ctr_d = M_tester_ctr_q;
    
    status = 32'h00000000;
    test_a = 1'h0;
    test_b = 1'h0;
    test_alufn = 1'h0;
    if (!start) begin
      M_tester_state_d = IDLE_tester_state;
    end
    state = M_tester_state_q;
    next_status = 32'h4e554c4c;
    
    case (M_tester_state_q)
      IDLE_tester_state: begin
        M_display_test_timer_d = 1'h0;
        M_display_fail_timer_d = 1'h0;
        M_tester_ctr_d = 1'h0;
        next_status = 32'h49444c45;
        if (start) begin
          M_tester_state_d = TEST_tester_state;
        end
      end
      TEST_tester_state: begin
        next_status = TEST_NAME[(M_tester_ctr_q)*32+31-:32];
        test_a = TEST_A[(M_tester_ctr_q)*16+15-:16];
        test_b = TEST_B[(M_tester_ctr_q)*16+15-:16];
        test_alufn = TEST_ALUFN[(M_tester_ctr_q)*6+5-:6];
        if (M_display_test_timer_q < 28'h8f0d180) begin
          M_display_test_timer_d = M_display_test_timer_q + 1'h1;
        end else begin
          M_display_test_timer_d = 1'h0;
          if (test_c != TEST_C[(M_tester_ctr_q)*16+15-:16]) begin
            M_tester_state_d = FAIL_tester_state;
          end else begin
            if (M_tester_ctr_q == 6'h0f) begin
              M_tester_state_d = DONE_tester_state;
              M_tester_ctr_d = 1'h0;
            end else begin
              M_tester_ctr_d = M_tester_ctr_q + 1'h1;
            end
          end
        end
      end
      FAIL_tester_state: begin
        next_status = 32'h4641494c;
      end
      DONE_tester_state: begin
        next_status = 32'h444f4e45;
      end
    endcase
    if (M_tester_state_q == IDLE_tester_state | M_tester_state_q == TEST_tester_state | M_tester_state_q == DONE_tester_state) begin
      status = next_status;
    end else begin
      if (~M_fail_blink_ctr_q[0+0-:1]) begin
        status = next_status;
      end else begin
        status = TEST_NAME[(M_tester_ctr_q)*32+31-:32];
      end
      if (M_display_fail_timer_q < 26'h2faf080) begin
        M_display_fail_timer_d = M_display_fail_timer_q + 1'h1;
      end else begin
        M_display_fail_timer_d = 1'h0;
        if (1'h1) begin
          M_fail_blink_ctr_d = M_fail_blink_ctr_q + 1'h1;
        end else begin
          if (M_fail_blink_ctr_q < 5'h03) begin
            M_fail_blink_ctr_d = M_fail_blink_ctr_q + 1'h1;
          end else begin
            M_fail_blink_ctr_d = 1'h0;
            if (M_tester_ctr_q < 6'h0f) begin
              M_tester_state_d = TEST_tester_state;
              M_tester_ctr_d = M_tester_ctr_q + 1'h1;
            end else begin
              M_tester_state_d = DONE_tester_state;
              M_tester_ctr_d = 1'h0;
            end
          end
        end
      end
    end
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_display_test_timer_q <= 1'h0;
      M_display_fail_timer_q <= 1'h0;
      M_fail_blink_ctr_q <= 1'h0;
      M_tester_ctr_q <= 1'h0;
      M_tester_state_q <= 1'h0;
    end else begin
      M_display_test_timer_q <= M_display_test_timer_d;
      M_display_fail_timer_q <= M_display_fail_timer_d;
      M_fail_blink_ctr_q <= M_fail_blink_ctr_d;
      M_tester_ctr_q <= M_tester_ctr_d;
      M_tester_state_q <= M_tester_state_d;
    end
  end
  
endmodule