# usados: $8 $9 $10 $11 $12 $13 $14 $15 $16
.text
main: addi $8 $0 1 # numero mais a direita
      addi $9 $0 1 # numero mais a esquerda
      addi $11 $0 3 # validar o 3
      addi $12 $0 10 # validar se o $8 já chegou em 10
      addi $13 $0 6
      addi $14 $0 9
      jal calculo

calculo:
	add $16 $0 $31
	mul $10 $8 $9 #multiplicacao dos números

	add $4 $0 $9
	addi $2 $0 1
	syscall #mostrar primeiro numero

	add $4 $0 ' '
	addi $2 $0 11
	syscall
	
	add $4 $0 'x'
	addi $2 $0 11
	syscall

	beq $8 $12 ignorarEspaco
	
	add $4 $0 ' '
	addi $2 $0 11
	syscall

ignorarEspaco:	
	add $4 $0 ' '
	addi $2 $0 11
	syscall
	add $4 $0 $8
	addi $2 $0 1
	syscall #mostrar segundo numero
	
	add $4 $0 ' '
	addi $2 $0 11
	syscall
	
	add $4 $0 '='
	addi $2 $0 11
	syscall
	
	add $4 $0 ' '
	addi $2 $0 11
	syscall
	
	slt $15 $10 $12 #se a multiplicação der menor que 10
	beq $15 $0 ignorarEspaco2
	add $4 $0 ' '
	addi $2 $0 11
	syscall

ignorarEspaco2:	
	mul $4 $8 $9
	addi $2 $0 1
	syscall
	
	add $4 $0 ' '
	addi $2 $0 11
	syscall
	
	beq $9 $11 primeiroBloco # Se $9 == 3, ele vai para a próxima linha da tabuada
	
	beq $9 $13 segundoBloco	# Se $9 == 6, ele vai para a próxima linha da tabuada
	
	beq $9 $14 terceiroBloco # Se $9 == 9, ele vai para a próxima linha da tabuada

	beq $9 $12 quartoBloco

	
	addi $9 $9 1 # numero mais a esquerda
	
	
	jr $31

primeiroBloco:
	
	add $4 $0 '\n'
	addi $2 $0 11
	syscall
	
	addi $9 $0 1 #reiniciar o segundo numero, para começar novamente do 1
	
	beq $8 $12 segundaChamada # se o $8 já chegou em 10

	addi $8 $8 1 # incrementar 1, para ir descendo as linhas
	
	jr $31

segundaChamada:
	add $4 $0 '\n'
	addi $2 $0 11
	syscall
	addi $9 $0 4 # o $9 virou 4 agora, para iniciar a próxima chamada
	addi $8 $0 1 # reiniciar o 8

	jr $31

segundoBloco:
	add $4 $0 '\n'
	addi $2 $0 11
	syscall

	addi $9 $0 4 # o $9 virou 4 agora, para iniciar a próxima chamada
	
	beq $8 $12 terceiraChamada # se o $8 já chegou em 10
	
	addi $8 $8 1 # incrementar 1, para ir descendo as linhas

	jr $31

terceiraChamada:
	add $4 $0 '\n'
	addi $2 $0 11
	syscall
	addi $9 $0 7 # o $9 virou 7 agora, para iniciar a próxima chamada
	addi $8 $0 1 # reiniciar o 8

	jr $31

terceiroBloco:
	add $4 $0 '\n'
	addi $2 $0 11
	syscall

	addi $9 $0 7 # o $9 virou 7 agora, para iniciar a próxima chamada
	
	beq $8 $12 quartaChamada # se o $8 já chegou em 10
	
	addi $8 $8 1 # incrementar 1, para ir descendo as linhas

	jr $31

quartaChamada:
	add $4 $0 '\n'
	addi $2 $0 11
	syscall
	addi $9 $0 10 # o $9 virou 10 agora, para iniciar a próxima chamada
	addi $8 $0 1 # reiniciar o 8

	jr $31

quartoBloco:
	add $4 $0 '\n'
	addi $2 $0 11
	syscall

	addi $9 $0 10 # o $9 virou 10 agora, para iniciar a próxima chamada
	
	beq $8 $12 final # se o $8 já chegou em 10
	
	addi $8 $8 1 # incrementar 1, para ir descendo as linhas

	jr $31

final: 
	addi $2 $0 10
	syscall
