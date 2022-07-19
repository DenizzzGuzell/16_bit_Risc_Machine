# 16_bit_Risc_Machine
CENG Computer Organization Term Project


Introduction
-------------------------------------------------------------------------------------------------------
  Now days, Computers are mainstream in quotidian activities. RISC Processor is a CPU design strategy
that uses simplified instructions for higher performance with faster execution of instruction. It also
reduces the delay in execution. It uses general instructions rather than specialized instructions. They
are less costly to design, test and manufacture. This has helped in implementation of RISC in
technological field. Its range of application includes signal processing, convolution application,
supercomputers such as K computers and wider base for smart phones.

The Features Of Design
-------------------------------------------------------------------------------------------------------
  
  ➢ 16-bit RISC-based single-cycle design processor. The processor should support the following
instruction set;
add sub and or
slt slti j jr
jal sll srl beq
bne mult muli lui
lw sw
  ➢ 8 registers with a length of 16 bits.
  ➢ -The multiplication instructions supports 8 x 8-bit multiplication in mul, and multiplication of
the lower half of the register with immediate value in the muli instruction.
  ➢ Grouped instructions according to their types, the design for the datapath, and control.
  ➢ single-cycle processor approach.
  ➢ 1K bytes of IM and DM, and processors supports, as much capability as possible like loops
(branches), procedures, and their calls

The Architecture Of Design
-------------------------------------------------------------------------------------------------------
  Instruction design
  -------------------------------------------------------------------------------------------------------
  R-Type
  -------------------------------------------------------------------------------------------------------
  4-bit OpCode------3-bit Rs------3-bit Rt-----3-bit Rd----------3-bit Function Code
  Given add,sub,and,or,slt,sll,srl,mult is R-type instructions.
  R types generaly have same opcode which is 4’h8
  The function code sends alu to AluOp codes
  The instructions which have 4’h8
  Function code = 3’b001 for Add R[rd] = R[rs] + R[rt]
  Function code = 3’b010 for And R[rd] = R[rs] & R[rt]
  Function code = 3’b011 for Sub R[rd] = R[rs] - R[rt]
  Function code = 3’b100 for Or R[rd] = R[rs] | R[rt]
  Function code = 3’b101 for Slt R[rd] = (R[rs] < R[rt]) ? 1 : 0
  Function code = 3’b111 for Mult R[rd] = R[rs] * R[rt]
  Function code = 3’b000 for default::
  The instructions which have not 4’h8
  Op code = 4’b1010 for sll R[rd] = R[rt] << shamt
  Op code = 4’b0110 for srl R[rd] = R[rt] >> shamt


The Architecture Of Design
-------------------------------------------------------------------------------------------------------
  Instruction design
  -------------------------------------------------------------------------------------------------------
  I-Type
  -------------------------------------------------------------------------------------------------------
  4-bit OpCode-------------3-bit Rs--------------3-bit Rt-------------6-bit Immediate
  Given Muli,Slti,lui,lw,sw,beq,bne,ori,addi is I-type instructions.
  The OpCode of I type instructions are
  Op code = 4’b1100 for slti R[rt] = (R[rs] < SignExtImm)? 1 : 0
  Op code = 4’b1110 for lui R[rt] = {imm, 16’b0}
  Op code = 4’b1111 for lw R[rt] = M[R[rs]+SignExtImm]
  Op code = 4’b0011 for sw M[R[rs]+SignExtImm] = R[rt]
  Op code = 4’b0000 for beq if(R[rs]==R[rt]) PC=PC+4+BranchAddr
  Op code = 4’b0101 for ori R[rt] = R[rs] | ZeroExtImm
  Op code = 4’b1011 for addi R[rt] = R[rs] + SignExtImm
  
The Architecture Of Design
-------------------------------------------------------------------------------------------------------
  Instruction design
  -------------------------------------------------------------------------------------------------------
  J-Type
  -------------------------------------------------------------------------------------------------------
  4-bit OpCode-----------------------------------------------------12-bit Immediate
  Given j,jr,jal is J-type instructions.
  The OpCode of J type instructions are
  Op code = 4’b0001 for j PC=JumpAddr
  Op code = 4’b1001 for jal R[5]=PC+8;PC=JumpAddr
  Registers
  Register [0], Register [1], Register [2], Register [3], Register [4], Register [7]
  are General purpose registers.
  Register [5]
  reserved for return address which is for jal instruction.
  Register [6]
  reserved for stack pointer which is 128 at beginning.
  
 DATAPATH
 -------------------------------------------------------------------------------------------------------
   The .circ file schematic shows the overall architecture of the processor. The designed RISC
 processor .The blocks present in the architecture are: ALU, Control Unit, Instruction Memory, Data Memory, Program Counter, Register File and various MUX units. It needs to Logism for understanding of datapath using .circ file
 
 ![image](https://user-images.githubusercontent.com/81621705/179777883-d97f1cd8-529a-4cdb-9386-a8b71093fe0c.png)

 
 ALU
 -------------------------------------------------------------------------------------------------------
  The arithmetic logical unit (ALU) we have designed is a very simple one. Its functions include basic
arithmetic operations, bit shifting operations and logical operations.

![image](https://user-images.githubusercontent.com/81621705/179778039-5a45947f-727e-463e-b121-fc2b9a508587.png)


Control Unit
-------------------------------------------------------------------------------------------------------
  The control unit (CU) is a component of the processor. It tells the computer's memory, arithmetic
and logic unit and input and output devices how to respond to the instructions that have been sent
to the processor. It directs the operation of the other units by providing timing and control signals.
Most computer resources are managed by the CU. Hardwired control units are implemented through
use of combinational logic units, featuring a finite number of gates that can generate specific results
based on the instructions that were used to invoke those responses. Hardwired control units are
generally faster than the micro programmed designs. The Design for the control unit is shown below.

![image](https://user-images.githubusercontent.com/81621705/179778090-23406745-df6c-43a2-96f2-184b1c773180.png)


The example Risc machine output
-------------------------------------------------------------------------------------------------------

![image](https://user-images.githubusercontent.com/81621705/179778342-9bfcb60e-329f-4d8c-87d7-39257c79cee0.png)


FPGA board Description
-------------------------------------------------------------------------------------------------------

  The Nexys 4 DDR board is a complete, ready-to-use digital circuit development platform
based on the latest Artix-7™ Field Programmable Gate Array (FPGA) from Xilinx®. generous external memories, and collection of USB, Ethernet, and other ports, the Nexys4 DDR can host designs ranging from introductory combinational circuits to powerful embedded processors. Several built-in peripherals, including an accelerometer, temperature sensor, MEMs digital microphone, a speaker amplifier, and several I/O devices allow the Nexys4 DDR to be used for a wide range of designs without needing any other components.

![image](https://user-images.githubusercontent.com/81621705/179778589-009fc956-b45b-4efe-8746-db4f15b334f2.png)

The Nexys4 DDR board includes a single 100 MHz crystal oscillator

15,850 logic slices, each with four 6-input LUTs and 8 flip-flops

4,860 Kbits of fast block RAM

The example FPGA board usage
-------------------------------------------------------------------------------------------------------

![image](https://user-images.githubusercontent.com/81621705/179779022-ca1e32ee-6071-4a1a-828d-70f99d280321.png)


Summary
-------------------------------------------------------------------------------------------------------

Thus, we have designed and simulated a 16-bit RISC processor using Verilog and verified its working by simulation. The processor can be extended to a 32 or even a 64-bit processor in the future by simple changes in the code and the datapath can be altered to include various new blocks which is not possible on a traditional processor unit.
