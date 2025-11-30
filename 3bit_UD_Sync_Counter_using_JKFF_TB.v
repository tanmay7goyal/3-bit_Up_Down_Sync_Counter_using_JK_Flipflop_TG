`timescale 1ns/1ps

module sync_jk_3bit_tb;

    reg clk;
    reg rst;
    reg ud;
    wire q2, q1, q0;

    // Instantiate the DUT
    sync_jk_3bit uut (
        .clk(clk),
        .rst(rst),
        .ud(ud),
        .q2(q2),
        .q1(q1),
        .q0(q0)
    );

    // Clock generation: 10ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Apply stimulus
    initial begin
        // Initial values
        rst = 1;   // start with reset active
        ud  = 1;   // start with UP count

        #20 rst = 0;   // release reset

        // Count UP for some time
        #100;

        // Change direction to DOWN
        ud = 0;

        // Count DOWN for some time
        #100;

        $finish;
    end

    // Monitor output
    initial begin
        $monitor("Time=%0t | rst=%b ud=%b | q2q1q0 = %b%b%b",
                  $time, rst, ud, q2, q1, q0);
    end

endmodule

