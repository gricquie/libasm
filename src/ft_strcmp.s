section .text
	global _ft_strcmp

_ft_strcmp:
; setupstack
	push rbp
	mov rbp, rsp

; s1 is rdi, s2 is rsi

loop:
	mov cl, [rdi]
	cmp byte cl, [rsi]
	jb	below
	jne end
	cmp cl, 0
	je end
	cmp byte [rsi], 0
	je end
	inc rdi
	inc rsi
	jmp loop

below:
	mov al, cl
	sub al, [rsi]
	neg al
	neg eax
	leave
	ret

end:
	mov al, cl
	sub al, [rsi]
	leave
	ret
