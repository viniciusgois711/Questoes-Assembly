.text
main:
	lui $8, 0x1001
	
	#lui $9, 0xFF66       # 
	#ori $9, $9, 0x00FF  # Cor Azul

	lui $9, 0xAAAA       # 
	ori $9, $9, 0xFFFF  # Cor Azul Borda
	
	lui $11, 0xCCCC       # 
	ori $11, $11, 0xFFFF  # Cor Azul chao
	
	
	addi $12 $0 16 # Tamanho de quadrados da Linha
	addi $13 $0 16 # Tamanho de linhas
	j pintarLinha
	
	
pintarTela:
	beq $13 $0 sair
	addi $13 $13 -1
	addi $12 $12 16
	addi $8 $8 3582
	j pintarLinha 

pintarLinha:
	
	beq $12 $0 pintarTela
	addi $10 $0 8
	addi $12 $12 -1
	j quadrado

quadrado:
	beq $10 $0 pintarLinha
	sw $11, 0($8)       # 1
	sw $11, 512($8)     # 2
	sw $11, 1024($8)    # 3
	sw $11, 1536($8)    # 4
	sw $11, 2048($8)    # 5
	sw $11, 2560($8)    # 6
	sw $11, 3072($8)    # 7
	sw $11, 3584($8)    # 8
	addi $8 $8 4
	addi $10 $10 -1
	j quadrado


		
sair: 	addi $2 $0 10
	syscall
