global _start
global count_digits

section .data
	SYS_EXIT equ 60
	num dq 987654321
    cnt db 0

section .text
_start:
    mov rdi, num                ; rdi = address of num
    call count_digits           ; function call

exit_here:
	mov rax, SYS_EXIT       
	xor rdi, rdi
	syscall

count_digits:
    mov rax, qword[rdi]         ; rax = num
    xor rcx, rcx                ; rcx xor rcx -> rcx = 0
                                ; rcx is the counter                
    
count_loop:
    test rax, rax               ; set zero flag to 1 if rax == 0 
                                ; will only be 0 if rax == 0 since anything ANDed to 0 is equal to 0
    jz count_done               ; if zero flag == 1, jump to count_done

    inc rcx                     ; rcx++
    mov rbx, 10                 ; rbx = 10
    xor rdx, rdx                ; rdx = 0 ;reset the remainder
    div rbx                     ; repeat loop
    jmp count_loop

count_done:
    mov byte[cnt], cl           ; mov the lowest 8 bits of c register to cnt 
    ret                         ; return


    


