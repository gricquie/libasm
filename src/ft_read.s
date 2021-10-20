%define MACH_SYSCALL(nb)	(0x2000000 | nb)
%define READ				3

section	.text
	global	_ft_read
	extern	___error

_ft_read:
; ssize_t	ft_read(int fd rdi, char *buf rsi, size_t count rcx)
; setup tack
	push rbp
	mov rbp, rsp

	mov rax, MACH_SYSCALL(READ)
	syscall
	jnc end

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

