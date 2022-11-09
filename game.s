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
	.file	"game.c"
	.text
	.align	2
	.global	initPlayer
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #2
	push	{r4, r5, r6, lr}
	mov	r1, #0
	mov	r0, #16
	mov	lr, #1
	mov	r6, #112
	mov	r5, #113
	mov	r4, #8
	mov	ip, #72
	ldr	r3, .L4
	str	r2, [r3, #36]
	ldr	r2, .L4+4
	str	r6, [r3, #4]
	str	lr, [r3, #12]
	str	r5, [r2, #4]
	str	r4, [r2, #12]
	str	lr, [r3, #8]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r0, [r2, #8]
	str	ip, [r3]
	str	ip, [r2]
	str	r1, [r3, #24]
	str	r1, [r3, #32]
	str	r1, [r3, #28]
	str	r1, [r3, #40]
	str	r1, [r2, #20]
	str	r1, [r2, #16]
	str	r1, [r2, #24]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	player
	.word	weapon
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	initPlayer
	mov	r2, #0
	mov	r0, #16
	mov	r1, #1
	ldr	r3, .L8
	ldr	ip, .L8+4
	str	r2, [r3]
	str	r2, [ip]
	str	r2, [r3, #4]
	str	r2, [r3, #24]
	str	r2, [r3, #36]
	str	r2, [r3, #40]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	str	r2, [r3, #44]
	str	r2, [r3, #48]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	ghost
	.word	timer
	.size	initGame, .-initGame
	.align	2
	.global	initGhost
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGhost, %function
initGhost:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	mov	r0, #16
	mov	r1, #1
	ldr	r3, .L11
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #24]
	str	r2, [r3, #36]
	str	r2, [r3, #40]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	str	r2, [r3, #44]
	str	r2, [r3, #48]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	bx	lr
.L12:
	.align	2
.L11:
	.word	ghost
	.size	initGhost, .-initGhost
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L26
	ldr	r3, .L26+4
	ldr	r2, [r2]
	smull	r0, r1, r3, r2
	asr	r3, r2, #31
	push	{r4, r5, lr}
	rsb	r3, r3, r1, asr #4
	ldr	r4, .L26+8
	add	r3, r3, r3, lsl #2
	ldr	r1, [r4, #40]
	add	r3, r3, r3, lsl #2
	sub	r3, r2, r3, lsl #1
	orrs	r3, r3, r1
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	sub	sp, sp, #20
	bne	.L14
	ldr	r3, .L26+12
	ldrh	r3, [r3, #48]
	tst	r3, #64
	bne	.L15
	cmp	r1, #1
	ble	.L15
	mov	r3, #1
	ldr	r2, [r4, #8]
	sub	r1, r1, r2
	str	r1, [r4]
	str	r3, [r4, #28]
.L14:
	ldr	r3, .L26+16
	ldr	r3, [r3, #44]
	cmp	r3, #0
	beq	.L23
	lsl	r0, r0, #23
	lsr	r0, r0, #23
	orr	r0, r0, #16384
	and	r1, r1, #255
.L20:
	mov	ip, #0
	ldr	r2, [r4, #28]
	ldr	r3, .L26+20
	lsl	r2, r2, #1
	strh	r2, [r3, #4]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r0, [r3, #2]	@ movhi
	str	ip, [r4, #40]
.L13:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L23:
	mov	r2, #16
	mov	ip, #120
	str	r2, [sp, #12]
	str	r2, [sp, #8]
	str	r3, [sp]
	str	ip, [sp, #4]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r5, .L26+24
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L24
	ldr	r3, .L26+12
	ldr	r0, [r4, #4]
	ldrh	r3, [r3, #48]
	lsl	r0, r0, #23
	lsr	r0, r0, #23
	tst	r3, #2
	ldrb	r1, [r4]	@ zero_extendqisi2
	orr	r0, r0, #16384
	bne	.L20
	mov	r2, #9
	mov	ip, #1
	ldr	r3, .L26+20
	str	ip, [r4, #40]
	strh	r2, [r3, #4]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r0, [r3, #2]	@ movhi
	b	.L13
.L24:
	ldr	r0, [r4, #4]
	lsl	r0, r0, #23
	lsr	r0, r0, #23
	ldrb	r1, [r4]	@ zero_extendqisi2
	orr	r0, r0, #16384
	b	.L20
.L15:
	ldr	r3, .L26+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #128
	bne	.L16
	ldr	r2, [r4, #20]
	add	r2, r1, r2
	cmp	r2, #159
	ble	.L25
.L16:
	ldr	r3, .L26+12
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L17
	cmp	r0, #0
	ble	.L17
	mov	r3, #3
	ldr	r2, [r4, #12]
	sub	r0, r0, r2
	str	r0, [r4, #4]
	str	r3, [r4, #28]
	b	.L14
.L17:
	ldr	r3, .L26+12
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L14
	ldr	r3, [r4, #16]
	add	r3, r0, r3
	cmp	r3, #239
	movle	r3, #2
	ldrle	r2, [r4, #12]
	addle	r0, r0, r2
	strle	r0, [r4, #4]
	strle	r3, [r4, #28]
	b	.L14
.L25:
	ldr	r2, [r4, #8]
	add	r1, r1, r2
	str	r3, [r4, #28]
	str	r1, [r4]
	b	.L14
.L27:
	.align	2
.L26:
	.word	timer
	.word	1374389535
	.word	player
	.word	67109120
	.word	ghost
	.word	shadowOAM
	.word	collision
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateWeapon
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateWeapon, %function
updateWeapon:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #16
	mov	r1, #120
	mov	r2, #0
	push	{r4, r5, r6, lr}
	sub	sp, sp, #16
	stmib	sp, {r1, r3}
	ldr	r5, .L49
	str	r2, [sp]
	str	r3, [sp, #12]
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	ldr	r6, .L49+4
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L29
	ldr	r3, .L49+8
	ldrh	r3, [r3]
	tst	r3, #2
	bne	.L46
.L29:
	ldr	r4, .L49+12
	ldr	r3, [r4, #24]
	cmp	r3, #199
	ble	.L30
	mov	r3, #4
	mov	r2, #0
	str	r3, [r4, #16]
	str	r2, [r4, #20]
	ldr	r3, [r4, #4]
	ldr	ip, [r4]
.L34:
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r2, [r4, #16]
	ldr	r1, [r4, #24]
	ldr	r0, .L49+16
	add	r2, r2, #16
	and	ip, ip, #255
	lsl	r2, r2, #2
	add	r1, r1, #1
	strh	r3, [r0, #10]	@ movhi
	strh	ip, [r0, #8]	@ movhi
	strh	r2, [r0, #12]	@ movhi
	str	r1, [r4, #24]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L46:
	ldr	r3, .L49+20
	ldrh	r3, [r3]
	ands	r3, r3, #2
	bne	.L29
	ldr	r4, .L49+12
	str	r3, [r4, #24]
.L30:
	mov	r2, #1
	ldr	r3, [r5, #28]
	cmp	r3, #0
	str	r2, [r4, #20]
	str	r3, [r4, #16]
	bne	.L47
	mov	r2, #16
	mov	r3, #24
	ldr	r0, [r5, #4]
	ldr	r1, [r5]
	stmib	r4, {r0, r2, r3}
	add	r1, r1, r2
	str	r1, [r4]
.L35:
	ldr	r5, .L49+24
	ldr	r3, [r5, #20]
	ldr	r2, [r5]
	ldr	ip, [r5, #16]
	str	r3, [sp, #12]
	ldr	r3, [r5, #4]
	stmib	sp, {r2, ip}
	str	r3, [sp]
	add	r2, r4, #8
	ldm	r2, {r2, r3}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L39
.L45:
	ldr	ip, [r4]
	ldr	r3, [r4, #4]
	b	.L34
.L47:
	cmp	r3, #1
	beq	.L48
	cmp	r3, #2
	bne	.L37
	mov	r2, #24
	mov	r3, #16
	ldr	r0, [r5, #4]
	ldr	r1, [r5]
	add	r0, r0, #14
	str	r0, [r4, #4]
	str	r1, [r4]
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	b	.L35
.L48:
	mov	r2, #16
	mov	r3, #24
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	sub	r1, r1, #22
	stmib	r4, {r0, r2, r3}
	str	r1, [r4]
	b	.L35
.L39:
	mov	r2, #0
	ldr	r3, .L49+28
	str	r2, [r5, #32]
	mov	lr, pc
	bx	r3
	b	.L45
.L37:
	cmp	r3, #3
	ldrne	r0, [r4, #4]
	ldrne	r1, [r4]
	bne	.L35
	mov	r2, #24
	mov	r3, #16
	ldr	r0, [r5, #4]
	ldr	r1, [r5]
	sub	r0, r0, #22
	str	r0, [r4, #4]
	str	r1, [r4]
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	b	.L35
.L50:
	.align	2
.L49:
	.word	player
	.word	collision
	.word	oldButtons
	.word	weapon
	.word	shadowOAM
	.word	buttons
	.word	ghost
	.word	goToWin
	.size	updateWeapon, .-updateWeapon
	.align	2
	.global	chase
	.syntax unified
	.arm
	.fpu softvfp
	.type	chase, %function
chase:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L63
	ldr	lr, .L63+4
	ldr	ip, [r3]
	ldr	r1, [lr]
	cmp	ip, r1
	sub	sp, sp, #16
	ble	.L52
	ldr	r2, [r3, #8]
	ldr	r0, [lr, #4]
	sub	ip, ip, r2
	ldr	r2, [r3, #4]
	cmp	r2, r0
	str	ip, [r3]
	ble	.L54
.L62:
	ldr	r4, [r3, #12]
	sub	r2, r2, r4
	str	r2, [r3, #4]
.L55:
	add	r3, r3, #16
	ldm	r3, {r3, r4}
	stm	sp, {r2, ip}
	str	r4, [sp, #12]
	str	r3, [sp, #8]
	add	r2, lr, #16
	ldm	r2, {r2, r3}
	ldr	r4, .L63+8
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	bne	.L61
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L52:
	ldrlt	r2, [r3, #8]
	ldr	r0, [lr, #4]
	addlt	ip, ip, r2
	ldr	r2, [r3, #4]
	strlt	ip, [r3]
	cmp	r2, r0
	bgt	.L62
.L54:
	ldrlt	r4, [r3, #12]
	addlt	r2, r2, r4
	strlt	r2, [r3, #4]
	b	.L55
.L61:
	ldr	r3, .L63+12
	mov	lr, pc
	bx	r3
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L64:
	.align	2
.L63:
	.word	ghost
	.word	player
	.word	collision
	.word	goToLose
	.size	chase, .-chase
	.align	2
	.global	updateGhost
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGhost, %function
updateGhost:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r4, .L87
	ldr	r3, [r4, #32]
	cmp	r3, #0
	sub	sp, sp, #20
	beq	.L82
	ldr	r3, .L87+4
	ldr	r2, .L87+8
	ldr	r1, .L87+12
	ldr	r3, [r3]
	mla	r3, r1, r3, r2
	ldr	r2, .L87+16
	cmp	r2, r3, ror #2
	bcc	.L65
	ldr	r3, [r4, #44]
	cmp	r3, #0
	bne	.L70
.L68:
	ldr	ip, [r4, #4]
	cmp	ip, #200
	ldr	lr, [r4]
	bgt	.L71
	ldr	r3, [r4, #48]
	cmp	r3, #0
	beq	.L83
.L71:
	cmp	lr, #120
	bgt	.L73
	ldr	r3, [r4, #48]
	cmp	r3, #1
	beq	.L84
.L73:
	cmp	ip, #29
	ble	.L74
	ldr	r3, [r4, #48]
	cmp	r3, #2
	beq	.L85
.L74:
	cmp	lr, #19
	ble	.L72
	ldr	r3, [r4, #48]
	cmp	r3, #3
	bne	.L72
	ldr	r3, [r4, #8]
	sub	lr, lr, r3
	cmp	lr, #20
	moveq	r3, #0
	str	lr, [r4]
	streq	r3, [r4, #32]
.L72:
	ldr	r0, .L87+20
	ldr	r3, [r0, #40]
	cmp	r3, #0
	beq	.L86
.L75:
	ldr	r3, [r4, #28]
	lsl	ip, ip, #23
	ldr	r2, .L87+24
	add	r3, r3, #96
	lsr	ip, ip, #23
	lsl	r3, r3, #1
	orr	ip, ip, #16384
	and	lr, lr, #255
	strh	ip, [r2, #18]	@ movhi
	strh	r3, [r2, #20]	@ movhi
	strh	lr, [r2, #16]	@ movhi
.L65:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L82:
	ldr	r3, .L87+28
	ldrh	r3, [r3]
	tst	r3, #256
	beq	.L67
	ldr	r3, .L87+32
	ldrh	r3, [r3]
	ands	r3, r3, #256
	bne	.L67
	mov	r1, #1
	ldr	r2, .L87+4
	ldr	r0, .L87+8
	ldr	ip, .L87+12
	ldr	r2, [r2]
	mla	r2, ip, r2, r0
	ldr	r0, .L87+16
	cmp	r0, r2, ror #2
	str	r3, [r4, #4]
	str	r3, [r4]
	str	r3, [r4, #48]
	str	r3, [r4, #44]
	str	r1, [r4, #32]
	bcs	.L68
	b	.L65
.L67:
	mov	r1, #201
	ldr	r3, [r4, #4]
	lsl	r3, r3, #23
	ldr	r2, .L87+24
	ldrb	r0, [r4]	@ zero_extendqisi2
	lsr	r3, r3, #23
	orr	r3, r3, #16384
	strh	r3, [r2, #18]	@ movhi
	strh	r0, [r2, #16]	@ movhi
	strh	r1, [r2, #20]	@ movhi
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L70:
	bl	chase
	ldr	ip, [r4, #4]
	ldr	lr, [r4]
	b	.L72
.L86:
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r0]
	ldr	r0, [r0, #4]
	str	lr, [sp, #4]
	str	ip, [sp]
	ldr	lr, [r4, #20]
	ldr	ip, [r4, #16]
	str	lr, [sp, #12]
	add	r3, r3, r3, lsl #1
	str	ip, [sp, #8]
	ldr	r5, .L87+36
	add	r2, r2, r2, lsl #1
	sub	r1, r1, #16
	sub	r0, r0, #16
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	movne	r3, #1
	ldreq	lr, [r4]
	ldrne	lr, [r4]
	strne	r3, [r4, #44]
	ldr	ip, [r4, #4]
	b	.L75
.L83:
	ldr	r3, [r4, #12]
	add	ip, ip, r3
	cmp	ip, #200
	moveq	r3, #1
	str	ip, [r4, #4]
	streq	r3, [r4, #48]
	b	.L72
.L84:
	ldr	r3, [r4, #8]
	add	lr, lr, r3
	cmp	lr, #120
	moveq	r3, #2
	str	lr, [r4]
	streq	r3, [r4, #48]
	b	.L72
.L85:
	ldr	r3, [r4, #12]
	sub	ip, ip, r3
	cmp	ip, #30
	moveq	r3, #3
	str	ip, [r4, #4]
	streq	r3, [r4, #48]
	b	.L72
.L88:
	.align	2
.L87:
	.word	ghost
	.word	timer
	.word	85899344
	.word	-1030792151
	.word	42949672
	.word	player
	.word	shadowOAM
	.word	oldButtons
	.word	buttons
	.word	collision
	.size	updateGhost, .-updateGhost
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	updatePlayer
	bl	updateGhost
	bl	updateWeapon
	ldr	lr, .L91
	ldr	ip, [lr]
	ldr	r4, .L91+4
	add	ip, ip, #1
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L91+8
	str	ip, [lr]
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L92:
	.align	2
.L91:
	.word	timer
	.word	DMANow
	.word	shadowOAM
	.size	updateGame, .-updateGame
	.comm	ghost,52,4
	.comm	weapon,28,4
	.comm	player,44,4
	.comm	shadowOAM,1024,4
	.comm	path,4,4
	.comm	timer,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
