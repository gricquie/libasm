section .text
	global ft_atoi_base
	extern ft_strlen

ft_atoi_base:
; int ft_atoi_base(char *str rdi, char *base rsi)
	push rbp
	mov rbp, rsp
	
	cmp rsi, 0
	je error
	cmp rdi, 0
	je error
	cmp byte [rdi], 0
	je error

get_base_len:
; len in rax
	push rdi
	mov rdi, rsi
	call ft_strlen
	pop rdi
	cmp rax, 1
	jbe error
	mov r8, rax

check_base:
	mov rcx, rsi
	inc rcx
	cmp byte [rsi], '+'
	je error
	cmp byte [rsi], '-'
	je error
rcx_loop:
	push rsi
rsi_loop:
	mov dl, [rcx]
	cmp byte [rsi], dl 
	je error
	inc rsi
	cmp rsi, rcx
	jne rsi_loop
rsi_loop_end:
	pop rsi
	inc rcx
	cmp byte [rcx], 0
	jne rcx_loop
rcx_loop_end:

check_sign:
; sign will be stored in rdx
	xor rcx, rcx
	push byte 0
	cmp byte [rdi], '+'
	je pos_sign
	cmp byte [rdi], '-'
	je neg_sign
	jmp process

pos_sign:
	inc rcx
	jmp process
neg_sign:
	pop rdx
	push byte 1
	inc rcx

process:
	xor rax, rax

proc_loop:
	mov r10b, byte [rdi + rcx]
	cmp r10b, 0
	je add_sign

check_char:
	xor r9, r9
char_loop:
	cmp r9, r8
	jae char_loop_end
	cmp byte [rsi + r9], r10b
	je char_loop_end
	inc r9
	jmp char_loop

char_loop_end:
	cmp r9, r8
	jae error
	mul r8
	add rax, r9
	inc rcx
	jmp proc_loop

error:
	xor rax, rax
	leave
	ret

add_sign:
	pop rdx
	cmp rdx, 0
	je end
	neg rax

end:
	leave
	ret
