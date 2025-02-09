.text
main:
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
