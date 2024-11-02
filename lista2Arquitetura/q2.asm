.text
main:addi $2 $0 5
     syscall
     
     slt $8 $2 $0
     
     bne $8 $0 negativo
     sll $9 $2 1
     add $4 $0 $9
     j fim

negativo: mul $9 $2 $2
	  add $4 $0 $9
	  j fim
	  
fim: addi $2 $0 1
     syscall
     
     addi $2 $0 10
     syscall