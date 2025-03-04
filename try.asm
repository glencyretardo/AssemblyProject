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

subjects1_1 db 10, 9, "Subjects for 1st Year: 1st Sem", 10, 9
            db "    Understanding the Self", 10, 9
            db "    Mathematics in the Modern World", 10, 9
            db "    Purposive Communication w/ Interactive Learning", 10, 9
            db "    The Child and Adolescent Learners and Learning Principles", 10, 9
            db "    Rizal's Life and Work", 10, 9
            db "    Foundation of Special and Inclusive Education", 10, 9
            db "    Movement Competency Training", 10, 9
            db "    National Service Training Program 1", 10, 9, 0

subjects1_2 db 10, 9, "Subjects for 1st Year: 2nd Sem", 10, 9
            db "    Strategic Lesson Planning and Design", 10, 9
            db "    Reading Comprehension", 10, 9
            db "    The Contemporary World", 10, 9
            db "    Technology for Teaching and Learning 1", 10, 9
            db "    Facilitating Learner-Centered Teaching", 10, 9
            db "    Science, Technology, and Society", 10, 9
            db "    Exercise-based Fitness Activities", 10, 9
            db "    National Service Training Program 2", 10, 9, 0

subjects1_summer db 10, 9, "Subjects for 1st Year: Summer", 10, 9
            db "    Educational Assessment of Students with Additional Needs", 10, 9
            db "    Art Appreciation", 10, 9
            db "    Content and Pedagogy in the Mother-tongue", 10, 9, 0
            
subjects2_1 db 10, 9, "Subjects for 2nd Year: 1st Sem", 10, 9
            db "    Assessment Learning 1", 10, 9
            db "    Pagtuturo ng Filipino sa Elementarya 1", 10, 9
            db "    Teaching Math in the Primary Grades", 10, 9
            db "    Teaching Music in the Elementary Grades", 10, 9
            db "    Teaching English in the Elementary Grades - Language Arts", 10, 9
            db "    Teaching Science in the Elementary Grades - Biology & Chemistry", 10, 9
            db "    Adapted Physical Education and Recreation", 10, 9
            db "    Behavior Management and Modification", 10, 9
            db "    Dance and Sports 1", 10, 9, 0

subjects2_2 db 10, 9, "Subjects for 2nd Year: 2nd Sem", 10, 9
            db "    Readings in Philippine History", 10, 9
            db "    The Teachers and the School Curriculum", 10, 9
            db "    Assessment of Learning 2", 10, 9
            db "    Teaching Social Studies in Primary Grades", 10, 9
            db "    Teaching Literacy in the Elementary Grades", 10, 9
            db "    Teaching Science in the Elementary Grades - Physics, Earth & Space", 10, 9
            db "    Instructional Adaptations in Language & Literacy Instruction", 10, 9
            db "    Instructional Adaptations in Mathematics & Science Instruction", 10, 9
            db "    Dance and Sports 2", 10, 9, 0

subjects2_summer db 10, 9, "Subjects for 2nd Year: Summer", 10, 9
            db "    Subject code|Subject Title                                                          |Units",10,9
            db "    Development of Individualized Education Plans", 10, 9
            db "    Ethics (Disciplinal)", 10, 9
            db "    Good Manners and Right Conduct", 10, 9,0
    
subjects3_1 db 10, 9, "Subjects for 3rd Year: 1st Sem", 10, 9
            db "    Subject code|Subject Title                                                          |Units",10,9
            db "    GE15         Environmental Science                                                   3 units", 10, 9
            db "    EDUC 108     Building and Enhancing New Literacies                                   3 units", 10, 9
            db "    SNED 117     Research in Special Needs and Inclusive Education 1                     3 units", 10, 9
            db "    EDSS 2       Teaching Social Studies in Intermediate Grades                          3 units", 10, 9
            db "    GE11         The Entrepreneurial Mind                                                3 units", 10, 9
            db "    EDTLE 1      Edukasyong Pantahanan at Pangkabuhayan - Home Economics & Agriculture   3 units", 10, 9
            db "    ED ARTS      Teaching Arts in the Elementary Grades                                  3 units", 10, 9
            db "    SNEED 112    Instructional Adaptations for Teaching Content Areas                    3 units", 10, 9, 0

