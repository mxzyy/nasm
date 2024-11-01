section .data
    result db '0', 10         ; Tempat untuk menyimpan hasil
    length equ $ - result     ; Menghitung panjang hasil

section .text
    global _start

_start:
    ; Menjumlahkan 1 + 1
    mov rax, 4               ; Memuat angka 1 ke register rax
    add rax, 2               ; Menjumlahkan 1

    ; Konversi hasil ke string
    add rax, '0'             ; Mengonversi hasil ke karakter ASCII

    ; Menyimpan hasil ke variabel result
    mov [result], al         ; Menyimpan karakter hasil ke variabel result

    ; Menyiapkan syscall untuk menulis
    mov rax, 1               ; syscall number for sys_write
    mov rdi, 1               ; file descriptor 1 (stdout)
    mov rsi, result          ; alamat dari string hasil
    mov rdx, length          ; panjang string
    syscall                  ; panggil kernel untuk menulis

    ; Menyiapkan syscall untuk keluar
    mov rax, 60              ; syscall number for sys_exit
    xor rdi, rdi             ; status keluar (0)
    syscall                  ; panggil kernel untuk keluar
