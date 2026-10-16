# Synchronous FIFO Design in Verilog HDL

A synchronous First-In, First-Out (FIFO) buffer designed and simulated using Verilog HDL and Xilinx Vivado. The project demonstrates RTL design, FIFO data management, and functional verification through simulation waveforms.

## Features

- 8-bit data width
- FIFO depth of 8 entries
- Separate read and write pointers
- Active-low reset
- Read and write enable control
- Full and empty status flags
- Simulation-based verification using Vivado

## Design Overview

The FIFO stores incoming data in an internal memory and retrieves it in the same order it was written.

- **Write operation:** Stores input data when write enable is asserted and the FIFO is not full.
- **Read operation:** Retrieves the oldest stored data when read enable is asserted and the FIFO is not empty.
- **Full flag:** Indicates that the FIFO has reached its storage capacity.
- **Empty flag:** Indicates that the FIFO contains no valid data.
- **Reset:** Initializes the FIFO control state.

## Simulation and Verification

The design was simulated using the **Xilinx Vivado Simulator (XSim)**.

The testbench applies reset, write, and read operations to verify FIFO behavior. The simulation waveform is included in this repository to illustrate the control signals, status flags, and data transfers.


## Project Structure

```text
Synchronous-FIFO/
├── FIFO.v
├── tb_FIFO.v
├── waveform.png
└── README.md
```

## Tools Used

- Verilog HDL
- Xilinx Vivado
- Vivado Simulator (XSim)

## Author

Nibir Baishya
