
`timescale 1ns / 1ps
module FIFO(
    input wire clk,
    input wire rst,
    input wire wr_en,
    input wire rd_en,
    input wire [7:0] d_in,
    output reg [7:0] d_out,
    output wire full,
    output wire empty
);

    // FIFO memory: 8 locations, 8 bits each
    reg [7:0] mem [0:7];

    // Read and write pointers
    reg [2:0] rd_ptr;
    reg [2:0] wr_ptr;

    // Number of stored entries: 0 to 8
    reg [3:0] count;

    // Status flags
    assign full  = (count == 8);
    assign empty = (count == 0);

    // Write operation
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            wr_ptr <= 3'b000;
        end
        else if (wr_en && !full) begin
            mem[wr_ptr] <= d_in;
            wr_ptr <= wr_ptr + 1'b1;
        end
    end

    // Read operation
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            rd_ptr <= 3'b000;
            d_out  <= 8'b00000000;
        end
        else if (rd_en && !empty) begin
            d_out <= mem[rd_ptr];
            rd_ptr <= rd_ptr + 1'b1;
        end
    end

    // Occupancy counter
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            count <= 4'b0000;
        end
        else begin
            case ({wr_en && !full, rd_en && !empty})

                2'b10: count <= count + 1'b1;
                2'b01: count <= count - 1'b1;

                default: count <= count;

            endcase
        end
    end

endmodule

