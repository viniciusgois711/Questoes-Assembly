.text
main:addi $2 $0 5
     syscall
     add $8 $0 $2
     
     addi $2 $0 5
     syscall
     add $9 $0 $2
     
     div $8 $9
     
     mflo $10 # resultado inteiro
     mfhi $11 #resto
     
     sub $12 $0 $11
     srl $13 $12 31
     
     add $4 $13 $10
     addi $2 $0 1
     syscall
     addi $2 $0 10
     syscall