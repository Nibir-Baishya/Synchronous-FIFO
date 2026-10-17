`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.10.2026 18:51:22
// Design Name: 
// Module Name: FIFO_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////





module tb_FIFO;

    reg clk;
    reg rst;
    reg wr_en;
    reg rd_en;
    reg [7:0] d_in;

    wire [7:0] d_out;
    wire full;
    wire empty;

    // Design Under Test
    FIFO uut (
        .clk(clk),
        .rst(rst),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .d_in(d_in),
        .d_out(d_out),
        .full(full),
        .empty(empty)
    );

    // Clock generation: 10 ns period
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 0;
        wr_en = 0;
        rd_en = 0;
        d_in = 0;

        // Apply reset
        #12;
        rst = 1;

        // Write 10
        @(negedge clk);
        wr_en = 1;
        d_in = 10;

        // Write 20
        @(negedge clk);
        d_in = 20;

        // Write 30
        @(negedge clk);
        d_in = 30;

        // Stop writing
        @(negedge clk);
        wr_en = 0;

        // Read data
        rd_en = 1;

        repeat (3) @(negedge clk);

        rd_en = 0;

        // Finish simulation
        #10;
        $finish;
    end

endmodule
