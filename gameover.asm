.text
main:
	lui $8 0x1001
	li $9 0xFF5733
	
	addi $8 $8 20544
	
	lui $25 0x1002
	sw $8 0($25)
	
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
	 	addi $13 $8 0
		addi $8 $12 32 
		addi $10 $0 16
		loopHorirzontalECima:
			beq $10 $0 sairloopHorirzontalECima
	 		sw $9 0($8)
	 		addi $8 $8 4
	 		addi $10 $10 -1
	 		j loopHorirzontalECima
	
	sairloopHorirzontalECima:
		addi $8 $12 4128
		addi $10 $0 16
		loopHorirzontalEMeio:
			beq $10 $0 sairloopHorirzontalEMeio
	 		sw $9 0($8)
	 		addi $8 $8 4
	 		addi $10 $10 -1
	 		j loopHorirzontalEMeio
	 		
	 sairloopHorirzontalEMeio:
		addi $8 $13 0
		addi $10 $0 16
		loopHorirzontalEBaixo:
			beq $10 $0 sairloopHorirzontalEBaixo
	 		sw $9 0($8)
	 		addi $8 $8 4
	 		addi $10 $10 -1
	 		j loopHorirzontalEBaixo
	 		
	 sairloopHorirzontalEBaixo:
	 
	# comeã Over
		lw $8 0($25)
		addi $8 $8 12288
		sw $8 4($25)
		addi $10 $0 16
		loopVerticalOEsquerdo:
			beq $10 $0 sairloopVerticalOEsquerdo
	 		sw $9 0($8)
	 		addi $8 $8 512
	 		addi $10 $10 -1
	 		j loopVerticalOEsquerdo	
	 
	 sairloopVerticalOEsquerdo:
		addi $10 $0 16
		loopHorirzontalOCima:
			beq $10 $0 sairloopHorirzontalOCima
	 		sw $9 0($8)
	 		addi $8 $8 4
	 		addi $10 $10 -1
	 		j loopHorirzontalOCima		 
	 	
	 sairloopHorirzontalOCima:
		addi $10 $0 16
		loopHorirzontalOBaixo:
			beq $10 $0 sairloopHorirzontalOBaixo
	 		sw $9 0($8)
	 		addi $8 $8 -512
	 		addi $10 $10 -1
	 		j loopHorirzontalOBaixo		 
	 	
	 sairloopHorirzontalOBaixo:
		addi $10 $0 16
		loopHorizontalOCima:
			beq $10 $0 sairloopHorizontalOCima
	 		sw $9 0($8)
	 		addi $8 $8 -4
	 		addi $10 $10 -1
	 		j loopHorizontalOCima
	 		
	 sairloopHorizontalOCima:
	 	lw $8 4($25)
	 	addi $8 $8 96
		addi $10 $0 16
		loopVerticalVCima:
			beq $10 $0 sairloopVerticalVCima
	 		sw $9 0($8)
	 		addi $8 $8 512
	 		addi $10 $10 -1
	 		j loopVerticalVCima
	 		
	 sairloopVerticalVCima:
	 	 
		addi $10 $0 16
		loopVerticalVDireita:
			beq $10 $0 sairloopVerticalVDireita
	 		sw $9 0($8)
	 		addi $8 $8 -508
	 		addi $10 $10 -1
	 		j loopVerticalVDireita
	 		
	 sairloopVerticalVDireita:

	 	addi $8 $8 28
		addi $10 $0 16
		loopVerticalEOver:
			beq $10 $0 sairloopVerticalEOver
	 		sw $9 0($8)
	 		addi $8 $8 512
	 		addi $10 $10 -1
	 		j loopVerticalEOver
	 		
	 sairloopVerticalEOver:
	 	sw $8 8($25)
		addi $10 $0 16
		loopHorizontalEOverBaixo:
			beq $10 $0 sairloopHorizontalEOverBaixo
	 		sw $9 0($8)
	 		addi $8 $8 4
	 		addi $10 $10 -1
	 		j loopHorizontalEOverBaixo
	 		
	 sairloopHorizontalEOverBaixo:
	 	lw $8 8($25)
	 	addi $8 $8 -4096
		addi $10 $0 16
		loopHorizontalEOverMeio:
			beq $10 $0 sairloopHorizontalEOverMeio
	 		sw $9 0($8)
	 		addi $8 $8 4
	 		addi $10 $10 -1
	 		j loopHorizontalEOverMeio
	 		
	 sairloopHorizontalEOverMeio:
	 	lw $8 8($25)
	 	addi $8 $8 -8192
		addi $10 $0 16
		loopHorizontalEOverCima:
			beq $10 $0 sairloopHorizontalEOverCima
	 		sw $9 0($8)
	 		addi $8 $8 4
	 		addi $10 $10 -1
	 		j loopHorizontalEOverCima
	 		
	 sairloopHorizontalEOverCima:
	 	
	 	addi $8 $8 32
		sw $8 12($25)
		addi $10 $0 18
		loopVerticalROver:
			beq $10 $0 sairloopVerticalROver
	 		sw $9 0($8)
	 		addi $8 $8 512
	 		addi $10 $10 -1
	 		j loopVerticalROver
	 		
	 sairloopVerticalROver:
	 	
		lw $8 12($25)
		addi $10 $0 10
		loopHorizontalROver:
			beq $10 $0 sairloopHorizontalROver
	 		sw $9 0($8)
	 		addi $8 $8 4
	 		addi $10 $10 -1
	 		j loopHorizontalROver
	 		
	 sairloopHorizontalROver:
		addi $10 $0 8
		loopVerticalROverDireita:
			beq $10 $0 sairloopVerticalROverDireita
	 		sw $9 0($8)
	 		addi $8 $8 512
	 		addi $10 $10 -1
	 		j loopVerticalROverDireita
	 		
	 sairloopVerticalROverDireita:
		addi $10 $0 10
		loopHorizontalROverVolta:
			beq $10 $0 sairloopHorizontalROverVolta
	 		sw $9 0($8)
	 		addi $8 $8 -4
	 		addi $10 $10 -1
	 		j loopHorizontalROverVolta
	 			 
	 sairloopHorizontalROverVolta:
		addi $10 $0 10
		loopTortoROver:
			beq $10 $0 sairloopTortoROver
	 		sw $9 0($8)
	 		addi $8 $8 516
	 		addi $10 $10 -1
	 		j loopTortoROver
	 		
	 sairloopTortoROver: