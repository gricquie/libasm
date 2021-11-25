section .text
	global ft_list_size

ft_list_size:
; int	ft_list_size(t_list *begin rdi)
	push rbp
	mov rbp, rsp

	xor rax, rax
loop:
	cmp rdi, 0
	je end
	inc rax
	mov rdi, [rdi + 8]
	jmp loop

end:
	leave
	ret