subjects3_2 db 10, 9, "Subjects for 3rd Year: 2nd Sem", 10, 9
            db "    Subject code|Subject Title                                                          |Units",10,9
            db "    EDUC109      The Teaching Profession                                                 3 units", 10, 9
            db "    EDUC 110     The Teacher & the Community, Culture, and Org Leadership                3 units", 10, 9
            db "    SNEED 118    Research in Special Needs and Inclusive Education  2                    3 units", 10, 9
            db "    EDMT 2       Teaching Math in the Intermediate Grades                                3 units", 10, 9
            db "    EDTLE 2      Edukasyong Pantahanan at Pangkabuhayan - Entrepreneurship               3 units", 10, 9
            db "    EDTTL 1/L    Technology for Teaching and Learning in the Elementary Grades           3 units", 10, 9
            db "    EDPEH        Teaching PE and Health in Elementary Grades                             3 units", 10, 9
            db "    SNEED 114    Early Childhood Inclusive Education                                     3 units", 10, 9, 0

subjects3_summer db 10, 9, "Subjects for 1st Year: Summer", 10, 9
            db "    Subject code|Subject Title                                                          |Units",10,9
            db "    EDFL 2       Pagtuturo ng Filipino sa Elementarya - Panitikan ng Pilipinas           3 units", 10, 9
            db "    FIL 215      Malayuning Komunikasyon sa Wikang Filipino                              3 units", 10, 9
            db "    GE 20        Reading Visual Arts                                                     3 units", 10, 9, 0
    
subjects4_1 db 10, 9, "Subjects for 4th Year: 1st Sem", 10, 9
            db "    Subject code|Subject Title                                                          |Units",10,9
            db "    FS 1         Field Study 1                                                           3 units", 10, 9
            db "    FS 2         Field Study 2                                                           3 units", 10, 9
            db "    CA 501       General Education                                                       5 units", 10, 9
            db "    CA 502       Professional Education                                                  5 units", 10, 9, 0

subjects4_2 db 10, 9, "Subjects for 4th Year: 2nd Sem", 10, 9
            db "    Subject code|Subject Title                                                          |Units",10,9
            db "    ED 421       Teaching Internship                                                     6 units", 10, 9
            db "    CAED 506     Career and Personality Development                                      3 units", 10, 9, 0

subjects1_sem db 10, 9, "1. 1st Sem", 10, 9, "2. 2nd Sem", 10, 9, "3. Summer", 10, 9, " Select which sem", 10, 9, 0
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
    cmp al, '3'
    je show1_summer
    jmp askContinue   ; If invalid input, go back to asking to continue
    

show2:
    invoke StdOut, addr subjects1_sem
    invoke StdIn, addr choice2_sem, 4 

    mov al, choice2_sem
    cmp al, '1'
    je show2_1
    cmp al, '2'
    je show2_2
    cmp al, '3'
    je show2_summer
    jmp askContinue   ; If invalid input, go back to asking to continue




show3:
    invoke StdOut, addr subjects1_sem
    invoke StdIn, addr choice3_sem, 4 

    mov al, choice3_sem
    cmp al, '1'
    je show3_1
    cmp al, '2'
    je show3_2
    cmp al, '3'
    je show3_summer
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

show1_summer:
    invoke StdOut, addr subjects1_summer
    jmp askContinue

show2_1:
    invoke StdOut, addr subjects2_1
    jmp askContinue

show2_2:
    invoke StdOut, addr subjects2_2
    jmp askContinue

show2_summer:
    invoke StdOut, addr subjects2_summer
    jmp askContinue

show3_1:
    invoke StdOut, addr subjects3_1
    jmp askContinue

show3_2:
    invoke StdOut, addr subjects3_2
    jmp askContinue

show3_summer:
    invoke StdOut, addr subjects3_summer
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