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
//set i to 0
@i
M=0
(LOOP)
    //while loop
    @i
    D=M //D = i
    @0
    D=D-M //D = i - R0
    @END
    D;JGE //if D >= 0 Jump to end
    //incrementation
    @1
    D=M //D=R1
    @2
    M=M+D // R2 = R2 + R1
    @i
    M=M+1 //i++
    @LOOP
    0;JMP //JUMP to LOOP
(END)
    @END //Loops Infinitely
    0;JMP
