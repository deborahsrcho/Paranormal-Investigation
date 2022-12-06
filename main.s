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
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+4
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L4+8
	ldr	r3, .L4+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	stopSound
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
	mov	r0, #26
	mov	r2, #0
	ldr	r1, .L8+32
	ldr	r3, .L8+36
	str	r0, [r1]
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
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
	.word	screenBlock
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
	mov	ip, #0
	mov	r2, #67108864
	mov	r0, #26
	ldr	r3, .L12
	ldr	r1, .L12+4
	push	{r4, lr}
	str	ip, [r3]
	strh	r1, [r2]	@ movhi
	ldr	r3, .L12+8
	ldr	r1, .L12+12
	ldrh	ip, [r3]
	strh	ip, [r1]	@ movhi
	add	r2, r2, #256
	ldrh	ip, [r2, #48]
	ldr	r1, .L12+16
	ldr	r2, .L12+20
	strh	ip, [r3]	@ movhi
	str	r0, [r1]
	mov	lr, pc
	bx	r2
	bl	initStart
	bl	goToStart
	ldr	r3, .L12+24
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	cheat
	.word	1044
	.word	buttons
	.word	oldButtons
	.word	screenBlock
	.word	hideSprites
	.word	setupSounds
	.size	initialize, .-initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	win.part.0, %function
win.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L19
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	push	{r4, lr}
	bl	initStart
	pop	{r4, lr}
	b	goToStart
.L20:
	.align	2
.L19:
	.word	buttons
	.size	win.part.0, .-win.part.0
	.set	lose.part.0,win.part.0
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
	push	{r4, r5, r6, lr}
	ldr	r3, .L23
	mov	lr, pc
	bx	r3
	mov	r5, #512
	mov	r2, #67108864
	mov	r1, #7936
	ldr	r4, .L23+4
	strh	r5, [r2]	@ movhi
	mov	r0, #3
	strh	r1, [r2, #10]	@ movhi
	ldr	r3, .L23+8
	mov	r2, #100663296
	ldr	r1, .L23+12
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L23+16
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L23+20
	ldr	r1, .L23+24
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L23+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L23+32
	mov	lr, pc
	bx	r3
	mov	r3, r5
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L23+36
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L23+40
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L24:
	.align	2
.L23:
	.word	initInstructions
	.word	DMANow
	.word	6224
	.word	instructionsPg1Tiles
	.word	instructionsPg1Pal
	.word	100726784
	.word	instructionsPg1Map
	.word	waitForVBlank
	.word	hideSprites
	.word	shadowOAM
	.word	state
	.size	goToInstructions, .-goToInstructions
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
	mov	r0, #3
	mov	r2, #100663296
	ldr	r3, .L27+4
	ldr	r1, .L27+8
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L27+12
	mov	lr, pc
	bx	r4
	mov	r3, #6144
	mov	r0, #3
	ldr	r2, .L27+16
	ldr	r1, .L27+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L27+24
	ldr	r3, [r3]
	lsl	r3, r3, #24
	orr	r3, r3, #-1073741824
	orr	r3, r3, #8388608
	lsr	r3, r3, #16
	strh	r3, [r5, #8]	@ movhi
	mov	r0, #3
	mov	r3, #16384
	ldr	r2, .L27+28
	ldr	r1, .L27+32
	mov	lr, pc
	bx	r4
	ldr	r2, .L27+36
	mov	r3, #256
	mov	r0, #3
	ldr	r1, .L27+40
	mov	lr, pc
	bx	r4
	ldr	r3, .L27+44
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L27+48
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L28:
	.align	2
.L27:
	.word	DMANow
	.word	27264
	.word	backgroundTiles
	.word	backgroundPal
	.word	100716544
	.word	backgroundMap
	.word	screenBlock
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
	ldr	r2, .L46
	ldr	r4, .L46+4
	ldr	r0, [r2]
	ldrh	r3, [r4]
	add	r0, r0, #1
	tst	r3, #8
	str	r0, [r2]
	beq	.L30
	ldr	r2, .L46+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L44
.L30:
	tst	r3, #4
	beq	.L31
	ldr	r2, .L46+8
	ldrh	r2, [r2]
	ands	r2, r2, #4
	beq	.L45
.L31:
	tst	r3, #512
	beq	.L29
	ldr	r3, .L46+8
	ldrh	r3, [r3]
	ands	r3, r3, #512
	bne	.L29
	ldr	r2, .L46+12
	ldr	r1, [r2]
	cmp	r1, #0
	moveq	r3, #1
	str	r3, [r2]
.L29:
	pop	{r4, lr}
	bx	lr
.L45:
	ldr	r3, .L46+16
	str	r2, [r3]
	bl	goToInstructions
	ldrh	r3, [r4]
	b	.L31
.L44:
	ldr	r3, .L46+20
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r3, .L46+24
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L30
.L47:
	.align	2
.L46:
	.word	seed
	.word	oldButtons
	.word	buttons
	.word	cheat
	.word	statePrev
	.word	srand
	.word	initGame
	.size	start, .-start
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
	push	{r4, lr}
	ldr	r4, .L59
	ldr	r3, .L59+4
	mov	lr, pc
	bx	r3
	ldr	r3, [r4]
	cmp	r3, #2
	beq	.L57
.L49:
	cmp	r3, #0
	bne	.L48
	ldr	r3, .L59+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L48
	ldr	r3, .L59+12
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L58
.L48:
	pop	{r4, lr}
	bx	lr
.L57:
	ldr	r3, .L59+8
	ldrh	r3, [r3]
	tst	r3, #512
	beq	.L48
	ldr	r3, .L59+12
	ldrh	r3, [r3]
	tst	r3, #512
	bne	.L48
	bl	goToGame
	ldr	r3, [r4]
	b	.L49
.L58:
	pop	{r4, lr}
	b	goToStart
.L60:
	.align	2
.L59:
	.word	statePrev
	.word	updatePage
	.word	oldButtons
	.word	buttons
	.size	instructions, .-instructions
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
	mov	r2, #67108864
	mov	r5, #512
	mov	r1, #5120
	ldr	r4, .L63
	strh	r5, [r2]	@ movhi
	mov	r0, #3
	strh	r1, [r2, #10]	@ movhi
	ldr	r3, .L63+4
	mov	r2, #100663296
	ldr	r1, .L63+8
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L63+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L63+16
	ldr	r1, .L63+20
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L63+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L63+28
	mov	lr, pc
	bx	r3
	mov	r3, r5
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L63+32
	mov	lr, pc
	bx	r4
	ldr	r3, .L63+36
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L63+40
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L64:
	.align	2
.L63:
	.word	DMANow
	.word	6160
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
	.global	manual
	.syntax unified
	.arm
	.fpu softvfp
	.type	manual, %function
manual:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L72
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L72+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L65
	ldr	r3, .L72+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L71
.L65:
	pop	{r4, lr}
	bx	lr
.L71:
	pop	{r4, lr}
	b	goToGame
.L73:
	.align	2
.L72:
	.word	updateCursor
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
	ldr	r3, .L76
	mov	lr, pc
	bx	r3
	mov	r5, #512
	mov	r2, #67108864
	mov	r1, #7936
	ldr	r4, .L76+4
	strh	r5, [r2]	@ movhi
	mov	r3, #7488
	strh	r1, [r2, #10]	@ movhi
	mov	r0, #3
	mov	r2, #100663296
	ldr	r1, .L76+8
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L76+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L76+16
	ldr	r1, .L76+20
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L76+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L76+28
	mov	lr, pc
	bx	r3
	mov	r3, r5
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L76+32
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L76+36
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L77:
	.align	2
.L76:
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
	ldr	r4, .L90
	ldrh	r3, [r4]
	tst	r3, #4
	beq	.L79
	ldr	r2, .L90+4
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L88
.L79:
	tst	r3, #256
	beq	.L78
	ldr	r3, .L90+4
	ldrh	r3, [r3]
	tst	r3, #256
	beq	.L89
.L78:
	pop	{r4, lr}
	bx	lr
.L89:
	bl	initStart
	pop	{r4, lr}
	b	goToStart
.L88:
	ldr	r3, .L90+8
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldrh	r3, [r4]
	b	.L79
.L91:
	.align	2
.L90:
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
	push	{r4, lr}
	ldr	r3, .L94
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	mov	r3, #4608
	mov	r1, #3840
	ldr	r4, .L94+4
	strh	r3, [r2]	@ movhi
	mov	r0, #3
	strh	r1, [r2, #10]	@ movhi
	add	r3, r3, #2256
	mov	r2, #100663296
	ldr	r1, .L94+8
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L94+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L94+16
	ldr	r1, .L94+20
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L94+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L94+28
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L94+32
	mov	lr, pc
	bx	r4
	ldr	r3, .L94+36
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L94+40
	ldr	r3, .L94+44
	mov	lr, pc
	bx	r3
	mov	r2, #5
	ldr	r3, .L94+48
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L95:
	.align	2
.L94:
	.word	calculateRank
	.word	DMANow
	.word	winBgTiles
	.word	winBgPal
	.word	100694016
	.word	winBgMap
	.word	waitForVBlank
	.word	hideSprites
	.word	shadowOAM
	.word	startmusic_length
	.word	startmusic_data
	.word	playSoundA
	.word	state
	.size	goToWin, .-goToWin
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
	ldr	r3, .L115
	ldr	r4, .L115+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L115+8
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #4
	beq	.L97
	ldr	r2, .L115+12
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L111
.L97:
	tst	r3, #8
	beq	.L98
	ldr	r2, .L115+12
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L112
.L98:
	tst	r3, #512
	beq	.L99
	ldr	r3, .L115+12
	ldrh	r3, [r3]
	tst	r3, #512
	beq	.L113
.L99:
	ldr	r3, .L115+16
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L114
	pop	{r4, lr}
	bx	lr
.L114:
	pop	{r4, lr}
	b	goToWin
.L113:
	mov	r2, #2
	ldr	r3, .L115+20
	str	r2, [r3]
	bl	goToInstructions
	b	.L99
.L111:
	bl	goToPause
	ldrh	r3, [r4]
	b	.L97
.L112:
	bl	goToManual
	ldrh	r3, [r4]
	b	.L98
.L116:
	.align	2
.L115:
	.word	updateGame
	.word	oldButtons
	.word	drawGame
	.word	buttons
	.word	ghostBanished
	.word	statePrev
	.size	game, .-game
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
	push	{r4, lr}
	ldr	r3, .L120
	mov	lr, pc
	bx	r3
	ldr	r4, .L120+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L120+8
	mov	lr, pc
	bx	r4
	ldr	r3, .L120+12
	ldrh	r3, [r3]
	tst	r3, #8
	popne	{r4, lr}
	bne	win.part.0
.L117:
	pop	{r4, lr}
	bx	lr
.L121:
	.align	2
.L120:
	.word	updateWin
	.word	DMANow
	.word	shadowOAM
	.word	oldButtons
	.size	win, .-win
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
	ldr	r6, .L137
	ldr	r7, .L137+4
	ldr	r3, .L137+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L137+12
	ldr	r2, [r6]
	ldrh	r0, [r7]
	ldr	fp, .L137+16
	ldr	r10, .L137+20
	ldr	r9, .L137+24
	ldr	r8, .L137+28
	ldr	r4, .L137+32
.L124:
	strh	r0, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r2, #6
	ldrls	pc, [pc, r2, asl #2]
	b	.L134
.L126:
	.word	.L132
	.word	.L131
	.word	.L130
	.word	.L129
	.word	.L128
	.word	.L127
	.word	.L125
.L125:
	tst	r0, #8
	beq	.L134
	ldr	r3, .L137+36
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r7]
	b	.L124
.L127:
	ldr	r3, .L137+40
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r7]
	b	.L124
.L128:
	ldr	r3, .L137+44
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r7]
	b	.L124
.L129:
	mov	lr, pc
	bx	r8
	ldr	r2, [r6]
	ldrh	r0, [r7]
	b	.L124
.L130:
	mov	lr, pc
	bx	r9
	ldr	r2, [r6]
	ldrh	r0, [r7]
	b	.L124
.L131:
	mov	lr, pc
	bx	r10
	ldr	r2, [r6]
	ldrh	r0, [r7]
	b	.L124
.L132:
	mov	lr, pc
	bx	fp
	ldr	r2, [r6]
	ldrh	r0, [r7]
	b	.L124
.L134:
	mov	r0, r3
	b	.L124
.L138:
	.align	2
.L137:
	.word	state
	.word	buttons
	.word	initialize
	.word	oldButtons
	.word	start
	.word	instructions
	.word	game
	.word	manual
	.word	67109120
	.word	lose.part.0
	.word	win
	.word	pause
	.size	main, .-main
	.text
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
	ldr	r4, .L141
	strh	r5, [r2]	@ movhi
	mov	r0, #3
	strh	r1, [r2, #10]	@ movhi
	ldr	r3, .L141+4
	mov	r2, #100663296
	ldr	r1, .L141+8
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L141+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L141+16
	ldr	r1, .L141+20
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L141+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L141+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L141+32
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L141+36
	ldr	r3, .L141+40
	mov	lr, pc
	bx	r3
	mov	r3, r5
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L141+44
	mov	lr, pc
	bx	r4
	mov	r2, #6
	ldr	r3, .L141+48
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L142:
	.align	2
.L141:
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
	ldr	r3, .L145
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	lose.part.0
.L146:
	.align	2
.L145:
	.word	oldButtons
	.size	lose, .-lose
	.comm	cheat,4,4
	.comm	screenBlock,4,4
	.comm	seed,4,4
	.comm	statePrev,4,4
	.comm	state,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	aniTimer,4,4
	.comm	scoreCol,4,4
	.comm	scoreRow,4,4
	.comm	medalRow,4,4
	.comm	rankCol,4,4
	.comm	rank,4,4
	.comm	page,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
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
