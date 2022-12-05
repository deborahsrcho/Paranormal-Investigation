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
	.global	initStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initStart, %function
initStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L4
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L4+4
	ldr	r3, .L4+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	startmusic_length
	.word	startmusic_data
	.word	playSoundA
	.size	initStart, .-initStart
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #67108864
	mov	r5, #512
	mov	r1, #7936
	ldr	r4, .L8
	strh	r5, [r2]	@ movhi
	mov	r3, #8000
	strh	r1, [r2, #10]	@ movhi
	mov	r0, #3
	mov	r2, #100663296
	ldr	r1, .L8+4
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L8+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L8+12
	ldr	r1, .L8+16
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L8+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+24
	mov	lr, pc
	bx	r3
	mov	r3, r5
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L8+28
	mov	lr, pc
	bx	r4
	mov	r2, #0
	ldr	r3, .L8+32
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L9:
	.align	2
.L8:
	.word	DMANow
	.word	startBgTiles
	.word	startBgPal
	.word	100726784
	.word	startBgMap
	.word	waitForVBlank
	.word	hideSprites
	.word	shadowOAM
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
	mov	r0, #26
	ldr	r1, .L12
	push	{r4, lr}
	ldr	r3, .L12+4
	strh	r1, [r2]	@ movhi
	ldr	r1, .L12+8
	ldrh	ip, [r3]
	strh	ip, [r1]	@ movhi
	add	r2, r2, #256
	ldrh	ip, [r2, #48]
	ldr	r1, .L12+12
	ldr	r2, .L12+16
	strh	ip, [r3]	@ movhi
	str	r0, [r1]
	mov	lr, pc
	bx	r2
	ldr	r3, .L12+20
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L12+24
	ldr	r3, .L12+28
	mov	lr, pc
	bx	r3
	bl	goToStart
	ldr	r3, .L12+32
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	1044
	.word	buttons
	.word	oldButtons
	.word	screenBlock
	.word	hideSprites
	.word	startmusic_length
	.word	startmusic_data
	.word	playSoundA
	.word	setupSounds
	.size	initialize, .-initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause.part.0, %function
pause.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L16
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L16+4
	ldr	r3, .L16+8
	mov	lr, pc
	bx	r3
	bl	goToStart
	ldr	r3, .L16+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L16+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	startmusic_length
	.word	startmusic_data
	.word	playSoundA
	.word	waitForVBlank
	.word	flipPage
	.size	pause.part.0, .-pause.part.0
	.set	lose.part.0,pause.part.0
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
	ldr	r1, .L20
	push	{r4, lr}
	mov	r3, #512
	strh	r1, [r2]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L20+4
	ldr	r4, .L20+8
	mov	lr, pc
	bx	r4
	ldr	r0, .L20+12
	ldr	r3, .L20+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L20+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L20+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L20+28
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L20+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L21:
	.align	2
.L20:
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
	ldr	r3, .L31
	ldrh	r3, [r3]
	tst	r3, #4
	bxeq	lr
	ldr	r3, .L31+4
	ldrh	r3, [r3]
	tst	r3, #4
	bxne	lr
	push	{r4, lr}
	bl	goToStart
	ldr	r3, .L31+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L31+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L32:
	.align	2
.L31:
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
	ldr	r4, .L35
	strh	r2, [r5]	@ movhi
	mov	r0, #3
	mov	r2, #100663296
	ldr	r3, .L35+4
	ldr	r1, .L35+8
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L35+12
	mov	lr, pc
	bx	r4
	mov	r3, #6144
	mov	r0, #3
	ldr	r2, .L35+16
	ldr	r1, .L35+20
	mov	lr, pc
	bx	r4
	ldr	r2, .L35+24
	mov	r3, #16384
	strh	r2, [r5, #8]	@ movhi
	mov	r0, #3
	ldr	r2, .L35+28
	ldr	r1, .L35+32
	mov	lr, pc
	bx	r4
	ldr	r2, .L35+36
	mov	r3, #256
	mov	r0, #3
	ldr	r1, .L35+40
	mov	lr, pc
	bx	r4
	ldr	r3, .L35+44
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L35+48
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L36:
	.align	2
.L35:
	.word	DMANow
	.word	27264
	.word	backgroundTiles
	.word	backgroundPal
	.word	100716544
	.word	backgroundMap
	.word	-9600
	.word	100728832
	.word	spritesheetTiles
	.word	83886592
	.word	spritesheetPal
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
	ldr	r2, .L49
	ldr	r4, .L49+4
	ldr	r0, [r2]
	ldrh	r3, [r4]
	add	r0, r0, #1
	tst	r3, #8
	str	r0, [r2]
	beq	.L38
	ldr	r2, .L49+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L47
.L38:
	tst	r3, #4
	beq	.L37
	ldr	r3, .L49+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L48
.L37:
	pop	{r4, lr}
	bx	lr
.L48:
	pop	{r4, lr}
	b	goToInstructions
.L47:
	ldr	r3, .L49+12
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r3, .L49+16
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L38
.L50:
	.align	2
.L49:
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
	mov	r1, #7936
	push	{r4, lr}
	mov	r0, #3
	ldr	r4, .L53
	strh	r3, [r2]	@ movhi
	strh	r1, [r2, #10]	@ movhi
	mov	r3, #3840
	mov	r2, #100663296
	ldr	r1, .L53+4
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L53+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L53+12
	ldr	r1, .L53+16
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L53+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L53+24
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	mov	r3, #512
	mov	r0, #3
	ldr	r1, .L53+28
	mov	lr, pc
	bx	r4
	ldr	r3, .L53+32
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L53+36
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L54:
	.align	2
.L53:
	.word	DMANow
	.word	manualBgTiles
	.word	manualBgPal
	.word	100726784
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
	ldr	r3, .L57
	mov	lr, pc
	bx	r3
	mov	r5, #512
	mov	r2, #67108864
	mov	r1, #7936
	ldr	r4, .L57+4
	strh	r5, [r2]	@ movhi
	mov	r3, #7552
	strh	r1, [r2, #10]	@ movhi
	mov	r0, #3
	mov	r2, #100663296
	ldr	r1, .L57+8
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L57+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L57+16
	ldr	r1, .L57+20
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L57+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L57+28
	mov	lr, pc
	bx	r3
	mov	r3, r5
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L57+32
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L57+36
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L58:
	.align	2
.L57:
	.word	pauseSound
	.word	DMANow
	.word	pauseBgTiles
	.word	pauseBgPal
	.word	100726784
	.word	pauseBgMap
	.word	waitForVBlank
	.word	hideSprites
	.word	shadowOAM
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
	ldr	r3, .L71
	ldr	r4, .L71+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L71+8
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #4
	beq	.L60
	ldr	r2, .L71+12
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L69
.L60:
	tst	r3, #8
	beq	.L59
	ldr	r3, .L71+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L70
.L59:
	pop	{r4, lr}
	bx	lr
.L70:
	pop	{r4, lr}
	b	goToManual
.L69:
	bl	goToPause
	ldrh	r3, [r4]
	b	.L60
.L72:
	.align	2
.L71:
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
	ldr	r4, .L85
	ldrh	r3, [r4]
	tst	r3, #4
	beq	.L74
	ldr	r2, .L85+4
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L83
.L74:
	tst	r3, #256
	beq	.L73
	ldr	r3, .L85+4
	ldrh	r3, [r3]
	tst	r3, #256
	beq	.L84
.L73:
	pop	{r4, lr}
	bx	lr
.L84:
	pop	{r4, lr}
	b	pause.part.0
.L83:
	ldr	r3, .L85+8
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldrh	r3, [r4]
	b	.L74
.L86:
	.align	2
.L85:
	.word	oldButtons
	.word	buttons
	.word	unpauseSound
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
	ldr	r5, .L89
	ldr	r4, .L89+4
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	ldr	r1, .L89+8
	mov	r3, #512
	strh	r1, [r2]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L89+12
	ldr	r6, .L89+16
	mov	lr, pc
	bx	r6
	ldr	r0, .L89+20
	ldr	r3, .L89+24
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r4
	ldr	r3, .L89+28
	mov	lr, pc
	bx	r3
	mov	r2, #5
	ldr	r3, .L89+32
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L90:
	.align	2
.L89:
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
	ldr	r3, .L103
	ldr	r4, .L103+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L103+8
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L92
	ldr	r2, .L103+12
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L101
.L92:
	tst	r3, #1
	beq	.L91
	ldr	r3, .L103+12
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L91
	ldr	r2, .L103+16
	ldr	r3, .L103+20
	ldr	r2, [r2, #8]
	ldr	r3, [r3, #56]
	cmp	r2, r3
	beq	.L102
.L91:
	pop	{r4, lr}
	bx	lr
.L101:
	mov	r2, #512
	ldr	r3, .L103+24
	strh	r2, [r3, #136]	@ movhi
	bl	goToGame
	ldrh	r3, [r4]
	b	.L92
.L102:
	ldr	r2, .L103+28
	ldr	r3, [r2]
	pop	{r4, lr}
	add	r3, r3, #500
	str	r3, [r2]
	b	goToWin
.L104:
	.align	2
.L103:
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
	mov	r2, #67108864
	mov	r5, #512
	mov	r1, #7936
	ldr	r4, .L107
	strh	r5, [r2]	@ movhi
	mov	r0, #3
	strh	r1, [r2, #10]	@ movhi
	ldr	r3, .L107+4
	mov	r2, #100663296
	ldr	r1, .L107+8
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L107+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L107+16
	ldr	r1, .L107+20
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L107+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L107+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L107+32
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L107+36
	ldr	r3, .L107+40
	mov	lr, pc
	bx	r3
	mov	r3, r5
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L107+44
	mov	lr, pc
	bx	r4
	mov	r2, #6
	ldr	r3, .L107+48
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L108:
	.align	2
.L107:
	.word	DMANow
	.word	7664
	.word	loseBgTiles
	.word	loseBgPal
	.word	100726784
	.word	loseBgMap
	.word	waitForVBlank
	.word	hideSprites
	.word	losesound_length
	.word	losesound_data
	.word	playSoundA
	.word	shadowOAM
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
	@ link register save eliminated.
	ldr	r3, .L114
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L114+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	lose.part.0
.L115:
	.align	2
.L114:
	.word	oldButtons
	.word	buttons
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
	ldr	r3, .L129
	mov	lr, pc
	bx	r3
	ldr	r6, .L129+4
	ldr	r8, .L129+8
	ldr	r5, .L129+12
	ldr	fp, .L129+16
	ldr	r10, .L129+20
	ldr	r9, .L129+24
	ldr	r7, .L129+28
	ldr	r4, .L129+32
.L117:
	ldr	r2, [r6]
	ldrh	r3, [r8]
.L118:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r8]	@ movhi
	cmp	r2, #6
	ldrls	pc, [pc, r2, asl #2]
	b	.L118
.L120:
	.word	.L125
	.word	.L124
	.word	.L123
	.word	.L122
	.word	.L121
	.word	.L119
	.word	.L119
.L119:
	mov	lr, pc
	bx	r7
	b	.L117
.L121:
	ldr	r3, .L129+36
	mov	lr, pc
	bx	r3
	b	.L117
.L122:
	ldr	r3, .L129+40
	mov	lr, pc
	bx	r3
	b	.L117
.L123:
	mov	lr, pc
	bx	r9
	b	.L117
.L124:
	mov	lr, pc
	bx	r10
	b	.L117
.L125:
	mov	lr, pc
	bx	fp
	b	.L117
.L130:
	.align	2
.L129:
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
	.comm	screenBlock,4,4
	.comm	seed,4,4
	.comm	state,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	soundB,32,4
	.comm	soundA,32,4
	.comm	score,4,4
	.comm	buttonTimer,4,4
	.comm	seconds,4,4
	.comm	sanity,4,4
	.comm	sanityTimer,4,4
	.comm	hOff,4,4
	.comm	vOff,4,4
	.comm	path,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
