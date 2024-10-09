This project consists of the following:

“RTL to GDS Implementation of Low Power Configurable Multi Clock Digital System”(Still in progress, expected to be finished in 2 weeks or less).

Description: It is responsible of receiving commands through UART receiver to do different system functions as register file reading/writing or doing some processing using ALU block 
and send result to UART transmitter through asynchronous FIFO for handling different clock rates and avoid data loss.

Project phases: -

1) RTL Design from Scratch of system blocks (ALU, Register File, Synchronous FIFO, Integer Clock Divider, Clock Gating, Synchronizers, Main Controller, UART TX, UART RX).
   
2) Integrate and verify functionality through self-checking testbench.

3) Constraining the system using synthesis TCL scripts.

4) Synthesize and optimize the design using design compiler tool.

5) Analyze Timing paths and fix setup and hold violations.

6) Verify Functionality equivalence using Formality tool

7) Physical implementation of the system passing through ASIC flow phases and generate the GDS File.

8) Verify functionality post-layout considering the actual delays.
