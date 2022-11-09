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
	ldr	r4, .L31
	mov	r3, #80
	mov	r0, #3
	strh	r2, [r5]	@ movhi
	ldr	r1, .L31+4
	mov	r2, #100663296
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L31+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L31+12
	ldr	r1, .L31+16
	mov	lr, pc
	bx	r4
	mov	r2, #7936
	mov	r3, #256
	mov	r0, #3
	strh	r2, [r5, #8]	@ movhi
	ldr	r1, .L31+20
	ldr	r2, .L31+24
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L31+28
	mov	r3, #16384
	ldr	r2, .L31+32
	mov	lr, pc
	bx	r4
	mov	r1, #640
	mov	r0, #1
	ldr	ip, .L31+12
	ldr	lr, .L31+36
.L26:
	sub	r3, r1, #640
.L27:
	lsl	r2, r3, #1
	add	r3, r3, #32
	cmp	r3, r1
	strh	r0, [ip, r2]	@ movhi
	bne	.L27
	add	r1, r3, #1
	cmp	r1, lr
	bne	.L26
	ldr	r3, .L31+40
	ldr	r2, .L31+44
	ldr	r1, .L31+48
	str	r2, [r3, #3008]
	str	r2, [r3, #3072]
	mov	lr, pc
	bx	r1
	mov	r2, #2
	ldr	r3, .L31+52
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L32:
	.align	2
.L31:
	.word	DMANow
	.word	gameBgTiles
	.word	gameBgPal
	.word	100726784
	.word	gameBgMap
	.word	spritesheetPal
	.word	83886592
	.word	spritesheetTiles
	.word	100728832
	.word	670
	.word	100724736
	.word	131074
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
	ldr	r4, .L45
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L34
	ldr	r2, .L45+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L43
.L34:
	tst	r3, #4
	beq	.L33
	ldr	r3, .L45+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L44
.L33:
	pop	{r4, lr}
	bx	lr
.L44:
	pop	{r4, lr}
	b	goToInstructions
.L43:
	bl	goToGame
	ldr	r3, .L45+8
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L34
.L46:
	.align	2
.L45:
	.word	oldButtons
	.word	buttons
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
	.word	manualBgBitmap
	.word	drawFullscreenImage4
	.word	hideSprites
	.word	state
	.size	goToManual, .-goToManual
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
	@ link register save eliminated.
	ldr	r3, .L56
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L56+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToGame
.L57:
	.align	2
.L56:
	.word	oldButtons
	.word	buttons
	.size	manual, .-manual
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
	ldr	r5, .L60
	ldr	r4, .L60+4
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	ldr	r1, .L60+8
	mov	r3, #512
	strh	r1, [r2]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L60+12
	ldr	r6, .L60+16
	mov	lr, pc
	bx	r6
	ldr	r0, .L60+20
	ldr	r3, .L60+24
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r4
	ldr	r3, .L60+28
	mov	lr, pc
	bx	r3
	mov	r2, #5
	ldr	r3, .L60+32
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L61:
	.align	2
.L60:
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
	ldr	r4, .L74
	ldr	r3, .L74+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #4
	beq	.L63
	ldr	r2, .L74+8
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L72
.L63:
	tst	r3, #8
	beq	.L62
	ldr	r3, .L74+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L73
.L62:
	pop	{r4, lr}
	bx	lr
.L73:
	pop	{r4, lr}
	b	goToManual
.L72:
	bl	goToPause
	ldrh	r3, [r4]
	b	.L63
.L75:
	.align	2
.L74:
	.word	oldButtons
	.word	updateGame
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
	ldr	r4, .L88
	ldrh	r3, [r4]
	tst	r3, #4
	beq	.L77
	ldr	r2, .L88+4
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L86
.L77:
	tst	r3, #256
	beq	.L76
	ldr	r3, .L88+4
	ldrh	r3, [r3]
	tst	r3, #256
	beq	.L87
.L76:
	pop	{r4, lr}
	bx	lr
.L87:
	bl	goToStart
	ldr	r3, .L88+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L88+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L86:
	bl	goToGame
	ldrh	r3, [r4]
	b	.L77
.L89:
	.align	2
.L88:
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
	ldr	r5, .L92
	ldr	r4, .L92+4
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	ldr	r1, .L92+8
	mov	r3, #512
	strh	r1, [r2]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L92+12
	ldr	r6, .L92+16
	mov	lr, pc
	bx	r6
	ldr	r0, .L92+20
	ldr	r3, .L92+24
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r4
	ldr	r3, .L92+28
	mov	lr, pc
	bx	r3
	mov	r2, #6
	ldr	r3, .L92+32
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L93:
	.align	2
.L92:
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
	ldr	r5, .L96
	ldr	r4, .L96+4
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	ldr	r1, .L96+8
	mov	r3, #512
	strh	r1, [r2]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L96+12
	ldr	r6, .L96+16
	mov	lr, pc
	bx	r6
	ldr	r0, .L96+20
	ldr	r3, .L96+24
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r4
	ldr	r3, .L96+28
	mov	lr, pc
	bx	r3
	mov	r2, #7
	ldr	r3, .L96+32
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L97:
	.align	2
.L96:
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
	ldr	r3, .L107
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L107+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	push	{r4, lr}
	bl	goToStart
	ldr	r3, .L107+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L107+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L108:
	.align	2
.L107:
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
	ldr	r6, .L125
	ldr	r8, .L125+4
	push	{r4, r7, fp, lr}
	ldr	r3, .L125+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L125+12
	ldr	r2, [r6]
	ldrh	r0, [r8]
	ldr	fp, .L125+16
	ldr	r10, .L125+20
	ldr	r9, .L125+24
	ldr	r7, .L125+28
	ldr	r4, .L125+32
.L111:
	strh	r0, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r8]	@ movhi
	cmp	r2, #7
	ldrls	pc, [pc, r2, asl #2]
	b	.L120
.L113:
	.word	.L118
	.word	.L117
	.word	.L116
	.word	.L120
	.word	.L115
	.word	.L114
	.word	.L112
	.word	.L112
.L112:
	mov	lr, pc
	bx	r7
	ldr	r2, [r6]
	ldrh	r0, [r8]
	b	.L111
.L114:
	ldr	r3, .L125+36
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r8]
	b	.L111
.L115:
	tst	r0, #8
	beq	.L120
	tst	r3, #8
	beq	.L124
.L120:
	mov	r0, r3
	b	.L111
.L116:
	mov	lr, pc
	bx	r9
	ldr	r2, [r6]
	ldrh	r0, [r8]
	b	.L111
.L118:
	mov	lr, pc
	bx	fp
	ldr	r2, [r6]
	ldrh	r0, [r8]
	b	.L111
.L117:
	mov	lr, pc
	bx	r10
	ldr	r2, [r6]
	ldrh	r0, [r8]
	b	.L111
.L124:
	ldr	r3, .L125+40
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r8]
	b	.L111
.L126:
	.align	2
.L125:
	.word	state
	.word	buttons
	.word	initialize
	.word	oldButtons
	.word	start
	.word	instructions
	.word	game
	.word	lose
	.word	67109120
	.word	pause
	.word	goToGame
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
	.comm	state,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	buttonTimer,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
