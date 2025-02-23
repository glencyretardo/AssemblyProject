.386
.model flat, stdcall
option casemap:none

include \masm32\include\windows.inc
include \masm32\include\masm32.inc
include \masm32\include\kernel32.inc
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib

.data
BSNE db 10, 9, "Bachelor of Special Needs Education", 0
menuText db 10, 9, "Select an option:", 0
op1 db 10, 9, "1 - 1st Year", 0
op2 db 10, 9, "2 - 2nd Year", 0
op3 db 10, 9, "3 - 3rd Year", 0
op4 db 10, 9, "4 - 4th Year", 0
op5 db 10, 9, "5 - Exit", 0
newline db 13, 10, 0
prompt db 10, 9, "Enter your choice: ", 0
invalidChoice db 10, 9, "Invalid choice, try again.", 0
exitMsg db 10, 9, "Exiting program...", 0
continuePrompt db 10, 9, "Do you want to continue? [y/n]: ", 0
choice db 4 dup(0)
continueChoice db 4 dup(0)

subjects1_1 db 10, 9, "Subjects for 1st Year: 1st Sem", 10, 9, "    Understanding the Self", 10, 9, "    Mathematics in the Modern World", 10, 9, "   Purposive Coomunication", 10, 9, "   Rizal's Life and Work", 10, 9, "    Foundation of Special Needs", 10, 9, "    Movement Competency Training", 10, 9,"    National Service Training Program 1", 10, 9, 0
subjects1_2 db 10, 9, "Subjects for 1st Year: 2nd Sem:", 10, 9, "    Understanding the Self", 10, 9, "    Mathematics in the Modern World", 10, 9, "    National Service Training Program 1", 10, 9, 0

subjects2_1 db 10, 9, "Subjects for 2nd Year: 1st Sem", 10, 9, "    Assessment of Learning 1", 10, 9, "    Teaching Math in the Primary Grades", 10, 9, "    Development of Individualized Education Plans", 10, 9, 0
subjects2_2 db 10, 9, "Subjects for 2nd Year: 2nd Sem", 10, 9, "    Assessment of Learning 1", 10, 9, "    Teaching Math in the Primary Grades", 10, 9, "    Development of Individualized Education Plans", 10, 9, 0

subjects3_1 db 10, 9, "Subjects for 3rd Year: 1st Sem", 10, 9, "    The Teaching Profession", 10, 9, "    Teaching PE and Health in Elementary Grades", 10, 9, "    Early Childhood Inclusive Education", 10, 9, 0
subjects3_2 db 10, 9, "Subjects for 3rd Year: 2nd Sem", 10, 9, "    The Teaching Profession", 10, 9, "    Teaching PE and Health in Elementary Grades", 10, 9, "    Early Childhood Inclusive Education", 10, 9, 0

subjects4_1 db 10, 9, "Subjects for 4th Year: 1st Sem", 10, 9, "    Field Study 1", 10, 9, "    Teaching Internship", 10, 9, "    Career and Personality Development", 10, 9, 0
subjects4_2 db 10, 9, "Subjects for 4th Year: 2nd Sem ", 10, 9, "    Field Study 1", 10, 9, "    Teaching Internship", 10, 9, "    Career and Personality Development", 10, 9, 0


subjects1_sem db 10, 9, "1. 1st Sem:", 10, 9, "2. 2nd Sem", 10, 9, " Select which sem", 10, 9, 0
choice1_sem db 4 dup (0)
choice2_sem db 4 dup (0)
choice3_sem db 4 dup (0)
choice4_sem db 4 dup (0)

.code
start:
    invoke StdOut, addr BSNE
    invoke StdOut, addr menuText
    invoke StdOut, addr op1
    invoke StdOut, addr op2
    invoke StdOut, addr op3
    invoke StdOut, addr op4
    invoke StdOut, addr op5
    invoke StdOut, addr newline

selectOption:
    invoke StdOut, addr prompt
    invoke StdIn, addr choice, 4
    
    mov al, choice
    cmp al, '1'
    je show1
    cmp al, '2'
    je show2
    cmp al, '3'
    je show3
    cmp al, '4'
    je show4
    cmp al, '5'
    je exitProgram
    
    invoke StdOut, addr invalidChoice
    invoke StdOut, addr newline
    jmp selectOption

show1:

    invoke StdOut, addr subjects1_sem
    invoke StdIn, addr choice1_sem, 4 

    mov al, choice1_sem
    cmp al, '1'
    je show1_1
    cmp al, '2'
    je show1_2

    jmp askContinue   ; If invalid input, go back to asking to continue
    

show2:
     invoke StdOut, addr subjects1_sem
    invoke StdIn, addr choice2_sem, 4 

    mov al, choice2_sem
    cmp al, '1'
    je show2_1
    cmp al, '2'
    je show2_2

    jmp askContinue   ; If invalid input, go back to asking to continue




show3:
     invoke StdOut, addr subjects1_sem
    invoke StdIn, addr choice3_sem, 4 

    mov al, choice3_sem
    cmp al, '1'
    je show3_1
    cmp al, '2'
    je show3_2

    jmp askContinue   ; If invalid input, go back to asking to continueinvoke StdOut, addr subjects3
    

show4:
     invoke StdOut, addr subjects1_sem
    invoke StdIn, addr choice4_sem, 4 

    mov al, choice4_sem
    cmp al, '1'
    je show4_1
    cmp al, '2'
    je show4_2

    jmp askContinue   ; If invalid input, go back to asking to continue



show1_1:
    invoke StdOut, addr subjects1_1
    jmp askContinue

show1_2:
    invoke StdOut, addr subjects1_2
    jmp askContinue

show2_1:
    invoke StdOut, addr subjects2_1
    jmp askContinue

show2_2:
    invoke StdOut, addr subjects2_2
    jmp askContinue

show3_1:
    invoke StdOut, addr subjects3_1
    jmp askContinue

show3_2:
    invoke StdOut, addr subjects3_2
    jmp askContinue

show4_1:
    invoke StdOut, addr subjects4_1
    jmp askContinue

show4_2:
    invoke StdOut, addr subjects4_2
    jmp askContinue
    
askContinue:
    invoke StdOut, addr continuePrompt
    invoke StdIn, addr continueChoice, 4
    
    mov al, continueChoice
    cmp al, 'y'
    je start
    cmp al, 'n'
    je exitProgram
    jmp askContinue

exitProgram:
    invoke StdOut, addr exitMsg
    invoke ExitProcess, 0

end start