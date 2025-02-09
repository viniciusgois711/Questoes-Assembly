.text
main:
	lui $8 0x1001
	li $9 0xFF5733
	
	addi $8 $8 20544
	
	addi $10 $0 15
	
	loopVerticalG:
	beq $10 $0 sairLoopVerticalG
	sw $9 0($8)
	addi $8 $8 512
	addi $10 $10 -1
	j loopVerticalG
	
	sairLoopVerticalG:
		addi $10 $0 15
		loopHorizontalGBaixo:
			beq $10 $0 sairLoopHorizontalGBaixo
			sw $9 0($8)
			addi $8 $8 4
			addi $10 $10 -1
			j loopHorizontalGBaixo
	
	sairLoopHorizontalGBaixo:
		
	 	addi $10 $0 6
		loopVerticalGBaixo:
			beq $10 $0 sairLoopVerticalGBaixo
			sw $9 0($8)
			addi $8 $8 -512
			addi $10 $10 -1
			j loopVerticalGBaixo
	
	
	sairLoopVerticalGBaixo:
	
	 	addi $10 $0 6
		loophorizontalGMeio:
			beq $10 $0 sairLoopHorizontalGMeio
			sw $9 0($8)
			addi $8 $8 -4
			addi $10 $10 -1
			j loophorizontalGMeio		
	
	
	sairLoopHorizontalGMeio:
		lui $8 0x1001
		addi $8 $8 20544
		addi $10 $0 15
		loopHorizontalGCima:
			beq $10 $0 sairLoopHorizontalGCima
			sw $9 0($8)
			addi $8 $8 4
			addi $10 $10 -1
			j loopHorizontalGCima
			
	sairLoopHorizontalGCima:
		lui $8 0x1001
		addi $8 $8 20640
		addi $10 $0 16
		loopVerticalA:
			beq $10 $0 sairLoopVerticalA
	 		sw $9 0($8)
	 		addi $8 $8 512
	 		addi $10 $10 -1
	 		j loopVerticalA
		
		
	sairLoopVerticalA:
		lui $8 0x1001
		addi $8 $8 20640
		addi $10 $0 15
		loopHorizontalACima:
			beq $10 $0 sairLoopHorizontalACima
	 		sw $9 0($8)
	 		addi $8 $8 4
	 		addi $10 $10 -1
	 		j loopHorizontalACima
		
	sairLoopHorizontalACima:
		addi $11 $8 0
		addi $10 $0 16
		loopVerticalADireita:
			beq $10 $0 sairLoopVerticalADireita
	 		sw $9 0($8)
	 		addi $8 $8 512
	 		addi $10 $10 -1
	 		j loopVerticalADireita
	 		
	sairLoopVerticalADireita:
		
		lui $8 0x1001
		addi $8 $8 24736
		addi $10 $0 16
		loopHorizontalAmeio:
			beq $10 $0 sairLoopHorizontalAMeio
	 		sw $9 0($8)
	 		addi $8 $8 4
	 		addi $10 $10 -1
	 		j loopHorizontalAmeio
	 		
	 sairLoopHorizontalAMeio:
	 	lui $8 0x1001
		addi $8 $11 32 
		addi $10 $0 16
		loopVerticalM:
			beq $10 $0 sairloopVerticalM
	 		sw $9 0($8)
	 		addi $8 $8 512
	 		addi $10 $10 -1
	 		j loopVerticalM
	 		
	 sairloopVerticalM:
	 	lui $8 0x1001
		addi $8 $11 32 
		addi $10 $0 16
		loopHorizontalM:
			beq $10 $0 sairloopHorizontalM
	 		sw $9 0($8)
	 		addi $8 $8 4
	 		addi $10 $10 -1
	 		j loopHorizontalM
	 		
	 sairloopHorizontalM:
	 	addi $12 $8 0
		addi $10 $0 16
		loopVerticalMDireita:
			beq $10 $0 sairloopVerticalMDireita
	 		sw $9 0($8)
	 		addi $8 $8 512
	 		addi $10 $10 -1
	 		j loopVerticalMDireita
	 		
	 sairloopVerticalMDireita:
	 	
	 	lui $8 0x1001
		addi $8 $11 64 
		addi $10 $0 16
		loopVerticalMMeio:
			beq $10 $0 sairloopVerticalMMeio
	 		sw $9 0($8)
	 		addi $8 $8 512
	 		addi $10 $10 -1
	 		j loopVerticalMMeio
	 		
	 sairloopVerticalMMeio:
		addi $8 $12 32 
		addi $10 $0 16
		loopVerticalE:
			beq $10 $0 sairloopVerticalE
	 		sw $9 0($8)
	 		addi $8 $8 512
	 		addi $10 $10 -1
	 		j loopVerticalE
	 		
	 sairloopVerticalE: