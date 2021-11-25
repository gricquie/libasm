section	.text
	global ft_strlen

ft_strlen:
; setup stack
	push rbp
	mov rbp, rsp

; s in rdi
; initialize return value
	xor rax, rax

loop:
; check end of src
	cmp byte [rdi], 0
	je end

	inc eax
	inc rdi
	jmp loop

end:
	leave
	ret
