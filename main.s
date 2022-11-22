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
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldr	r1, .L4
	push	{r4, lr}
	mov	r3, #512
	strh	r1, [r2]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L4+4
	ldr	r4, .L4+8
	mov	lr, pc
	bx	r4
	ldr	r0, .L4+12
	ldr	r3, .L4+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+24
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L4+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	1044
	.word	startBgPal
	.word	DMANow
	.word	startBgBitmap
	.word	drawFullscreenImage4
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldr	r1, .L8
	push	{r4, lr}
	ldr	r3, .L8+4
	strh	r1, [r2]	@ movhi
	ldr	r1, .L8+8
	ldrh	r0, [r3]
	strh	r0, [r1]	@ movhi
	add	r2, r2, #256
	ldrh	r1, [r2, #48]
	ldr	r2, .L8+12
	strh	r1, [r3]	@ movhi
	mov	lr, pc
	bx	r2
	pop	{r4, lr}
	b	goToStart
.L9:
	.align	2
.L8:
	.word	1044
	.word	buttons
	.word	oldButtons
	.word	hideSprites
	.size	initialize, .-initialize
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldr	r1, .L12
	push	{r4, lr}
	mov	r3, #512
	strh	r1, [r2]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L12+4
	ldr	r4, .L12+8
	mov	lr, pc
	bx	r4
	ldr	r0, .L12+12
	ldr	r3, .L12+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L12+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L12+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L12+28
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L12+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L13:
	.align	2
.L12:
	.word	1044
	.word	startBgPal
	.word	DMANow
	.word	instructionsBgBitmap
	.word	drawFullscreenImage4
	.word	waitForVBlank
	.word	flipPage
	.word	hideSprites
	.word	state
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L23
	ldrh	r3, [r3]
	tst	r3, #4
	bxeq	lr
	ldr	r3, .L23+4
	ldrh	r3, [r3]
	tst	r3, #4
	bxne	lr
	push	{r4, lr}
	bl	goToStart
	ldr	r3, .L23+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L23+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L24:
	.align	2
.L23:
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
	.word	flipPage
	.size	instructions, .-instructions
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #4352
	mov	r5, #67108864
	ldr	r4, .L27
	strh	r2, [r5]	@ movhi
	mov	r3, #32
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L27+4
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L27+8
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L27+12
	ldr	r1, .L27+16
	mov	lr, pc
	bx	r4
	mov	r2, #24064
	mov	r3, #256
	strh	r2, [r5, #8]	@ movhi
	mov	r0, #3
	ldr	r2, .L27+20
	ldr	r1, .L27+24
	mov	lr, pc
	bx	r4
	ldr	r2, .L27+28
	mov	r3, #16384
	mov	r0, #3
	ldr	r1, .L27+32
	mov	lr, pc
	bx	r4
	ldr	r3, .L27+36
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L27+40
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L28:
	.align	2
.L27:
	.word	DMANow
	.word	backgroundTiles
	.word	backgroundPal
	.word	100724736
	.word	backgroundMap
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	waitForVBlank
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r2, .L41
	ldr	r4, .L41+4
	ldr	r0, [r2]
	ldrh	r3, [r4]
	add	r0, r0, #1
	tst	r3, #8
	str	r0, [r2]
	beq	.L30
	ldr	r2, .L41+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L39
.L30:
	tst	r3, #4
	beq	.L29
	ldr	r3, .L41+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L40
.L29:
	pop	{r4, lr}
	bx	lr
.L40:
	pop	{r4, lr}
	b	goToInstructions
.L39:
	ldr	r3, .L41+12
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r3, .L41+16
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L30
.L42:
	.align	2
.L41:
	.word	seed
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	initGame
	.size	start, .-start
	.align	2
	.global	goToManual
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToManual, %function
goToManual:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r3, #4608
	ldr	r1, .L45
	push	{r4, lr}
	mov	r0, #3
	ldr	r4, .L45+4
	strh	r3, [r2]	@ movhi
	strh	r1, [r2, #10]	@ movhi
	mov	r3, #3840
	ldr	r2, .L45+8
	ldr	r1, .L45+12
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L45+16
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L45+20
	ldr	r1, .L45+24
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L45+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L45+32
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	mov	r3, #512
	mov	r0, #3
	ldr	r1, .L45+36
	mov	lr, pc
	bx	r4
	ldr	r3, .L45+40
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L45+44
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L46:
	.align	2
.L45:
	.word	5128
	.word	DMANow
	.word	100696064
	.word	manualBgTiles
	.word	manualBgPal
	.word	100704256
	.word	manualBgMap
	.word	waitForVBlank
	.word	hideSprites
	.word	shadowOAM
	.word	initCursor
	.word	state
	.size	goToManual, .-goToManual
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L49
	ldr	r4, .L49+4
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	ldr	r1, .L49+8
	mov	r3, #512
	strh	r1, [r2]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L49+12
	ldr	r6, .L49+16
	mov	lr, pc
	bx	r6
	ldr	r0, .L49+20
	ldr	r3, .L49+24
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r4
	ldr	r3, .L49+28
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L49+32
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L50:
	.align	2
.L49:
	.word	waitForVBlank
	.word	flipPage
	.word	1044
	.word	startBgPal
	.word	DMANow
	.word	pauseBgBitmap
	.word	drawFullscreenImage4
	.word	hideSprites
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L63
	ldr	r4, .L63+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L63+8
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #4
	beq	.L52
	ldr	r2, .L63+12
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L61
.L52:
	tst	r3, #8
	beq	.L51
	ldr	r3, .L63+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L62
.L51:
	pop	{r4, lr}
	bx	lr
.L62:
	pop	{r4, lr}
	b	goToManual
.L61:
	bl	goToPause
	ldrh	r3, [r4]
	b	.L52
.L64:
	.align	2
.L63:
	.word	updateGame
	.word	oldButtons
	.word	drawGame
	.word	buttons
	.size	game, .-game
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L77
	ldrh	r3, [r4]
	tst	r3, #4
	beq	.L66
	ldr	r2, .L77+4
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L75
.L66:
	tst	r3, #256
	beq	.L65
	ldr	r3, .L77+4
	ldrh	r3, [r3]
	tst	r3, #256
	beq	.L76
.L65:
	pop	{r4, lr}
	bx	lr
.L76:
	bl	goToStart
	ldr	r3, .L77+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L77+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L75:
	bl	goToGame
	ldrh	r3, [r4]
	b	.L66
.L78:
	.align	2
.L77:
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
	.word	flipPage
	.size	pause, .-pause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L81
	ldr	r4, .L81+4
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	ldr	r1, .L81+8
	mov	r3, #512
	strh	r1, [r2]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L81+12
	ldr	r6, .L81+16
	mov	lr, pc
	bx	r6
	ldr	r0, .L81+20
	ldr	r3, .L81+24
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r4
	ldr	r3, .L81+28
	mov	lr, pc
	bx	r3
	mov	r2, #5
	ldr	r3, .L81+32
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L82:
	.align	2
.L81:
	.word	waitForVBlank
	.word	flipPage
	.word	1044
	.word	startBgPal
	.word	DMANow
	.word	winBgBitmap
	.word	drawFullscreenImage4
	.word	hideSprites
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	manual
	.syntax unified
	.arm
	.fpu softvfp
	.type	manual, %function
manual:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L95
	ldr	r4, .L95+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L95+8
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L84
	ldr	r2, .L95+12
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L93
.L84:
	tst	r3, #1
	beq	.L83
	ldr	r3, .L95+12
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L83
	ldr	r2, .L95+16
	ldr	r3, .L95+20
	ldr	r2, [r2, #8]
	ldr	r3, [r3, #56]
	cmp	r2, r3
	beq	.L94
.L83:
	pop	{r4, lr}
	bx	lr
.L93:
	mov	r2, #512
	ldr	r3, .L95+24
	strh	r2, [r3, #136]	@ movhi
	bl	goToGame
	ldrh	r3, [r4]
	b	.L84
.L94:
	ldr	r2, .L95+28
	ldr	r3, [r2]
	pop	{r4, lr}
	add	r3, r3, #500
	str	r3, [r2]
	b	goToWin
.L96:
	.align	2
.L95:
	.word	drawManual
	.word	oldButtons
	.word	updateCursor
	.word	buttons
	.word	cursor
	.word	ghost
	.word	shadowOAM
	.word	score
	.size	manual, .-manual
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L99
	ldr	r4, .L99+4
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	ldr	r1, .L99+8
	mov	r3, #512
	strh	r1, [r2]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L99+12
	ldr	r6, .L99+16
	mov	lr, pc
	bx	r6
	ldr	r0, .L99+20
	ldr	r3, .L99+24
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r4
	ldr	r3, .L99+28
	mov	lr, pc
	bx	r3
	mov	r2, #6
	ldr	r3, .L99+32
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L100:
	.align	2
.L99:
	.word	waitForVBlank
	.word	flipPage
	.word	1044
	.word	startBgPal
	.word	DMANow
	.word	loseBgBitmap
	.word	drawFullscreenImage4
	.word	hideSprites
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L110
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L110+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	push	{r4, lr}
	bl	goToStart
	ldr	r3, .L110+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L110+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L111:
	.align	2
.L110:
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
	.word	flipPage
	.size	lose, .-lose
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L125
	mov	lr, pc
	bx	r3
	ldr	r6, .L125+4
	ldr	r8, .L125+8
	ldr	r5, .L125+12
	ldr	fp, .L125+16
	ldr	r10, .L125+20
	ldr	r9, .L125+24
	ldr	r7, .L125+28
	ldr	r4, .L125+32
.L113:
	ldr	r2, [r6]
	ldrh	r3, [r8]
.L114:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r8]	@ movhi
	cmp	r2, #6
	ldrls	pc, [pc, r2, asl #2]
	b	.L114
.L116:
	.word	.L121
	.word	.L120
	.word	.L119
	.word	.L118
	.word	.L117
	.word	.L115
	.word	.L115
.L115:
	mov	lr, pc
	bx	r7
	b	.L113
.L117:
	ldr	r3, .L125+36
	mov	lr, pc
	bx	r3
	b	.L113
.L118:
	ldr	r3, .L125+40
	mov	lr, pc
	bx	r3
	b	.L113
.L119:
	mov	lr, pc
	bx	r9
	b	.L113
.L120:
	mov	lr, pc
	bx	r10
	b	.L113
.L121:
	mov	lr, pc
	bx	fp
	b	.L113
.L126:
	.align	2
.L125:
	.word	initialize
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	instructions
	.word	game
	.word	lose
	.word	67109120
	.word	pause
	.word	manual
	.size	main, .-main
	.text
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	lose
	.size	win, .-win
	.comm	seed,4,4
	.comm	state,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	tens,4,4
	.comm	ones,4,4
	.comm	score,4,4
	.comm	buttonTimer,4,4
	.comm	seconds,4,4
	.comm	sanity,4,4
	.comm	sanityTimer,4,4
	.comm	hOff,4,4
	.comm	vOff,4,4
	.comm	path,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
