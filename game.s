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
	push	{r4, r5, r6, r7, lr}
	mov	r1, #0
	mov	lr, #16
	mov	r4, #1
	mov	r6, #2
	mov	r5, #8
	ldr	r3, .L4
	ldr	r0, .L4+4
	ldr	r2, [r3]
	ldr	r0, [r0]
	ldr	r3, .L4+8
	add	r7, r2, #112
	add	ip, r2, #113
	ldr	r2, .L4+12
	add	r0, r0, #72
	str	r7, [r3, #4]
	str	r6, [r3, #36]
	str	r5, [r2, #12]
	str	lr, [r3, #16]
	str	lr, [r3, #20]
	str	lr, [r2, #8]
	str	r4, [r3, #12]
	str	r4, [r3, #8]
	str	ip, [r2, #4]
	str	r0, [r3]
	str	r0, [r2]
	str	r1, [r3, #24]
	str	r1, [r3, #32]
	str	r1, [r3, #28]
	str	r1, [r3, #40]
	str	r1, [r2, #20]
	str	r1, [r2, #16]
	str	r1, [r2, #24]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	hOff
	.word	vOff
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
	mov	r4, #0
	ldr	r2, .L8
	ldr	r3, .L8+4
	str	r4, [r2]
	str	r4, [r3]
	bl	initPlayer
	mov	r2, #1
	mov	r1, #16
	ldr	r3, .L8+8
	ldr	ip, .L8+12
	ldr	r0, .L8+16
	str	r4, [ip]
	str	r4, [r0]
	str	r4, [r3]
	str	r4, [r3, #4]
	str	r4, [r3, #24]
	str	r4, [r3, #36]
	str	r4, [r3, #40]
	str	r4, [r3, #28]
	str	r4, [r3, #32]
	str	r4, [r3, #44]
	str	r4, [r3, #48]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #52]
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	hOff
	.word	vOff
	.word	ghost
	.word	timer
	.word	sanity
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
	mov	r1, #1
	mov	r0, #16
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
	str	r1, [r3, #52]
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
	ldr	r2, .L46
	ldr	r3, .L46+4
	ldr	r2, [r2]
	smull	r0, r1, r3, r2
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #4
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L46+8
	add	r3, r3, r3, lsl #2
	ldr	r1, [r4, #40]
	add	r3, r3, r3, lsl #2
	sub	r3, r2, r3, lsl #1
	orrs	r3, r3, r1
	bne	.L15
	ldr	r3, .L46+12
	ldrh	r3, [r3, #48]
	tst	r3, #64
	bne	.L16
	ldr	r3, [r4]
	cmp	r3, #1
	ble	.L16
	ldr	r0, .L46+16
	ldr	r2, [r4, #8]
	ldr	r1, [r0]
	sub	r3, r3, r2
	sub	r2, r3, r1
	cmp	r2, #80
	movle	r2, #1
	movgt	r2, #0
	cmp	r1, #0
	movle	r2, #0
	mov	ip, #1
	cmp	r2, #0
	str	r3, [r4]
	str	ip, [r4, #28]
	bne	.L43
.L15:
	ldr	r3, .L46+20
	ldr	r3, [r3, #44]
	cmp	r3, #0
	beq	.L44
.L13:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L44:
	ldr	r7, .L46+24
	ldr	r6, .L46+28
	mov	r1, #512
	ldr	r3, [r4]
	ldr	r2, [r4, #4]
	ldr	r0, [r7]
	mov	lr, pc
	bx	r6
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #4]
	add	r2, r2, r3
	mov	r8, r0
	mov	r1, #512
	ldr	r3, [r4]
	sub	r2, r2, #1
	ldr	r0, [r7]
	mov	lr, pc
	bx	r6
	ldr	r2, [r4, #20]
	ldr	r3, [r4]
	rsbs	r5, r0, #1
	add	r3, r3, r2
	movcc	r5, #0
	mov	r1, #512
	cmp	r8, #0
	ldr	r2, [r4, #4]
	sub	r3, r3, #1
	ldr	r0, [r7]
	moveq	r5, #1
	mov	lr, pc
	bx	r6
	mov	ip, r0
	ldr	r1, [r4, #16]
	ldr	r0, [r4, #20]
	ldr	r3, [r4]
	ldr	r2, [r4, #4]
	add	r3, r3, r0
	add	r2, r2, r1
	cmp	ip, #0
	mov	r1, #512
	ldr	r0, [r7]
	sub	r3, r3, #1
	sub	r2, r2, #1
	moveq	r5, #1
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	moveq	r5, #1
	cmp	r5, #0
	beq	.L13
	ldr	r3, .L46+32
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L13
	ldr	r3, .L46+36
	ldrh	r3, [r3]
	ands	r3, r3, #2
	bne	.L13
	ldr	r2, [r4, #40]
	cmp	r2, #0
	moveq	r3, #1
	str	r3, [r4, #40]
	b	.L13
.L16:
	ldr	r3, .L46+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #128
	bne	.L18
	ldr	r2, [r4]
	ldr	r1, [r4, #20]
	add	r1, r2, r1
	cmp	r1, #255
	ble	.L45
.L18:
	ldr	r3, .L46+12
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L19
	ldr	r3, [r4, #4]
	cmp	r3, #0
	ble	.L19
	ldr	r0, .L46+40
	ldr	r2, [r4, #12]
	ldr	r1, [r0]
	sub	r3, r3, r2
	sub	r2, r3, r1
	cmp	r2, #120
	movle	r2, #1
	movgt	r2, #0
	cmp	r1, #0
	movle	r2, #0
	mov	ip, #3
	cmp	r2, #0
	str	r3, [r4, #4]
	str	ip, [r4, #28]
	beq	.L15
.L43:
	sub	r1, r1, #1
	str	r1, [r0]
	b	.L15
.L19:
	ldr	r3, .L46+12
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L15
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #16]
	add	r2, r3, r2
	cmp	r2, #512
	bge	.L15
	ldr	r0, .L46+40
	ldr	r2, [r4, #12]
	ldr	r1, [r0]
	add	r3, r3, r2
	sub	r2, r3, r1
	ldr	ip, .L46+44
	cmp	r2, #119
	movgt	r2, #1
	movle	r2, #0
	cmp	r1, ip
	movgt	r2, #0
	mov	ip, #2
	cmp	r2, #0
	addne	r1, r1, #1
	str	r3, [r4, #4]
	str	ip, [r4, #28]
	strne	r1, [r0]
	b	.L15
.L45:
	ldr	ip, .L46+16
	ldr	r1, [r4, #8]
	ldr	r0, [ip]
	add	r2, r2, r1
	sub	r1, r2, r0
	cmp	r1, #79
	movgt	r1, #1
	movle	r1, #0
	cmp	r0, #94
	movgt	r1, #0
	cmp	r1, #0
	addne	r0, r0, #1
	str	r3, [r4, #28]
	str	r2, [r4]
	strne	r0, [ip]
	b	.L15
.L47:
	.align	2
.L46:
	.word	timer
	.word	1374389535
	.word	player
	.word	67109120
	.word	vOff
	.word	ghost
	.word	.LANCHOR0
	.word	collisionCheck
	.word	oldButtons
	.word	buttons
	.word	hOff
	.word	270
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L51
	ldr	r0, .L51+4
	ldr	ip, [r0]
	ldr	r0, [r1, #40]
	cmp	r0, #0
	movne	r0, #9
	ldr	r2, .L51+8
	ldr	r3, [r1, #4]
	ldr	r2, [r2]
	sub	r3, r3, r2
	ldr	r2, [r1]
	ldreq	r0, [r1, #28]
	lsl	r3, r3, #23
	ldrne	r1, .L51+12
	ldreq	r1, .L51+12
	lsr	r3, r3, #23
	sub	r2, r2, ip
	orr	r3, r3, #16384
	and	r2, r2, #255
	lsleq	r0, r0, #1
	strh	r0, [r1, #4]	@ movhi
	strh	r2, [r1]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	bx	lr
.L52:
	.align	2
.L51:
	.word	player
	.word	vOff
	.word	hOff
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
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
	push	{r4, r5, r6, lr}
	ldr	r3, .L74
	ldrh	r3, [r3]
	tst	r3, #2
	ldr	r4, .L74+4
	sub	sp, sp, #16
	beq	.L54
	ldr	r3, .L74+8
	ldrh	r3, [r3]
	ands	r3, r3, #2
	streq	r3, [r4, #24]
	beq	.L55
.L54:
	ldr	r3, [r4, #24]
	cmp	r3, #199
	ble	.L55
	mov	r2, #0
	mov	r3, #4
	str	r2, [r4, #20]
	str	r3, [r4, #16]
.L63:
	ldr	r3, [r4, #24]
	add	r3, r3, #1
	str	r3, [r4, #24]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L55:
	mov	r1, #1
	ldr	r3, .L74+12
	ldr	r2, [r3, #28]
	cmp	r2, #0
	str	r2, [r4, #16]
	str	r1, [r4, #20]
	bne	.L72
	mov	r0, #16
	mov	r1, #24
	ldm	r3, {r2, ip}
	add	r3, r2, r0
	stm	r4, {r3, ip}
	str	r0, [r4, #8]
	str	r1, [r4, #12]
.L60:
	ldr	r5, .L74+16
	ldm	r5, {r2, r3}
	ldr	r0, [r5, #20]
	ldr	r1, [r5, #16]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #8
	ldm	r2, {r2, r3}
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	ldr	r6, .L74+20
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L63
	mov	r2, #0
	ldr	r3, .L74+24
	str	r2, [r5, #32]
	mov	lr, pc
	bx	r3
	b	.L63
.L72:
	cmp	r2, #1
	beq	.L73
	cmp	r2, #2
	bne	.L62
	mov	r0, #24
	mov	r1, #16
	ldr	r2, [r3, #4]
	ldr	ip, [r3]
	add	r3, r2, #14
	str	r3, [r4, #4]
	str	ip, [r4]
	str	r0, [r4, #8]
	str	r1, [r4, #12]
	b	.L60
.L73:
	mov	r0, #16
	mov	r1, #24
	ldm	r3, {r2, ip}
	sub	r3, r2, #22
	stm	r4, {r3, ip}
	str	r0, [r4, #8]
	str	r1, [r4, #12]
	b	.L60
.L62:
	cmp	r2, #3
	bne	.L60
	mov	r0, #24
	mov	r1, #16
	ldr	r2, [r3, #4]
	ldr	ip, [r3]
	sub	r3, r2, #22
	str	r3, [r4, #4]
	str	ip, [r4]
	str	r0, [r4, #8]
	str	r1, [r4, #12]
	b	.L60
.L75:
	.align	2
.L74:
	.word	oldButtons
	.word	weapon
	.word	buttons
	.word	player
	.word	ghost
	.word	collision
	.word	goToWin
	.size	updateWeapon, .-updateWeapon
	.align	2
	.global	drawWeapon
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawWeapon, %function
drawWeapon:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L77
	ldr	r2, .L77+4
	ldr	r3, [r1, #4]
	ldr	r2, [r2]
	sub	r3, r3, r2
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r0, .L77+8
	ldr	r2, [r1]
	ldr	ip, [r0]
	ldr	r1, [r1, #16]
	ldr	r0, .L77+12
	add	r1, r1, #16
	sub	r2, r2, ip
	lsl	r1, r1, #2
	and	r2, r2, #255
	strh	r3, [r0, #10]	@ movhi
	strh	r1, [r0, #12]	@ movhi
	strh	r2, [r0, #8]	@ movhi
	bx	lr
.L78:
	.align	2
.L77:
	.word	weapon
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.size	drawWeapon, .-drawWeapon
	.align	2
	.global	drawGhost
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGhost, %function
drawGhost:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L83
	ldr	r3, [r2, #32]
	cmp	r3, #0
	bne	.L82
	mov	r0, #201
	ldr	r1, .L83+4
	ldr	r3, [r2, #4]
	ldr	ip, [r1]
	ldr	r1, .L83+8
	sub	r3, r3, ip
	ldr	r2, [r2]
	ldr	ip, [r1]
	lsl	r3, r3, #23
	ldr	r1, .L83+12
	lsr	r3, r3, #23
	sub	r2, r2, ip
	orr	r3, r3, #16384
	and	r2, r2, #255
	strh	r3, [r1, #18]	@ movhi
	strh	r2, [r1, #16]	@ movhi
	strh	r0, [r1, #20]	@ movhi
	bx	lr
.L82:
	ldr	r3, .L83+16
	ldr	r1, .L83+20
	ldr	r0, .L83+24
	ldr	r3, [r3]
	mla	r3, r0, r3, r1
	ldr	r1, .L83+28
	cmp	r1, r3, ror #2
	bxcc	lr
	ldr	r1, .L83+4
	ldr	r3, [r2, #4]
	ldr	r0, [r1]
	ldr	r1, .L83+8
	sub	r3, r3, r0
	ldr	ip, [r1]
	ldr	r1, [r2]
	ldr	r2, [r2, #28]
	lsl	r3, r3, #23
	ldr	r0, .L83+12
	lsr	r3, r3, #23
	sub	r1, r1, ip
	add	r2, r2, #96
	orr	r3, r3, #16384
	and	r1, r1, #255
	lsl	r2, r2, #1
	strh	r3, [r0, #18]	@ movhi
	strh	r1, [r0, #16]	@ movhi
	strh	r2, [r0, #20]	@ movhi
	bx	lr
.L84:
	.align	2
.L83:
	.word	ghost
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.word	timer
	.word	85899344
	.word	-1030792151
	.word	42949672
	.size	drawGhost, .-drawGhost
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	drawPlayer
	ldr	r1, .L87
	ldr	r2, .L87+4
	ldr	r3, [r1, #4]
	ldr	r2, [r2]
	sub	r3, r3, r2
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r0, .L87+8
	ldr	r2, [r1]
	ldr	ip, [r0]
	ldr	r1, [r1, #16]
	ldr	r0, .L87+12
	add	r1, r1, #16
	sub	r2, r2, ip
	lsl	r1, r1, #2
	and	r2, r2, #255
	strh	r3, [r0, #10]	@ movhi
	strh	r1, [r0, #12]	@ movhi
	strh	r2, [r0, #8]	@ movhi
	pop	{r4, lr}
	b	drawGhost
.L88:
	.align	2
.L87:
	.word	weapon
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.size	drawGame, .-drawGame
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
	ldr	r3, .L101
	ldr	lr, .L101+4
	ldr	ip, [r3]
	ldr	r1, [lr]
	cmp	ip, r1
	sub	sp, sp, #16
	ble	.L90
	ldr	r2, [r3, #8]
	ldr	r0, [lr, #4]
	sub	ip, ip, r2
	ldr	r2, [r3, #4]
	cmp	r2, r0
	str	ip, [r3]
	ble	.L92
.L100:
	ldr	r4, [r3, #12]
	sub	r2, r2, r4
	str	r2, [r3, #4]
.L93:
	add	r3, r3, #16
	ldm	r3, {r3, r4}
	stm	sp, {r2, ip}
	str	r4, [sp, #12]
	str	r3, [sp, #8]
	add	r2, lr, #16
	ldm	r2, {r2, r3}
	ldr	r4, .L101+8
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	bne	.L99
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L90:
	ldrlt	r2, [r3, #8]
	ldr	r0, [lr, #4]
	addlt	ip, ip, r2
	ldr	r2, [r3, #4]
	strlt	ip, [r3]
	cmp	r2, r0
	bgt	.L100
.L92:
	ldrlt	r4, [r3, #12]
	addlt	r2, r2, r4
	strlt	r2, [r3, #4]
	b	.L93
.L99:
	ldr	r3, .L101+12
	mov	lr, pc
	bx	r3
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L102:
	.align	2
.L101:
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
	ldr	r4, .L125
	ldr	r3, [r4, #32]
	cmp	r3, #0
	sub	sp, sp, #20
	beq	.L121
	ldr	r3, .L125+4
	ldr	r2, .L125+8
	ldr	r1, .L125+12
	ldr	r3, [r3]
	mla	r3, r1, r3, r2
	ldr	r2, .L125+16
	cmp	r2, r3, ror #2
	bcc	.L103
	ldr	r3, [r4, #44]
	cmp	r3, #0
	bne	.L109
.L108:
	ldr	r3, [r4, #4]
	cmp	r3, #200
	bgt	.L110
	ldr	r2, [r4, #48]
	cmp	r2, #0
	beq	.L122
.L110:
	ldr	r2, [r4]
	cmp	r2, #120
	bgt	.L113
	ldr	r1, [r4, #48]
	cmp	r1, #1
	beq	.L123
.L113:
	cmp	r3, #29
	ble	.L115
	ldr	r1, [r4, #48]
	cmp	r1, #2
	beq	.L124
.L115:
	cmp	r2, #19
	ble	.L112
	ldr	r3, [r4, #48]
	cmp	r3, #3
	bne	.L112
	ldr	r3, [r4, #8]
	sub	r2, r2, r3
	cmp	r2, #20
	moveq	r3, #0
	str	r2, [r4]
	streq	r3, [r4, #32]
.L112:
	ldr	r0, .L125+20
	ldr	r3, [r0, #40]
	cmp	r3, #0
	bne	.L103
	add	ip, r4, #16
	ldm	ip, {ip, lr}
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r0]
	ldr	r0, [r0, #4]
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	ldr	lr, [r4]
	ldr	ip, [r4, #4]
	add	r3, r3, r3, lsl #1
	stm	sp, {ip, lr}
	ldr	r5, .L125+24
	add	r2, r2, r2, lsl #1
	sub	r1, r1, #16
	sub	r0, r0, #16
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	movne	r3, #1
	strne	r3, [r4, #44]
.L103:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L121:
	ldr	r3, .L125+28
	ldrh	r3, [r3]
	tst	r3, #256
	beq	.L103
	ldr	r3, .L125+32
	ldrh	r3, [r3]
	ands	r3, r3, #256
	bne	.L103
	mov	r1, #1
	ldr	r2, .L125+4
	ldr	r0, .L125+8
	ldr	ip, .L125+12
	ldr	r2, [r2]
	mla	r2, ip, r2, r0
	ldr	r0, .L125+16
	cmp	r0, r2, ror #2
	str	r3, [r4, #4]
	str	r3, [r4]
	str	r3, [r4, #48]
	str	r3, [r4, #44]
	str	r1, [r4, #32]
	bcs	.L108
	b	.L103
.L109:
	bl	chase
	b	.L112
.L122:
	ldr	r2, [r4, #12]
	add	r3, r3, r2
	cmp	r3, #200
	str	r3, [r4, #4]
	moveq	r3, #1
	streq	r3, [r4, #48]
	b	.L112
.L123:
	ldr	r3, [r4, #8]
	add	r2, r2, r3
	cmp	r2, #120
	moveq	r3, #2
	str	r2, [r4]
	streq	r3, [r4, #48]
	b	.L112
.L124:
	ldr	r2, [r4, #12]
	sub	r3, r3, r2
	cmp	r3, #30
	str	r3, [r4, #4]
	moveq	r3, #3
	streq	r3, [r4, #48]
	b	.L112
.L126:
	.align	2
.L125:
	.word	ghost
	.word	timer
	.word	85899344
	.word	-1030792151
	.word	42949672
	.word	player
	.word	collision
	.word	oldButtons
	.word	buttons
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
	ldr	r4, .L132
	bl	updatePlayer
	ldr	r3, [r4]
	ldr	r2, .L132+4
	mul	r3, r2, r3
	ldr	r2, .L132+8
	add	r3, r3, #3424256
	add	r3, r3, #11712
	cmp	r2, r3, ror #3
	ldrcs	r2, .L132+12
	ldrcc	r3, .L132+12
	ldrcs	r3, [r2]
	ldrcc	r3, [r3]
	addcs	r3, r3, #1
	strcs	r3, [r2]
	cmp	r3, #10
	moveq	r2, #1
	ldreq	r3, .L132+16
	streq	r2, [r3, #32]
	bl	updateGhost
	bl	updateWeapon
	mov	r2, #67108864
	ldr	r3, [r4]
	ldr	r1, .L132+20
	add	r3, r3, #1
	str	r3, [r4]
	ldrh	r1, [r1]
	ldr	r3, .L132+24
	strh	r1, [r2, #16]	@ movhi
	ldrh	r1, [r3]
	ldr	r4, .L132+28
	strh	r1, [r2, #18]	@ movhi
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L132+32
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L133:
	.align	2
.L132:
	.word	timer
	.word	989560465
	.word	858992
	.word	sanity
	.word	ghost
	.word	hOff
	.word	vOff
	.word	DMANow
	.word	shadowOAM
	.size	updateGame, .-updateGame
	.align	2
	.global	updateSanity
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateSanity, %function
updateSanity:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L137
	ldr	r2, .L137+4
	ldr	r3, [r3]
	mul	r3, r2, r3
	ldr	r1, .L137+8
	ldr	r2, .L137+12
	add	r3, r3, #3424256
	add	r3, r3, #11712
	cmp	r1, r3, ror #3
	ldr	r3, [r2]
	addcs	r3, r3, #1
	strcs	r3, [r2]
	cmp	r3, #10
	moveq	r2, #1
	ldreq	r3, .L137+16
	streq	r2, [r3, #32]
	bx	lr
.L138:
	.align	2
.L137:
	.word	timer
	.word	989560465
	.word	858992
	.word	sanity
	.word	ghost
	.size	updateSanity, .-updateSanity
	.global	collisionMap
	.comm	sanity,4,4
	.comm	ghost,56,4
	.comm	weapon,28,4
	.comm	player,44,4
	.comm	shadowOAM,1024,4
	.comm	hOff,4,4
	.comm	vOff,4,4
	.comm	path,4,4
	.comm	timer,4,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	collisionMap, %object
	.size	collisionMap, 4
collisionMap:
	.word	collisionmapBitmap
	.ident	"GCC: (devkitARM release 53) 9.1.0"
