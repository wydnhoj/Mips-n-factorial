# Laboratory 6-2	 		Laboratory6-2_Ferrancullo.asm
# Author: John Ross F. Ferrancullo	11/30/2021
# Description: Program that computes the factorial of a number n input 
#	       by the user, and display the result on the screen.
# 	Input: Input integer
#	Ouput: Display the facotrial of the integer
################################## Data segment #######################################
.data
	n:	.asciiz		"Enter number: "
	result: .asciiz		"Result of Factorial: "
	i:	.word 0
	fact: 	.word 0
################################## Code segment #######################################
.text
.globl main

main:
	#$t3 - index
	#$t1 - result of factorial
	#$t0 - user input
	
	
	la $a0, n		#load address of n prompt
	li $v0, 4		#display n prompt
	syscall
	
	li $v0, 5		#read user input
	syscall
	move $t0, $v0		#move data inputted to $t0
	
	la $t3, i		#load address of i to $t3
	li $t3, 1		#set index($t3) to 1
	
	la $t1, fact		#load address of fact to $t1
	li $t1, 1		#set $t1 to 1
	
loop:
	bgt $t3, $t0, display	#if index($t3) > user input($t0) branch to display
	mul $t1, $t1, $t3	#result($t1) = result($t1) * index($t3)
	addi $t3, $t3, 1	#increment index($t3)
	j loop
	
display:
	la $a0, result		#load address of result prompt
	li $v0, 4		#print result prompt
	syscall
	
	la $a0, ($t1)		#load address of result($t1) to $a0
	li $v0, 1		#print integer
	syscall
	
	li $v0, 10		#exit
	syscall	
