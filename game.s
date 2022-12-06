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
	.global	interruptHandler
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r3, .L32
	ldrh	r1, [r3, #2]
	tst	r1, #32
	push	{r4, r5, r6, lr}
	strh	r2, [r3, #8]	@ movhi
	beq	.L3
	ldr	r2, .L32+4
	ldr	r2, [r2, #32]
	cmp	r2, #0
	ldreq	r1, .L32+8
	ldreq	r2, [r1]
	ldr	r4, .L32+12
	ldr	r5, .L32+16
	addeq	r2, r2, #1
	ldr	r3, [r4]
	streq	r2, [r1]
	ldr	r2, [r5, #16]
	add	r3, r3, #1
	cmp	r2, #0
	str	r3, [r4]
	bne	.L27
.L3:
	ldr	r3, .L32
	ldrh	r3, [r3, #2]
	tst	r3, #1
	beq	.L7
	ldr	r3, .L32+20
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L9
	ldr	r2, [r3, #28]
	ldr	r1, [r3, #20]
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #28]
	ble	.L9
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L28
	ldr	r0, .L32+24
	ldr	r1, .L32+28
	ldr	r0, [r0]
	str	r2, [r3, #12]
	str	r2, [r0, #20]
	strh	r2, [r1, #2]	@ movhi
.L9:
	ldr	r3, .L32+32
	ldr	r2, [r3, #12]
	cmp	r2, #0
	bne	.L29
.L13:
	mov	r2, #1
	ldr	r3, .L32
	strh	r2, [r3, #2]	@ movhi
.L7:
	mov	r1, #1
	ldr	r3, .L32
	ldrh	r2, [r3, #2]
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L29:
	ldr	r2, [r3, #28]
	ldr	r1, [r3, #20]
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #28]
	ble	.L13
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L30
	ldr	r0, .L32+24
	ldr	r1, .L32+28
	ldr	r0, [r0]
	str	r2, [r3, #12]
	str	r2, [r0, #32]
	strh	r2, [r1, #6]	@ movhi
	b	.L13
.L27:
	ldr	r2, .L32+36
	smull	r1, r2, r3, r2
	sub	r2, r2, r3, asr #31
	add	r2, r2, r2, lsl #1
	cmp	r3, r2
	asr	r2, r3, #31
	beq	.L31
.L6:
	ldr	r1, .L32+40
	smull	r0, r1, r3, r1
	rsb	r2, r2, r1, asr #2
	add	r2, r2, r2, lsl #2
	cmp	r3, r2, lsl #1
	bne	.L3
	ldr	r5, .L32+44
	mov	lr, pc
	bx	r5
	ldr	r4, .L32+36
	smull	r2, r3, r4, r0
	sub	r3, r3, r0, asr #31
	ldr	r2, .L32+48
	add	r3, r3, r3, lsl #1
	sub	r0, r0, r3
	str	r0, [r2, #24]
	mov	lr, pc
	bx	r5
	smull	r2, r3, r4, r0
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	ldr	r2, .L32+52
	sub	r0, r0, r3
	str	r0, [r2, #24]
	mov	lr, pc
	bx	r5
	smull	r3, r4, r0, r4
	sub	r4, r4, r0, asr #31
	ldr	r3, .L32+56
	add	r4, r4, r4, lsl #1
	sub	r4, r0, r4
	str	r4, [r3, #24]
	b	.L3
.L31:
	ldr	r3, .L32+44
	mov	lr, pc
	bx	r3
	ldr	r3, [r5, #16]
	cmp	r0, #0
	and	r0, r0, #1
	rsblt	r0, r0, #0
	cmp	r3, #0
	str	r0, [r5, #24]
	beq	.L3
	ldr	r3, [r4]
	asr	r2, r3, #31
	b	.L6
.L28:
	ldm	r3, {r0, r1}
	ldr	r3, .L32+60
	mov	lr, pc
	bx	r3
	b	.L9
.L30:
	ldm	r3, {r0, r1}
	ldr	r3, .L32+64
	mov	lr, pc
	bx	r3
	b	.L13
.L33:
	.align	2
.L32:
	.word	67109376
	.word	ghost
	.word	sanityTimer
	.word	seconds
	.word	thermometer
	.word	soundA
	.word	dma
	.word	67109120
	.word	soundB
	.word	1431655766
	.word	1717986919
	.word	rand
	.word	ghostbook
	.word	videocam
	.word	spiritbox
	.word	playSoundA
	.word	playSoundB
	.size	interruptHandler, .-interruptHandler
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEMFReader.part.0, %function
drawEMFReader.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #416
	mov	r1, #10
	push	{r4, r5, lr}
	mov	r4, #436
	mov	lr, #28
	mov	ip, #26
	ldr	r3, .L36
	ldr	r2, [r3, #16]
	ldr	r3, .L36+4
	add	r2, r2, #512
	add	r5, r3, #364
	add	r2, r2, #1
	strh	r2, [r5]	@ movhi
	ldr	r2, .L36+8
	strh	r0, [r3, #28]	@ movhi
	add	r0, r3, #272
	strh	r2, [r3, #26]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	add	r2, r3, #352
	strh	r1, [r3, #24]	@ movhi
	strh	r1, [r2, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	ldr	r1, .L36+12
	strh	r1, [r2]	@ movhi
	add	r2, r3, #276
	ldr	r1, .L36+16
	strh	r4, [r2]	@ movhi
	add	r2, r3, #356
	add	r3, r3, #360
	strh	lr, [r3]	@ movhi
	strh	r1, [r2]	@ movhi
	strh	ip, [r3, #2]	@ movhi
	pop	{r4, r5, lr}
	bx	lr
.L37:
	.align	2
.L36:
	.word	EMFReader
	.word	shadowOAM
	.word	16394
	.word	16412
	.word	502
	.size	drawEMFReader.part.0, .-drawEMFReader.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEquipment.part.0, %function
drawEquipment.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L46
	ldr	r3, [r3]
	ldr	r2, .L46+4
	ldr	r1, .L46+8
	sub	r3, r3, #26
	ldr	r2, [r2]
	ldr	r1, [r1, #4]
	add	r3, r3, r3, lsr #31
	asr	r3, r3, #1
	add	r0, r2, r3, lsl #8
	add	ip, r1, #47
	cmp	ip, r0
	blt	.L39
	lsl	r3, r3, #8
	add	r0, r2, #160
	add	r3, r0, r3
	cmp	r1, r3
	bge	.L39
	ldr	r3, .L46+12
	mov	r1, r3
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	lr, #388
	mov	r7, r3
	mov	r6, r3
	mov	r4, r3
	mov	r8, #384
	ldr	ip, .L46+16
	lsl	r2, r2, #16
	ldr	r0, [ip]
	lsr	r2, r2, #16
	ldr	r5, .L46+20
	sub	r0, r0, r2
	ldr	fp, [ip, #4]
	and	r0, r0, #255
	ldrh	ip, [r5]
	strh	r0, [r1, #8]!	@ movhi
	ldr	r0, .L46+24
	sub	fp, fp, ip
	ldr	r10, .L46+28
	and	fp, fp, r0
	strh	fp, [r1, #2]	@ movhi
	ldr	r1, .L46+32
	strh	lr, [r3, #36]	@ movhi
	ldr	lr, [r10]
	ldr	fp, [r1]
	ldr	r1, [r1, #4]
	ldr	r9, .L46+36
	sub	lr, lr, r2
	sub	r1, r1, ip
	and	lr, lr, #255
	strh	lr, [r7, #16]!	@ movhi
	and	r1, r1, r0
	ldr	lr, [r9]
	strh	r1, [r3, #2]	@ movhi
	ldr	r1, [r10, #4]
	ldr	r5, .L46+40
	sub	lr, lr, r2
	sub	r1, r1, ip
	and	lr, lr, #255
	ldr	r9, [r9, #4]
	strh	lr, [r6, #24]!	@ movhi
	and	r1, r1, r0
	ldr	lr, [r5]
	strh	r1, [r7, #2]	@ movhi
	sub	r9, r9, ip
	ldr	r1, [r5, #4]
	sub	fp, fp, r2
	sub	r2, lr, r2
	and	lr, r9, r0
	sub	r1, r1, ip
	strh	lr, [r6, #2]	@ movhi
	and	ip, r2, #255
	ldr	lr, [r5, #28]
	strh	ip, [r4, #32]!	@ movhi
	strh	r8, [r3, #4]	@ movhi
	ldr	r7, .L46+44
	add	r8, r8, #1
	and	ip, r1, r0
	strh	r8, [r3, #12]	@ movhi
	and	fp, fp, #255
	add	r8, r8, #1
	lsl	r2, r2, #16
	lsl	r1, r1, #16
	cmp	lr, #1
	strh	fp, [r3]	@ movhi
	strh	r8, [r3, #20]	@ movhi
	strh	r7, [r3, #28]	@ movhi
	strh	ip, [r4, #2]	@ movhi
	lsr	r2, r2, #16
	lsr	r1, r1, #16
	beq	.L45
.L38:
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L39:
	ldr	r2, .L46+12
	mov	r3, #512
	mov	r1, r2
	strh	r3, [r1], #8	@ movhi
	strh	r3, [r2, #16]	@ movhi
	strh	r3, [r1]	@ movhi
	strh	r3, [r2, #24]	@ movhi
	strh	r3, [r2, #32]	@ movhi
	strh	r3, [r2, #64]	@ movhi
	bx	lr
.L45:
	mov	ip, r3
	add	r2, r2, #10
	and	r2, r2, #255
	strh	r2, [ip, #64]!	@ movhi
	add	r1, r1, #10
	ldr	r2, .L46+48
	and	r1, r1, r0
	strh	r1, [ip, #2]	@ movhi
	strh	r2, [r3, #68]	@ movhi
	b	.L38
.L47:
	.align	2
.L46:
	.word	screenBlock
	.word	vOff
	.word	ghostspot
	.word	shadowOAM+832
	.word	ghostbook
	.word	hOff
	.word	511
	.word	videocam
	.word	thermometer
	.word	spiritbox
	.word	uvlight
	.word	387
	.word	389
	.size	drawEquipment.part.0, .-drawEquipment.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateWeapon.part.0, %function
updateWeapon.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L74
	ldrh	r3, [r3]
	ldr	r4, .L74+4
	tst	r3, #2
	sub	sp, sp, #16
	ldr	r3, [r4, #28]
	beq	.L49
	ldr	r2, .L74+8
	ldrh	r2, [r2]
	ands	r5, r2, #2
	beq	.L70
.L49:
	cmp	r3, #19
	ble	.L50
	mov	r2, #0
	ldr	r3, [r4, #16]
	str	r2, [r4, #20]
.L52:
	cmp	r3, #0
	bne	.L53
	mov	r0, #16
	mov	r1, #24
	ldr	r2, .L74+12
	ldr	r3, [r2]
	ldr	r2, [r2, #4]
	add	r3, r3, r0
	str	r3, [r4]
	str	r2, [r4, #4]
	str	r0, [r4, #8]
	str	r1, [r4, #12]
.L54:
	ldr	r5, .L74+16
	ldr	r3, [r5, #32]
	cmp	r3, #0
	beq	.L58
	ldr	r3, [r4, #20]
	cmp	r3, #0
	bne	.L71
.L58:
	ldr	r3, [r4, #28]
	add	r3, r3, #1
	str	r3, [r4, #28]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L53:
	cmp	r3, #1
	beq	.L72
	cmp	r3, #2
	beq	.L73
	cmp	r3, #3
	bne	.L54
	mov	r0, #24
	mov	r1, #16
	ldr	r2, .L74+12
	ldm	r2, {r2, r3}
	sub	r3, r3, #15
	stm	r4, {r2, r3}
	str	r0, [r4, #8]
	str	r1, [r4, #12]
	b	.L54
.L70:
	cmp	r3, #20
	ble	.L49
	ldr	r3, .L74+20
	mov	r2, r5
	ldr	r1, [r3]
	ldr	r0, .L74+24
	ldr	r3, .L74+28
	mov	lr, pc
	bx	r3
	str	r5, [r4, #28]
.L50:
	mov	r2, #1
	ldr	r3, .L74+12
	ldr	r3, [r3, #32]
	str	r2, [r4, #20]
	str	r3, [r4, #16]
	b	.L52
.L72:
	mov	r0, #16
	mov	r1, #24
	ldr	r2, .L74+12
	ldr	r3, [r2]
	ldr	r2, [r2, #4]
	sub	r3, r3, #15
	str	r3, [r4]
	str	r2, [r4, #4]
	str	r0, [r4, #8]
	str	r1, [r4, #12]
	b	.L54
.L71:
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
	ldr	r6, .L74+32
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L58
	mov	ip, #0
	ldr	r2, .L74+36
	ldr	r3, [r2]
	ldr	r1, .L74+40
	add	r3, r3, #300
	str	r3, [r2]
	ldr	r1, [r1]
	mov	r2, #1
	ldr	r0, .L74+44
	ldr	r3, .L74+48
	str	ip, [r5, #32]
	mov	lr, pc
	bx	r3
	b	.L58
.L73:
	mov	r0, #24
	mov	r1, #16
	ldr	r2, .L74+12
	ldm	r2, {r2, r3}
	add	r3, r3, #14
	stm	r4, {r2, r3}
	str	r0, [r4, #8]
	str	r1, [r4, #12]
	b	.L54
.L75:
	.align	2
.L74:
	.word	oldButtons
	.word	weapon
	.word	buttons
	.word	player
	.word	ghost
	.word	gunsound_length
	.word	gunsound_data
	.word	playSoundB
	.word	collision
	.word	score
	.word	gamemusic_length
	.word	gamemusic_data
	.word	playSoundA
	.size	updateWeapon.part.0, .-updateWeapon.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCamera.part.0, %function
updateCamera.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L113
	ldrh	r3, [r3]
	ldr	r5, .L113+4
	tst	r3, #2
	sub	sp, sp, #20
	ldr	r3, [r5, #28]
	beq	.L77
	ldr	r2, .L113+8
	ldrh	r2, [r2]
	ands	r4, r2, #2
	beq	.L107
.L77:
	cmp	r3, #9
	ble	.L78
	mov	r3, #0
	mov	r2, #4
	str	r3, [r5, #16]
	str	r2, [r5, #24]
.L82:
	mov	fp, #1
	ldr	r4, .L113+12
	ldr	r7, .L113+16
	ldr	r10, .L113+20
	ldr	r9, .L113+24
	ldr	r8, .L113+28
	add	r6, r4, #100
.L83:
	cmp	r3, #0
	beq	.L108
	ldr	r2, [r4, #16]
	cmp	r2, #0
	beq	.L109
.L87:
	add	r4, r4, #20
	cmp	r6, r4
	bne	.L83
	cmp	r3, #0
	beq	.L91
	ldr	r4, .L113+32
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L91
	ldr	r3, [r4, #52]
	cmp	r3, #0
	beq	.L110
.L91:
	ldr	r3, [r5, #28]
	add	r3, r3, #1
	str	r3, [r5, #28]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L108:
	add	r4, r4, #20
	cmp	r4, r6
	bne	.L87
	b	.L91
.L107:
	cmp	r3, #10
	ble	.L77
	ldr	r3, .L113+36
	mov	r2, r4
	ldr	r1, [r3]
	ldr	r0, .L113+40
	ldr	r3, .L113+44
	mov	lr, pc
	bx	r3
	str	r4, [r5, #28]
.L78:
	mov	r1, #1
	ldr	r2, .L113+48
	ldr	r3, [r2, #32]
	cmp	r3, #0
	str	r3, [r5, #24]
	str	r1, [r5, #16]
	bne	.L111
	mov	lr, #48
	mov	ip, #32
	ldr	r0, [r2, #4]
	ldr	r3, [r2]
	ldr	r2, [r2, #20]
	sub	r0, r0, #16
	add	r2, r3, r2
.L105:
	mov	r3, r1
	str	r0, [r5, #4]
	str	r2, [r5]
	str	lr, [r5, #8]
	str	ip, [r5, #12]
	b	.L82
.L109:
	add	r0, r4, #8
	ldm	r0, {r0, r1}
	ldm	r4, {r2, r3}
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r5, #8
	ldm	r2, {r2, r3}
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	ldrne	r3, [r8]
	ldrne	r1, [r10]
	ldrne	r2, [r9]
	addne	r3, r3, #100
	addne	r1, r1, #1
	addne	r2, r2, #10
	strne	r3, [r8]
	strne	fp, [r4, #16]
	strne	r1, [r10]
	strne	r2, [r9]
	ldr	r3, [r5, #16]
	b	.L87
.L111:
	cmp	r3, #1
	beq	.L112
	cmp	r3, #2
	bne	.L85
	ldr	r0, [r2, #4]
	ldr	r3, [r2, #16]
	ldr	r2, [r2]
	mov	lr, #32
	mov	ip, #48
	add	r0, r0, r3
	sub	r2, r2, #16
	b	.L105
.L112:
	mov	ip, #48
	mov	r0, #32
	ldr	r1, [r2, #4]
	ldr	r2, [r2]
	sub	r1, r1, #16
	sub	r2, r2, #32
	str	r1, [r5, #4]
	str	r2, [r5]
	str	ip, [r5, #8]
	str	r0, [r5, #12]
	b	.L82
.L110:
	ldm	r4, {r2, r3}
	ldr	r0, [r4, #20]
	ldr	r1, [r4, #16]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r5, #8
	ldm	r2, {r2, r3}
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	ldr	r6, .L113+16
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L91
	mov	ip, #1
	ldr	r0, .L113+28
	ldr	r1, .L113+20
	ldr	r2, [r0]
	ldr	r3, [r1]
	add	r2, r2, #100
	add	r3, r3, ip
	str	r2, [r0]
	str	r3, [r1]
	str	ip, [r4, #52]
	b	.L91
.L85:
	cmp	r3, #3
	bne	.L92
	mov	lr, #32
	mov	ip, #48
	ldm	r2, {r0, r3}
	ldr	r2, [r5, #8]
	sub	r0, r0, #16
	sub	r2, r3, r2
	stm	r5, {r0, r2, lr}
	mov	r3, r1
	str	ip, [r5, #12]
	b	.L82
.L92:
	mov	r3, r1
	b	.L82
.L114:
	.align	2
.L113:
	.word	oldButtons
	.word	camera
	.word	buttons
	.word	occurrences
	.word	collision
	.word	occurrencesCaught
	.word	sanity
	.word	score
	.word	ghost
	.word	camerasound_length
	.word	camerasound_data
	.word	playSoundB
	.word	player
	.size	updateCamera.part.0, .-updateCamera.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCamera.part.0, %function
drawCamera.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #420
	mov	ip, #10
	push	{r4, r5, lr}
	mov	r1, #15
	mov	r4, #30
	mov	lr, #28
	ldr	r2, .L117
	ldr	r3, .L117+4
	ldr	r2, [r2]
	add	r5, r3, #292
	add	r2, r2, #512
	strh	r2, [r5]	@ movhi
	ldr	r2, .L117+8
	strh	r0, [r3, #28]	@ movhi
	add	r0, r3, #272
	strh	ip, [r0]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	ldr	r0, .L117+12
	strh	ip, [r3, #24]	@ movhi
	strh	r2, [r3, #26]	@ movhi
	ldr	ip, .L117+16
	add	r2, r3, #276
	strh	r0, [r2]	@ movhi
	add	r0, r3, #288
	add	r2, r3, #344
	add	r3, r3, #348
	strh	r4, [r0, #2]	@ movhi
	strh	lr, [r2, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r1, [r2]	@ movhi
	strh	ip, [r3]	@ movhi
	pop	{r4, r5, lr}
	bx	lr
.L118:
	.align	2
.L117:
	.word	occurrencesCaught
	.word	shadowOAM
	.word	16394
	.word	422
	.word	523
	.size	drawCamera.part.0, .-drawCamera.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateUVLight.part.0, %function
updateUVLight.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L124
	ldr	r3, [r3, #48]
	cmp	r3, #3
	cmpne	r3, #1
	movls	r2, #1
	ldrls	r3, .L124+4
	strls	r2, [r3, #28]
	bx	lr
.L125:
	.align	2
.L124:
	.word	ghost
	.word	uvlight
	.size	updateUVLight.part.0, .-updateUVLight.part.0
	.align	2
	.global	enableTimerInterrupts
	.syntax unified
	.arm
	.fpu softvfp
	.type	enableTimerInterrupts, %function
enableTimerInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #67108864
	str	lr, [sp, #-4]!
	mov	r1, #0
	mov	lr, #194
	ldrh	r3, [ip, #4]
	ldr	r0, .L128
	orr	r3, r3, #8
	ldrh	r2, [r0]
	strh	r3, [ip, #4]	@ movhi
	ldr	r3, .L128+4
	orr	r2, r2, #33
	strh	r2, [r0]	@ movhi
	strh	r1, [r3, #10]	@ movhi
	strh	r1, [r3, #8]	@ movhi
	strh	lr, [r3, #10]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L129:
	.align	2
.L128:
	.word	67109376
	.word	67109120
	.size	enableTimerInterrupts, .-enableTimerInterrupts
	.align	2
	.global	setupInterrupts
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #67108864
	push	{r4, lr}
	mov	r0, #0
	mov	r4, #1
	mov	lr, #194
	ldrh	r3, [ip, #4]
	ldr	r2, .L132
	orr	r3, r3, #8
	ldrh	r1, [r2]
	strh	r3, [ip, #4]	@ movhi
	ldr	r3, .L132+4
	orr	r1, r1, #33
	strh	r1, [r2]	@ movhi
	strh	r0, [r3, #10]	@ movhi
	ldr	r1, .L132+8
	strh	r4, [r2, #8]	@ movhi
	ldr	r2, .L132+12
	strh	r0, [r3, #8]	@ movhi
	str	r2, [r1, #4092]
	strh	lr, [r3, #10]	@ movhi
	pop	{r4, lr}
	bx	lr
.L133:
	.align	2
.L132:
	.word	67109376
	.word	67109120
	.word	50360320
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r2, #0
	mov	r4, #16
	mov	lr, #1
	mov	r6, #3
	mov	r5, #8
	ldr	r3, .L136
	ldr	r0, .L136+4
	ldr	r1, [r3]
	ldr	r0, [r0]
	ldr	r3, .L136+8
	add	r7, r1, #112
	add	ip, r1, #113
	ldr	r1, .L136+12
	add	r0, r0, #72
	str	r7, [r3, #4]
	str	r6, [r3, #40]
	str	r5, [r1, #12]
	str	r4, [r3, #16]
	str	r4, [r3, #20]
	str	r4, [r1, #8]
	str	lr, [r3, #12]
	str	lr, [r3, #8]
	str	lr, [r3, #28]
	str	ip, [r1, #4]
	str	r0, [r3]
	str	r0, [r1]
	str	r2, [r3, #24]
	str	r2, [r3, #36]
	str	r2, [r3, #32]
	str	r2, [r3, #44]
	str	r2, [r3, #48]
	str	r2, [r1, #20]
	str	r2, [r1, #16]
	str	r2, [r1, #28]
	str	r2, [r1, #24]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L137:
	.align	2
.L136:
	.word	hOff
	.word	vOff
	.word	player
	.word	weapon
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initEquipment
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEquipment, %function
initEquipment:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r6, #8
	mov	r0, #16
	mov	r4, #0
	mov	ip, #1
	ldr	r2, .L140
	ldr	r1, [r2, #20]
	ldr	r3, .L140+4
	add	r1, r1, r6
	str	r1, [r3, #12]
	ldr	r1, [r2]
	str	r1, [r3]
	ldr	r1, [r2, #4]
	str	r1, [r3, #4]
	ldr	r1, [r2, #16]
	ldr	lr, .L140+8
	ldr	r5, [r2, #32]
	add	r2, r1, r0
	str	r2, [r3, #8]
	ldmib	lr, {r1, r2}
	str	r5, [r3, #24]
	ldr	r5, .L140+12
	str	r4, [r3, #16]
	str	r4, [r3, #20]
	str	r4, [r3, #28]
	add	r2, r2, r6
	ldr	r3, .L140+16
	str	r2, [r5, #4]
	ldr	r2, .L140+20
	str	r1, [r5]
	str	r4, [r3]
	str	r4, [r3, #4]
	str	r4, [r3, #16]
	str	ip, [r3, #20]
	str	r4, [r5, #16]
	str	r4, [r5, #20]
	str	r4, [r5, #24]
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	r6, [r5, #8]
	str	r6, [r5, #12]
	mov	lr, pc
	bx	r2
	ldr	r3, .L140+24
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	ldr	r7, [r5, #4]
	rsb	r3, r3, r2, asr #1
	ldr	ip, .L140+28
	add	r3, r3, r3, lsl #2
	ldr	lr, [r5]
	sub	r0, r0, r3
	add	r3, r7, #16
	ldr	r1, .L140+32
	ldr	r2, .L140+36
	str	r3, [ip, #4]
	add	r0, r0, #13
	ldr	r3, .L140+40
	str	r0, [r5, #28]
	str	lr, [ip]
	str	r6, [ip, #8]
	str	r6, [ip, #12]
	str	r4, [ip, #16]
	str	r4, [ip, #20]
	str	r4, [ip, #24]
	str	r4, [ip, #28]
	str	r4, [ip, #32]
	add	r0, r7, #32
	add	ip, lr, #16
	stmib	r2, {r0, r6}
	str	r4, [r5, #32]
	str	r7, [r1, #4]
	str	r6, [r1, #8]
	str	r6, [r1, #12]
	str	r4, [r1, #16]
	str	r4, [r1, #20]
	str	r4, [r1, #24]
	str	r4, [r1, #28]
	str	r4, [r1, #32]
	str	lr, [r2]
	str	r6, [r2, #12]
	str	r4, [r2, #16]
	str	r4, [r2, #20]
	str	r4, [r2, #24]
	str	r4, [r2, #28]
	str	r4, [r2, #32]
	str	ip, [r1]
	str	ip, [r3]
	stmib	r3, {r0, r6}
	str	r6, [r3, #12]
	str	r4, [r3, #16]
	str	r4, [r3, #20]
	str	r4, [r3, #24]
	str	r4, [r3, #28]
	str	r4, [r3, #32]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L141:
	.align	2
.L140:
	.word	player
	.word	camera
	.word	ghostspot
	.word	thermometer
	.word	EMFReader
	.word	rand
	.word	1717986919
	.word	ghostbook
	.word	spiritbox
	.word	videocam
	.word	uvlight
	.size	initEquipment, .-initEquipment
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
	mov	r2, #16
	mov	r3, #1
	push	{r4, r5, r6, lr}
	mov	r0, #3
	mov	r5, #0
	ldr	r4, .L144
	ldr	r1, .L144+4
	str	r2, [r4, #16]
	str	r2, [r4, #20]
	str	r3, [r4, #8]
	str	r3, [r4, #12]
	str	r5, [r4]
	str	r5, [r4, #4]
	str	r5, [r4, #24]
	str	r5, [r4, #36]
	str	r5, [r4, #28]
	str	r5, [r4, #32]
	str	r5, [r4, #44]
	str	r0, [r4, #40]
	mov	lr, pc
	bx	r1
	ldr	r3, .L144+8
	smull	r2, r3, r0, r3
	sub	r3, r3, r0, asr #31
	ldr	r1, [r4, #4]
	ldr	r2, [r4]
	add	r3, r3, r3, lsl #1
	sub	r3, r0, r3, lsl #1
	str	r5, [r4, #52]
	str	r5, [r4, #56]
	str	r3, [r4, #48]
	str	r1, [r4, #64]
	str	r2, [r4, #60]
	pop	{r4, r5, r6, lr}
	bx	lr
.L145:
	.align	2
.L144:
	.word	ghost
	.word	rand
	.word	715827883
	.size	initGhost, .-initGhost
	.align	2
	.global	initghostSpot
	.syntax unified
	.arm
	.fpu softvfp
	.type	initghostSpot, %function
initghostSpot:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L155
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L155+4
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #1
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3
	ldr	r2, .L155+8
	cmp	r3, #0
	str	r3, [r2]
	bne	.L147
	mov	r1, #80
	mov	r3, #32
	stmib	r2, {r1, r3}
.L148:
	mov	r3, #48
	pop	{r4, lr}
	str	r3, [r2, #12]
	str	r3, [r2, #16]
	bx	lr
.L147:
	cmp	r3, #1
	beq	.L153
	cmp	r3, #2
	beq	.L154
	cmp	r3, #3
	moveq	r1, #448
	moveq	r3, #32
	movne	r1, #464
	movne	r3, #336
	stmib	r2, {r1, r3}
	b	.L148
.L153:
	mov	r1, #304
	mov	r3, #160
	stmib	r2, {r1, r3}
	b	.L148
.L154:
	mov	r1, #256
	mov	r3, #288
	stmib	r2, {r1, r3}
	b	.L148
.L156:
	.align	2
.L155:
	.word	rand
	.word	1717986919
	.word	ghostspot
	.size	initghostSpot, .-initghostSpot
	.align	2
	.global	initItems
	.syntax unified
	.arm
	.fpu softvfp
	.type	initItems, %function
initItems:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L163
	mov	r1, #8
	mov	r3, r2
	mov	ip, #0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	add	r0, r2, #120
.L158:
	str	r1, [r3, #12]
	str	r1, [r3, #8]
	str	ip, [r3, #16]
	add	r3, r3, #20
	cmp	r3, r0
	bne	.L158
	ldr	r3, .L163+4
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L159
	mov	r10, #80
	mov	r9, #120
	mov	r8, #224
	mov	r7, #320
	mov	r6, #272
	mov	r5, #448
	mov	r4, #432
	mov	lr, #528
	mov	ip, #96
	mov	r0, #288
	mov	r1, #480
	mov	r3, #160
	stm	r2, {r9, r10}
	str	r8, [r2, #24]
	str	r7, [r2, #20]
	str	r6, [r2, #44]
	str	r5, [r2, #40]
	str	r4, [r2, #64]
	str	lr, [r2, #60]
	str	ip, [r2, #84]
	str	r0, [r2, #80]
	str	r1, [r2, #104]
	str	r3, [r2, #100]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L159:
	ldr	r0, .L163+8
	ldr	r1, [r0, #4]
	ldr	ip, [r0, #20]
	ldr	r3, [r0]
	sub	r0, r1, #16
	add	r3, r3, ip
	sub	lr, r1, #8
	add	ip, r1, #8
	str	r1, [r2, #44]
	str	r0, [r2, #4]
	add	r0, r1, #16
	add	r1, r1, #24
	str	lr, [r2, #24]
	str	ip, [r2, #64]
	str	r0, [r2, #84]
	str	r1, [r2, #104]
	str	r3, [r2]
	str	r3, [r2, #20]
	str	r3, [r2, #40]
	str	r3, [r2, #60]
	str	r3, [r2, #80]
	str	r3, [r2, #100]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L164:
	.align	2
.L163:
	.word	items
	.word	cheat
	.word	player
	.size	initItems, .-initItems
	.align	2
	.global	updateItems
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateItems, %function
updateItems:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r5, .L181
	ldr	r4, .L181+4
	add	r0, r5, #16
	ldm	r5, {r1, r2}
	ldm	r0, {r0, ip}
	ldr	r7, .L181+8
	ldr	r9, .L181+12
	ldr	r8, .L181+16
	ldr	fp, .L181+20
	sub	sp, sp, #20
	add	r6, r4, #120
	b	.L168
.L166:
	add	r4, r4, #20
	cmp	r4, r6
	beq	.L179
.L168:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	bne	.L166
	str	ip, [sp, #12]
	str	r0, [sp, #8]
	str	r1, [sp, #4]
	str	r2, [sp]
	ldr	r3, [r4, #8]
	ldr	r2, [r4, #12]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	ldr	r3, .L181+24
	ldr	ip, .L181+28
	ldr	r1, .L181+32
	ldr	r2, .L181+36
	bne	.L167
	add	r4, r4, #20
	add	r0, r5, #16
	cmp	r4, r6
	ldm	r5, {r1, r2}
	ldm	r0, {r0, ip}
	bne	.L168
.L179:
	mov	r3, #32
	str	r0, [sp, #8]
	str	r1, [sp, #4]
	str	r2, [sp]
	mov	r1, r3
	mov	r2, #24
	mov	r0, #448
	str	ip, [sp, #12]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L169
	ldr	r2, [r9]
	cmp	r2, #6
	beq	.L180
.L170:
	mov	r4, #150
	mov	lr, #36
	mov	r1, #504
	ldr	r3, .L181+40
	ldr	ip, .L181+28
	ldr	r0, .L181+44
	add	r2, r2, #512
	strh	r2, [r3, #140]	@ movhi
	strh	r4, [r3, #136]	@ movhi
	add	r2, r3, #336
	strh	lr, [r3, #138]	@ movhi
	add	r3, r3, #340
	strh	ip, [r2]	@ movhi
	strh	r0, [r2, #2]	@ movhi
	strh	r1, [r3]	@ movhi
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L167:
	mov	r0, #480
	mov	r10, #150
	mov	lr, #107
	strh	ip, [r3, #6]	@ movhi
	ldrh	ip, [fp]
	strh	r0, [r3, #2]	@ movhi
	tst	ip, #1
	add	r0, r5, #16
	strh	r1, [r8, #10]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	strh	r10, [r8]	@ movhi
	strh	lr, [r3]	@ movhi
	ldm	r5, {r1, r2}
	ldm	r0, {r0, ip}
	beq	.L166
	ldr	lr, .L181+48
	ldrh	lr, [lr]
	tst	lr, #1
	bne	.L166
	ldr	lr, [r9]
	add	lr, lr, #1
	mov	r10, #512
	str	lr, [r9]
	mov	lr, #1
	strh	r10, [r8]	@ movhi
	str	lr, [r4, #16]
	strh	r10, [r3, #6]	@ movhi
	b	.L166
.L169:
	mov	r1, #512
	ldr	r3, .L181+52
	strh	r1, [r3], #8	@ movhi
	ldr	r2, [r9]
	strh	r1, [r3]	@ movhi
	b	.L170
.L180:
	ldr	r3, .L181+52
	mov	r5, #150
	mov	r1, r3
	mov	r4, #107
	mov	lr, #480
	mov	ip, #528
	mov	r0, #116
	ldr	r6, .L181+20
	strh	r5, [r3]	@ movhi
	ldrh	r6, [r6]
	add	r5, r5, #16384
	strh	r5, [r1, #8]!	@ movhi
	tst	r6, #1
	strh	r4, [r3, #2]	@ movhi
	strh	lr, [r3, #4]	@ movhi
	strh	ip, [r3, #12]	@ movhi
	strh	r0, [r1, #2]	@ movhi
	beq	.L170
	ldr	r3, .L181+48
	ldrh	r3, [r3]
	tst	r3, #1
	moveq	r1, #1
	ldreq	r3, .L181+56
	streq	r1, [r3]
	b	.L170
.L182:
	.align	2
.L181:
	.word	player
	.word	items
	.word	collision
	.word	itemsCollected
	.word	shadowOAM+384
	.word	oldButtons
	.word	shadowOAM+386
	.word	16534
	.word	16500
	.word	474
	.word	shadowOAM
	.word	16394
	.word	buttons
	.word	shadowOAM+416
	.word	ghostBanished
	.size	updateItems, .-updateItems
	.align	2
	.global	drawItems
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawItems, %function
drawItems:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L191
	ldr	r3, .L191+4
	ldr	r0, [r2]
	push	{r4, r5, r6, r7, r8, r9, lr}
	sub	r0, r0, #26
	ldr	lr, [r3]
	add	r0, r0, r0, lsr #31
	ldr	r3, .L191+8
	asr	r0, r0, #1
	add	r8, lr, #160
	lsl	r5, lr, #16
	ldrh	r7, [r3]
	mov	r1, #0
	mov	r4, #512
	ldr	r3, .L191+12
	ldr	r2, .L191+16
	ldr	r6, .L191+20
	add	lr, lr, r0, lsl #8
	add	r8, r8, r0, lsl #8
	lsr	r5, r5, #16
	b	.L186
.L190:
	ldr	ip, [r3]
	ldr	r0, [r3, #8]
	add	r0, ip, r0
	sub	r0, r0, #1
	cmp	r0, lr
	ble	.L184
	sub	r9, ip, r5
	add	r0, r1, #388
	cmp	ip, r8
	and	r9, r9, #255
	add	r0, r0, #2
	bge	.L184
	ldr	ip, [r3, #4]
	sub	ip, ip, r7
	and	ip, ip, r6
	strh	r9, [r2]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	strh	ip, [r2, #2]	@ movhi
.L185:
	add	r1, r1, #1
	cmp	r1, #6
	add	r3, r3, #20
	add	r2, r2, #8
	beq	.L189
.L186:
	ldr	r0, [r3, #16]
	cmp	r0, #0
	beq	.L190
.L184:
	strh	r4, [r2]	@ movhi
	b	.L185
.L189:
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L192:
	.align	2
.L191:
	.word	screenBlock
	.word	vOff
	.word	hOff
	.word	items
	.word	shadowOAM+720
	.word	511
	.size	drawItems, .-drawItems
	.align	2
	.global	initOccurrences
	.syntax unified
	.arm
	.fpu softvfp
	.type	initOccurrences, %function
initOccurrences:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L199
	mov	r1, #16
	mov	r3, r2
	mov	ip, #0
	push	{r4, r5, lr}
	add	r0, r2, #100
.L194:
	str	r1, [r3, #12]
	str	r1, [r3, #8]
	str	ip, [r3, #16]
	add	r3, r3, #20
	cmp	r3, r0
	bne	.L194
	ldr	r3, .L199+4
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L195
	mov	r3, #480
	mov	r1, #288
	mov	r5, #130
	mov	r4, #140
	mov	lr, #20
	mov	ip, #500
	mov	r0, #360
	str	r3, [r2, #24]
	str	r3, [r2, #84]
	str	r1, [r2, #20]
	sub	r3, r3, #30
	add	r1, r1, #62
	str	r5, [r2]
	str	r4, [r2, #44]
	str	lr, [r2, #64]
	str	ip, [r2, #60]
	str	r0, [r2, #80]
	str	r1, [r2, #4]
	str	r3, [r2, #40]
	pop	{r4, r5, lr}
	bx	lr
.L195:
	ldr	r1, .L199+8
	ldr	r3, [r1]
	ldr	r1, [r1, #4]
	add	lr, r3, #24
	add	ip, r3, #48
	add	r0, r3, #72
	str	r1, [r2, #4]
	str	r1, [r2, #24]
	str	r1, [r2, #44]
	str	r1, [r2, #64]
	str	r1, [r2, #84]
	add	r1, r3, #96
	add	r3, r3, #120
	str	lr, [r2]
	str	ip, [r2, #20]
	str	r0, [r2, #40]
	str	r1, [r2, #60]
	str	r3, [r2, #80]
	pop	{r4, r5, lr}
	bx	lr
.L200:
	.align	2
.L199:
	.word	occurrences
	.word	cheat
	.word	player
	.size	initOccurrences, .-initOccurrences
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
	mov	r3, #0
	mov	r2, #67108864
	mov	r0, #26
	push	{r4, lr}
	mov	r4, #1
	mov	lr, #194
	ldr	r1, .L203
	str	r3, [r1]
	ldr	r1, .L203+4
	str	r3, [r1]
	ldr	r1, .L203+8
	str	r3, [r1]
	ldr	r1, .L203+12
	str	r3, [r1]
	ldr	r1, .L203+16
	str	r3, [r1]
	ldr	r1, .L203+20
	str	r3, [r1]
	ldr	r1, .L203+24
	str	r3, [r1]
	ldr	r1, .L203+28
	str	r3, [r1]
	ldr	r1, .L203+32
	str	r3, [r1]
	ldr	r1, .L203+36
	str	r0, [r1]
	ldrh	r0, [r2, #4]
	ldr	r1, .L203+40
	orr	r0, r0, #8
	strh	r4, [r1, #8]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	ldrh	r0, [r1]
	orr	r0, r0, #33
	strh	r0, [r1]	@ movhi
	ldr	r2, .L203+44
	ldr	r0, .L203+48
	ldr	ip, .L203+52
	strh	r3, [r1, #-246]	@ movhi
	str	r0, [r2, #4092]
	strh	r3, [r1, #-248]	@ movhi
	strh	lr, [r1, #-246]	@ movhi
	str	r3, [ip, #8]
	bl	initPlayer
	bl	initGhost
	bl	initghostSpot
	bl	initEquipment
	bl	initOccurrences
	bl	initItems
	ldr	r3, .L203+56
	mov	r2, r4
	ldr	r1, [r3]
	ldr	r0, .L203+60
	ldr	r3, .L203+64
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L204:
	.align	2
.L203:
	.word	ghostBanished
	.word	seconds
	.word	sanity
	.word	sanityTimer
	.word	hOff
	.word	vOff
	.word	score
	.word	occurrencesCaught
	.word	itemsCollected
	.word	screenBlock
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.word	cursor
	.word	gamemusic_length
	.word	gamemusic_data
	.word	playSoundA
	.size	initGame, .-initGame
	.align	2
	.global	drawOccurrences
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawOccurrences, %function
drawOccurrences:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r0, #0
	mov	r6, #512
	ldr	r2, .L211
	ldr	r3, .L211+4
	ldr	r5, [r2]
	ldr	lr, [r3]
	ldr	r2, .L211+8
	sub	r5, r5, #26
	add	r5, r5, r5, lsr #31
	asr	r3, r5, #1
	lsl	r4, lr, #16
	add	r5, lr, #160
	ldrh	r8, [r2]
	ldr	r1, .L211+12
	ldr	r2, .L211+16
	ldr	r7, .L211+20
	add	lr, lr, r3, lsl #8
	add	r5, r5, r3, lsl #8
	lsr	r4, r4, #16
.L208:
	ldr	ip, [r2]
	ldr	r3, [r2, #8]
	add	r3, ip, r3
	sub	r3, r3, #1
	cmp	r3, lr
	ble	.L206
	sub	r9, ip, r4
	lsl	r3, r0, #1
	cmp	ip, r5
	and	r9, r9, #255
	add	r3, r3, #544
	bge	.L206
	ldr	ip, [r2, #4]
	sub	ip, ip, r8
	and	ip, ip, r7
	orr	ip, ip, #16384
	strh	r9, [r1]	@ movhi
	strh	r3, [r1, #4]	@ movhi
	strh	ip, [r1, #2]	@ movhi
.L207:
	add	r0, r0, #1
	cmp	r0, #5
	add	r2, r2, #20
	add	r1, r1, #8
	bne	.L208
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L206:
	strh	r6, [r1]	@ movhi
	b	.L207
.L212:
	.align	2
.L211:
	.word	screenBlock
	.word	vOff
	.word	hOff
	.word	shadowOAM+944
	.word	occurrences
	.word	511
	.size	drawOccurrences, .-drawOccurrences
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L314
	ldr	r6, .L314+4
	ldr	r8, .L314+8
	ldr	r2, [r6, #32]
	ldr	r3, [r4, #44]
	ldr	r7, .L314+12
	ldr	r1, [r8, #32]
	ldr	r9, .L314+16
	orr	r3, r3, r2
	ldr	r5, .L314+20
	ldr	r2, [r7, #32]
	orr	r3, r3, r1
	ldr	r1, [r9, #32]
	orr	r3, r3, r2
	ldr	r2, [r5, #20]
	orr	r3, r3, r1
	orrs	r3, r3, r2
	sub	sp, sp, #12
	bne	.L305
	ldr	r3, .L314+24
	ldrh	r10, [r3, #48]
	ands	r10, r10, #64
	beq	.L306
.L216:
	ldr	r3, .L314+24
	ldrh	r10, [r3, #48]
	ands	r10, r10, #128
	bne	.L218
	ldr	r2, [r4]
	ldr	r3, [r4, #20]
	add	r2, r2, r3
	cmp	r2, #576
	blt	.L307
.L218:
	ldr	r3, .L314+24
	ldrh	r10, [r3, #48]
	ands	r10, r10, #32
	bne	.L219
	ldr	r3, [r4, #4]
	cmp	r3, #0
	bgt	.L308
.L219:
	ldr	r3, .L314+24
	ldrh	r10, [r3, #48]
	ands	r10, r10, #16
	bne	.L220
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #16]
	add	r3, r3, r2
	cmp	r3, #512
	blt	.L309
.L220:
	mov	r3, #1
	str	r3, [r4, #28]
.L305:
	ldr	r3, .L314+28
	str	r3, [sp, #4]
.L215:
	ldr	r10, .L314+32
	ldr	r3, [r10, #44]
	cmp	r3, #0
	beq	.L310
.L221:
	mov	r1, #512
	ldr	r2, .L314+36
	ldr	r3, .L314+40
	ldrh	r2, [r2]
	strh	r1, [r3], #8	@ movhi
	tst	r2, #256
	strh	r1, [r3]	@ movhi
	and	r3, r2, #1
	beq	.L228
	ldr	r1, .L314+44
	ldrh	r2, [r1]
	tst	r2, #256
	bne	.L228
.L239:
	ldr	r2, [r4, #48]
	add	r2, r2, #1
	cmp	r2, #2
	str	r2, [r4, #48]
	movgt	r2, #0
	strgt	r2, [r4, #48]
	bgt	.L230
	cmp	r2, #1
	beq	.L311
	cmp	r2, #2
	bne	.L232
	mov	r2, #0
	mov	r0, #1
	mov	r1, #30
	ldr	ip, .L314+48
	str	r2, [r5, #24]
	str	r2, [ip, #20]
	ldr	r2, .L314+52
	str	r0, [r2, #20]
	str	r1, [r2, #28]
.L228:
	cmp	r3, #0
	beq	.L234
	ldr	r1, .L314+44
.L233:
	ldrh	r3, [r1]
	tst	r3, #1
	bne	.L234
.L241:
	ldr	r3, .L314+48
	ldr	r3, [r3, #16]
	cmp	r3, #2
	ble	.L234
	ldr	r2, [r10, #32]
	ldr	r3, [r6, #16]
	orrs	r3, r2, r3
	bne	.L234
	mov	r1, #1
	ldr	r3, .L314+56
	ldmib	r3, {r2, r3}
	ldr	r0, .L314+60
	stm	r6, {r2, r3}
	str	r2, [r8]
	str	r2, [r7]
	add	r2, r2, #24
	stm	r9, {r2, r3}
	str	r2, [r0]
	add	r2, r3, #24
	add	r3, r3, #48
	str	r2, [r8, #4]
	str	r3, [r7, #4]
	str	r3, [r0, #4]
	str	r1, [r0, #16]
	str	r1, [r6, #16]
	str	r1, [r8, #16]
	str	r1, [r7, #16]
	str	r1, [r9, #16]
.L234:
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	cmp	r3, #256
	ble	.L236
	ldr	r2, .L314+64
	ldr	r1, [r2]
	cmp	r1, #26
	beq	.L312
.L238:
	mov	r2, #67108864
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [r2, #18]	@ movhi
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L236:
	cmp	r3, #0
	bgt	.L238
	ldr	r2, .L314+64
	ldr	r1, [r2]
	cmp	r1, #28
	bne	.L238
	mov	ip, #26
	mov	r1, #67108864
	ldr	lr, [sp, #4]
	ldr	r0, .L314+68
	add	r3, r3, #256
	str	r3, [lr]
	str	ip, [r2]
	strh	r0, [r1, #8]	@ movhi
	b	.L238
.L310:
	ldr	r2, .L314+72
	mov	r1, #512
	ldr	r3, [r4]
	ldr	r0, [r2]
	ldr	ip, .L314+76
	ldr	r2, [r4, #4]
	mov	lr, pc
	bx	ip
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #4]
	add	r2, r2, r3
	ldr	r3, .L314+72
	mov	fp, r0
	mov	r1, #512
	ldr	r0, [r3]
	ldr	ip, .L314+76
	ldr	r3, [r4]
	sub	r2, r2, #1
	mov	lr, pc
	bx	ip
	mov	ip, r0
	cmp	ip, #2
	cmpne	fp, #2
	ldr	r2, [r4, #20]
	ldr	r3, [r4]
	add	r3, r3, r2
	ldr	r2, .L314+72
	mov	r1, #512
	ldr	r0, [r2]
	ldr	ip, .L314+76
	ldr	r2, [r4, #4]
	sub	r3, r3, #1
	moveq	fp, #1
	movne	fp, #0
	mov	lr, pc
	bx	ip
	mov	ip, r0
	ldr	r1, [r4, #16]
	ldr	r2, [r4, #4]
	ldr	r0, [r4, #20]
	ldr	r3, [r4]
	add	r2, r2, r1
	ldr	r1, .L314+72
	add	r3, r3, r0
	cmp	ip, #2
	orreq	fp, fp, #1
	ldr	r0, [r1]
	ldr	ip, .L314+76
	mov	r1, #512
	sub	r3, r3, #1
	sub	r2, r2, #1
	mov	lr, pc
	bx	ip
	cmp	r0, #2
	orreq	fp, fp, #1
	cmp	fp, #0
	beq	.L221
	ldr	r2, [r4, #44]
	cmp	r2, #0
	bne	.L222
	mov	r1, #496
	mov	lr, #150
	mov	ip, #107
	mov	r0, #480
	mov	fp, #116
	ldr	r3, .L314+80
	strh	r1, [r3, #-4]	@ movhi
	ldr	r1, .L314+84
	strh	ip, [r3, #2]	@ movhi
	strh	lr, [r3]	@ movhi
	strh	r0, [r3, #4]	@ movhi
	strh	r1, [r3, #-8]!	@ movhi
	strh	fp, [r3, #2]	@ movhi
.L223:
	ldr	r3, .L314+36
	ldrh	r1, [r3]
	ands	r3, r1, #1
	and	r0, r1, #256
	beq	.L224
	ldr	r1, .L314+44
	ldrh	ip, [r1]
	ands	lr, ip, #1
	beq	.L313
	cmp	r0, #0
	beq	.L234
.L240:
	tst	ip, #256
	beq	.L239
	b	.L233
.L312:
	mov	ip, #28
	mov	r1, #67108864
	ldr	lr, [sp, #4]
	ldr	r0, .L314+88
	sub	r3, r3, #256
	str	r3, [lr]
	str	ip, [r2]
	strh	r0, [r1, #8]	@ movhi
	b	.L238
.L232:
	cmp	r2, #0
	bne	.L228
.L230:
	mov	r2, #0
	mov	ip, #1
	mov	r0, #30
	ldr	r1, .L314+48
	str	r2, [r1, #20]
	ldr	r1, .L314+52
	str	ip, [r5, #24]
	str	r0, [r5, #28]
	str	r2, [r1, #20]
	b	.L228
.L311:
	mov	r1, #0
	ldr	ip, .L314+52
	ldr	r0, .L314+48
	str	r1, [r5, #24]
	str	r1, [ip, #20]
	str	r2, [r0, #20]
	b	.L228
.L224:
	cmp	r0, #0
	beq	.L234
	ldr	r1, .L314+44
	ldrh	r2, [r1]
	ands	r3, r2, #256
	beq	.L239
	b	.L234
.L222:
	mov	r1, #512
	ldr	r3, .L314+40
	strh	r1, [r3], #8	@ movhi
	strh	r1, [r3]	@ movhi
	b	.L223
.L313:
	cmp	r2, #0
	moveq	r2, #1
	strne	lr, [r4, #44]
	streq	r2, [r4, #44]
	cmp	r0, #0
	beq	.L241
	b	.L240
.L306:
	ldr	r3, [r4]
	cmp	r3, #1
	ble	.L216
	ldr	r2, [r4, #8]
	ldr	fp, .L314+72
	sub	r3, r3, r2
	mov	r1, #512
	ldr	r0, [fp]
	ldr	r2, [r4, #4]
	ldr	ip, .L314+76
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L216
	ldr	r0, [r4, #16]
	ldr	r2, [r4, #4]
	ldr	r1, [r4]
	ldr	r3, [r4, #8]
	add	r2, r2, r0
	sub	r3, r1, r3
	ldr	r0, [fp]
	mov	r1, #512
	ldr	ip, .L314+76
	sub	r2, r2, #1
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L216
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #4]
	ldr	ip, [r4]
	ldr	r1, [r4, #8]
	add	r3, r3, r3, lsr #31
	add	r2, r2, r3, asr #1
	ldr	r0, [fp]
	sub	r3, ip, r1
	sub	r2, r2, #1
	mov	r1, #512
	ldr	ip, .L314+76
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L216
	ldr	r1, [r4]
	ldr	r2, [r4, #8]
	ldr	r3, .L314+64
	sub	r1, r1, r2
	ldr	r3, [r3]
	ldr	r2, .L314+28
	sub	r3, r3, #26
	str	r2, [sp, #4]
	ldr	r2, [r2]
	sub	r3, r1, r3, lsl #7
	sub	r3, r3, r2
	cmp	r3, #80
	movle	r3, #1
	movgt	r3, #0
	cmp	r2, #0
	movle	r3, #0
	mov	r0, #1
	cmp	r3, #0
	str	r10, [r4, #28]
	str	r1, [r4]
	str	r0, [r4, #32]
	ldrne	r3, .L314+28
	subne	r2, r2, #1
	strne	r2, [r3]
	b	.L215
.L308:
	ldr	r2, [r4, #12]
	ldr	fp, .L314+72
	sub	r2, r3, r2
	mov	r1, #512
	ldr	r0, [fp]
	ldr	r3, [r4]
	ldr	ip, .L314+76
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L219
	ldr	r0, [r4, #20]
	ldr	r3, [r4]
	ldr	r1, [r4, #4]
	ldr	r2, [r4, #12]
	add	r3, r3, r0
	sub	r2, r1, r2
	ldr	r0, [fp]
	mov	r1, #512
	ldr	ip, .L314+76
	sub	r3, r3, #1
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L219
	ldr	r0, .L314+92
	ldr	r2, [r4, #4]
	ldr	r1, [r4, #12]
	ldr	r3, [r0]
	sub	r2, r2, r1
	sub	r1, r2, r3
	cmp	r1, #120
	movle	r1, #1
	movgt	r1, #0
	cmp	r3, #0
	movle	r1, #0
	mov	ip, #3
	cmp	r1, #0
	str	r10, [r4, #28]
	str	r2, [r4, #4]
	str	ip, [r4, #32]
	beq	.L305
	sub	r3, r3, #1
	str	r3, [r0]
	ldr	r3, .L314+28
	str	r3, [sp, #4]
	b	.L215
.L307:
	ldr	r3, [r4, #8]
	ldr	fp, .L314+72
	sub	r2, r2, #1
	add	r3, r2, r3
	mov	r1, #512
	ldr	r0, [fp]
	ldr	r2, [r4, #4]
	ldr	ip, .L314+76
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L218
	ldr	r1, [r4, #20]
	ldr	r3, [r4]
	ldr	r0, [r4, #16]
	ldr	r2, [r4, #4]
	add	r3, r3, r1
	ldr	r1, [r4, #8]
	add	r2, r2, r0
	sub	r3, r3, #1
	add	r3, r3, r1
	ldr	r0, [fp]
	mov	r1, #512
	ldr	ip, .L314+76
	sub	r2, r2, #1
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L218
	ldr	r0, [r4, #20]
	ldr	r3, [r4]
	ldr	r2, [r4, #16]
	ldr	r1, [r4, #4]
	ldr	ip, [r4, #8]
	add	r3, r3, r0
	add	r2, r2, r2, lsr #31
	add	r2, r1, r2, asr #1
	sub	r3, r3, #1
	add	r3, r3, ip
	mov	r1, #512
	ldr	r0, [fp]
	ldr	ip, .L314+76
	sub	r2, r2, #1
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L218
	ldr	r3, .L314+28
	ldr	r2, [r4]
	ldr	r1, [r4, #8]
	str	r3, [sp, #4]
	ldr	r3, [r3]
	add	r2, r2, r1
	sub	r1, r2, r3
	ldr	r0, .L314+96
	cmp	r1, #79
	movgt	r1, #1
	movle	r1, #0
	cmp	r3, r0
	movgt	r1, #0
	cmp	r1, #0
	str	r10, [r4, #32]
	str	r10, [r4, #28]
	str	r2, [r4]
	beq	.L215
	cmp	r3, #159
	movgt	r2, #0
	movle	r2, #1
	ldr	r1, .L314+64
	ldr	r1, [r1]
	cmp	r1, #28
	orrne	r2, r2, #1
	cmp	r2, #0
	ldrne	r2, .L314+28
	addne	r3, r3, #1
	strne	r3, [r2]
	b	.L215
.L309:
	ldr	r2, [r4, #12]
	ldr	fp, .L314+72
	sub	r3, r3, #1
	add	r2, r3, r2
	mov	r1, #512
	ldr	r0, [fp]
	ldr	r3, [r4]
	ldr	ip, .L314+76
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L220
	ldr	r2, [r4, #16]
	ldr	r3, [r4, #4]
	ldr	r1, [r4]
	ldr	r0, [r4, #20]
	ldr	ip, [r4, #12]
	add	r3, r3, r2
	sub	r2, r3, #1
	add	r3, r1, r0
	add	r2, r2, ip
	mov	r1, #512
	ldr	r0, [fp]
	ldr	ip, .L314+76
	sub	r3, r3, #1
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L220
	ldr	r0, .L314+92
	ldr	r2, [r4, #4]
	ldr	r1, [r4, #12]
	ldr	r3, [r0]
	add	r2, r2, r1
	sub	r1, r2, r3
	ldr	ip, .L314+100
	cmp	r1, #119
	movgt	r1, #1
	movle	r1, #0
	cmp	r3, ip
	movgt	r1, #0
	mov	ip, #2
	cmp	r1, #0
	str	r10, [r4, #28]
	str	r2, [r4, #4]
	str	ip, [r4, #32]
	beq	.L305
	add	r3, r3, #1
	str	r3, [r0]
	ldr	r3, .L314+28
	str	r3, [sp, #4]
	b	.L215
.L315:
	.align	2
.L314:
	.word	player
	.word	thermometer
	.word	ghostbook
	.word	videocam
	.word	spiritbox
	.word	weapon
	.word	67109120
	.word	vOff
	.word	ghost
	.word	oldButtons
	.word	shadowOAM+368
	.word	buttons
	.word	EMFReader
	.word	camera
	.word	ghostspot
	.word	uvlight
	.word	screenBlock
	.word	-9600
	.word	.LANCHOR0
	.word	collisionCheck
	.word	shadowOAM+376
	.word	16534
	.word	-9088
	.word	hOff
	.word	414
	.word	270
	.size	updatePlayer, .-updatePlayer
	.global	__aeabi_idivmod
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
	push	{r4, r5, r6, lr}
	ldr	r4, .L322
	ldr	r3, .L322+4
	ldr	r5, [r4, #24]
	smull	r1, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #2
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #1
	bne	.L317
	ldr	r0, [r4, #36]
	ldr	r3, .L322+8
	ldr	r1, [r4, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #36]
.L317:
	ldr	r1, [r4, #44]
	cmp	r1, #0
	beq	.L318
	mov	r2, #512
	ldr	r3, .L322+12
	pop	{r4, r5, r6, lr}
	strh	r2, [r3, #56]	@ movhi
	bx	lr
.L318:
	ldr	r2, .L322+16
	ldr	r0, [r2]
	ldr	r2, .L322+20
	ldr	r3, [r4, #4]
	ldr	ip, [r2]
	ldr	r2, [r4]
	sub	r3, r3, r0
	sub	r2, r2, ip
	lsl	r3, r3, #23
	ldr	ip, [r4, #28]
	ldr	r0, .L322+12
	lsr	r3, r3, #23
	cmp	ip, #0
	and	r2, r2, #255
	orr	r3, r3, #16384
	strh	r3, [r0, #58]	@ movhi
	strh	r2, [r0, #56]	@ movhi
	ldr	r3, [r4, #32]
	ldreq	r2, [r4, #36]
	addeq	r3, r3, r2, lsl #5
	addeq	r5, r5, #1
	lslne	r3, r3, #1
	lsleq	r3, r3, #1
	strne	r1, [r4, #36]
	strne	r1, [r4, #24]
	streq	r5, [r4, #24]
	strhne	r3, [r0, #60]	@ movhi
	strheq	r3, [r0, #60]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L323:
	.align	2
.L322:
	.word	player
	.word	1717986919
	.word	__aeabi_idivmod
	.word	shadowOAM
	.word	hOff
	.word	vOff
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	updateEMFReader
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEMFReader, %function
updateEMFReader:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r4, .L341
	ldr	r3, [r4, #32]
	cmp	r3, #0
	sub	sp, sp, #20
	beq	.L325
	ldr	r3, [r4, #48]
	sub	r2, r3, #1
	cmp	r3, #5
	cmpne	r2, #1
	movls	r0, #4
	movhi	r0, #3
	mvnhi	r2, #46336
	ldrls	r1, .L341+4
	ldrls	r3, .L341+8
	ldrls	r2, .L341+12
	ldrhi	r1, .L341+4
	ldrhi	r3, .L341+8
	str	r0, [r1, #16]
	strh	r2, [r3, #4]	@ movhi
.L324:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L325:
	ldr	r6, .L341+16
	ldmib	r6, {r2, r3}
	ldr	r0, [r6, #16]
	ldr	r1, [r6, #12]
	ldr	r5, .L341+20
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	ldr	r7, .L341+24
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L328
	ldr	r3, .L341+28
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L329
	ldr	r3, [r4, #48]
	sub	r2, r3, #1
	cmp	r3, #5
	cmpne	r2, #1
	bhi	.L329
	mov	r0, #4
	ldr	r1, .L341+4
	ldr	r3, .L341+8
	ldr	r2, .L341+12
	str	r0, [r1, #16]
	strh	r2, [r3, #4]	@ movhi
	b	.L330
.L329:
	mov	r0, #3
	mvn	r2, #46336
	ldr	r1, .L341+4
	ldr	r3, .L341+8
	str	r0, [r1, #16]
	strh	r2, [r3, #4]	@ movhi
.L330:
	ldr	r3, .L341+32
	ldr	r3, [r3, #16]
	cmp	r3, #0
	moveq	r0, #150
	moveq	r1, #116
	moveq	r2, #480
	movne	r2, #512
	ldreq	r3, .L341+36
	ldrne	r3, .L341+36
	strheq	r0, [r3]	@ movhi
	strheq	r1, [r3, #2]	@ movhi
	strheq	r2, [r3, #4]	@ movhi
	strhne	r2, [r3]	@ movhi
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L328:
	ldmib	r6, {r2, r3}
	ldr	r0, [r6, #16]
	ldr	r1, [r6, #12]
	add	r0, r0, #96
	add	r1, r1, #96
	sub	r2, r2, #48
	sub	r3, r3, #48
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L332
	mov	lr, #512
	mov	r0, #2
	mvn	r2, #46080
	ldr	ip, .L341+36
	ldr	r1, .L341+4
	ldr	r3, .L341+8
	strh	lr, [ip]	@ movhi
	str	r0, [r1, #16]
	strh	r2, [r3, #4]	@ movhi
	b	.L324
.L332:
	ldmib	r6, {r2, r3}
	ldr	r0, [r6, #16]
	ldr	r1, [r6, #12]
	add	r0, r0, #192
	add	r1, r1, #192
	sub	r2, r2, #96
	sub	r3, r3, #96
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	movne	r0, #1
	ldrne	r1, .L341+4
	ldrne	r3, .L341+8
	ldrne	r2, .L341+40
	ldreq	r1, .L341+4
	ldreq	r3, .L341+8
	ldreq	r2, .L341+44
	str	r0, [r1, #16]
	strh	r2, [r3, #4]	@ movhi
	b	.L324
.L342:
	.align	2
.L341:
	.word	ghost
	.word	EMFReader
	.word	83886592
	.word	20063
	.word	ghostspot
	.word	player
	.word	collision
	.word	cheat
	.word	thermometer
	.word	shadowOAM+464
	.word	19446
	.word	32690
	.size	updateEMFReader, .-updateEMFReader
	.align	2
	.global	drawEMFReader
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEMFReader, %function
drawEMFReader:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L345
	ldr	r3, [r3, #20]
	cmp	r3, #0
	bne	drawEMFReader.part.0
.L344:
	mov	r2, #512
	ldr	r3, .L345+4
	strh	r2, [r3], #-8	@ movhi
	strh	r2, [r3]	@ movhi
	bx	lr
.L346:
	.align	2
.L345:
	.word	EMFReader
	.word	shadowOAM+360
	.size	drawEMFReader, .-drawEMFReader
	.align	2
	.global	drawEquipment
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEquipment, %function
drawEquipment:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L349
	ldr	r3, [r3, #16]
	cmp	r3, #0
	bxeq	lr
	b	drawEquipment.part.0
.L350:
	.align	2
.L349:
	.word	thermometer
	.size	drawEquipment, .-drawEquipment
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
	@ link register save eliminated.
	ldr	r3, .L353
	ldr	r3, [r3, #24]
	cmp	r3, #0
	bxeq	lr
	b	updateWeapon.part.0
.L354:
	.align	2
.L353:
	.word	weapon
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
	ldr	r3, .L371
	ldr	r2, [r3, #20]
	cmp	r2, #0
	beq	.L356
	ldr	r2, [r3, #28]
	cmp	r2, #9
	bgt	.L356
	push	{r4, lr}
	mov	lr, #10
	ldr	r2, .L371+4
	ldr	r1, [r3, #4]
	ldr	r0, [r2]
	ldr	r2, .L371+8
	ldr	ip, [r3]
	sub	r1, r1, r0
	ldr	r0, [r2]
	sub	ip, ip, r0
	ldr	r0, [r3, #16]
	ldr	r3, [r3, #24]
	ldr	r2, .L371+12
	lsl	r1, r1, #23
	and	ip, ip, #255
	cmp	r3, #0
	lsr	r1, r1, #23
	add	r0, r0, #4
	ldr	r4, .L371+16
	orr	r1, r1, #16384
	lsl	r0, r0, #1
	strh	ip, [r2, #8]	@ movhi
	ldrne	r3, .L371+20
	ldr	ip, .L371+24
	strh	r1, [r2, #10]	@ movhi
	strh	r0, [r2, #12]	@ movhi
	add	r1, r2, #272
	add	r0, r2, #276
	strh	lr, [r1]	@ movhi
	strh	r4, [r1, #2]	@ movhi
	strh	ip, [r0]	@ movhi
	strhne	r3, [r2, #28]	@ movhi
	pop	{r4, lr}
	bx	lr
.L356:
	mov	r1, #512
	ldr	r3, [r3, #24]
	cmp	r3, #0
	ldr	r2, .L371+12
	ldrne	r3, .L371+20
	strh	r1, [r2, #8]	@ movhi
	strhne	r3, [r2, #28]	@ movhi
	bx	lr
.L372:
	.align	2
.L371:
	.word	weapon
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.word	16394
	.word	418
	.word	422
	.size	drawWeapon, .-drawWeapon
	.align	2
	.global	updateCamera
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCamera, %function
updateCamera:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L375
	ldr	r3, [r3, #20]
	cmp	r3, #0
	bxeq	lr
	b	updateCamera.part.0
.L376:
	.align	2
.L375:
	.word	camera
	.size	updateCamera, .-updateCamera
	.align	2
	.global	drawCamera
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCamera, %function
drawCamera:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L379
	ldr	r3, [r3, #20]
	cmp	r3, #0
	bne	drawCamera.part.0
.L378:
	mov	r2, #512
	ldr	r3, .L379+4
	strh	r2, [r3], #-56	@ movhi
	strh	r2, [r3]	@ movhi
	bx	lr
.L380:
	.align	2
.L379:
	.word	camera
	.word	shadowOAM+344
	.size	drawCamera, .-drawCamera
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
	push	{r4, r5, r6, lr}
	ldr	r4, .L389
	ldr	r3, .L389+4
	ldr	r5, [r4, #24]
	smull	r1, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #2
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #1
	bne	.L382
	ldr	r0, [r4, #36]
	ldr	r3, .L389+8
	ldr	r1, [r4, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #36]
.L382:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L383
	ldr	r3, .L389+12
	ldr	r3, [r3]
	ldr	r0, .L389+16
	ldr	r1, [r4]
	ldr	r2, [r4, #20]
	sub	r3, r3, #26
	ldr	r0, [r0]
	add	r3, r3, r3, lsr #31
	asr	r3, r3, #1
	add	r2, r1, r2
	add	ip, r0, r3, lsl #8
	sub	r2, r2, #1
	cmp	r2, ip
	lsl	r3, r3, #8
	bgt	.L388
.L384:
	mov	r2, #512
	ldr	r3, .L389+20
	strh	r2, [r3, #16]	@ movhi
.L385:
	add	r5, r5, #1
	str	r5, [r4, #24]
	b	.L386
.L383:
	mov	r2, #512
	ldr	r3, .L389+20
	strh	r2, [r3, #16]	@ movhi
.L386:
	mov	r3, #67108864
	mov	r1, #272
	mov	r2, #2064
	strh	r1, [r3, #80]	@ movhi
	strh	r2, [r3, #82]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L388:
	add	r2, r0, #160
	add	r3, r2, r3
	cmp	r1, r3
	bge	.L384
	ldr	r3, .L389+24
	ldr	r2, [r3]
	ldr	r3, [r4, #4]
	sub	r3, r3, r2
	ldr	r2, [r4, #36]
	add	ip, r2, #3
	ldr	r2, [r4, #28]
	sub	r1, r1, r0
	lsl	r3, r3, #23
	ldr	r0, .L389+20
	and	r1, r1, #255
	lsr	r3, r3, #23
	add	r2, r2, ip, lsl #5
	orr	r1, r1, #1024
	orr	r3, r3, #16384
	lsl	r2, r2, #1
	strh	r1, [r0, #16]	@ movhi
	strh	r3, [r0, #18]	@ movhi
	strh	r2, [r0, #20]	@ movhi
	b	.L385
.L390:
	.align	2
.L389:
	.word	ghost
	.word	1717986919
	.word	__aeabi_idivmod
	.word	screenBlock
	.word	vOff
	.word	shadowOAM
	.word	hOff
	.size	drawGhost, .-drawGhost
	.align	2
	.global	ghostMovement
	.syntax unified
	.arm
	.fpu softvfp
	.type	ghostMovement, %function
ghostMovement:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L412
	ldr	r3, [r4, #28]
	cmp	r3, #2
	beq	.L409
	cmp	r3, #3
	beq	.L410
	cmp	r3, #0
	bne	.L399
	ldr	r2, [r4, #60]
	ldr	r0, [r4, #20]
	ldr	r3, [r4, #56]
	add	r1, r2, r0
	add	r1, r1, r3
	cmp	r1, #528
	bgt	.L411
.L400:
	ldr	r1, [r4]
	add	r3, r2, r3
	cmp	r1, r3
	bge	.L401
	ldr	r3, [r4, #8]
	add	r1, r3, r1
	str	r1, [r4]
.L391:
	pop	{r4, r5, r6, lr}
	bx	lr
.L410:
	ldr	r2, [r4, #64]
	ldr	r3, [r4, #56]
	sub	r3, r2, r3
	cmp	r3, #47
	bgt	.L397
	sub	r2, r2, #48
	cmp	r2, #99
	movle	r3, #2
	str	r2, [r4, #56]
	strle	r3, [r4, #28]
	ble	.L391
	mov	r3, #48
.L397:
	ldr	r2, [r4, #4]
	cmp	r2, r3
	ble	.L398
	ldr	r3, [r4, #12]
	sub	r2, r2, r3
	str	r2, [r4, #4]
	pop	{r4, r5, r6, lr}
	bx	lr
.L409:
	ldr	r2, [r4, #64]
	ldr	r0, [r4, #16]
	ldr	r3, [r4, #56]
	add	r1, r2, r0
	add	r1, r1, r3
	cmp	r1, #464
	ble	.L393
	rsb	r3, r2, #464
	sub	r3, r3, r0
	cmp	r3, #99
	str	r3, [r4, #56]
	movle	r3, #3
	strle	r3, [r4, #28]
	ble	.L391
.L393:
	ldr	r1, [r4, #4]
	add	r3, r2, r3
	cmp	r1, r3
	bge	.L395
	ldr	r3, [r4, #12]
	add	r1, r3, r1
	str	r1, [r4, #4]
	pop	{r4, r5, r6, lr}
	bx	lr
.L399:
	cmp	r3, #1
	bne	.L391
	ldr	r2, [r4, #60]
	ldr	r3, [r4, #56]
	sub	r3, r2, r3
	cmp	r3, #47
	bgt	.L402
	sub	r2, r2, #48
	cmp	r2, #99
	movle	r3, #0
	str	r2, [r4, #56]
	strle	r3, [r4, #28]
	ble	.L391
	mov	r3, #48
.L402:
	ldr	r2, [r4]
	cmp	r2, r3
	ble	.L403
	ldr	r3, [r4, #8]
	sub	r2, r2, r3
	str	r2, [r4]
	b	.L391
.L411:
	rsb	r3, r2, #528
	sub	r3, r3, r0
	cmp	r3, #99
	str	r3, [r4, #56]
	movle	r3, #1
	strle	r3, [r4, #28]
	bgt	.L400
	b	.L391
.L395:
	ldr	r3, [r4]
	ldr	r5, .L412+4
	str	r1, [r4, #64]
	str	r3, [r4, #60]
	mov	lr, pc
	bx	r5
	rsbs	r3, r0, #0
	and	r3, r3, #3
	and	r0, r0, #3
	rsbpl	r0, r3, #0
	str	r0, [r4, #28]
	mov	lr, pc
	bx	r5
	ldr	r3, .L412+8
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #7
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl #4
	add	r0, r0, #200
	str	r0, [r4, #56]
	b	.L391
.L398:
	ldr	r3, [r4]
	ldr	r5, .L412+4
	str	r2, [r4, #64]
	str	r3, [r4, #60]
.L407:
	mov	lr, pc
	bx	r5
	rsbs	r2, r0, #0
	and	r2, r2, #3
	and	r3, r0, #3
	rsbpl	r3, r2, #0
	str	r3, [r4, #28]
	mov	lr, pc
	bx	r5
	ldr	r3, .L412+8
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #7
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #4
	str	r3, [r4, #56]
	pop	{r4, r5, r6, lr}
	bx	lr
.L401:
	ldr	r3, [r4, #4]
	ldr	r5, .L412+4
	str	r1, [r4, #60]
.L408:
	str	r3, [r4, #64]
	b	.L407
.L403:
	ldr	r3, [r4, #4]
	ldr	r5, .L412+4
	str	r2, [r4, #60]
	b	.L408
.L413:
	.align	2
.L412:
	.word	ghost
	.word	rand
	.word	1374389535
	.size	ghostMovement, .-ghostMovement
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
	push	{r4, r5, lr}
	ldr	r3, .L426
	ldr	lr, .L426+4
	ldr	ip, [r3]
	ldr	r1, [lr]
	cmp	ip, r1
	sub	sp, sp, #20
	ble	.L415
	mov	r2, #1
	ldr	r0, [r3, #8]
	str	r2, [r3, #28]
	sub	ip, ip, r0
	ldr	r2, [r3, #4]
	ldr	r0, [lr, #4]
	cmp	r2, r0
	str	ip, [r3]
	ble	.L417
.L425:
	mov	r4, #3
	ldr	r5, [r3, #12]
	sub	r2, r2, r5
	str	r2, [r3, #4]
	str	r4, [r3, #28]
.L418:
	add	r3, r3, #16
	ldm	r3, {r3, r4}
	stm	sp, {r2, ip}
	str	r4, [sp, #12]
	str	r3, [sp, #8]
	add	r2, lr, #16
	ldm	r2, {r2, r3}
	ldr	r4, .L426+8
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	bne	.L424
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L415:
	movlt	r2, #0
	ldrlt	r0, [r3, #8]
	strlt	r2, [r3, #28]
	addlt	ip, ip, r0
	ldr	r2, [r3, #4]
	ldr	r0, [lr, #4]
	strlt	ip, [r3]
	cmp	r2, r0
	bgt	.L425
.L417:
	movlt	r4, #2
	ldrlt	r5, [r3, #12]
	addlt	r2, r2, r5
	strlt	r2, [r3, #4]
	strlt	r4, [r3, #28]
	b	.L418
.L424:
	ldr	r3, .L426+12
	mov	lr, pc
	bx	r3
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L427:
	.align	2
.L426:
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
	ldr	r4, .L440
	ldr	r3, [r4, #32]
	cmp	r3, #0
	sub	sp, sp, #20
	beq	.L428
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L438
	bl	chase
	ldr	r0, .L440+4
	ldr	r3, [r0, #44]
	cmp	r3, #0
	beq	.L439
.L428:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L438:
	bl	ghostMovement
	ldr	r0, .L440+4
	ldr	r3, [r0, #44]
	cmp	r3, #0
	bne	.L428
.L439:
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
	add	r3, r3, r3, lsl #2
	stm	sp, {ip, lr}
	ldr	r5, .L440+8
	add	r2, r2, r2, lsl #2
	sub	r1, r1, #32
	sub	r0, r0, #32
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	movne	r3, #1
	strne	r3, [r4, #44]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L441:
	.align	2
.L440:
	.word	ghost
	.word	player
	.word	collision
	.size	updateGhost, .-updateGhost
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
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r5, .L452
	ldr	r3, [r5]
	cmp	r3, #99
	ldr	r6, .L452+4
	ble	.L451
	ldr	r3, [r6]
	cmp	r3, #3
	bgt	.L449
.L451:
	ldr	r4, .L452+8
.L443:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L444
	ldr	r2, [r6]
	cmp	r2, #0
	ble	.L442
	ldr	r2, [r5]
	cmp	r2, #99
	addle	r2, r2, #1
	strle	r2, [r5]
	strle	r3, [r6]
.L442:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L444:
	mov	r3, #0
	str	r3, [r6]
	str	r3, [r5]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L449:
	mov	r3, #0
	mov	r7, #1
	ldr	r4, .L452+8
	ldr	r8, .L452+12
	str	r3, [r4, #44]
	str	r7, [r4, #32]
	mov	lr, pc
	bx	r8
	ldr	r2, .L452+16
	rsbs	r3, r0, #0
	and	r3, r3, r2
	and	r0, r0, r2
	rsbpl	r0, r3, #0
	str	r0, [r4, #4]
	mov	lr, pc
	bx	r8
	ldr	r3, .L452+20
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #7
	add	r3, r3, r3, lsl #3
	ldr	r2, [r4, #4]
	sub	r3, r0, r3, lsl #6
	str	r2, [r4, #64]
	str	r3, [r4]
	str	r3, [r4, #60]
	mov	lr, pc
	bx	r8
	rsbs	r3, r0, #0
	and	r3, r3, #3
	and	r0, r0, #3
	rsbpl	r0, r3, #0
	str	r0, [r4, #28]
	mov	lr, pc
	bx	r8
	ldr	r3, .L452+24
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #7
	ldr	r1, .L452+28
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #4
	mov	r2, r7
	ldr	r1, [r1]
	ldr	r0, .L452+32
	ldr	r7, .L452+36
	str	r3, [r4, #56]
	mov	lr, pc
	bx	r7
	b	.L443
.L453:
	.align	2
.L452:
	.word	sanity
	.word	sanityTimer
	.word	ghost
	.word	rand
	.word	511
	.word	954437177
	.word	1374389535
	.word	ghostmusic_length
	.word	ghostmusic_data
	.word	playSoundA
	.size	updateSanity, .-updateSanity
	.align	2
	.global	drawSanity
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawSanity, %function
drawSanity:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L459
	ldr	r3, [r3, #32]
	cmp	r3, #0
	push	{r4, r5, r6, lr}
	bne	.L455
	ldr	r3, .L459+4
	ldr	r2, [r3]
	cmp	r2, #99
	ble	.L456
	ldr	r3, .L459+8
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L456
.L455:
	mov	r0, #428
	mov	lr, #432
	mov	r2, #512
	ldr	r3, .L459+12
	ldr	r1, .L459+16
	ldr	ip, .L459+20
	strh	r1, [r3, #90]	@ movhi
	strh	r0, [r3, #92]	@ movhi
	ldr	r1, .L459+24
	add	r0, r3, #280
	strh	ip, [r0, #2]	@ movhi
	add	ip, r3, #284
	strh	lr, [ip]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r1, [r3, #88]	@ movhi
	strh	r2, [r3, #80]	@ movhi
	strh	r2, [r3, #72]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L456:
	ldr	r3, .L459+28
	smull	r0, r1, r3, r2
	mov	ip, #512
	mov	r5, #424
	mov	r4, #214
	mov	lr, #222
	mov	r0, #12
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #5
	add	r3, r3, r3, lsl #2
	ldr	r1, .L459+32
	add	r3, r3, r3, lsl #2
	sub	r3, r2, r3, lsl #2
	smull	r6, r2, r1, r3
	asr	r1, r3, #31
	rsb	r1, r1, r2, asr #2
	add	r2, r1, r1, lsl #2
	sub	r3, r3, r2, lsl #1
	ldr	r2, .L459+12
	add	r3, r3, ip
	add	r1, r1, ip
	strh	r3, [r2, #76]	@ movhi
	ldr	r3, .L459+24
	strh	r1, [r2, #84]	@ movhi
	ldr	r1, .L459+16
	strh	r3, [r2, #88]	@ movhi
	add	r3, r2, #280
	strh	r5, [r2, #92]	@ movhi
	strh	r4, [r2, #82]	@ movhi
	strh	lr, [r2, #74]	@ movhi
	strh	r1, [r2, #90]	@ movhi
	strh	ip, [r3]	@ movhi
	strh	r0, [r2, #80]	@ movhi
	strh	r0, [r2, #72]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L460:
	.align	2
.L459:
	.word	ghost
	.word	sanity
	.word	sanityTimer
	.word	shadowOAM
	.word	-32554
	.word	-32664
	.word	16392
	.word	1374389535
	.word	1717986919
	.size	drawSanity, .-drawSanity
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
	bl	drawWeapon
	bl	drawGhost
	ldr	r3, .L471
	ldr	r3, [r3, #20]
	cmp	r3, #0
	beq	.L462
	bl	drawEMFReader.part.0
.L463:
	ldr	r3, .L471+4
	ldr	r3, [r3, #20]
	cmp	r3, #0
	beq	.L464
	bl	drawCamera.part.0
.L465:
	ldr	r3, .L471+8
	ldr	r3, [r3, #16]
	cmp	r3, #0
	blne	drawEquipment.part.0
.L466:
	bl	drawSanity
	bl	drawOccurrences
	bl	drawItems
	ldr	r3, .L471+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L464:
	mov	r2, #512
	ldr	r3, .L471+16
	strh	r2, [r3], #-56	@ movhi
	strh	r2, [r3]	@ movhi
	b	.L465
.L462:
	mov	r2, #512
	ldr	r3, .L471+20
	strh	r2, [r3], #-8	@ movhi
	strh	r2, [r3]	@ movhi
	b	.L463
.L472:
	.align	2
.L471:
	.word	EMFReader
	.word	camera
	.word	thermometer
	.word	waitForVBlank
	.word	shadowOAM+344
	.word	shadowOAM+360
	.size	drawGame, .-drawGame
	.align	2
	.global	updateThermometer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateThermometer, %function
updateThermometer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L510
	ldr	r3, [r3]
	ldr	r4, .L510+4
	cmp	r3, #0
	sub	sp, sp, #16
	ldr	r3, [r4, #24]
	beq	.L474
	ldr	r2, .L510+8
	ldr	r2, [r2, #48]
	bic	r1, r2, #2
	cmp	r1, #0
	cmpne	r2, #5
	bne	.L474
	mov	r2, #0
	cmp	r3, #1
	str	r2, [r4, #28]
	beq	.L477
.L476:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	bne	.L509
.L473:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L474:
	cmp	r3, #1
	bne	.L476
	ldr	r3, [r4, #28]
	cmp	r3, #0
	ble	.L477
	ldr	r2, .L510+8
	ldr	r2, [r2, #48]
	bic	r1, r2, #2
	cmp	r1, #0
	cmpne	r2, #5
	bne	.L479
.L508:
	sub	r3, r3, #3
	str	r3, [r4, #28]
.L477:
	mov	r3, #4
	str	r3, [r4, #24]
	ldr	r3, [r4, #16]
	cmp	r3, #0
	beq	.L473
.L509:
	ldr	r5, .L510+12
	ldr	ip, [r4, #8]
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	ldr	r6, [r4, #12]
	ldr	lr, [r4]
	str	ip, [sp, #8]
	ldr	ip, [r4, #4]
	str	r6, [sp, #12]
	stm	sp, {ip, lr}
	ldr	r6, .L510+16
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L481
	ldr	r2, [r4, #32]
.L482:
	cmp	r2, #1
	beq	.L485
.L486:
	mov	r2, #512
	ldr	r3, .L510+20
	strh	r2, [r3, #104]	@ movhi
	strh	r2, [r3, #112]	@ movhi
	strh	r2, [r3, #120]	@ movhi
	strh	r2, [r3, #128]	@ movhi
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L481:
	ldr	r3, .L510+24
	ldrh	r3, [r3]
	tst	r3, #1
	ldr	r2, [r4, #32]
	beq	.L483
	ldr	r3, .L510+28
	ldrh	r3, [r3]
	ands	r3, r3, #1
	bne	.L483
	cmp	r2, #0
	bne	.L484
	ldr	r3, .L510+32
	mov	ip, #107
	mov	r1, #480
	mov	r2, r3
	mov	lr, #150
	mov	r0, #1
	strh	ip, [r3, #2]	@ movhi
	ldr	ip, .L510+36
	strh	r1, [r3, #4]	@ movhi
	sub	r1, r1, #10
	strh	lr, [r3]	@ movhi
	strh	ip, [r2, #8]!	@ movhi
	strh	r1, [r3, #12]	@ movhi
	ldr	r3, .L510+40
	str	r0, [r4, #32]
	strh	r3, [r2, #2]	@ movhi
.L485:
	ldm	r4, {r2, r3}
	ldr	r0, [r4, #12]
	ldr	r1, [r4, #8]
	str	r2, [sp, #4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L486
	mov	r3, #512
	mov	r1, #1
	ldr	r2, .L510+20
	ldr	ip, .L510+44
	strh	ip, [r2, #128]	@ movhi
	ldr	ip, .L510+48
	ldr	r0, [r4, #28]
	strh	ip, [r2, #130]	@ movhi
	add	ip, r2, #400
	cmp	r0, #0
	strh	r3, [ip]	@ movhi
	add	ip, r2, #408
	strh	r3, [ip]	@ movhi
	str	r1, [r5, #28]
	movlt	ip, #137
	movlt	r1, #100
	addlt	r3, r3, #10
	strhlt	r3, [r2, #124]	@ movhi
	strhge	r3, [r2, #120]	@ movhi
	ldr	r3, .L510+52
	strhlt	ip, [r2, #120]	@ movhi
	strhlt	r1, [r2, #122]	@ movhi
	smull	ip, r1, r3, r0
	mov	lr, #152
	asr	r3, r0, #31
	rsb	r3, r3, r1, asr #5
	add	r3, r3, r3, lsl #2
	ldr	r1, .L510+56
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #2
	smull	ip, r0, r1, r3
	asr	r1, r3, #31
	rsb	r1, r1, r0, asr #2
	add	r0, r1, r1, lsl #2
	sub	r3, r3, r0, lsl #1
	mov	ip, #118
	mov	r0, #137
	strh	lr, [r2, #132]	@ movhi
	mov	lr, #108
	cmp	r3, #0
	rsblt	r3, r3, #0
	cmp	r1, #0
	rsblt	r1, r1, #0
	add	r3, r3, #512
	add	r1, r1, #512
	strh	r3, [r2, #108]	@ movhi
	strh	r1, [r2, #116]	@ movhi
	strh	r0, [r2, #112]	@ movhi
	strh	r0, [r2, #104]	@ movhi
	strh	lr, [r2, #114]	@ movhi
	strh	ip, [r2, #106]	@ movhi
	b	.L473
.L479:
	cmp	r3, #5
	bgt	.L508
	b	.L477
.L483:
	ldr	r3, .L510+32
	mov	lr, #150
	mov	r0, #480
	mov	r1, r3
	mov	ip, #107
	strh	lr, [r3]	@ movhi
	strh	r0, [r3, #4]	@ movhi
	add	lr, lr, #16384
	sub	r0, r0, #10
	strh	lr, [r1, #8]!	@ movhi
	strh	ip, [r3, #2]	@ movhi
	strh	r0, [r3, #12]	@ movhi
	ldr	r3, .L510+40
	strh	r3, [r1, #2]	@ movhi
	b	.L482
.L484:
	ldr	r2, .L510+32
	mov	r1, r2
	mov	r5, #150
	mov	lr, #107
	mov	ip, #480
	str	r3, [r4, #32]
	ldr	r3, .L510+36
	ldr	r0, .L510+60
	strh	r3, [r1, #8]!	@ movhi
	sub	r3, r3, #34
	strh	r5, [r2]	@ movhi
	strh	lr, [r2, #2]	@ movhi
	strh	ip, [r2, #4]	@ movhi
	strh	r0, [r2, #12]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	b	.L486
.L511:
	.align	2
.L510:
	.word	cheat
	.word	thermometer
	.word	ghost
	.word	player
	.word	collision
	.word	shadowOAM
	.word	oldButtons
	.word	buttons
	.word	shadowOAM+400
	.word	16534
	.word	16500
	.word	16504
	.word	-16296
	.word	1374389535
	.word	1717986919
	.word	470
	.size	updateThermometer, .-updateThermometer
	.align	2
	.global	updateUVLight
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateUVLight, %function
updateUVLight:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L514
	ldr	r3, [r3, #16]
	cmp	r3, #0
	bxeq	lr
	b	updateUVLight.part.0
.L515:
	.align	2
.L514:
	.word	uvlight
	.size	updateUVLight, .-updateUVLight
	.align	2
	.global	updateGhostbook
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGhostbook, %function
updateGhostbook:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L546
	ldr	r3, [r3]
	ldr	r4, .L546+4
	cmp	r3, #0
	sub	sp, sp, #16
	ldr	r3, [r4, #24]
	beq	.L517
	ldr	r2, .L546+8
	ldr	r2, [r2, #48]
	sub	r1, r2, #3
	cmp	r2, #0
	cmpne	r1, #1
	bls	.L544
.L519:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	bne	.L545
.L516:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L544:
	mov	r2, #1
	cmp	r3, r2
	str	r2, [r4, #28]
	beq	.L521
	ldr	r3, [r4, #16]
	cmp	r3, #0
	beq	.L516
.L545:
	ldr	r5, .L546+12
	ldr	ip, [r4, #8]
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	ldr	r6, [r4, #12]
	ldr	lr, [r4]
	str	ip, [sp, #8]
	ldr	ip, [r4, #4]
	str	r6, [sp, #12]
	stm	sp, {ip, lr}
	ldr	r6, .L546+16
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L523
	ldr	r2, [r4, #32]
.L524:
	cmp	r2, #0
	bne	.L527
.L528:
	mov	r2, #512
	ldr	r3, .L546+20
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #40]	@ movhi
	strh	r2, [r3, #48]	@ movhi
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L517:
	cmp	r3, #1
	bne	.L519
	ldr	r3, .L546+8
	ldr	r3, [r3, #48]
	sub	r2, r3, #3
	cmp	r3, #0
	cmpne	r2, #1
	bhi	.L519
.L521:
	mov	r3, #1
	str	r3, [r4, #28]
	b	.L519
.L523:
	ldr	r3, .L546+24
	ldrh	r3, [r3]
	tst	r3, #1
	ldr	r2, [r4, #32]
	beq	.L525
	ldr	r3, .L546+28
	ldrh	r3, [r3]
	ands	r3, r3, #1
	bne	.L525
	cmp	r2, #0
	bne	.L526
	ldr	r3, .L546+32
	mov	ip, #107
	mov	r1, #480
	mov	r2, r3
	mov	lr, #150
	mov	r0, #1
	strh	ip, [r3, #2]	@ movhi
	ldr	ip, .L546+36
	strh	r1, [r3, #4]	@ movhi
	sub	r1, r1, #10
	strh	lr, [r3]	@ movhi
	strh	ip, [r2, #8]!	@ movhi
	strh	r1, [r3, #12]	@ movhi
	ldr	r3, .L546+40
	str	r0, [r4, #32]
	strh	r3, [r2, #2]	@ movhi
.L527:
	ldm	r4, {r2, r3}
	ldr	r0, [r4, #12]
	ldr	r1, [r4, #8]
	str	r2, [sp, #4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L528
	mov	r0, #1
	mov	r1, #80
	mov	r2, #512
	mov	ip, #16
	ldr	r3, [r4, #28]
	cmp	r3, r0
	ldr	r3, .L546+20
	ldr	lr, .L546+44
	str	r0, [r5, #28]
	strh	r1, [r3, #48]	@ movhi
	add	r0, r3, #400
	add	r1, r3, #408
	strh	lr, [r3, #50]	@ movhi
	strh	ip, [r3, #52]	@ movhi
	strh	r2, [r0]	@ movhi
	strh	r2, [r1]	@ movhi
	strhne	r2, [r3]	@ movhi
	strhne	r2, [r3, #40]	@ movhi
	bne	.L516
	mov	ip, #24
	mov	r0, #26
	ldr	r2, .L546+48
	ldr	r1, .L546+52
	strh	ip, [r3, #4]	@ movhi
	strh	r0, [r3, #44]	@ movhi
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	strh	r2, [r3, #40]	@ movhi
	strh	r1, [r3, #42]	@ movhi
	b	.L516
.L525:
	ldr	r3, .L546+32
	mov	lr, #150
	mov	r0, #480
	mov	r1, r3
	mov	ip, #107
	strh	lr, [r3]	@ movhi
	strh	r0, [r3, #4]	@ movhi
	add	lr, lr, #16384
	sub	r0, r0, #10
	strh	lr, [r1, #8]!	@ movhi
	strh	ip, [r3, #2]	@ movhi
	strh	r0, [r3, #12]	@ movhi
	ldr	r3, .L546+40
	strh	r3, [r1, #2]	@ movhi
	b	.L524
.L526:
	ldr	r2, .L546+32
	mov	r1, r2
	mov	r5, #150
	mov	lr, #107
	mov	ip, #480
	str	r3, [r4, #32]
	ldr	r3, .L546+36
	ldr	r0, .L546+56
	strh	r3, [r1, #8]!	@ movhi
	sub	r3, r3, #34
	strh	r5, [r2]	@ movhi
	strh	lr, [r2, #2]	@ movhi
	strh	ip, [r2, #4]	@ movhi
	strh	r0, [r2, #12]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	b	.L528
.L547:
	.align	2
.L546:
	.word	cheat
	.word	ghostbook
	.word	ghost
	.word	player
	.word	collision
	.word	shadowOAM
	.word	oldButtons
	.word	buttons
	.word	shadowOAM+400
	.word	16534
	.word	16500
	.word	-16304
	.word	-32678
	.word	-32646
	.word	470
	.size	updateGhostbook, .-updateGhostbook
	.align	2
	.global	updateVideoCam
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateVideoCam, %function
updateVideoCam:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L579
	ldr	r3, [r3]
	ldr	r4, .L579+4
	cmp	r3, #0
	ldr	r2, [r4, #24]
	sub	sp, sp, #20
	beq	.L549
	ldr	r3, .L579+8
	ldr	r3, [r3, #48]
	sub	r3, r3, #3
	cmp	r3, #2
	bls	.L575
.L551:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	bne	.L576
.L548:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L575:
	mov	r3, #1
	cmp	r2, r3
	str	r3, [r4, #28]
	beq	.L553
	ldr	r3, [r4, #16]
	cmp	r3, #0
	beq	.L548
.L576:
	ldr	r5, .L579+12
	ldr	r6, [r4, #12]
	ldr	ip, [r4, #8]
	add	r2, r5, #16
	ldr	lr, [r4]
	ldm	r2, {r2, r3}
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	str	r6, [sp, #12]
	str	ip, [sp, #8]
	ldr	ip, [r4, #4]
	ldr	r6, .L579+16
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L555
	ldr	r7, [r4, #32]
.L556:
	cmp	r7, #1
	beq	.L577
.L559:
	mov	r2, #512
	ldr	r3, .L579+20
	strh	r2, [r3, #208]	@ movhi
	strh	r2, [r3, #216]	@ movhi
	strh	r2, [r3, #224]	@ movhi
	strh	r2, [r3, #232]	@ movhi
	strh	r2, [r3, #240]	@ movhi
.L573:
	strh	r2, [r3, #248]	@ movhi
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L549:
	cmp	r2, #1
	bne	.L551
	ldr	r3, .L579+8
	ldr	r3, [r3, #48]
	sub	r3, r3, #3
	cmp	r3, #2
	bhi	.L551
.L553:
	mov	r3, #1
	str	r3, [r4, #28]
	b	.L551
.L555:
	ldr	r3, .L579+24
	ldrh	r3, [r3]
	tst	r3, #1
	ldr	r7, [r4, #32]
	beq	.L557
	ldr	r3, .L579+28
	ldrh	r3, [r3]
	ands	r3, r3, #1
	bne	.L557
	cmp	r7, #0
	beq	.L578
	ldr	r2, .L579+32
	mov	r1, r2
	mov	r5, #150
	mov	lr, #107
	mov	ip, #480
	str	r3, [r4, #32]
	ldr	r3, .L579+36
	ldr	r0, .L579+40
	strh	r3, [r1, #8]!	@ movhi
	sub	r3, r3, #34
	strh	r5, [r2]	@ movhi
	strh	lr, [r2, #2]	@ movhi
	strh	ip, [r2, #4]	@ movhi
	strh	r0, [r2, #12]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	b	.L559
.L578:
	mov	r3, #1
	ldr	r8, .L579+44
	str	r3, [r4, #32]
	mov	lr, pc
	bx	r8
	ldr	r7, .L579+48
	smull	r3, r2, r7, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	ldr	r2, .L579+52
	sub	r3, r0, r3, lsl #2
	add	r3, r3, #30
	str	r3, [r2]
	mov	lr, pc
	bx	r8
	smull	r3, r7, r0, r7
	asr	r3, r0, #31
	rsb	r3, r3, r7, asr #6
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	ldr	r2, .L579+56
	sub	r3, r0, r3, lsl #3
	add	r3, r3, #20
	str	r3, [r2]
	ldr	r7, [r4, #32]
.L557:
	ldr	r3, .L579+32
	mov	ip, #150
	mov	r1, #480
	mov	r2, r3
	mov	r0, #107
	strh	ip, [r3]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	add	ip, ip, #16384
	sub	r1, r1, #10
	strh	ip, [r2, #8]!	@ movhi
	strh	r0, [r3, #2]	@ movhi
	strh	r1, [r3, #12]	@ movhi
	ldr	r3, .L579+60
	strh	r3, [r2, #2]	@ movhi
	b	.L556
.L577:
	ldm	r4, {r2, r3}
	ldr	r0, [r4, #12]
	ldr	r1, [r4, #8]
	str	r2, [sp, #4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L559
	mov	r0, #136
	mov	r2, #512
	mov	lr, #0
	mov	ip, #16384
	mov	r1, #144
	mov	fp, #72
	mov	r10, #74
	mov	r9, #76
	mov	r8, #78
	mov	r6, #116
	ldr	r3, [r4, #28]
	cmp	r3, #1
	ldr	r3, .L579+20
	strh	r0, [r3, #244]	@ movhi
	add	r0, r3, #400
	strh	r2, [r0]	@ movhi
	add	r0, r3, #408
	ldr	r4, .L579+64
	strh	r2, [r0]	@ movhi
	ldr	r0, .L579+68
	str	r7, [r5, #28]
	strh	fp, [r3, #212]	@ movhi
	strh	r10, [r3, #220]	@ movhi
	strh	r9, [r3, #228]	@ movhi
	strh	r8, [r3, #236]	@ movhi
	strh	r6, [r3, #242]	@ movhi
	strh	r4, [r3, #240]	@ movhi
	strh	lr, [r3, #208]	@ movhi
	strh	lr, [r3, #216]	@ movhi
	strh	ip, [r3, #210]	@ movhi
	strh	ip, [r3, #226]	@ movhi
	strh	r0, [r3, #218]	@ movhi
	strh	r0, [r3, #234]	@ movhi
	strh	r1, [r3, #224]	@ movhi
	strh	r1, [r3, #232]	@ movhi
	bne	.L573
	ldr	ip, .L579+72
	ldr	r1, .L579+76
	ldr	r2, [ip]
	smull	lr, r0, r1, r2
	asr	r1, r2, #31
	rsb	r1, r1, r0, asr #2
	ldr	lr, .L579+52
	add	r1, r1, r1, lsl #2
	cmp	r2, r1, lsl #1
	ldr	r0, [lr]
	bne	.L561
	cmp	r0, #100
	subgt	r0, r0, #1
	addle	r0, r0, #1
	str	r0, [lr]
.L561:
	mov	lr, #396
	ldr	r1, .L579+56
	ldr	r1, [r1]
	lsl	r1, r1, #23
	add	r2, r2, #1
	and	r0, r0, #255
	lsr	r1, r1, #23
	str	r2, [ip]
	strh	r0, [r3, #248]	@ movhi
	strh	r1, [r3, #250]	@ movhi
	strh	lr, [r3, #252]	@ movhi
	b	.L548
.L580:
	.align	2
.L579:
	.word	cheat
	.word	videocam
	.word	ghost
	.word	player
	.word	collision
	.word	shadowOAM
	.word	oldButtons
	.word	buttons
	.word	shadowOAM+400
	.word	16534
	.word	470
	.word	rand
	.word	1374389535
	.word	orbRow
	.word	orbCol
	.word	16500
	.word	16392
	.word	16608
	.word	orbTimer
	.word	1717986919
	.size	updateVideoCam, .-updateVideoCam
	.align	2
	.global	updateSpiritBox
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateSpiritBox, %function
updateSpiritBox:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L614
	ldr	r3, [r3]
	ldr	r4, .L614+4
	cmp	r3, #0
	sub	sp, sp, #16
	ldr	r3, [r4, #24]
	beq	.L582
	ldr	r2, .L614+8
	ldr	r2, [r2, #48]
	sub	r1, r2, #1
	cmp	r2, #4
	cmpne	r1, #1
	bls	.L610
.L584:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	bne	.L611
.L581:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L610:
	mov	r2, #1
	cmp	r3, r2
	str	r2, [r4, #28]
	beq	.L586
	ldr	r3, [r4, #16]
	cmp	r3, #0
	beq	.L581
.L611:
	ldr	r5, .L614+12
	ldr	ip, [r4, #8]
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldr	r6, [r4, #12]
	ldr	lr, [r4]
	str	ip, [sp, #8]
	ldr	ip, [r4, #4]
	str	r6, [sp, #12]
	stm	sp, {ip, lr}
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	ldr	r6, .L614+16
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L589
	ldr	r2, [r4, #32]
	cmp	r2, #0
	bne	.L612
.L593:
	mov	r1, #128
	ldr	r2, .L614+20
	ldr	r3, .L614+24
	strh	r1, [r2, #2]	@ movhi
	ldr	r3, [r3]
	ldr	r0, .L614+28
	ldr	r1, .L614+32
	cmp	r3, r1
	cmpne	r3, r0
	moveq	r3, #0
	strheq	r3, [r2, #6]	@ movhi
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L582:
	cmp	r3, #1
	bne	.L584
	ldr	r3, .L614+8
	ldr	r3, [r3, #48]
	sub	r2, r3, #1
	cmp	r3, #4
	cmpne	r2, #1
	bhi	.L584
.L586:
	mov	r3, #1
	str	r3, [r4, #28]
	b	.L584
.L589:
	ldr	r3, .L614+36
	ldrh	r3, [r3]
	tst	r3, #1
	ldr	r2, [r4, #32]
	beq	.L591
	ldr	r3, .L614+40
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L591
	rsbs	r3, r2, #1
	movcc	r3, #0
	ldr	r2, [r4, #28]
	cmp	r2, #1
	str	r3, [r4, #32]
	ldreq	r3, .L614+44
	ldrne	r3, .L614+48
	movne	r2, #1
	ldreq	r1, [r3]
	ldrne	r1, [r3]
	ldreq	r0, .L614+32
	ldrne	r0, .L614+28
	ldr	r3, .L614+52
	mov	lr, pc
	bx	r3
	ldr	r2, [r4, #32]
.L591:
	ldr	r3, .L614+56
	mov	lr, #150
	mov	r0, #480
	mov	r1, r3
	mov	ip, #107
	strh	lr, [r3]	@ movhi
	strh	r0, [r3, #4]	@ movhi
	add	lr, lr, #16384
	sub	r0, r0, #10
	strh	lr, [r1, #8]!	@ movhi
	strh	ip, [r3, #2]	@ movhi
	strh	r0, [r3, #12]	@ movhi
	ldr	r3, .L614+60
	cmp	r2, #0
	strh	r3, [r1, #2]	@ movhi
	beq	.L593
.L612:
	ldm	r4, {r2, r3}
	ldr	r0, [r4, #12]
	ldr	r1, [r4, #8]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L593
	mov	r1, #0
	ldr	r2, [r4, #28]
	ldr	r3, .L614+20
	cmp	r2, #1
	strh	r1, [r3, #2]	@ movhi
	beq	.L613
.L594:
	mov	r2, #512
	mov	r1, #1
	ldr	r3, .L614+56
	strh	r2, [r3], #8	@ movhi
	str	r1, [r5, #28]
	strh	r2, [r3]	@ movhi
	b	.L581
.L613:
	ldr	r1, .L614+24
	ldr	r3, .L614+28
	ldr	r1, [r1]
	cmp	r1, r3
	bne	.L594
	ldr	r3, .L614+44
	ldr	r0, .L614+32
	ldr	r1, [r3]
	ldr	r3, .L614+52
	mov	lr, pc
	bx	r3
	b	.L594
.L615:
	.align	2
.L614:
	.word	cheat
	.word	spiritbox
	.word	ghost
	.word	player
	.word	collision
	.word	67109120
	.word	soundB
	.word	staticsound_data
	.word	spiritboxsound_data
	.word	oldButtons
	.word	buttons
	.word	spiritboxsound_length
	.word	staticsound_length
	.word	playSoundB
	.word	shadowOAM+400
	.word	16500
	.size	updateSpiritBox, .-updateSpiritBox
	.align	2
	.global	hideText
	.syntax unified
	.arm
	.fpu softvfp
	.type	hideText, %function
hideText:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r3, .L628
	ldr	r0, [r3, #12]
	ldr	r1, [r3, #8]
	ldm	r3, {r2, r3}
	sub	sp, sp, #20
	ldr	r4, .L628+4
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	ldr	r7, .L628+8
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L626
.L618:
	mov	r6, #6
	mov	r8, #512
	ldr	r5, .L628+12
	ldr	r9, .L628+16
	b	.L623
.L621:
	subs	r6, r6, #1
	beq	.L627
.L623:
	ldm	r4, {r2, r3}
	ldr	r0, [r4, #20]
	ldr	r1, [r4, #16]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r2, [r5, #12]
	ldr	r3, [r5, #8]
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L621
	ldm	r4, {r2, r3}
	ldr	r0, [r4, #20]
	ldr	r1, [r4, #16]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r2, [r5, #32]
	ldr	r3, [r5, #28]
	ldr	r1, [r5, #20]
	ldr	r0, [r5, #24]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L621
	ldm	r4, {r2, r3}
	ldr	r0, [r4, #20]
	ldr	r1, [r4, #16]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r2, [r5, #52]
	ldr	r3, [r5, #48]
	ldr	r1, [r5, #40]
	ldr	r0, [r5, #44]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L621
	ldm	r4, {r2, r3}
	ldr	r0, [r4, #20]
	ldr	r1, [r4, #16]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r2, [r5, #72]
	ldr	r3, [r5, #68]
	ldr	r1, [r5, #60]
	ldr	r0, [r5, #64]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L621
	ldm	r4, {r2, r3}
	ldr	r0, [r4, #20]
	ldr	r1, [r4, #16]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r2, [r5, #92]
	ldr	r3, [r5, #88]
	ldr	r1, [r5, #80]
	ldr	r0, [r5, #84]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L621
	ldm	r4, {r2, r3}
	ldr	r0, [r4, #20]
	ldr	r1, [r4, #16]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r2, [r5, #112]
	ldr	r3, [r5, #108]
	ldr	r1, [r5, #100]
	ldr	r0, [r5, #104]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	ldreq	r3, .L628+20
	strheq	r8, [r9]	@ movhi
	strheq	r8, [r3]	@ movhi
	b	.L621
.L627:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L626:
	ldr	r3, .L628+24
	ldr	r0, [r3, #12]
	ldr	r1, [r3, #8]
	ldm	r3, {r2, r3}
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L618
	ldr	r3, .L628+28
	ldr	r0, [r3, #12]
	ldr	r1, [r3, #8]
	ldm	r3, {r2, r3}
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L618
	ldr	r3, .L628+32
	ldr	r0, [r3, #12]
	ldr	r1, [r3, #8]
	ldm	r3, {r2, r3}
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	moveq	r2, #512
	ldreq	r3, .L628+36
	strheq	r2, [r3], #8	@ movhi
	strheq	r2, [r3]	@ movhi
	b	.L618
.L629:
	.align	2
.L628:
	.word	spiritbox
	.word	player
	.word	collision
	.word	items
	.word	shadowOAM+384
	.word	shadowOAM+392
	.word	videocam
	.word	ghostbook
	.word	thermometer
	.word	shadowOAM+400
	.size	hideText, .-hideText
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
	bl	updateSanity
	bl	updateGhost
	ldr	r3, .L644
	ldr	r3, [r3, #24]
	cmp	r3, #0
	blne	updateWeapon.part.0
.L631:
	bl	updateEMFReader
	bl	updateThermometer
	ldr	r3, .L644+4
	ldr	r3, [r3, #16]
	cmp	r3, #0
	blne	updateUVLight.part.0
.L632:
	bl	updateGhostbook
	bl	updateVideoCam
	bl	updateSpiritBox
	ldr	r3, .L644+8
	ldr	r3, [r3, #20]
	cmp	r3, #0
	blne	updateCamera.part.0
.L633:
	bl	updateItems
	bl	hideText
	mov	r2, #67108864
	ldr	r3, .L644+12
	ldrh	r1, [r3]
	ldr	r3, .L644+16
	strh	r1, [r2, #16]	@ movhi
	ldrh	r1, [r3]
	ldr	r4, .L644+20
	strh	r1, [r2, #18]	@ movhi
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L644+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L645:
	.align	2
.L644:
	.word	weapon
	.word	uvlight
	.word	camera
	.word	hOff
	.word	vOff
	.word	DMANow
	.word	shadowOAM
	.size	updateGame, .-updateGame
	.global	collisionMap
	.comm	camera,32,4
	.comm	ghostspot,20,4
	.comm	uvlight,36,4
	.comm	spiritbox,36,4
	.comm	videocam,36,4
	.comm	ghostbook,36,4
	.comm	thermometer,36,4
	.comm	EMFReader,24,4
	.comm	ghost,68,4
	.comm	weapon,32,4
	.comm	player,52,4
	.comm	items,120,4
	.comm	occurrences,100,4
	.comm	shadowOAM,1024,4
	.comm	emptyTile,4,4
	.comm	checkTile,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
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
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	collisionMap, %object
	.size	collisionMap, 4
collisionMap:
	.word	collisionmapBitmap
	.ident	"GCC: (devkitARM release 53) 9.1.0"
