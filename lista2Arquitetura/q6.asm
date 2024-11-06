.text
main:addi $2 $0 5
     syscall
     add $8 $0 $2
     
     addi $9 $0 4
     addi $10 $0 100
     addi $11 $0 400
     
     div $8 $9
     mfhi $12
     div $8 $10
     mfhi $13
     
     div $8 $11
     mfhi $20
   
     beq $20 $0 bissexto
     beq $12 $0 div4 

     j nBissexto
     
div4: beq $13 $0 nBissexto
      j bissexto
 
nBissexto: addi $4 $0 'n'
           j fim
           
bissexto: addi $4 $0 's'
          j fim


fim: addi $2 $0 11
     syscall