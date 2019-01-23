// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

  @SCREEN //Load the location of the screen into R0
  D=A
  @R0
  M=D
(LOOP)
  @R0 //Check to see if we have overflowed the screen at the end
  D=M
  @24576
  D=D-A
  @CONT
  D;JLT
  @SCREEN
  D=A
  @R0
  M=D
  (CONT)
    @R0 //Check to see if we have overflowed the screen at the beginning
    D=M
    @SCREEN
    D=A-D
    @CONT2
    D;JLE
    @24576
    D=A
    @R0
    M=D
    (CONT2)
    @KBD //the keyboard
    D=M
    @WHITE
    D;JEQ
    (BLACK)
      @R0
      A=M
      M=-1
      @R0
      M=M+1
      @LOOP
      0;JMP
    (WHITE)
      @R0
      A=M
      M=0
      @R0
      M=M-1
      @LOOP
      0;JMP