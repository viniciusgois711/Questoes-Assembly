.text
main:
	lui $8, 0x1001
	
	li $9, 0xFF6600FF

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
		beq $10, $0, enderecosIniciais
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

enderecosIniciais:
	
	# endereco personagem
	lui $8 0x1001
	addi $8 $8 4640
	
	add $10 $8 $0	
	
	
	# endereço inicial boneco
	lui $8 0x1001
	addi $8 $8 57888

	# endereco boneco
	lui $23, 0x1002
	sw $8 0($23)
		
	# contador
	addi $17 $0 20
	sw $17 4($23)	
	
	li $5 4
	li $2 42
	syscall	
	addi $4 $4 1
						
principal:

	add $8 $10 $0
	
	jal desenharPersonagem
	
	jal teclado

voltaTeclado:
	
	voltaApagarExplosao:
	
	lw $17 4($23)
	
	beq $17 $0 reiniciaTimer

	lw $17 0($23)
	# chama função de desenhar o boneco
	jal desenharBoneco
	
	addi $15 $0 1
	
	addi $17 $0 1
	beq $4 $17 andarDireitaBoneco
	addi $17 $0 2
	beq $4 $17 andarEsquerdaBoneco
	addi $17 $0 3
	beq $4 $17 andarPCimaBoneco
	addi $17 $0 4
	beq $4 $17 andarPBaixoBoneco
	
	
	
	testarVolta:
		lw $17 4($23)
		addi $17 $17 -1
		sw $17 4($23)
		j principal
	
	reiniciaTimer:
		li $5 4
		li $2 42
		syscall
		addi $4 $4 1
		addi $17 $0 20
		sw $17 4($23)
		
		j principal


teclado:
  	lui $12, 0xffff  # Armazena o endereco de memoria que armazena 1 se tiver alguma entrada do teclado e 0 se nao
  	lw $13, 0($12) # armazena no $13 o que esta no endereço de memoria apontado por $12
  	beq $13, $0, voltaTeclado
  	
  	
  	lw $13, 4($12) # Armazena no $12 a tecla pressionada
  	
  	addi $15 $0 2
  
  	addi $16, $0, 65 # A ascii
  	beq $13, $16, andarEsquerda
  	addi $16, $0, 97 # a ascii
  	beq $13, $16, andarEsquerda
  
  	addi $16, $0, 68 # D ascii
  	beq $13, $16, andarDireita
  	addi $16, $0, 100 # d ascii
  	beq $13, $16, andarDireita
  
	
  	addi $16, $0, 83 # S ascii
  	beq $13, $16, andarPBaixo
 	addi $16, $0, 115 # s ascii
  	beq $13, $16, andarPBaixo
  	
  	addi $16, $0, 87 # W ascii
  	beq $13, $16, andarPCima
 	addi $16, $0, 119 # w ascii
  	beq $13, $16, andarPCima
	
	addi $16, $0, 32 # Space ascii
  	beq $13, $16, desenharBomba
	
	jr $31
	
andarDireita:

	
	# guardar endereço
	add $16 $0 $31
	
	# cor da borda
	li $20, 0xFF6600FF

 	# pega o endereço do lado direito do bloco atual do boneco
	lw $21 32($8)
	

	# se o bloco do lado for da cor da borda, ele pula o codigo
	beq $20 $21 pularCodigoAndarDireita
	
	# pega o endereço do lado direito do bloco atual do boneco
	lw $21 3616($8)

	# se o bloco do lado for da cor da borda, ele pula o codigo
	beq $20 $21 pularCodigoAndarDireita
	
	addi $11 $0 8
	
	# cor da bomba
	li $20, 0x000000
	
	addi $22 $8 32
	
	
	loopColisaoBomba:
		lw $21 0($22)
		beq $11 $0 sairloopColisaoBomba
 		beq $20 $21 pularCodigoAndarDireita
 		
 		add $22 $22 512
 		addi $11 $11 -1
 		
 		j loopColisaoBomba
 		
 	sairloopColisaoBomba:
	
	# o bloco anterior ao que o boneco está atualmente, serve para apagar o boneco
	add $14 $8 0
	
	jal apagarRastro
	
	# recuperar o endereço $31
	add $31 $0 $16
	
	# adiciona um bloco para a direita ao endereço do boneco
	addi $8 $8 4
	
	# chama a função de desenhar boneco com o endereço novo
	jal desenharPersonagem
	
	# recuperar o endereço $31
	add $31 $0 $16
	
	jal timer
	
	# recuperar o endereço $31
	add $31 $0 $16
	# diminui a quantidade de espaços a serem percorridos
	addi $15 $15 -1
	
	# se ainda nao estiver chegado em 0, ele continua o laço
	bne $15 $0 andarDireita
	
	
	pularCodigoAndarDireita:
		add $10 $8 $0
		jr $31


		
