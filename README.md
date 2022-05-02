This is a Verilog implementation of [RISC-V](https://riscv.org/) Instruction Set Architecture (ISA) 

## Details
### Supported Instructions
- *R-Type:* ADD, SUB, OR, AND, SLL, SRL, SRA, SLT, SLTU
- *I-Type:* ADDI, ORI, ANDI, SLLI, SRLI, SLTI, LW, LH, LB
- *S-Type:* SW, SH, SB
- *B-Type:* BEQ, BNE, BLT
- *J-Type:* JAL, JALR
- *U-Type:* LUI
  
### Getting Started

1. Install Vivado Hlx design suite 2018.2 (recommended).
2. Clone repository and include **design**, **simulation** and **constraint** sources in vivado project.
3. Run behavioural simulation and open the waveform configuration file.
4. **Synthesize** the model.
5. Set constraints and run **implementation**.
6. Generate **bit stream** and upload it to FPGA.

### FPGA

Xilinix Nexys A7:tm: *xc7a100tcsg324-1*

![FPGA](https://github.com/HamxaCodes/RiscV-Single-Cycle/blob/media/nexys_a7.jpg?raw=true)

## Simulations
### 0 to 100ns
![wave0to100](https://github.com/HamxaCodes/RiscV-Single-Cycle/blob/media/wave1.png?raw=true)

### 100 to 200ns
![wave100to200](https://github.com/HamxaCodes/RiscV-Single-Cycle/blob/media/wave2.png?raw=true)

### 200 to 300ns
![wave200to300](https://github.com/HamxaCodes/RiscV-Single-Cycle/blob/media/wave3.png?raw=true)

### 300 to 400ns
![wave300to400](https://github.com/HamxaCodes/RiscV-Single-Cycle/blob/media/wave4.png?raw=true)

### 400 to 500ns
![wave400to500](https://github.com/HamxaCodes/RiscV-Single-Cycle/blob/media/wave5.png?raw=true)

### 500 to 600ns
![wave500to600](https://github.com/HamxaCodes/RiscV-Single-Cycle/blob/media/wave6.png?raw=true)

### 600 to 700ns
![wave600to700](https://github.com/HamxaCodes/RiscV-Single-Cycle/blob/media/wave7.png?raw=true)

## Algorithm
### Description
- Data memory has eight 8-bit numbers placed at the starting address of 0x1C.
- Find the largest and the smallest number and display them on the seven segment.
- If the largest number is greater than 50 shift it left by 4 bits, subtract 20 from it and XOR it with 0xFFF else place the 1234567 in the uppermost bits of the largest number then shift it right by 2 bits and then add the smallest number to it.
- Store the results in the memory.

### Assembly Code
![code](https://github.com/HamxaCodes/RiscV-Single-Cycle/blob/media/instr.png?raw=true)





