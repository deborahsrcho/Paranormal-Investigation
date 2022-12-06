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
	.file	"instructions.c"
	.text
	.align	2
	.global	initInstructions
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initInstructions, %function
initInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	ldr	r3, .L3
	str	r2, [r3]
	bx	lr
.L4:
	.align	2
.L3:
	.word	page
	.size	initInstructions, .-initInstructions
	.align	2
	.global	updatePage
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePage, %function
updatePage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L22
	ldrh	r1, [r3]
	ldr	r2, .L22+4
	tst	r1, #32
	push	{r4, lr}
	ldr	r3, [r2]
	beq	.L6
	ldr	r0, .L22+8
	ldrh	r0, [r0]
	tst	r0, #32
	subeq	r3, r3, #1
	streq	r3, [r2]
.L6:
	tst	r1, #16
	beq	.L7
	ldr	r1, .L22+8
	ldrh	r1, [r1]
	tst	r1, #16
	addeq	r3, r3, #1
	streq	r3, [r2]
.L7:
	cmp	r3, #2
	movgt	r3, #0
	strgt	r3, [r2]
	ble	.L21
.L9:
	ldr	r4, .L22+12
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L22+16
	ldr	r1, .L22+20
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L22+24
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L22+28
	ldr	r1, .L22+32
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L21:
	cmp	r3, #0
	bge	.L10
	mov	r3, #2
	str	r3, [r2]
.L11:
	ldr	r4, .L22+12
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L22+36
	ldr	r1, .L22+40
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L22+44
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L22+28
	ldr	r1, .L22+48
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L10:
	beq	.L9
	cmp	r3, #1
	bne	.L11
	ldr	r4, .L22+12
	mov	r3, #6336
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L22+52
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L22+56
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L22+28
	ldr	r1, .L22+60
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L23:
	.align	2
.L22:
	.word	oldButtons
	.word	page
	.word	buttons
	.word	DMANow
	.word	6224
	.word	instructionsPg1Tiles
	.word	instructionsPg1Pal
	.word	100726784
	.word	instructionsPg1Map
	.word	6368
	.word	instructionsPg3Tiles
	.word	instructionsPg3Pal
	.word	instructionsPg3Map
	.word	instructionsPg2Tiles
	.word	instructionsPg2Pal
	.word	instructionsPg2Map
	.size	updatePage, .-updatePage
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
	.comm	page,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
