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
    D;JEQ       //Jump to Setscreen if value of keyboard input is 0
    D=-1        //Set KBD = -1
    
(SETSCREEN)     // Sets status from arguments
    @ARG
    M=D         // Save new status arg
    @status     // Status of entire screen
    D=D-M       // D=newstatus-status
    @LOOP
    D;JEQ        // Jump if status == 0
    
    @ARG
    D=M         //Puts ARG into Data memory
    @status
    M=D         // saves status memory with ARG
    
    @SCREEN
    D=A         // D=Screen address
    @8192
    D=D+A       // 1 bit past screen address
    @i
    M=D         // assign i to screen address
    
(SETLOOP)    
    @i
    D=M-1       //puts i-1 in data memory
    M=D         // i= data memory
    @LOOP
    D;JLT       // if i<0 Jump to LOOP
    
    @status
    D=M         // D=status
    @i
    A=M         //new i = previous i
    M=D         //previous i = data register
    @SETLOOP
    0;JMP //Goto SETLOOP