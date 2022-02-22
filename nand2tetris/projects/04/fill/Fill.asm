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

// Put your code here.
//implemented using https://github.com/havivha/Nand2Tetris/
//Page 14
    @status
    M=-1        // status=-1
    D=0         // Argument - what to set screen bits to
    @SETSCREEN
    0;JMP       //GOTO SETSCREEN

(LOOP)
    @KBD
    D=M         // D = current keyboard character
    @SETSCREEN
    D;JEQ       // If no key, set screen to 0
    D=-1        // If key pressed, set screen to 1
    
(SETSCREEN)     // Sets status from arguments
    @ARG
    M=D         // Save new status arg
    @status     // Status of entire screen
    D=D-M       // D=newstatus-status
    @LOOP
    D;JEQ        // Do nothing if new status == old status
    
    @ARG
    D=M
    @status
    M=D         // status = ARG
    
    @SCREEN
    D=A         // D=Screen address
    @8192
    D=D+A       // 1 bit past screen address
    @i
    M=D         // assign i to screen address
    
(SETLOOP)    
    @i
    D=M-1
    M=D         // i=i-1
    @LOOP
    D;JLT       // if i<0 GOTO LOOP
    
    @status
    D=M         // D=status
    @i
    A=M
    M=D         // M[current screen address]=status
    @SETLOOP
    0;JMP //GOTO SETLOOP