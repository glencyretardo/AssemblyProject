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
            db "    Subject code|Subject Title                                                          |Units",10,9
            db "    GE 1         Understanding the Self                                                  3.0 ", 10, 9
            db "    GE 2         Mathematics in the Modern World                                         3.0", 10, 9
            db "    GE 4         Purposive Communication w/ Interactive Learning                         4.0 ", 10, 9
            db "    GE 6         The Child and Adolescent Learners and Learning Principles               3.0", 10, 9
            db "    EUDC 101     Rizal's Life and Work                                                   3.0", 10, 9
            db "    EDUC 104     Foundation of Special and Inclusive Education                           3.0", 10, 9
            db "    PAHF1        Movement Competency Training                                            2.0", 10, 9
            db "    NSTP 1       National Service Training Program 1                                     3.0", 10, 9, 0

subjects1_2 db 10, 9, "Subjects for 1st Year: 2nd Sem", 10, 9
            db "    Subject code|Subject Title                                                          |Units",10,9
            db "    LP 100       Strategic Lesson Planning and Design                                    3.0", 10, 9
            db "    UGE 1        Reading Comprehension                                                   6.0", 10, 9
            db "    GE 3         The Contemporary World                                                  3.0", 10, 9
            db "    EDUC 102     Technology for Teaching and Learning 1                                  3.0", 10, 9
            db "    EDUC 103     Facilitating Learner-Centered Teaching                                  3.0", 10, 9
            db "    GE 5         Science, Technology, and Society                                        3.0", 10, 9
            db "    PAHF 2       Exercise-based Fitness Activities                                       2.0", 10, 9
            db "    NSTP 2       National Service Training Program 2                                     3.0", 10, 9, 0

subjects1_summer db 10, 9, "Subjects for 1st Year: Summer", 10, 9
            db "    Subject code|Subject Title                                                          |Units",10,9
            db "    SNED 107     Educational Assessment of Students with Additional Needs                3.0", 10, 9
            db "    GE 7         Art Appreciation                                                        3.0", 10, 9
            db "    EDMTB 1      Content and Pedagogy in the Mother-tongue                               3.0", 10, 9, 0
            
subjects2_1 db 10, 9, "Subjects for 2nd Year: 1st Sem", 10, 9
            db "    Subject code|Subject Title                                                          |Units",10,9
            db "    EDUC 105     Assessment Learning 1                                                   3.0", 10, 9
            db "    EDFL 1       Pagtuturo ng Filipino sa Elementarya 1                                  3.0", 10, 9
            db "    EDMT 1       Teaching Math in the Primary Grades                                     3.0", 10, 9
            db "    EDMUS 1      Teaching Music in the Elementary Grades                                 3.0", 10, 9
            db "    EDENG 1      Teaching English in the Elementary Grades - Language Arts               3.0", 10, 9
            db "    EDSC 1       Teaching Science in the Elementary Grades - Biology & Chemistry         3.0", 10, 9
            db "    SNED 109     Adapted Physical Education and Recreation                               3.0", 10, 9
            db "    SNED 108     Behavior Management and Modification                                    3.0", 10, 9
            db "    PAHF 3       Dance and Sports 1                                                      2.0", 10, 9, 0

subjects2_2 db 10, 9, "Subjects for 2nd Year: 2nd Sem", 10, 9
            db "    Subject code|Subject Title                                                          |Units",10,9
            db "    GE 8         Readings in Philippine History                                          3.0", 10, 9
            db "    EDUC 105     The Teachers and the School Curriculum                                  3.0", 10, 9
            db "    EDUC 107     Assessment of Learning 2                                                3.0", 10, 9
            db "    EDSS 1       Teaching Social Studies in Primary Grades                               3.0", 10, 9
            db "    EDENG 2      Teaching Literacy in the Elementary Grades                              3.0", 10, 9
            db "    EDSC 2       Teaching Science in the Elementary Grades - Physics, Earth & Space      3.0", 10, 9
            db "    SNED 110     Instructional Adaptations in Language & Literacy Instruction            3.0", 10, 9
            db "    SNED 111     Instructional Adaptations in Mathematics & Science Instruction          3.0", 10, 9
            db "    PAHF 4       Dance and Sports 2                                                      2.0", 10, 9, 0

