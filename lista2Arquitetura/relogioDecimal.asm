## relogio

.text
main: addi $2 $0 5
      syscall
      add $8 $0 $2
      
      addi $9 $0 2
      
      div $8 $9
      mfhi $10 #primeiro
      mflo $8
      div $8 $9
      mfhi $11 #segundo
      mflo $8
      div $8 $9
      mfhi $12 #terceiro
      mflo $8
      div $8 $9
      mfhi $13 #quarto
      mflo $8 #quinto
      
      add $4 $0 $8
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
      
      add $4 $0 $10
      addi $2 $0 1
      syscall
      
      addi $2 $0 10
      syscall