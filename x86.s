; 
; sandbox.asm 
; 
; nasm -f elf32 <name>.s -o <name>.o 
; ld -m elf_i386 <name>.o -o <name>
;

global _start 

section .data 
	; msg db "Hello, World", 0x0a 
	; len $ - msg 	

section .text 
_start: 
	; Hello, World 
	mov [msg + len], byte '!' 	; add ! to end of 'Hello, World' Why? I don't know... 
	mov eax, 4 			; write system call 
	mov ebx, 1			; stdout file descriptor 
	mov ecx, msg 
	mov edx, len 
	
	; Iteration loop 
	mov ebx, 1			; start ebx at 1 
	mov ecx, 4 			; number of iterations 
	
_loop: 
	add ebx, ebx 			; ebx += 
	dec ecx 			; decrement ecx by 1 
	cmp ecx, 0 			; compare ecx to 0 
	jg _loop 			; if ecx is > 0 start loop again 
	jmp _exit 			; 
	
_exit: 
	mov eax, 1 			; exit system call 
	mov ebx, 0 			; exit status is 0 (no error)
	int 0x80 