andarDireitaBoneco:
	
	lui $23 0x1002
	lw $17 0($23) 	

	# guardar endereço
	add $16 $0 $31
	
	li $20, 0xFF6600FF
 	
 	# pega o endereço do lado direito do bloco atual do boneco
	lw $21 32($17)

	# se o bloco do lado for da cor da borda, ele pula o codigo
	beq $20 $21 pularCodigoAndarDireitaBoneco
	
	# pega o endereço do lado direito do bloco atual do boneco
	lw $21 3616($17)

	# se o bloco do lado for da cor da borda, ele pula o codigo
	beq $20 $21 pularCodigoAndarDireitaBoneco
	
	
	addi $11 $0 8
	
	# cor da bomba
	li $20, 0x000000
	
	addi $22 $17 32
	
	
	loopColisaoBombaDireitaBoneco:
		lw $21 0($22)
		beq $11 $0 sairloopColisaoBombaDireitaBoneco
 		beq $20 $21 pularCodigoAndarDireitaBoneco
 		
 		add $22 $22 512
 		addi $11 $11 -1
 		
 		j loopColisaoBombaDireitaBoneco
 		
 	sairloopColisaoBombaDireitaBoneco:
	
	
	# o bloco que o boneco está atualmente, serve para apagar o boneco
	add $14 $17 0
	
	jal apagarRastro
	
	# recuperar o endereço $31
	add $31 $0 $16
	
	# adiciona um bloco para a direita ao endereço do boneco
	addi $17 $17 4
	
	sw $17 0($23)
	
	# chama a função de desenhar boneco com o endereço novo
	jal desenharBoneco
	
	# recuperar o endereço $31
	add $31 $0 $16
	
	jal timer
	
	# recuperar o endereço $31
	add $31 $0 $16
	# diminui a quantidade de espaços a serem percorridos
	addi $15 $15 -1
	# se ainda nao estiver chegado em 0, ele continua o laço
	bne $15 $0 andarDireitaBoneco
	
	
	pularCodigoAndarDireitaBoneco:
		
		j testarVolta



andarEsquerda:

	# guardar endereço
	add $16 $0 $31
	
	li $20, 0xFF6600FF
 	
 	# pega o endereço do lado esquerdo do bloco atual do boneco
	lw $21 -4($8)

	# se o bloco de baixo for da cor da borda, ele pula o codigo
	beq $20 $21 pularCodigoAndarEsquerda
	
	# pega o endereço do lado esquerdo do bloco atual do boneco
	lw $21 3580($8)

	# se o bloco de baixo for da cor da borda, ele pula o codigo
	beq $20 $21 pularCodigoAndarEsquerda
	
	
	addi $11 $0 8
	
	# cor da bomba
	li $20, 0x000000
	
	addi $22 $8 -4
	
	
	loopColisaoBombaEsquerda:
		lw $21 0($22)
		beq $11 $0 sairloopColisaoBombaEsquerda
 		beq $20 $21 pularCodigoAndarEsquerda
 		
 		add $22 $22 512
 		addi $11 $11 -1
 		
 		j loopColisaoBombaEsquerda
 		
 	sairloopColisaoBombaEsquerda:
	
	
	
	# o bloco que o boneco está atualmente, serve para apagar o boneco
	add $14 $8 0
	
	jal apagarRastro
	
	# recuperar o endereço $31
	add $31 $0 $16
	
	# adiciona um bloco para a esquerda ao endereço do boneco
	addi $8 $8 -4
	
	# chama a função de desenhar boneco com o endereço novo
	jal desenharPersonagem
	
	# recuperar o endereço $31
	add $31 $0 $16
	
	jal timer
	
	# recuperar o endereço $31
	add $31 $0 $16
	# diminui a quantidade de espaços a serem percorridos
	addi $15 $15 -1
	
	# se ainda nao estiver chegado em 0, ele continua o laço
	bne $15 $0 andarEsquerda
	
	
	pularCodigoAndarEsquerda:
		add $10 $8 $0
		jr $31



