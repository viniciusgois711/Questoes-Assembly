.text
main: addi $2 $0 5
      syscall
      add $8 $2 $0
      
      addi $2 $0 5
      syscall
      add $9 $2 $0
      
      div $8 $9
      
      mflo $10
      mfhi $11
      
      beq $11 $0 mantem
      addi $10 $10 1
      add $4 $0 $10
      j fim
      
mantem: add $4 $0 $10

fim: addi $2 $0 1
     syscall
     
     addi $2 $0 10
     syscall