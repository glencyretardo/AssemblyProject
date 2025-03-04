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

subjects1_1 db 10, 9, "Subjects for 1st Year: 1st Sem                                    units", 10, 9
            db "    Understanding the Self                                        3.0 ", 10, 9
            db "    Mathematics in the Modern World                               3.0", 10, 9
            db "    Purposive Communication w/ Interactive Learning               4.0 ", 10, 9
            db "    The Child and Adolescent Learners and Learning Principles     3.0", 10, 9
            db "    Rizal's Life and Work                                         3.0", 10, 9
            db "    Foundation of Special and Inclusive Education                 3.0", 10, 9
            db "    Movement Competency Training                                  2.0", 10, 9
            db "    National Service Training Program 1                           3.0", 10, 9, 0

subjects1_2 db 10, 9, "Subjects for 1st Year: 2nd Sem                         units", 10, 9
            db "    Strategic Lesson Planning and Design                3.0", 10, 9
            db "    Reading Comprehension                               6.0", 10, 9
            db "    The Contemporary World                              3.0", 10, 9
            db "    Technology for Teaching and Learning 1              3.0", 10, 9
            db "    Facilitating Learner-Centered Teaching              3.0", 10, 9
            db "    Science, Technology, and Society                    3.0", 10, 9
            db "    Exercise-based Fitness Activities                   2.0", 10, 9
            db "    National Service Training Program 2                 3.0", 10, 9, 0

subjects1_summer db 10, 9, "Subjects for 1st Year: Summer                                     units", 10, 9
            db "    Educational Assessment of Students with Additional Needs              3.0", 10, 9
            db "    Art Appreciation                                                      3.0", 10, 9
            db "    Content and Pedagogy in the Mother-tongue                             3.0", 10, 9, 0
            
subjects2_1 db 10, 9, "Subjects for 2nd Year: 1st Sem                                            units", 10, 9
            db "    Assessment Learning 1                                                3.0", 10, 9
            db "    Pagtuturo ng Filipino sa Elementarya 1                               3.0", 10, 9
            db "    Teaching Math in the Primary Grades                                  3.0", 10, 9
            db "    Teaching Music in the Elementary Grades                              3.0", 10, 9
            db "    Teaching English in the Elementary Grades - Language Arts            3.0", 10, 9
            db "    Teaching Science in the Elementary Grades - Biology & Chemistry      3.0", 10, 9
            db "    Adapted Physical Education and Recreation                            3.0", 10, 9
            db "    Behavior Management and Modification                                 3.0", 10, 9
            db "    Dance and Sports 1                                                   2.0", 10, 9, 0

subjects2_2 db 10, 9, "Subjects for 2nd Year: 2nd Sem                                                units", 10, 9
            db "    Readings in Philippine History                                             3.0", 10, 9
            db "    The Teachers and the School Curriculum                                     3.0", 10, 9
            db "    Assessment of Learning 2                                                   3.0", 10, 9
            db "    Teaching Social Studies in Primary Grades                                  3.0", 10, 9
            db "    Teaching Literacy in the Elementary Grades                                 3.0", 10, 9
            db "    Teaching Science in the Elementary Grades - Physics, Earth & Space         3.0", 10, 9
            db "    Instructional Adaptations in Language & Literacy Instruction               3.0", 10, 9
            db "    Instructional Adaptations in Mathematics & Science Instruction             3.0", 10, 9
            db "    Dance and Sports 2                                                         2.0", 10, 9, 0

subjects2_summer db 10, 9, "Subjects for 1st Year: Summer                            units", 10, 9
            db "    Development of Individualized Education Plans             3.0", 10, 9
            db "    Ethics (Disciplinal)                                      3.0", 10, 9
            db "    Good Manners and Right Conduct                            3.0", 10, 9,0
    
subjects3_1 db 10, 9, "Subjects for 3rd Year: 1st Sem", 10, 9
            db "    Environmental Science", 10, 9
            db "    Building and Enhancing New Literacies", 10, 9
            db "    Research in Special Needs and Inclusive Education 1", 10, 9
            db "    Teaching Social Studies in Intermediate Grades", 10, 9
            db "    The Entrepreneurial Mind", 10, 9
            db "    Edukasyong Pantahanan at Pangkabuhayan - Home Economics & Agri", 10, 9
            db "    Teaching Arts in the Elementary Grades", 10, 9
            db "    Instructional Adaptations for Teaching Content Areas", 10, 9, 0

subjects3_2 db 10, 9, "Subjects for 3rd Year: 2nd Sem", 10, 9
            db "    The Teaching Profession", 10, 9
            db "    The Teacher & the Community, Culture, and Org Leadership", 10, 9
            db "    Research in Special Needs and Inclusive Education 2", 10, 9
            db "    Teaching Math in the Intermediate Grades", 10, 9
            db "    Edukasyong Pantahanan at Pangkabuhayan - Entrepreneurship", 10, 9
            db "    Technology for Teaching and Learning in the Elementary Grades", 10, 9
            db "    Teaching PE and Health in Elementary Grades", 10, 9
            db "    Early Childhood Inclusive Education", 10, 9, 0

subjects3_summer db 10, 9, "Subjects for 1st Year: Summer", 10, 9
            db "    Pagtuturo ng Filipino sa Elementarya - Panitikan ng Pilipinas", 10, 9
            db "    Malayuning Komunikasyon sa Wikang Filipino", 10, 9
            db "    Reading Visual Arts", 10, 9, 0
    
subjects4_1 db 10, 9, "Subjects for 4th Year: 1st Sem", 10, 9
            db "    Field Study 1", 10, 9
            db "    Field Study 2", 10, 9
            db "    General Education", 10, 9
            db "    Professional Education", 10, 9, 0

subjects4_2 db 10, 9, "Subjects for 4th Year: 2nd Sem", 10, 9
            db "    Teaching Internship", 10, 9
            db "    Career and Personality Development", 10, 9, 0

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