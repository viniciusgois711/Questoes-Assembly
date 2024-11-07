.text
main: addi $2 $0 5
      syscall
      add $8 $0 $2
      addi $9 $0 10
      
      div $8 $9
      mfhi $10 # primeiro
      mflo $8
      div $8 $9
      mfhi $11 #segundo
      mflo $8
      div $8 $9
      mfhi $12 # terceiro
      mflo $8
      div $8 $9
      mfhi $13 # quarto
      mflo $8
      div $8 $9
      mfhi $14 # quinto
      mflo $8
      div $8 $9
      mfhi $15 # sexto
      mflo $8
      div $8 $9
      mfhi $16 # setimo
      mflo $8 #oitavo
      
      bne $10 $0 und

vseg:bne $11 $0 seg
vter:bne $12 $0 ter
vqua:bne $13 $0 qua
vqui:bne $14 $0 qui
vsex:bne $15 $0 sex
vset:bne $16 $0 set
voit:bne $8 $0 oit

     j fim

und:addi $20 $20 1
    j vseg
seg:addi $20 $20 2
    j vter
ter:addi $20 $20 4
    j vqua
qua:addi $20 $20 8
    j vqui

qui:addi $20 $20 16
    j vsex

sex:addi $20 $20 32
    j vset

set:addi $20 $20 64
    j voit

oit:addi $20 $20 128

fim: addi $4 $20 0
     addi $2 $0 1
     syscall
     
     addi $2 $0 10
     syscall
     
     