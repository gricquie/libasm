%define MACH_SYSCALL(nb)	0x2000000 | nb
%define STDOUT				1
%define	WRITE				4

section	.data

section	.bss

section	.text
	global _ft_strlen

_ft_strlen:
; setup stack
	push rbp
	mov rbp, rsp

; s in rdi
; initialize return value
	xor rax, rax

loop:
; check end of src
	cmp byte [rdi], 0
	je end

	inc eax
	inc rdi
	jmp loop

end:
	leave
	ret
