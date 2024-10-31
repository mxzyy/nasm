; simple hello world program
    global _start

    section .text
_start  mov rax,    1
        mov rdi,    1
        mov rsi,    message
        mov rdx,    20
        syscall 
        mov rax,    60
        xor rdi,    rdi
        syscall

message    db      "Hello mf World", 10