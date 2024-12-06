.text
main: lui $8 0x1001
      lui $9 0x00ff
      addi $20 $0 32
      addi $21 $0 14
      
test: beq $20 $0 fimLinhaA
      sw $9 0($8)
      addi $8 $8 4
      addi $20 $20 -1
      j test
      
fimLinhaA: addi $8 $8 -4
fimLinha: beq $21 $0 startUltima
	  addi $8 $8 4
	  sw $9 0($8)
	  addi $8 $8 124
	  sw $9 0($8)
	  addi $21 $21 -1
	  j fimLinha


startUltima: addi $20 $0 32
          addi $8 $8 4
   	  
ultimaLinha: beq $20 $0 sair
      sw $9 0($8)
      addi $8 $8 4
      addi $20 $20 -1
      j ultimaLinha
      
sair: addi $2 $0 10
	syscall
