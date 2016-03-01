# Calculate sums of positive odd and negative even values in an array
#   in MIPS assembly using MARS
# for MYΥ-402 - Computer Architecture
# Department of Computer Engineering, University of Ioannina
# Aris Efthymiou

        .globl main # declare the label main as global. 
        
        .text 
     
main:
        la         $a0, length       # get address of length to $a0
        lw         $a0, 0($a0)       # get the length in to $a0

        la         $a1, input        # get address of array to $a1

        addiu      $s0, $zero, 0     # sum of positive odd values starts as 0
        addiu      $s1, $zero, 0     # sum of negative even values starts as 0

loop:
	addiu	$t4,$t4,1
	sll	$t1, $t4 ,2		
	add	$t1,$t1,$a1
	lw	$t0,0($t1)
	bne	$t4, $a0 exit
	andi	$t3,$t0,0x1		
	beq	$t3,$zero pos
arn:
	slt	$t2,$t0,$zero
	beq	$t2,$zero loop
	add	$s1,$s1,$t0
	j loop
pos:
	slt	$t2,$t0,$zero
	bne	$t2,$zero loop
	add	$s0,$s0,$t0
	j loop
        
exit: 
        addiu      $v0, $zero, 10    # system service 10 is exit
        syscall                      # we are outta here.
        
        ###############################################################################
        # Data input.
        ###############################################################################
        .data
length: .word 5 # Number of values in the input array
input:  .word 3, -2, 0, 4, -1