andarEsquerdaBoneco:

	lui $23 0x1002
	lw $17 0($23)

	# guardar endereço
	add $16 $0 $31
	
	li $20, 0xFF6600FF
 	
 	# pega o endereço do lado esquerdo do bloco atual do boneco
	lw $21 -4($17)

	# se o bloco de baixo for da cor da borda, ele pula o codigo
	beq $20 $21 pularCodigoAndarEsquerdaBoneco
	
	# pega o endereço do lado esquerdo do bloco atual do boneco
	lw $21 3580($17)

	# se o bloco de baixo for da cor da borda, ele pula o codigo
	beq $20 $21 pularCodigoAndarEsquerdaBoneco
	
	addi $11 $0 8
	
	# cor da bomba
	li $20, 0x000000
	
	addi $22 $17 -4
	
	
	loopColisaoBombaEsquerdaBoneco:
		lw $21 0($22)
		beq $11 $0 sairloopColisaoBombaEsquerdaBoneco
 		beq $20 $21 pularCodigoAndarEsquerdaBoneco
 		
 		add $22 $22 512
 		addi $11 $11 -1
 		
 		j loopColisaoBombaEsquerdaBoneco
 		
 	sairloopColisaoBombaEsquerdaBoneco:
	
	
	
	# o bloco que o boneco está atualmente, serve para apagar o boneco
	add $14 $17 0
	
	jal apagarRastro
	
	# recuperar o endereço $31
	add $31 $0 $16
	
	# adiciona um bloco para a esquerda ao endereço do boneco
	addi $17 $17 -4
	
	sw $17 0($23)
	
	# chama a função de desenhar boneco com o endereço novo
	jal desenharBoneco
	
	# recuperar o endereço $31
	add $31 $0 $16
	
	jal timer
	
	# recuperar o endereço $31
	add $31 $0 $16
	# diminui a quantidade de espaços a serem percorridos
	addi $15 $15 -1
	
	# se ainda nao estiver chegado em 0, ele continua o laço
	bne $15 $0 andarEsquerdaBoneco
	
	
	pularCodigoAndarEsquerdaBoneco:
		j testarVolta


andarPBaixo:
	# guardar endereço
	add $16 $0 $31
	
	li $20, 0xFF6600FF
 	
 	# pega o endereço de baixo do bloco atual do boneco
	lw $21 4096($8)

	# se o bloco de baixo for da cor da borda, ele pula o codigo
	beq $20 $21 pularCodigoAndarBaixo
	
	# pega o endereço de baixo do bloco atual do boneco
	lw $21 4124($8)

	# se o bloco de baixo for da cor da borda, ele pula o codigo
	beq $20 $21 pularCodigoAndarBaixo
	
	# quantas vezes o loop se repete
	addi $11 $0 8
	
	# cor da bomba
	li $20, 0x000000
	
	addi $22 $8 4096
	
	
	loopColisaoBombaPBaixo:
		lw $21 0($22)
		beq $11 $0 sairloopColisaoBombaPBaixo
 		beq $20 $21 pularCodigoAndarBaixo
 		
 		add $22 $22 4
 		addi $11 $11 -1
 		
 		j loopColisaoBombaPBaixo
 		
 	sairloopColisaoBombaPBaixo:
	
	
	
	# o bloco anterior ao que o boneco está atualmente, serve para apagar o boneco
	add $14 $8 0
	
	jal apagarRastro
	
	# recuperar o endereço $31
	add $31 $0 $16
	
	# adiciona um bloco para baixo do boneco
	addi $8 $8 512
	
	# chama a função de desenhar boneco com o endereço novo
	jal desenharPersonagem
	
	# recuperar o endereço $31
	add $31 $0 $16
	
	jal timer
	
	# recuperar o endereço $31
	add $31 $0 $16
	
	# diminui a quantidade de espaços a serem percorridos
	addi $15 $15 -1
	
	# se ainda nao estiver chegado em 0, ele continua o laço
	bne $15 $0 andarPBaixo
	
	pularCodigoAndarBaixo:
		add $10 $8 $0
		jr $31


