.text
main:
	lui $8, 0x1001
	
	lui $9, 0xFF66       # 
	ori $9, $9, 0x00FF  # Cor Azul

	lui $19, 0xAAAA       # 
	ori $19, $19, 0xFFFF  # Cor Azul Borda

	
	lui $11, 0xCCCC       # 
	ori $11, $11, 0xFFFF  # Cor Azul chao
	
	
	
	
	
	addi $12 $0 16 # Tamanho de quadrados da Linha
	addi $13 $0 16 # Tamanho de linhas
	addi $14 $0 15 # validador das bordas
	
	
	addi $15 $0 12 # saber se a linha ou coluna esta na 12
	add $16 $15 $0
	add $17 $15 $0
	addi $18 $0 8
	addi $8 $8 -3584 # Para come�ar na primeira linha
	
	
pintarTela:
	beq $13 $0 sair
	addi $13 $13 -1
	addi $12 $12 16
	addi $8 $8 3584
	j pintarLinha 

pintarLinha:	
	add $17 $15 $0
	beq $12 $0 pintarTela
	addi $10 $0 8
	addi $12 $12 -1
	j quadrado


quadrado:
	beq $10 $0 lateral
	beq $10 $18 primeiraColunaQuadrado
	sw $11, 0($8)       # 1
	sw $11, 512($8)     # 2
	sw $11, 1024($8)    # 3
	sw $11, 1536($8)    # 4
	sw $11, 2048($8)    # 5
	sw $11, 2560($8)    # 6
	sw $11, 3072($8)    # 7
	sw $19, 3584($8)    # 8
	addi $8 $8 4
	addi $10 $10 -1
	
	j quadrado

primeiraColunaQuadrado:
	sw $19, 0($8)       # 1
	sw $19, 512($8)     # 2
	sw $19, 1024($8)    # 3
	sw $19, 1536($8)    # 4
	sw $19, 2048($8)    # 5
	sw $19, 2560($8)    # 6
	sw $19, 3072($8)    # 7
	sw $19, 3584($8)    # 8
	addi $8 $8 4
	addi $10 $10 -1
	
	j quadrado

lateral:
	beq $13 $14 teste #Se for a primeira linha, pinta de cor diferente
	beq $13 $0 teste #Se for ultima linha, pinta de cor diferente
	beq $12 $14 teste # se for a primeira coluna, pinta de cor diferente
	beq $12 $0 teste
	addi $17 $0 12
	beq $13 $17 talvezObstaculo
	addi $17 $0 11
	beq $13 $17 talvezObstaculo
	addi $17 $0 8
	beq $13 $17 talvezObstaculo
	addi $17 $0 7
	beq $13 $17 talvezObstaculo
	addi $17 $0 4
	beq $13 $17 talvezObstaculo
	addi $17 $0 3
	beq $13 $17 talvezObstaculo
	j pintarLinha

talvezObstaculo:
	addi $16 $0 12
	beq $12 $15 teste
	addi $16 $0 11
	beq $12 $16 teste
	addi $16 $0 8
	beq $12 $16 teste
	addi $16 $0 7
	beq $12 $16 teste
	addi $16 $0 4
	beq $12 $16 teste
	addi $16 $0 3
	beq $12 $16 teste
	j pintarLinha

teste:
	addi $10 $10 8
	addi $8 $8 -32
	j lateral2
	
lateral2:

	beq $10 $0 pintarLinha
	sw $9, 0($8)       # 1
	sw $9, 512($8)     # 2
	sw $9, 1024($8)    # 3
	sw $9, 1536($8)    # 4
	sw $9, 2048($8)    # 5
	sw $9, 2560($8)    # 6
	sw $9, 3072($8)    # 7
	sw $9, 3584($8)    # 8
	addi $8 $8 4
	addi $10 $10 -1
	
	j lateral2


sair: 	lui $8, 0x1001

	# preto boneco
	lui $9, 0x0000
	ori $9, $9, 0x0000
	sw $9, 8($8)
	sw $9, 12($8)
	sw $9, 16($8)
	sw $9, 20($8)
	sw $9, 520($8)
	sw $9, 1036($8)
	sw $9, 1044($8)
		
	# pele boneco
	li $9 0xf5cbbe
	
	sw $9, 516($8)
	sw $9, 524($8)
	sw $9, 528($8)
	sw $9, 532($8)
	sw $9, 1028($8)
	sw $9, 1032($8)
	sw $9, 1040($8)
	
	sw $9, 1544($8)
	sw $9, 1548($8)
	sw $9, 1552($8)
	sw $9, 1556($8)
	
	sw $9, 2048($8)
	sw $9, 2076($8)
	sw $9, 2560($8)
	sw $9, 2588($8)
	
	# camisa boneco
	li $9 0x2858F4
	sw $9, 2052($8)
	sw $9, 2056($8)
	sw $9, 2060($8)
	sw $9, 2064($8)
	sw $9, 2068($8)
	sw $9, 2072($8)
	
	sw $9, 2564($8)
	sw $9, 2568($8)
	sw $9, 2572($8)
	sw $9, 2576($8)
	sw $9, 2580($8)
	sw $9, 2584($8)
	
	sw $9, 3588($8)
	sw $9, 3592($8)
	sw $9, 3604($8)
	sw $9, 3608($8)
	
	# branco boneco
	li $9 0xffffff
	sw $9, 3080($8)
	sw $9, 3092($8)
	
	
	
	