subjects2_summer db 10, 9, "Subjects for 2nd Year: Summer", 10, 9
            db "    Subject code|Subject Title                                                          |Units",10,9
            db "    SNED 113     Development of Individualized Education Plans                           3.0", 10, 9
            db "    GE 9         Ethics (Disciplinal)                                                    3.0", 10, 9
            db "    RDGRMC       Good Manners and Right Conduct                                          3.0", 10, 9,0
    
subjects3_1 db 10, 9, "Subjects for 3rd Year: 1st Sem", 10, 9
            db "    Subject code|Subject Title                                                          |Units",10,9
            db "    GE15         Environmental Science                                                   3.0", 10, 9
            db "    EDUC 108     Building and Enhancing New Literacies                                   3.0", 10, 9
            db "    SNED 117     Research in Special Needs and Inclusive Education 1                     3.0", 10, 9
            db "    EDSS 2       Teaching Social Studies in Intermediate Grades                          3.0", 10, 9
            db "    GE11         The Entrepreneurial Mind                                                3.0", 10, 9
            db "    EDTLE 1      Edukasyong Pantahanan at Pangkabuhayan - Home Economics & Agriculture   3.0", 10, 9
            db "    ED ARTS      Teaching Arts in the Elementary Grades                                  3.0", 10, 9
            db "    SNEED 112    Instructional Adaptations for Teaching Content Areas                    3.0", 10, 9, 0

subjects3_2 db 10, 9, "Subjects for 3rd Year: 2nd Sem", 10, 9
            db "    Subject code|Subject Title                                                          |Units",10,9
            db "    EDUC109      The Teaching Profession                                                 3.0", 10, 9
            db "    EDUC 110     The Teacher & the Community, Culture, and Org Leadership                3.0", 10, 9
            db "    SNEED 118    Research in Special Needs and Inclusive Education  2                    3.0", 10, 9
            db "    EDMT 2       Teaching Math in the Intermediate Grades                                3.0", 10, 9
            db "    EDTLE 2      Edukasyong Pantahanan at Pangkabuhayan - Entrepreneurship               3.0", 10, 9
            db "    EDTTL 1/L    Technology for Teaching and Learning in the Elementary Grades           3.0", 10, 9
            db "    EDPEH        Teaching PE and Health in Elementary Grades                             3.0", 10, 9
            db "    SNEED 114    Early Childhood Inclusive Education                                     3.0", 10, 9, 0

subjects3_summer db 10, 9, "Subjects for 1st Year: Summer", 10, 9
            db "    Subject code|Subject Title                                                          |Units",10,9
            db "    EDFL 2       Pagtuturo ng Filipino sa Elementarya - Panitikan ng Pilipinas           3.0", 10, 9
            db "    FIL 215      Malayuning Komunikasyon sa Wikang Filipino                              3.0", 10, 9
            db "    GE 20        Reading Visual Arts                                                     3.0", 10, 9, 0
    
subjects4_1 db 10, 9, "Subjects for 4th Year: 1st Sem", 10, 9
            db "    Subject code|Subject Title                                                          |Units",10,9
            db "    FS 1         Field Study 1                                                           3.0", 10, 9
            db "    FS 2         Field Study 2                                                           3.0", 10, 9
            db "    CA 501       General Education                                                       5.0", 10, 9
            db "    CA 502       Professional Education                                                  5.0", 10, 9, 0

subjects4_2 db 10, 9, "Subjects for 4th Year: 2nd Sem", 10, 9
            db "    Subject code|Subject Title                                                          |Units",10,9
            db "    ED 421       Teaching Internship                                                     6.0", 10, 9
            db "    CAED 506     Career and Personality Development                                      3.0", 10, 9, 0

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