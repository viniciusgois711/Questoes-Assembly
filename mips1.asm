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
	addi $8 $8 -3584 # Para começar na primeira linha
	
loop: bne $0 $0 sair	
pintarTela:
	beq $13 $0 copiaCenario
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

copiaCenario:
	
	# está guardando no endereço 21 o inicio do mapa
	lui $21, 0x1001    
	# fara a repetição bloco por bloco durante todo o mapa, 128x128 = (8x16)x(8x16)
	addi $10 $0 16384
	loopCopiaCenario:
		# quando o registrador 10 tiver passado por todo os bloquinhos, ele sai e vai para a declaração do boneco
		beq $10, $0, principal
		# carrega o que está no endereço 21(cenarioNormal) e coloca no endereço 25
		lw $25, 0($21)      
		# vai colocar no endereço 25 o endereço do cenario mais 65536, sendo o final da tela 
		sw $25, 65536($21)  
		# vai para o proximo bloquinho
		addi $21, $21, 4
		#diminui um do contador
		addi $10 $10 -1
		# chama o loop
		j loopCopiaCenario
			
principal:
	# endereço inicial boneco
	lui $8 0x1001
	# chama função de desenhar o boneco
	jal desenharBoneco
	
	jal timer
	
	# quantos blocos o boneco vai andar
	addi $15 $0 10
	
	jal andarDireita
	
	# quantos blocos o boneco vai andar
	addi $15 $0 4
	
	jal andarEsquerda
	
	# quantos blocos o boneco vai andar
	addi $15 $0 4
	
	jal andarPBaixo
	
	# quantos blocos o boneco vai andar
	addi $15 $0 3
	
	jal andarPCima
	
	
	j sair

andarDireita:

	# guardar endereço
	add $16 $0 $31
	
	# adiciona um bloco para a direita ao endereço do boneco
	addi $8 $8 32
	
	# chama a função de desenhar boneco com o endereço novo
	jal desenharBoneco
	
	# recuperar o endereço $31
	add $31 $0 $16
	
	# o bloco anterior ao que o boneco está atualmente, serve para apagar o boneco
	add $14 $8 -32
	
	jal apagarRastro
	
	# recuperar o endereço $31
	add $31 $0 $16
	
	# se ainda nao estiver chegado em 0, ele continua o laço
	bne $15 $0 andarDireita
	
	jr $31

andarEsquerda:

	# guardar endereço
	add $16 $0 $31
	
	# adiciona um bloco para a esquerda ao endereço do boneco
	addi $8 $8 -32
	
	# chama a função de desenhar boneco com o endereço novo
	jal desenharBoneco
	
	# recuperar o endereço $31
	add $31 $0 $16
	
	# o bloco anterior ao que o boneco está atualmente, serve para apagar o boneco
	add $14 $8 32
	
	jal apagarRastro
	
	# recuperar o endereço $31
	add $31 $0 $16
	
	# se ainda nao estiver chegado em 0, ele continua o laço
	bne $15 $0 andarEsquerda
	
	jr $31

andarPBaixo:
	# guardar endereço
	add $16 $0 $31
	
	# adiciona um bloco para baixo do boneco
	addi $8 $8 4096
	
	# chama a função de desenhar boneco com o endereço novo
	jal desenharBoneco
	
	# recuperar o endereço $31
	add $31 $0 $16
	
	# o bloco anterior ao que o boneco está atualmente, serve para apagar o boneco
	add $14 $8 -4096
	
	jal apagarRastro
	
	# recuperar o endereço $31
	add $31 $0 $16
	
	# se ainda nao estiver chegado em 0, ele continua o laço
	bne $15 $0 andarPBaixo
	
	jr $31

