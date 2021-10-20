section .text
	global _ft_strcpy

_ft_strcpy:
; setup stack
	push rbp
	mov rbp, rsp

; src is rdi, dest is rsi
; return value is dest
	mov rax, rsi

loop:
	mov cl, [rdi]
	mov [rsi], cl
; check end of src
	cmp byte [rdi], 0
	je end
	inc rsi
	inc rdi
	jmp loop

end:
	leave
	ret
