.text
main: addi $2 $0 5
      syscall
      add $8 $0 $2 #n1
      
      addi $2 $0 5
      syscall
      add $9 $0 $2 #n2
      
      addi $2 $0 5
      syscall
      add $10 $0 $2 #n3
      
      addi $11 $0 3
      addi $20 $0 10
      addi $21 $0 6
      
      add $12 $8 $9
      add $12 $12 $10 #somaNotas
      
      div $12 $11
      
      mfhi $13
      mul $13 $13 $20
      
      div $13 $11
      mfhi $13
      mflo $14
      
      slt $13 $13 $21 # se n < 6 ? 1 : 0
      
      beq $13 $0 baixo
      addi $4 $14 1
      j fim
      
baixo: add $4 $14 $0

	
fim: addi $2 $0 1
     syscall
     
     addi $2 $0 10
     syscall
      
      
      