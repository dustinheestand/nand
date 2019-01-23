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
  @R0 //We are storing the current write location in R0
  M=D
(LOOP)
  @R0 //Check to see if we have overflowed the screen at the end
  D=M
  @24576
  D=D-A
  @CONT // If the address of the screen is less than the maximum screen value
  D;JLT // continue
  @SCREEN //Otherwise, set R0 to the minimum screen value
  D=A
  @R0
  M=D
  (CONT)
    @R0 //Check to see if we have overflowed the screen at the beginning
    D=M
    @SCREEN
    D=A-D
    @CONT2
    D;JLE // If the address of the screen is greater than the minimum screen value, comtinue
    @24575 //Otherwise, set the value in R- to the end of the screen
    D=A
    @R0
    M=D
      (CONT2)
      @KBD //the keyboard
      D=M
      @WHITE // If the keyboard value is zero
      D;JEQ // Jump to WHITE
      (BLACK) //Else BLACK
        @R0 //Set the memory location specified at R0 to -1 (all black)
        A=M
        M=-1
        @R0
        M=M+1 // Then increment the value in R0
        @LOOP // Then test again to see if the key is still down.
        0;JMP
      (WHITE)
        @R0 //Set the memory location specified at R0 to 0 (all white)
        A=M
        M=0
        @R0
        M=M-1 //Then decrement the value in R0
        @LOOP //Then test again to see if a key is down
        0;JMP