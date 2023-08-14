.text
null_cipher_sf:

li $t4, 0 #counter for plaintext2
li $t9,0
move $t0,$a0 #s0
indices_loop:
beq $t4,$a3,null_cipher_end
lw $t2,0($a2) #first index in the array
j cipherText

cipherText:
li $t5,0
beq $t5,$t2,skip
addi $t5,$t5,1
reloop:
beq $t5,$t2,when_equal
addi $t5,$t5,1
addi $a1,$a1,1
j reloop
inner_loop:j skip

skip:
addi  $t8,$a3,-1
beq $t4,$t8,null_cipher_end
li $t6,32
lb $t7,0($a1)
bne $t7,$t6,loop

loop: addi $a1,$a1,1
lb $t7,0($a1)
bne $t7,$t6,loop

addi $a1,$a1,1
addi $a2,$a2,4
addi $t4,$t4,1
j indices_loop

when_equal:
addi $t9,$t9,1
lb $t1,0($a1)
sb $t1,0($a0)
addi $a0,$a0,1
j inner_loop

null_cipher_end : 
li $t1,'\0'
sb $t1,0($a0)
move $a0,$t0
move $v0,$t9
jr $ra

transposition_cipher_sf:

move $t2,$a2
move $t3,$a3

move $t0, $a0
move $t1, $a1

li $t4,0 #column counter
li $t5,0 #row counter
li $t6,0 #total counter
li $t7,0 #compute
li $t8,42
li $t9,0


cipher_loop:
lb $t9,0($t1)
beq $t9,$t8,looping_counter
sb $t9,0($t0)
addi $t0,$t0,1
looping_counter:
addi $t4,$t4,1
addi $t6,$t6,1
beq $t4,$t3, cipher_changes
add $t7,$t1,$t2
add $t2,$t2,$a2
lb $t9,0($t7)
beq $t9,$t8,looping_counter
sb $t9,0($t0)
addi $t0,$t0,1
j looping_counter

cipher_changes:
move $t2,$a2
mul $t9, $t2, $t3
beq $t9,$t6,cipher_end
addi $t1,$t1,1
li $t4,0 
li $t5,0 
j cipher_loop

cipher_end:li $t9,'\0'
sb $t9, 0($t0)
jr $ra

decrypt_sf:
addi $sp,$sp,-4
sw $ra, 0($sp)
addi $sp,$sp,-4
sw $s0,0($sp)

move $s0,$a0

li $t0,0
mul $t0,$a2,$a3
neg $t0,$t0

add $sp,$sp,$t0

move $a0,$sp

jal transposition_cipher_sf

li $t0,0
mul $t0,$a2,$a3

add $sp,$sp,$t0

move $a1,$a0
move $a0,$s0

lw $a2, 12($sp)
lw $a3, 8($sp)

jal null_cipher_sf 

lw $s0,0($sp)

lw $ra, 4($sp)
addi $sp,$sp,8

jr $ra

