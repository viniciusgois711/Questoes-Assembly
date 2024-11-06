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
      
      div $12 $11 #divide a somaNotas por 3
      mflo $22 # o resultado coloca no 22
      mfhi $13 # resto no 13
      
      mul $13 $13 $20 #multiplica o $13 por 10

      div $13 $11 #divide o resto*10 por 3
      mflo $13 #resultado da divisao

      
      slt $14 $13 $21 # se resto < 6 ? 1 : 0
      
      bne $14 $0 baixo

cima: addi $4 $22 1
      j fim
      
baixo: add $4 $22 $0

	
fim: addi $2 $0 1
     syscall
     
     addi $2 $0 10
     syscall
      