%define	WRITE	1

section	.text
	global ft_write
	extern __errno_location

ft_write:
; setup stack
	push rbp
	mov rbp, rsp

; fd in rdi, buf in rsi, count in rdx
	push rdx
	mov rax, WRITE
; args already in place
	syscall
	test rax,rax
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

