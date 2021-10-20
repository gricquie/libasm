section .text
	global _ft_list_remove_if
	extern _free

_ft_list_remove_if:
; voif ft_list_remove_if(t_list **begin rdi, void *data_ref rsi, int (*cmp)() rdx)
	push rbp
	mov rbp, rsp

	cmp rdi, 0
	je end
	mov rax, [rdi]
	cmp rax, 0
	je end
	cmp rdx, 0
	je end

	push rdi
	push rsi
	add rax, 8
	mov rdi, rax
	call _ft_list_remove_if
	pop rsi
	pop rdi
	mov rax, [rdi]

	push rdi
	push rsi
	push rdx
	mov rdi, [rax]
	call rdx
	pop rdx
	pop rsi
	pop rdi
	cmp rax, 0
	je remove

end:
	leave
	ret

remove:
	mov rax, [rdi]
	mov rbx, [rax + 8]
	mov [rdi], rbx
	push rdi
	push rsi
	push rdx
	mov rdi, rax
	call _free
	pop rdx
	pop rsi
	pop rdi
	jmp end