andarPBaixoBoneco:

	lui $23 0x1002
	lw $17 0($23)

	# guardar endereço
	add $16 $0 $31
	
	li $20, 0xFF6600FF
 	
 	# pega o endereço de baixo do bloco atual do boneco
	lw $21 4096($17)

	# se o bloco de baixo for da cor da borda, ele pula o codigo
	beq $20 $21 pularCodigoAndarBaixoBoneco
	
	# pega o endereço de baixo do bloco atual do boneco
	lw $21 4124($17)

	# se o bloco de baixo for da cor da borda, ele pula o codigo
	beq $20 $21 pularCodigoAndarBaixoBoneco
	
	
	addi $11 $0 8
	
	# cor da bomba
	li $20, 0x000000
	
	addi $22 $17 4096
	
	
	loopColisaoBombaPBaixoBoneco:
		lw $21 0($22)
		beq $11 $0 sairloopColisaoBombaPBaixoBoneco
 		beq $20 $21 pularCodigoAndarBaixoBoneco
 		
 		add $22 $22 4
 		addi $11 $11 -1
 		
 		j loopColisaoBombaPBaixoBoneco
 		
 	sairloopColisaoBombaPBaixoBoneco:
	
	
	# o bloco anterior ao que o boneco está atualmente, serve para apagar o boneco
	add $14 $17 0
	
	jal apagarRastro
	
	# recuperar o endereço $31
	add $31 $0 $16
	
	# adiciona um bloco para baixo do boneco
	addi $17 $17 512
	
	sw $17 0($23)
	
	# chama a função de desenhar boneco com o endereço novo
	jal desenharBoneco
	
	# recuperar o endereço $31
	add $31 $0 $16
	
	jal timer
	
	# recuperar o endereço $31
	add $31 $0 $16
	
	# diminui a quantidade de espaços a serem percorridos
	addi $15 $15 -1
	
	# se ainda nao estiver chegado em 0, ele continua o laço
	bne $15 $0 andarPBaixoBoneco
	
	pularCodigoAndarBaixoBoneco:
		j testarVolta


andarPCima:
	# guardar endereço
	add $16 $0 $31
	
	li $20, 0xFF6600FF
 	
 	# pega o endereço de cima do bloco atual do boneco
	lw $21 -512($8)

	# se o bloco de baixo for da cor da borda, ele pula o codigo
	beq $20 $21 pularCodigoAndarCima
	
	# pega o endereço de cima do bloco atual do boneco
	lw $21 -484($8)

	# se o bloco de baixo for da cor da borda, ele pula o codigo
	beq $20 $21 pularCodigoAndarCima
	
	
	addi $11 $0 8
	
	# cor da bomba
	li $20, 0x000000
	
	addi $22 $8 -512
	
	
	loopColisaoBombaPCima:
		lw $21 0($22)
		beq $11 $0 sairloopColisaoBombaPCima
 		beq $20 $21 pularCodigoAndarCima
 		
 		add $22 $22 4
 		addi $11 $11 -1
 		
 		j loopColisaoBombaPCima
 		
 	sairloopColisaoBombaPCima:
	
	
	
	# o bloco anterior ao que o boneco está atualmente, serve para apagar o boneco
	add $14 $8 0
	
	jal apagarRastro
	
	# recuperar o endereço $31
	add $31 $0 $16
	
	# adiciona um bloco para cima do boneco
	addi $8 $8 -512
	
	# chama a função de desenhar boneco com o endereço novo
	jal desenharPersonagem
	
	# recuperar o endereço $31
	add $31 $0 $16
	
	jal timer
	
	# recuperar o endereço $31
	add $31 $0 $16
	
	# diminui a quantidade de espaços a serem percorridos
	addi $15 $15 -1
	
	# se ainda nao estiver chegado em 0, ele continua o laço
	bne $15 $0 andarPCima
	
	pularCodigoAndarCima:
		add $10 $8 $0
		jr $31



