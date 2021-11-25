section .text
	global ft_list_push_front
	extern malloc

;t_list
;{
;	void	*data	8B
;	t_list	*next	8B
;}

ft_list_push_front:
; void	ft_list_push_front(t_list **begin_list rdi, void * data rsi)
	push rbp
	mov rbp, rsp

	cmp rdi, 0
	je end
	push rdi
	push rsi
	mov rdi, 16
	call malloc wrt ..plt
	cmp rax, 0
	je end
	pop rsi
	pop rdi
	mov qword [rax], rsi
	mov rbx, [rdi]
	mov qword [rax + 8], rbx
	mov [rdi], rax

end:
	leave
	ret
