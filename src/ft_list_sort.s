section	.text
	global _ft_list_sort

_ft_list_sort:
; void	ft_list_sort(t_list **begin rdi, int (*cmp)() rsi)
	push rbp
	mov rbp, rsp

;checks
	cmp rdi, 0
	je end
	mov rax, [rdi]
	cmp rax, 0
	je end
	add rax, 8
	cmp qword [rax], 0
	je end

;sort the next
	push rdi
	push rsi
	mov rdi, rax
	call _ft_list_sort
	pop rsi
	pop rdi

;cmp cur
	push rsi
	push rdi
	mov rdi, [rdi]
	mov rsi, [rdi + 8]
	mov rdi, [rdi]
	mov rsi, [rsi]
	call [rbp - 8]
	neg eax
	test eax, eax
	js swap

end:
	leave
	ret

swap:
	pop rdi
	mov rax, [rdi]
	mov rax, [rax + 8]
	mov rbx, [rdi]
	mov rcx, [rax + 8]
	mov qword [rbx + 8], rcx
	mov qword [rax + 8], rbx
	mov [rdi], rax
	pop rsi
	call _ft_list_sort
	jmp end