andarPCimaBoneco:

	lui $23 0x1002
	
	lw $17 0($23)

	# guardar endereço
	add $16 $0 $31
	
	li $20, 0xFF6600FF
 	
 	# pega o endereço de cima do bloco atual do boneco
	lw $21 -512($17)

	# se o bloco de baixo for da cor da borda, ele pula o codigo
	beq $20 $21 pularCodigoAndarCimaBoneco
	
	# pega o endereço de cima do bloco atual do boneco
	lw $21 -484($17)

	# se o bloco de baixo for da cor da borda, ele pula o codigo
	beq $20 $21 pularCodigoAndarCimaBoneco
	
	addi $11 $0 8
	
	# cor da bomba
	li $20, 0x000000
	
	addi $22 $17 -512
	
	
	loopColisaoBombaPCimaBoneco:
		lw $21 0($22)
		beq $11 $0 sairloopColisaoBombaPCimaBoneco
 		beq $20 $21 pularCodigoAndarCimaBoneco
 		
 		add $22 $22 4
 		addi $11 $11 -1
 		
 		j loopColisaoBombaPCimaBoneco
 		
 	sairloopColisaoBombaPCimaBoneco:
	
	
	# o bloco anterior ao que o boneco está atualmente, serve para apagar o boneco
	add $14 $17 0
	
	jal apagarRastro
	
	# recuperar o endereço $31
	add $31 $0 $16
	
	# adiciona um bloco para cima do boneco
	addi $17 $17 -512
	
	sw $17 0($23) 
	
	# chama a função de desenhar boneco com o endereço novo
	jal desenharBoneco
	
	# recuperar o endereço $31
	add $31 $0 $16
	
	jal timer
	
	# recuperar o endereço $31
	add $31 $0 $16
	
	# diminui a quantidade de espaços a serem percorridos
	addi $15 $15 -1
	
	# se ainda nao estiver chegado em 0, ele continua o laço
	bne $15 $0 andarPCimaBoneco
	
	pularCodigoAndarCimaBoneco:

		j testarVolta


apagarRastro:

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
			
			# guarda no endereço 13, o que está na copia e se reperte em cada bloquinho
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
	
	
	# recuperar o endereço $31
	
	jr $31
	
desenharBoneco:
 	lw $17 0($23)
 	
	# preto boneco
	lui $9, 0x0000
	ori $9, $9, 0x0000
	sw $9, 8($17)
	sw $9, 12($17)
	sw $9, 16($17)
	sw $9, 20($17)
	sw $9, 520($17)
	sw $9, 1036($17)
	sw $9, 1044($17)
	
	# pele boneco
	li $9 0xf5cbbe
	
	sw $9, 516($17)
	sw $9, 524($17)
	sw $9, 528($17)
	sw $9, 532($17)
	sw $9, 1028($17)
	sw $9, 1032($17)
	sw $9, 1040($17)
	
	sw $9, 1544($17)
	sw $9, 1548($17)
	sw $9, 1552($17)
	sw $9, 1556($17)
	
	sw $9, 2048($17)
	sw $9, 2076($17)
	sw $9, 2560($17)
	sw $9, 2588($17)
	
	# camisa boneco
	li $9 0xBF0101
	sw $9, 2052($17)
	sw $9, 2056($17)
	sw $9, 2060($17)
	sw $9, 2064($17)
	sw $9, 2068($17)
	sw $9, 2072($17)
	
	sw $9, 2564($17)
	sw $9, 2568($17)
	sw $9, 2572($17)
	sw $9, 2576($17)
	sw $9, 2580($17)
	sw $9, 2584($17)
	
	sw $9, 3588($17)
	sw $9, 3592($17)
	sw $9, 3604($17)
	sw $9, 3608($17)
	
	# branco boneco
	li $9 0xffffff
	sw $9, 3080($17)
	sw $9, 3092($17)

	
	jr $31

	
