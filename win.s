	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"win.c"
	.text
	.align	2
	.global	updateWin
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateWin, %function
updateWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L11
	ldr	r3, .L11+4
	ldr	r2, [r4]
	smull	r0, r1, r3, r2
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #3
	ldr	r6, .L11+8
	add	r3, r3, r3, lsl #2
	ldr	r1, .L11+12
	ldr	r7, .L11+16
	ldr	r5, .L11+20
	cmp	r2, r3, lsl #2
	ldr	r3, [r6]
	sub	sp, sp, #12
	ldr	ip, [r1]
	ldr	r0, [r7]
	str	r3, [sp, #4]
	ldr	lr, [r5]
	bne	.L2
	cmp	ip, #55
	addle	ip, ip, #1
	strle	ip, [r1]
	cmp	ip, #56
	beq	.L8
	cmp	r0, #76
	beq	.L9
.L5:
	ldr	r3, [sp, #4]
	cmp	r3, #56
	beq	.L10
.L2:
	ldr	r3, .L11+24
	ldr	r2, .L11+28
	ldr	r10, [r3]
	smull	r1, r3, r2, r10
	ldr	r1, .L11+32
	mov	r6, r1
	mov	r5, r1
	mov	r8, r1
	asr	r2, r10, #31
	rsb	r2, r2, r3, asr #6
	rsb	r3, r2, r2, lsl #5
	add	r3, r2, r3, lsl #2
	sub	r3, r10, r3, lsl #3
	ldr	r10, .L11+36
	smull	fp, r10, r3, r10
	asr	r3, r3, #31
	rsb	r3, r3, r10, asr #5
	and	r0, r0, #255
	add	r3, r3, #512
	strh	r0, [r6, #136]!	@ movhi
	strh	r0, [r5, #144]!	@ movhi
	strh	r3, [r1, #148]	@ movhi
	orr	fp, r0, #16384
	ldr	r3, .L11+40
	ldr	r0, .L11+44
	add	r2, r2, #512
	strh	r2, [r1, #140]	@ movhi
	strh	r0, [r1]	@ movhi
	ldr	r2, .L11+48
	ldr	r0, [sp, #4]
	ldr	r3, [r3]
	and	r0, r0, r2
	and	ip, ip, r2
	add	r3, r3, #66
	ldr	r2, .L11+52
	lsl	r3, r3, #2
	mov	r9, r1
	mov	r7, r1
	strh	r2, [r8, #128]!	@ movhi
	strh	r3, [r1, #12]	@ movhi
	ldr	r2, .L11+56
	ldr	r3, .L11+60
	orr	r0, r0, #16384
	orr	ip, ip, #16384
	strh	r0, [r1, #2]	@ movhi
	strh	ip, [r8, #2]	@ movhi
	strh	r2, [r1, #4]	@ movhi
	mov	ip, #92	@ movhi
	strh	r3, [r1, #132]	@ movhi
	mov	r2, #524	@ movhi
	mov	r3, #100	@ movhi
	mov	r0, #84	@ movhi
	and	lr, lr, #255
	strh	lr, [r9, #8]!	@ movhi
	strh	fp, [r7, #152]!	@ movhi
	ldr	lr, .L11+64
	strh	r2, [r1, #156]	@ movhi
	strh	r3, [r7, #2]	@ movhi
	strh	r0, [r6, #2]	@ movhi
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	strh	lr, [r9, #2]	@ movhi
	ldr	r6, .L11+68
	strh	ip, [r5, #2]	@ movhi
	sub	r1, r1, #304
	mov	lr, pc
	bx	r6
	ldr	r3, [r4]
	add	r3, r3, #1
	str	r3, [r4]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L10:
	cmp	lr, #87
	addle	lr, lr, #1
	strle	lr, [r5]
	b	.L2
.L8:
	cmp	r0, #75
	addle	r0, r0, #1
	strle	r0, [r7]
	cmp	r0, #76
	bne	.L5
.L9:
	ldr	r3, [sp, #4]
	cmp	r3, #55
	addle	r3, r3, #1
	strle	r3, [sp, #4]
	strle	r3, [r6]
	ldr	r3, [sp, #4]
	cmp	r3, #56
	bne	.L2
	b	.L10
.L12:
	.align	2
.L11:
	.word	aniTimer
	.word	1717986919
	.word	rankCol
	.word	scoreCol
	.word	scoreRow
	.word	medalRow
	.word	score
	.word	274877907
	.word	shadowOAM+304
	.word	1374389535
	.word	rank
	.word	16484
	.word	511
	.word	16460
	.word	498
	.word	438
	.word	-32680
	.word	DMANow
	.size	updateWin, .-updateWin
	.align	2
	.global	calculateRank
	.syntax unified
	.arm
	.fpu softvfp
	.type	calculateRank, %function
calculateRank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mvn	r1, #31
	mvn	r3, #7
	str	lr, [sp, #-4]!
	mov	lr, #0
	ldr	r0, .L19
	ldr	ip, .L19+4
	ldr	r2, [r0, #8]
	ldr	ip, [ip, #48]
	cmp	r2, ip
	ldr	ip, .L19+8
	str	r1, [ip]
	ldr	ip, .L19+12
	str	r1, [ip]
	ldr	r1, .L19+16
	ldr	ip, .L19+20
	str	r3, [r1]
	ldr	r1, .L19+24
	str	r3, [ip]
	addeq	r2, r2, #1
	ldr	r3, [r1]
	streq	r2, [r0, #8]
	ldr	r2, .L19+28
	addeq	r3, r3, #500
	ldr	ip, .L19+32
	streq	r3, [r1]
	cmp	r3, r2
	str	lr, [ip]
	ble	.L15
	mov	r2, #0
	ldr	r3, .L19+36
	ldr	lr, [sp], #4
	str	r2, [r3]
	bx	lr
.L15:
	cmp	r3, #900
	movge	r2, #1
	movlt	r2, #2
	ldr	r3, .L19+36
	ldr	lr, [sp], #4
	str	r2, [r3]
	bx	lr
.L20:
	.align	2
.L19:
	.word	cursor
	.word	ghost
	.word	rankCol
	.word	medalRow
	.word	scoreRow
	.word	scoreCol
	.word	score
	.word	1299
	.word	aniTimer
	.word	rank
	.size	calculateRank, .-calculateRank
	.comm	emptyTile,4,4
	.comm	checkTile,4,4
	.comm	orbRow,4,4
	.comm	orbCol,4,4
	.comm	ghostBanished,4,4
	.comm	itemsCollected,4,4
	.comm	occurrencesCaught,4,4
	.comm	score,4,4
	.comm	orbTimer,4,4
	.comm	seconds,4,4
	.comm	sanity,4,4
	.comm	sanityTimer,4,4
	.comm	hOff,4,4
	.comm	vOff,4,4
	.comm	path,4,4
	.comm	aniTimer,4,4
	.comm	scoreCol,4,4
	.comm	scoreRow,4,4
	.comm	medalRow,4,4
	.comm	rankCol,4,4
	.comm	rank,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
