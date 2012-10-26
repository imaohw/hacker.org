addiu $4,$0,84
addiu $2,$0,11
syscall
addiu $8,$0,100
addiu $9,$0,4
add $4,$8,$9
syscall
addiu $10,$0,65533
add $4,$8,$10
syscall
addiu $11,$0,5
addiu $12,$0,11
mul $13,$11,$12
sll $4,$13,1
syscall
addiu $4,$0,107
syscall
addiu $4,$0,2
sll $4,$4,4
syscall
addiu $4,$0,121
syscall
sll $4,$13,1
addiu $5,$0,1
add $4,$4,$5
syscall
addiu $5,$0,6
add $4,$4,$5
syscall
addiu $4,$0,32
syscall
addiu $13,$0,70
add $4,$4,$13
syscall
addiu $8,$0,9
add $4,$4,$8
syscall
addiu $8,$0,57
sll $4,$8,1
syscall
addiu $13,$0,2
addiu $14,$0,4
sllv $4,$13,$14
syscall
addiu $4,$0,115
syscall
addiu $12,$0,222
sra $4,$12, 1
syscall
addiu $12,$0,3
addiu $11,$0,0
sub $11,$11,$12
add $4,$4,$11
syscall
addiu $4,$0,118
syscall
addiu $8,$0,10
mul $8,$8,$8
addiu $9,$0,5
add $4,$8,$9
syscall
add $4,$4,$9
syscall
addiu $9,$0,65529
add $4,$4,$9
syscall
addiu $4,$0,33
syscall
addiu $9,$0,65535
add $4,$4,$9
syscall
addiu $9,$0,9
mul $9,$9,$9
addiu $10,$0,3
add $4,$9,$10
syscall
addiu $8,$0,65504
add $4,$4,$8
sll $4,$4,1
syscall
addiu $8,$0,65533
add $4,$4,$8
syscall
addiu $4,$0,32
syscall
addiu $12,$0,10
mul $11,$12,$12
add $4,$11,$8
syscall
addiu $13,$0,11
mul $4,$12,$13
syscall
addiu $13,$0,5
add $4,$4,$13
syscall
add $4,$4,$13
addiu $10,$0,65535
add $4,$4,$10
syscall
addiu $4,$0,101
syscall
addiu $9,$0,13
add $4,$4,$9
syscall
addiu $8,$0,32
addu $4,$0,$8
syscall
addiu $4,$0,105
syscall
addiu $8,$0,10
add $4,$8,$4
syscall
addiu $12,$0,2
sll $4,$12,4
syscall
mul $12,$8,$8
addiu $8,$0,12
add $8,$12,$8
addu $4,$0,$8
syscall
addiu $9,$0,65529
add $4,$4,$9
syscall
addu $4,$0,$8
syscall
addiu $9,$0,10
nop
nop
div $4,$9
mflo $9
addiu $10,$0,65535
mul $10,$10,$9
add $4,$4,$10
syscall
addiu $15,$0,7
add $4,$15,$4
syscall
addiu $8,$0,65533
add $4,$4,$8
syscall
addiu $15,$0,2
nop
nop
div $4,$15
mflo $8
addiu $9,$0,10
nop
nop
div $8,$9
mflo $8
add $4,$4,$8
syscall
addiu $4,$0,101
syscall
nop
nop
div $4,$9
mflo $4
addiu $8,$0,3
mul $4,$4,$8
add $4,$4,$8
syscall