desenharPersonagem: 	
	# preto boneco
	add $24 $8 $0
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
	li $9 0x000000
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

	jr $31


desenharBomba:
	
	lui $23 0x1002
	sw $31 8($23)
	
	li $20, 0xFF6600FF
	
	lw $21, -32($8)
	
	beq $20 $21 pularDesenharBomba
	
	lw $21 3580($8)
	
	beq $20 $21 pularDesenharBomba
	
	addi $22 $8 -32
	
	lui $23 0x1002
	
	#endereço da bomba
	sw $22 12($23)
	
	#se existe bomba
	add $17 $0 1
	sw $17 16($23)
	
	# laranja pavil
	li $9 0xFFA500
	sw $9 16($22)
	
	#amarelo pavil
	li $9 0xFFFF00
	sw $9 524($22)
	
	# branco pavil
	li $9 0xffffff
	sw $9 1036($22)
	
	# preto bomba
	li $9 0x000000
	sw $9 1032($22)
	sw $9 1040($22)
	sw $9 1032($22)
	
	sw $9 1540($22)
	sw $9 1544($22)
	sw $9 1548($22)
	sw $9 1552($22)
	sw $9 1556($22)
	
	sw $9 2052($22)
	sw $9 2056($22)
	sw $9 2060($22)
	sw $9 2064($22)
	sw $9 2068($22)
	
	sw $9 2564($22)
	sw $9 2568($22)
	sw $9 2572($22)
	sw $9 2576($22)
	sw $9 2580($22)
	
	sw $9 3080($22)
	sw $9 3084($22)
	sw $9 3088($22)
	
	jal timer
	jal timer
	jal timer
	jal timer
	
	
	jal desenharExplosao
	
	jal timer
	jal timer
	jal timer
	jal timer
	
	jal apagarExplosao
	
	pularDesenharBomba:
		lw $31 8($23)
		jr $31

desenharExplosao:
	lw $17 12($23)
	addi $19 $0 24
	addi $18 $17 -32
		

		
	loopExplosaoHorizontal:
	li $9 0xBF0101
		
	addi $11 $18 0
		
	#contador
	addi $12 $0 8
	loopColisaoWin:
		beq $12 $0 sairLoopColisaoWin
		lw $17 0($11)
		beq $9 $17 youwin
		addi $11 $11 512
		addi $12 $12 -1
		j loopColisaoWin
	sairLoopColisaoWin:	
	 	# laranja
		li $9 0xFF5733
		beq $19 $0 inicializadorVertical
		sw $9, 0($18)       # 1
		sw $9, 512($18)     # 2
		sw $9, 1024($18)    # 3
		sw $9, 1536($18)    # 4
		sw $9, 2048($18)    # 5
		sw $9, 2560($18)    # 6
		sw $9, 3072($18)    # 7
		sw $9, 3584($18)    # 8

		
		addi $18 $18 4
		addi $19 $19 -1
		
		j loopExplosaoHorizontal
		
	inicializadorVertical:
		lw $17 12($23)
		addi $18 $17 -4096
		addi $19 $0 24
		
	
	loopExplosaoVertical:
	
		li $9 0xBF0101
		
		addi $11 $18 0
		
		#contador
		addi $12 $0 8
		loopColisaoWin2:
			beq $12 $0 sairLoopColisaoWin2
			lw $17 0($11)
			beq $9 $17 youwin
			addi $11 $11 4
			addi $12 $12 -1
			j loopColisaoWin2	
		
		sairLoopColisaoWin2:
	 	# laranja
		li $9 0xFF5733
		beq $19 $0 sairLoopExplosao
		sw $9, 0($18)       # 1
		sw $9, 4($18)     # 2
		sw $9, 8($18)    # 3
		sw $9, 12($18)    # 4
		sw $9, 16($18)    # 5
		sw $9, 20($18)    # 6
		sw $9, 24($18)    # 7
		sw $9, 28($18)    # 8
		
		
		
		addi $18 $18 512
		addi $19 $19 -1
		
		j loopExplosaoVertical
		
	sairLoopExplosao:
		addi $19 $0 2
		addi $24 $0 1
		addi $14 $18 -4096
		addi $18 $0 1
		
		
		sw $17 16($23)
		jr $31


