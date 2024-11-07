.text
main: addi $2 $0 5
      syscall
      add $8 $0 $2
      addi $10 $0 10
      
      div $8 $10
      mfhi $11 #unidade
      mflo $8
      div $8 $10
      mfhi $12 #dezena
      
      mflo $8
      div $8 $10
      mfhi $13 #centena
      mflo $8 #milhar
      
      beq $8 $0 semMilhar
      
      j comMilhar
 
semMilhar: addi $4 $0 ' '
           addi $2 $0 11
           syscall
           
           beq $13 $0 semCent
           
           add $4 $0 $13
           addi $2 $0 1
           syscall
           
           add $4 $0 $12
           addi $2 $0 1
           syscall
           
           add $4 $0 $11
           addi $2 $0 1
           syscall
           
           j fim
        
        
semCent: addi $4 $0 ' '
           addi $2 $0 11
           syscall
           
           beq $12 $0 semDezena
           
           add $4 $0 $12
           addi $2 $0 1
           syscall
           
           add $4 $0 $11
           addi $2 $0 1
           syscall
           
           j fim
        
semDezena: addi $4 $0 ' '
           addi $2 $0 11
           syscall
           
           beq $11 $0 semUnidade
           
           add $4 $0 $11
           addi $2 $0 1
           syscall
           
           j fim

semUnidade: addi $4 $0 ' '
            addi $2 $0 11
            syscall 
            
            j fim
            
comMilhar: add $4 $0 $8
           addi $2 $0 1
           syscall
           
	   add $4 $0 $13
           addi $2 $0 1
           syscall
           
           add $4 $0 $12
           addi $2 $0 1
           syscall
           
           add $4 $0 $11
           addi $2 $0 1
           syscall
           
fim: addi $2 $0 10
     syscall