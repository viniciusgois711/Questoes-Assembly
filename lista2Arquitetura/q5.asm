.text
main: addi $2 $0 5
      syscall
      add $8 $0 $2 #nota1
      
      addi $2 $0 5
      syscall
      add $9 $0 $2 #nota2
      
      addu $2 $0 5
      syscall
      add $10 $0 $2 #nota3
      
      addi $11 $0 1 #peso1
      addi $12 $0 2 #peso2
      addi $13 $0 3 #peso3
      
      add $14 $11 $12 
      add $14 $14 $13 #somaPesos
      
      mul $8 $8 $11 #nota1
      mul $9 $9 $12 #nota2
      mul $10 $10 $13 #nota3
      
      add $15 $8 $9
      add $15 $15 $10 #somaNotas
      
      div $15 $14
      mflo $4 #inteiro
      mflo $9
      
      addi $2 $0 1
      syscall
      
      mfhi $16
      addi $10 $0 10
      mul $16 $16 $10
      div $16 $14

      addi $4 $0 ','
      addi $2 $0 11
      syscall
      
      mflo $4
      addi $2 $0 1
      syscall
      addi $18 $0 6 #validacao passou
      
      slt $17 $9 $18 # nota < 6 ? 1 : 0
      
      bne $17 $0 nPassou # igual a 1 n passou
      addi $4 $0 'A'	
      
      j fim
    	
nPassou: addi $4 $0 'R'     
        
fim: addi $2 $0 11
     syscall
     
     addi $2 $0 10
     syscal