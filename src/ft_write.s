%define MACH_SYSCALL(nb)	(0x2000000 | nb)
%define	WRITE				4

section	.text
	global _ft_write
	extern ___error

_ft_write:
; setup stack
	push rbp
	mov rbp, rsp

; fd in rdi, buf in rsi, count in rdx
	push rdx
	mov rax, MACH_SYSCALL(WRITE)
; args already in place
	syscall
	jnc	end

error:
	push rax
	call ___error
	pop rcx
	mov qword [rax], rcx
	mov rax, -1
	leave
	ret

end:
	leave
	ret

