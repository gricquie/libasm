section .text
	global	ft_strdup
	extern	malloc
	extern	ft_strlen
	extern	ft_strcpy

ft_strdup:
; char	*ft_strdup(char *s rdi)
	push rbp
	mov rbp, rsp
	
	cmp rdi, 0
	je error
	push rdi
	call ft_strlen
	mov rdi, rax
	inc rdi
	call malloc wrt ..plt
	cmp rax, 0
	je error
	pop rdi
	mov rsi, rax
	push rsi
	call ft_strcpy
	pop rax
	leave
	ret

error:
	xor rax, rax
	leave
	ret
