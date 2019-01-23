// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)


  @R1
  D=M // D = Memory[R1]
  @LOOP
  D;JGT // If R1 is already positive, jump to doing the addition already

//Otherwise, set both R0 and R1 to negative themselves
(NEG)
  @R1
  M=-M
  @R0
  M=-M
(LOOP)
  @R1
  D=M
  M=M-1
  @END 
  D;JEQ //If R1 = 0 before decrementing, jump to end
  @R0
  D=M //Otherwise store data at R0 in M
  @R2
  M=M+D //Then add that data to the data already in R2
  @LOOP
  0;JMP //And loop back unconditionally - loop breaks above
(END)
  @END
  0;JMP