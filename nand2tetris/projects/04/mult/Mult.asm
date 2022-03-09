// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

//Got help from https://github.com/havivha/Nand2Tetris/
// Put your code here.
@2
M=0 //R2=0
(LOOP)
    //while loop
    @0
    D=M
    @END
    D;JEQ //if R0 == 0 Jump to end (if program ran R0 times quit)
    //incrementation
    @1
    D=M //D=R1
    @2
    M=M+D // Sum += R1
    @0
    M=M-1 //R0 = R0-1
    @LOOP
    0;JMP //JUMP to LOOP
(END)
    @END //Loops Infinitely
    0;JMP
