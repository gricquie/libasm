%define READ	0

section	.text
	global	ft_read
	extern	__errno_location

ft_read:
; ssize_t	ft_read(int fd rdi, char *buf rsi, size_t count rcx)
; setup tack
	push rbp
	mov rbp, rsp

	mov rax, READ
	syscall
	test rax, rax
	jns end

error:
	push rax
	call __errno_location wrt ..plt
	pop rcx
	mov qword [rax], rcx
	mov rax, -1
	leave
	ret

end:
	leave
	ret