apagarExplosao:

	# quantidade de bloquinhos na vertical,
	addi $11 $0 8
	laco_apagar_bomba_1:
		# se o contator estiver zerado, sai do laço
		beq $11 $0 fim_laco_apagar_bomba_1
		# quantidade de bloquinhos na horizontal
		addi $12 $0 8
		laco_apagar_bomba_2:
			# se todos os bloquinho da horizontal estiverem recuperados, ele sai
			beq $12 $0 fim_laco_bomba_2
			
			# guarda no endereço 13, o que está na copia e se reperte em cada bloquinho
			lw $13 65536($14)
			# coloca no endereço 14 o que está no 13
			sw $13 0($14)
			# vai para o endereço do proximo bloquinho
			addi $14 $14 4
			# diminui um bloquinho
			addi $12 $12 -1
			j laco_apagar_bomba_2
		fim_laco_bomba_2:
		# pega o endereço do bloco anterior ao que o boneco está atualmente (ele soma 4 oito vezes, emtão 32, com isso ele vai para o inicio da linha de novo
		addi $14 $14 -32
		# depois de ir para o inicio da linha ele vai para a linha de bloquinhos de baixo
		addi $14 $14 512
		# diminui um do contador de blocos na vertical
		addi $11 $11 -1
		j laco_apagar_bomba_1
		
	fim_laco_apagar_bomba_1:
	
	
	beq $19 $0 sairApagarExplosaoHorizontal
	addi $14 $14 -8192
	addi $19 $19 -1
	j apagarExplosao
	
	sairApagarExplosaoHorizontal:
		beq $24 $0 sairApagarExplosao
		addi $14 $14 32
		addi $24 $24 -1
		j apagarExplosao
	
	sairApagarExplosao:
		beq $18 $0 sairGeralExplosao
		addi $18 $18 -1
		addi $14 $14 -4160

		j apagarExplosao

	sairGeralExplosao:
		
		j voltaApagarExplosao

