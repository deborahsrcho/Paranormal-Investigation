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
	mov	r1, #4
	mov	r0, #3
	ldr	r2, .L3
	ldr	r3, .L3+4
	str	r1, [r2]
	add	r1, r3, #260
	ldrh	ip, [r1, #2]
	ldr	r1, .L3+8
	add	r3, r3, #580
	str	ip, [r1]
	ldrh	r1, [r3, #2]
	ldr	r3, .L3+12
	str	r0, [r2, #4]
	str	r1, [r3]
	bx	lr
.L4:
	.align	2
.L3:
	.word	cursor
	.word	100704256
	.word	checkTile
	.word	emptyTile
	.size	initCursor, .-initCursor
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
	ldr	r3, .L26
	ldrh	r1, [r3]
	ldr	r3, .L26+4
	tst	r1, #32
	str	lr, [sp, #-4]!
	ldr	r2, [r3, #8]
	beq	.L6
	ldr	r0, .L26+8
	ldrh	r0, [r0]
	tst	r0, #32
	subeq	r2, r2, #1
	streq	r2, [r3, #8]
.L6:
	tst	r1, #16
	beq	.L7
	ldr	r1, .L26+8
	ldrh	r1, [r1]
	tst	r1, #16
	addeq	r2, r2, #1
	streq	r2, [r3, #8]
.L7:
	cmp	r2, #5
	movgt	r2, #0
	strgt	r2, [r3, #8]
	bgt	.L9
	cmp	r2, #0
	bge	.L10
	mov	r1, #5
	ldr	r2, .L26+12
	ldr	ip, .L26+16
	ldrh	r2, [r2]
	ldr	r0, .L26+20
	ldr	lr, .L26+24
	strh	r2, [ip, #2]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	strh	r2, [lr, #2]	@ movhi
	strh	r2, [ip, #28]	@ movhi
	strh	r2, [r0, #28]	@ movhi
	str	r1, [r3, #8]
.L11:
	mov	ip, #14
	mov	r0, #16
	ldr	r1, .L26+28
	ldr	r2, .L26+32
	ldr	r1, [r1]
	str	ip, [r3]
	str	r0, [r3, #4]
	ldr	lr, [sp], #4
	strh	r1, [r2]	@ movhi
	bx	lr
.L10:
	bne	.L12
.L9:
	mov	r1, #4
	mov	r0, #3
	ldr	ip, .L26+28
	str	r1, [r3]
	ldr	r1, .L26+12
	ldr	r2, .L26+16
	ldr	ip, [ip]
	ldrh	r1, [r1]
	strh	ip, [r2, #2]	@ movhi
	add	r2, r2, #320
	str	r0, [r3, #4]
	strh	r1, [r2, #2]	@ movhi
	mov	r2, #0
.L13:
	ldr	r0, .L26+24
	cmp	r2, #3
	strh	r1, [r0, #2]	@ movhi
	bne	.L16
	mov	r2, #4
	mov	r0, #16
	ldr	ip, .L26+28
	str	r2, [r3]
	ldr	lr, [ip]
	ldr	r2, .L26+36
	ldr	ip, .L26+40
	strh	lr, [ip]	@ movhi
	str	r0, [r3, #4]
	strh	r1, [r2]	@ movhi
.L15:
	ldr	r3, .L26+32
	ldr	lr, [sp], #4
	strh	r1, [r3]	@ movhi
	bx	lr
.L12:
	ldr	r1, .L26+12
	ldr	r0, .L26+16
	ldrh	r1, [r1]
	cmp	r2, #1
	strh	r1, [r0, #2]	@ movhi
	bne	.L14
	mov	ip, #9
	mov	lr, #3
	ldr	r2, .L26+28
	ldr	r0, [r2]
	ldr	r2, .L26+20
	str	ip, [r3]
	strh	r0, [r2, #2]	@ movhi
	ldr	ip, .L26+24
	ldr	r0, .L26+40
	str	lr, [r3, #4]
	strh	r1, [ip, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r1, [r2, #28]	@ movhi
	b	.L15
.L14:
	ldr	r0, .L26+20
	cmp	r2, #2
	strh	r1, [r0, #2]	@ movhi
	bne	.L13
	mov	r0, #14
	mov	ip, #3
	ldr	r2, .L26+28
	ldr	lr, [r2]
	ldr	r2, .L26+24
	str	r0, [r3]
	ldr	r0, .L26+40
	strh	lr, [r2, #2]	@ movhi
	sub	r2, r2, #292
	str	ip, [r3, #4]
	strh	r1, [r0]	@ movhi
	strh	r1, [r2]	@ movhi
	b	.L15
.L16:
	ldr	r0, .L26+40
	cmp	r2, #4
	strh	r1, [r0]	@ movhi
	bne	.L17
	mov	lr, #9
	mov	ip, #16
	ldr	r2, .L26+28
	ldr	r0, [r2]
	ldr	r2, .L26+36
	str	lr, [r3]
	str	ip, [r3, #4]
	strh	r0, [r2]	@ movhi
	b	.L15
.L17:
	ldr	r0, .L26+36
	cmp	r2, #5
	strh	r1, [r0]	@ movhi
	beq	.L11
	b	.L15
.L27:
	.align	2
.L26:
	.word	oldButtons
	.word	cursor
	.word	buttons
	.word	emptyTile
	.word	100704516
	.word	100704836
	.word	100705156
	.word	checkTile
	.word	100705184
	.word	100704864
	.word	100704544
	.size	updateCursor, .-updateCursor
	.comm	cursor,12,4
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
	.ident	"GCC: (devkitARM release 53) 9.1.0"
