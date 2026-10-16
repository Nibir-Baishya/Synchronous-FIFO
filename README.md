# Synchronous FIFO Design in Verilog

A synchronous First-In, First-Out (FIFO) buffer implemented in Verilog HDL. The design uses an 8-entry memory with separate read and write pointers to manage data storage and retrieval.

## Features

- 8-bit input and output data
- FIFO depth of 8 entries
- Separate read and write pointers
- Active-low reset (`rst`)
- Write enable (`wr_en`) and read enable (`rd_en`)
- Full and empty status flags
- Protection against writes when full and reads when empty

## RTL Design

The FIFO module is named `FIFO`.

| Signal | Description |
|---|---|
| `clk` | Clock input |
| `rst` | Active-low reset |
| `d_in` | 8-bit input data |
| `d_out` | 8-bit output data |
| `wr_en` | Write enable |
| `rd_en` | Read enable |
| `full` | Indicates FIFO is full |
| `empty` | Indicates FIFO is empty |

The internal memory stores 8 data words. The write pointer selects the location for incoming data, while the read pointer selects the oldest stored data.

A 4-bit occupancy counter tracks the number of entries currently stored in the FIFO.

## FIFO Operation

1. **Write:** When `wr_en` is asserted and the FIFO is not full, input data is stored at the write pointer's location.
2. **Read:** When `rd_en` is asserted and the FIFO is not empty, the oldest stored data is read.
3. **Status:** The `full` flag is asserted when occupancy reaches 8. The `empty` flag is asserted when occupancy is 0.
4. **Reset:** An active-low reset clears the pointers and occupancy counter.

## Verification

The testbench `tb_FIFO` generates a clock and applies reset, write, and read operations.

The basic test writes the values `10`, `20`, and `30`, then reads them in the same order to verify FIFO data ordering.

## Project Structure

```text
Synchronous-FIFO/
├── FIFO.v
├── tb_FIFO.v
└── README.md
```

## Simulation

Simulate the design using Icarus Verilog:

```bash
iverilog -o fifo_sim FIFO.v tb_FIFO.v
vvp fifo_sim
```

If the testbench generates a VCD waveform:

```bash
gtkwave fifo.vcd
```

## Tools

- Verilog HDL
- Icarus Verilog
- GTKWave (for waveform viewing)

## Author

Nibir Baishya

