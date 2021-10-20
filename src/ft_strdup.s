section .text
	global	_ft_strdup
	extern	_malloc
	extern	_ft_strlen
	extern	_ft_strcpy

_ft_strdup:
; char	*ft_strdup(char *s rdi)
	push rbp
	mov rbp, rsp
	
	cmp rdi, 0
	je error
	push rdi
	call _ft_strlen
	mov rdi, rax
	inc rdi
	call _malloc
	cmp rax, 0
	je error
	pop rdi
	mov rsi, rax
	push rsi
	call _ft_strcpy
	pop rax
	leave
	ret

error:
	xor rax, rax
	leave
	ret
