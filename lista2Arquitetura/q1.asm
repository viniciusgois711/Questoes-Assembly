.text
main: addi $2, $0, 5
      syscall
      add $8, $0, $2
      
      addi $2, $0, 5
      syscall
      
      slt $9, $2, $8
      
      beq $9, $0, maior2
      add $4, $0, $8
      
      j fim

maior2: add $4, $0, $2
	j fim
	
fim: addi $2, $0, 1
     syscall
     
     addi $2, $0, 10
     syscall