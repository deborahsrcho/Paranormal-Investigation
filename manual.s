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
	.file	"manual.c"
	.text
	.align	2
	.global	initCursor
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initCursor, %function
initCursor:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	ldr	r3, .L3
	str	r2, [r3, #4]
	str	r2, [r3]
	str	r2, [r3, #8]
	bx	lr
.L4:
	.align	2
.L3:
	.word	cursor
	.size	initCursor, .-initCursor
	.align	2
	.global	drawManual
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawManual, %function
drawManual:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #512
	ldr	r4, .L7
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L7+4
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L8:
	.align	2
.L7:
	.word	DMANow
	.word	shadowOAM
	.size	drawManual, .-drawManual
	.align	2
	.global	updateCursor
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCursor, %function
updateCursor:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L40
	ldrh	r1, [r3]
	ldr	r3, .L40+4
	tst	r1, #32
	ldr	r2, [r3, #8]
	beq	.L10
	ldr	r0, .L40+8
	ldrh	r0, [r0]
	tst	r0, #32
	subeq	r2, r2, #1
	streq	r2, [r3, #8]
.L10:
	tst	r1, #16
	beq	.L11
	ldr	r1, .L40+8
	ldrh	r1, [r1]
	tst	r1, #16
	addeq	r2, r2, #1
	streq	r2, [r3, #8]
.L11:
	cmp	r2, #5
	ble	.L12
	mov	r0, #2
	mov	r1, #1
	mov	r2, #0
	stm	r3, {r0, r1, r2}
.L21:
	ldm	r3, {r1, r2}
	lsl	r1, r1, #3
	lsl	r2, r2, #3
	and	r1, r1, #248
	and	r2, r2, #504
.L24:
	ldr	r3, .L40+12
	ldr	r0, .L40+16
	strh	r1, [r3, #136]	@ movhi
	strh	r2, [r3, #138]	@ movhi
	strh	r0, [r3, #140]	@ movhi
	bx	lr
.L12:
	cmp	r2, #0
	bge	.L14
	mov	r2, #5
	str	r2, [r3, #8]
.L15:
	mov	ip, #17
	mov	r0, #14
	mov	r2, #136
	mov	r1, #112
	stm	r3, {r0, ip}
	b	.L24
.L14:
	beq	.L36
	cmp	r2, #1
	bne	.L37
	mov	r1, #8
	stm	r3, {r1, r2}
	b	.L21
.L36:
	mov	r0, #2
	mov	r1, #1
	stm	r3, {r0, r1}
.L17:
	cmp	r2, #4
	bne	.L38
	mov	r1, #8
	mov	r2, #17
	stm	r3, {r1, r2}
	mov	r2, #136
	mov	r1, #64
	b	.L24
.L37:
	cmp	r2, #2
	bne	.L39
	mov	r1, #14
	mov	r2, #1
	stm	r3, {r1, r2}
	b	.L21
.L38:
	cmp	r2, #5
	bne	.L21
	b	.L15
.L39:
	cmp	r2, #3
	bne	.L17
	mov	r1, #2
	mov	r2, #17
	stm	r3, {r1, r2}
	mov	r2, #136
	mov	r1, #16
	b	.L24
.L41:
	.align	2
.L40:
	.word	oldButtons
	.word	cursor
	.word	buttons
	.word	shadowOAM
	.word	262
	.size	updateCursor, .-updateCursor
	.comm	cursor,12,4
	.comm	score,4,4
	.comm	buttonTimer,4,4
	.comm	seconds,4,4
	.comm	sanity,4,4
	.comm	sanityTimer,4,4
	.comm	hOff,4,4
	.comm	vOff,4,4
	.comm	path,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