andarPCima:
	# guardar endereço
	add $16 $0 $31
	
	# adiciona um bloco para baixo do boneco
	addi $8 $8 -4096
	
	# chama a função de desenhar boneco com o endereço novo
	jal desenharBoneco
	
	# recuperar o endereço $31
	add $31 $0 $16
	
	# o bloco anterior ao que o boneco está atualmente, serve para apagar o boneco
	add $14 $8 4096
	
	jal apagarRastro
	
	# recuperar o endereço $31
	add $31 $0 $16
	
	# se ainda nao estiver chegado em 0, ele continua o laço
	bne $15 $0 andarPCima
	
	jr $31


apagarRastro:
	add $17 $0 $31
	# quantidade de bloquinhos na vertical,
	addi $11 $0 8
	laco_apagar_rastro_1:
		# se o contator estiver zerado, sai do laço
		beq $11 $0 fim_laco_apagar_rastro_1
		# quantidade de bloquinhos na horizontal
		addi $12 $0 8
		laco_apagar_rastro_2:
			# se todos os bloquinho da horizontal estiverem recuperados, ele sai
			beq $12 $0 fim_laco_apagar_rastro_2
			
			# guada no endereço 13, o que está na copia e se reperte em cada bloquinho
			lw $13 65536($14)
			# coloca no endereço 14 o que está no 13
			sw $13 0($14)
			# vai para o endereço do proximo bloquinho
			addi $14 $14 4
			# diminui um bloquinho
			addi $12 $12 -1
			j laco_apagar_rastro_2
		fim_laco_apagar_rastro_2:
		# pega o endereço do bloco anterior ao que o boneco está atualmente (ele soma 4 oito vezes, emtão 32, com isso ele vai para o inicio da linha de novo
		addi $14 $14 -32
		# depois de ir para o inicio da linha ele vai para a linha de bloquinhos de baixo
		addi $14 $14 512
		# diminui um do contador de blocos na vertical
		addi $11 $11 -1
		j laco_apagar_rastro_1
		
	fim_laco_apagar_rastro_1:
	# diminui a quantidade de espaços a serem percorridos
	addi $15 $15 -1
	
	jal timer
	# recuperar o endereço $31
	add $31 $0 $17
	
	jr $31
	
desenharBoneco: 	
	# preto boneco
	add $24 $8 $0
	lui $9, 0x0000
	ori $9, $9, 0x0000
	sw $9, 8($24)
	sw $9, 12($24)
	sw $9, 16($24)
	sw $9, 20($24)
	sw $9, 520($24)
	sw $9, 1036($24)
	sw $9, 1044($24)
		
	# pele boneco
	li $9 0xf5cbbe
	
	sw $9, 516($24)
	sw $9, 524($24)
	sw $9, 528($24)
	sw $9, 532($24)
	sw $9, 1028($24)
	sw $9, 1032($24)
	sw $9, 1040($24)
	
	sw $9, 1544($24)
	sw $9, 1548($24)
	sw $9, 1552($24)
	sw $9, 1556($24)
	
	sw $9, 2048($24)
	sw $9, 2076($24)
	sw $9, 2560($24)
	sw $9, 2588($24)
	
	# camisa boneco
	li $9 0x2858F4
	sw $9, 2052($24)
	sw $9, 2056($24)
	sw $9, 2060($24)
	sw $9, 2064($24)
	sw $9, 2068($24)
	sw $9, 2072($24)
	
	sw $9, 2564($24)
	sw $9, 2568($24)
	sw $9, 2572($24)
	sw $9, 2576($24)
	sw $9, 2580($24)
	sw $9, 2584($24)
	
	sw $9, 3588($24)
	sw $9, 3592($24)
	sw $9, 3604($24)
	sw $9, 3608($24)
	
	# branco boneco
	li $9 0xffffff
	sw $9, 3080($24)
	sw $9, 3092($24)
	
	jr $31
	

timer: 
	sw $16, 0($29)
       addi $29, $29, -4
       addi $16, $0, 50000
forT:  beq $16, $0, fimT
       nop
       nop
       addi $16, $16, -1      
       j forT                  
fimT:  addi $29, $29, 4                                                    
       lw $16, 0($29)          
       jr $31

sair:
	addi $2 $0 10
	syscall
	
	