timer: 
	sw $16, 0($29)
       addi $29, $29, -4
       addi $16, $0, 10000
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
	
	
youwin:
	jal timer
	jal timer
	jal timer
	
	jal timer
	
	jal timer
	jal timer
	lui $8 0x1001
	
	li $9 0x000000
	sw $9 0($8)
	addi $24 $0 16384
	
	loopPreto:
		beq $24 $0 sairPreto
		sw $9 0($8)
		addi $8 $8 4
		addi $24 $24 -1
		j loopPreto
	
	sairPreto:
	lui $8 0x1001
	li $9 0x0000FF
	
	addi $8 $8 20608
	lui $25 0x1002
	sw $8 8($25)
	
	addi $10 $0 8
	
	loopVerticalYEsquerdo:
		beq $10 $0 sairloopVerticalYEsquerdo
		sw $9 0($8)
		addi $8 $8 516
		addi $10 $10 -1
		j loopVerticalYEsquerdo
		
	sairloopVerticalYEsquerdo:
		sw $8 0($25)
		addi $10 $0 8
		loopVerticalY:
		beq $10 $0 sairloopVerticalY
		sw $9 0($8)
		addi $8 $8 512
		addi $10 $10 -1
		j loopVerticalY
	
	sairloopVerticalY:
		lw $8 0($25)
		addi $10 $0 8
		loopVerticalYDireito:
		beq $10 $0 sairloopVerticalYDireito
		sw $9 0($8)
		addi $8 $8 -508
		addi $10 $10 -1
		j loopVerticalYDireito
		
	sairloopVerticalYDireito:
		
		addi $8 $8 32
		addi $10 $0 16
		loopVerticalOEsquerdo:
		beq $10 $0 sairloopVerticalOEsquerdo
		sw $9 0($8)
		addi $8 $8 512
		addi $10 $10 -1
		j loopVerticalOEsquerdo
	
	sairloopVerticalOEsquerdo:
		addi $10 $0 16	
		loopHorizontalOEsquerdo:
		beq $10 $0 sairloopHorizontalOEsquerdo
		sw $9 0($8)
		addi $8 $8 4
		addi $10 $10 -1
		j loopHorizontalOEsquerdo
	
	sairloopHorizontalOEsquerdo:
		addi $10 $0 16	
		
		loopVerticalODireito:
		beq $10 $0 sairloopVerticalODireito
		sw $9 0($8)
		addi $8 $8 -512
		addi $10 $10 -1
		j loopVerticalODireito
		
	sairloopVerticalODireito:
		sw $8 4($25)
		addi $10 $0 16	
		loopHorizontalOVolta:
		beq $10 $0 sairloopHorizontalOVolta
		sw $9 0($8)
		addi $8 $8 -4
		addi $10 $10 -1
		j loopHorizontalOVolta
		
	sairloopHorizontalOVolta:
		lw $8 4($25)
		addi $8 $8 32
		addi $10 $0 16
		loopVerticalUEsquerdo:
		beq $10 $0 sairloopVerticalUEsquerdo
		sw $9 0($8)
		addi $8 $8 512
		addi $10 $10 -1
		j loopVerticalUEsquerdo
		
	sairloopVerticalUEsquerdo:
		
		addi $10 $0 16
		loopHU:
		beq $10 $0 sairloopHU
		sw $9 0($8)
		addi $8 $8 4
		addi $10 $10 -1
		j loopHU
		
	sairloopHU:
		addi $10 $0 16
		loopVU:
		beq $10 $0 sairloopVU
		sw $9 0($8)
		addi $8 $8 -512
		addi $10 $10 -1
		j loopVU
		
	sairloopVU:
	# começo win
		lw $8 8($25)
		addi $8 $8 16384
		addi $10 $0 8
		loopEsqW:
		beq $10 $0 sairloopEsqW
		sw $9 0($8)
		addi $8 $8 516
		addi $10 $10 -1
		j loopEsqW
		
	sairloopEsqW:
		addi $10 $0 8
		loop2W:
		beq $10 $0 sairloop2W
		sw $9 0($8)
		addi $8 $8 -508
		addi $10 $10 -1
		j loop2W
		
	sairloop2W:
		addi $10 $0 9
		loop3W:
		beq $10 $0 sairloop3W
		sw $9 0($8)
		addi $8 $8 516
		addi $10 $10 -1
		j loop3W
		
	sairloop3W:
		addi $10 $0 8
		loop4W:
		beq $10 $0 sairloop4W
		sw $9 0($8)
		addi $8 $8 -508
		addi $10 $10 -1
		j loop4W
		
	sairloop4W:
		addi $8 $8 32
		addi $10 $0 16
		loopI:
		beq $10 $0 sairloopI
		sw $9 0($8)
		addi $8 $8 512
		addi $10 $10 -1
		j loopI
		
	sairloopI:
		addi $8 $8 32
		addi $10 $0 16
		loopVN1:
		beq $10 $0 sairloopVN1
		sw $9 0($8)
		addi $8 $8 -512
		addi $10 $10 -1
		j loopVN1
		
	sairloopVN1:
		addi $10 $0 16
		loopVN2:
		beq $10 $0 sairloopVN2
		sw $9 0($8)
		addi $8 $8 516
		addi $10 $10 -1
		j loopVN2
		
	sairloopVN2:
		addi $10 $0 16
		loopVN3:
		beq $10 $0 sairloopVN3
		sw $9 0($8)
		addi $8 $8 -512
		addi $10 $10 -1
		j loopVN3
	
	sairloopVN3:
		
