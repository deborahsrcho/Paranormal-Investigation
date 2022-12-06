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
	ldr	r3, .L162
	ldr	r3, [r3]
	cmp	r3, #0
	push	{r4, lr}
	beq	.L159
	mov	r2, #0
	ldr	r3, .L162+4
	str	r2, [r3]
.L148:
	mov	r1, #80
	mov	r2, #32
	stmib	r3, {r1, r2}
.L150:
	mov	r2, #48
	pop	{r4, lr}
	str	r2, [r3, #12]
	str	r2, [r3, #16]
	bx	lr
.L159:
	ldr	r3, .L162+8
	mov	lr, pc
	bx	r3
	ldr	r2, .L162+12
	smull	r1, r3, r2, r0
	asr	r2, r0, #31
	rsb	r2, r2, r3, asr #1
	add	r2, r2, r2, lsl #2
	sub	r2, r0, r2
	ldr	r3, .L162+4
	cmp	r2, #0
	str	r2, [r3]
	beq	.L148
	cmp	r2, #1
	beq	.L160
	cmp	r2, #2
	beq	.L161
	cmp	r2, #3
	moveq	r1, #448
	moveq	r2, #32
	movne	r1, #464
	movne	r2, #336
	stmib	r3, {r1, r2}
	b	.L150
.L160:
	mov	r1, #304
	mov	r2, #160
	stmib	r3, {r1, r2}
	b	.L150
.L161:
	mov	r1, #256
	mov	r2, #288
	stmib	r3, {r1, r2}
	b	.L150
.L163:
	.align	2
.L162:
	.word	cheat
	.word	ghostspot
	.word	rand
	.word	1717986919
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
	ldr	r2, .L170
	mov	r1, #8
	mov	r3, r2
	mov	ip, #0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	add	r0, r2, #120
.L165:
	str	r1, [r3, #12]
	str	r1, [r3, #8]
	str	ip, [r3, #16]
	add	r3, r3, #20
	cmp	r3, r0
	bne	.L165
	ldr	r3, .L170+4
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L166
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
.L166:
	ldr	r0, .L170+8
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
.L171:
	.align	2
.L170:
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
	ldr	r5, .L188
	ldr	r4, .L188+4
	add	r0, r5, #16
	ldm	r5, {r1, r2}
	ldm	r0, {r0, ip}
	ldr	r7, .L188+8
	ldr	r9, .L188+12
	ldr	r8, .L188+16
	ldr	fp, .L188+20
	sub	sp, sp, #20
	add	r6, r4, #120
	b	.L175
.L173:
	add	r4, r4, #20
	cmp	r4, r6
	beq	.L186
.L175:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	bne	.L173
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
	ldr	r3, .L188+24
	ldr	ip, .L188+28
	ldr	r1, .L188+32
	ldr	r2, .L188+36
	bne	.L174
	add	r4, r4, #20
	add	r0, r5, #16
	cmp	r4, r6
	ldm	r5, {r1, r2}
	ldm	r0, {r0, ip}
	bne	.L175
.L186:
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
	beq	.L176
	ldr	r2, [r9]
	cmp	r2, #6
	beq	.L187
.L177:
	mov	r4, #150
	mov	lr, #36
	mov	r1, #504
	ldr	r3, .L188+40
	ldr	ip, .L188+28
	ldr	r0, .L188+44
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
.L174:
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
	beq	.L173
	ldr	lr, .L188+48
	ldrh	lr, [lr]
	tst	lr, #1
	bne	.L173
	ldr	lr, [r9]
	add	lr, lr, #1
	mov	r10, #512
	str	lr, [r9]
	mov	lr, #1
	strh	r10, [r8]	@ movhi
	str	lr, [r4, #16]
	strh	r10, [r3, #6]	@ movhi
	b	.L173
.L176:
	mov	r1, #512
	ldr	r3, .L188+52
	strh	r1, [r3], #8	@ movhi
	ldr	r2, [r9]
	strh	r1, [r3]	@ movhi
	b	.L177
.L187:
	ldr	r3, .L188+52
	mov	r5, #150
	mov	r1, r3
	mov	r4, #107
	mov	lr, #480
	mov	ip, #528
	mov	r0, #116
	ldr	r6, .L188+20
	strh	r5, [r3]	@ movhi
	ldrh	r6, [r6]
	add	r5, r5, #16384
	strh	r5, [r1, #8]!	@ movhi
	tst	r6, #1
	strh	r4, [r3, #2]	@ movhi
	strh	lr, [r3, #4]	@ movhi
	strh	ip, [r3, #12]	@ movhi
	strh	r0, [r1, #2]	@ movhi
	beq	.L177
	ldr	r3, .L188+48
	ldrh	r3, [r3]
	tst	r3, #1
	moveq	r1, #1
	ldreq	r3, .L188+56
	streq	r1, [r3]
	b	.L177
.L189:
	.align	2
.L188:
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
	ldr	r2, .L198
	ldr	r3, .L198+4
	ldr	r0, [r2]
	push	{r4, r5, r6, r7, r8, r9, lr}
	sub	r0, r0, #26
	ldr	lr, [r3]
	add	r0, r0, r0, lsr #31
	ldr	r3, .L198+8
	asr	r0, r0, #1
	add	r8, lr, #160
	lsl	r5, lr, #16
	ldrh	r7, [r3]
	mov	r1, #0
	mov	r4, #512
	ldr	r3, .L198+12
	ldr	r2, .L198+16
	ldr	r6, .L198+20
	add	lr, lr, r0, lsl #8
	add	r8, r8, r0, lsl #8
	lsr	r5, r5, #16
	b	.L193
.L197:
	ldr	ip, [r3]
	ldr	r0, [r3, #8]
	add	r0, ip, r0
	sub	r0, r0, #1
	cmp	r0, lr
	ble	.L191
	sub	r9, ip, r5
	add	r0, r1, #388
	cmp	ip, r8
	and	r9, r9, #255
	add	r0, r0, #2
	bge	.L191
	ldr	ip, [r3, #4]
	sub	ip, ip, r7
	and	ip, ip, r6
	strh	r9, [r2]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	strh	ip, [r2, #2]	@ movhi
.L192:
	add	r1, r1, #1
	cmp	r1, #6
	add	r3, r3, #20
	add	r2, r2, #8
	beq	.L196
.L193:
	ldr	r0, [r3, #16]
	cmp	r0, #0
	beq	.L197
.L191:
	strh	r4, [r2]	@ movhi
	b	.L192
.L196:
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L199:
	.align	2
.L198:
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
	ldr	r2, .L206
	mov	r1, #16
	mov	r3, r2
	mov	ip, #0
	push	{r4, r5, lr}
	add	r0, r2, #100
.L201:
	str	r1, [r3, #12]
	str	r1, [r3, #8]
	str	ip, [r3, #16]
	add	r3, r3, #20
	cmp	r3, r0
	bne	.L201
	ldr	r3, .L206+4
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L202
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
.L202:
	ldr	r1, .L206+8
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
.L207:
	.align	2
.L206:
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
	ldr	r1, .L210
	str	r3, [r1]
	ldr	r1, .L210+4
	str	r3, [r1]
	ldr	r1, .L210+8
	str	r3, [r1]
	ldr	r1, .L210+12
	str	r3, [r1]
	ldr	r1, .L210+16
	str	r3, [r1]
	ldr	r1, .L210+20
	str	r3, [r1]
	ldr	r1, .L210+24
	str	r3, [r1]
	ldr	r1, .L210+28
	str	r3, [r1]
	ldr	r1, .L210+32
	str	r3, [r1]
	ldr	r1, .L210+36
	str	r0, [r1]
	ldrh	r0, [r2, #4]
	ldr	r1, .L210+40
	orr	r0, r0, #8
	strh	r4, [r1, #8]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	ldrh	r0, [r1]
	orr	r0, r0, #33
	strh	r0, [r1]	@ movhi
	ldr	r2, .L210+44
	ldr	r0, .L210+48
	ldr	ip, .L210+52
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
	ldr	r3, .L210+56
	mov	r2, r4
	ldr	r1, [r3]
	ldr	r0, .L210+60
	ldr	r3, .L210+64
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L211:
	.align	2
.L210:
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
	ldr	r2, .L218
	ldr	r3, .L218+4
	ldr	r5, [r2]
	ldr	lr, [r3]
	ldr	r2, .L218+8
	sub	r5, r5, #26
	add	r5, r5, r5, lsr #31
	asr	r3, r5, #1
	lsl	r4, lr, #16
	add	r5, lr, #160
	ldrh	r8, [r2]
	ldr	r1, .L218+12
	ldr	r2, .L218+16
	ldr	r7, .L218+20
	add	lr, lr, r3, lsl #8
	add	r5, r5, r3, lsl #8
	lsr	r4, r4, #16
.L215:
	ldr	ip, [r2]
	ldr	r3, [r2, #8]
	add	r3, ip, r3
	sub	r3, r3, #1
	cmp	r3, lr
	ble	.L213
	sub	r9, ip, r4
	lsl	r3, r0, #1
	cmp	ip, r5
	and	r9, r9, #255
	add	r3, r3, #544
	bge	.L213
	ldr	ip, [r2, #4]
	sub	ip, ip, r8
	and	ip, ip, r7
	orr	ip, ip, #16384
	strh	r9, [r1]	@ movhi
	strh	r3, [r1, #4]	@ movhi
	strh	ip, [r1, #2]	@ movhi
.L214:
	add	r0, r0, #1
	cmp	r0, #5
	add	r2, r2, #20
	add	r1, r1, #8
	bne	.L215
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L213:
	strh	r6, [r1]	@ movhi
	b	.L214
.L219:
	.align	2
.L218:
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
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L332
	ldr	r6, .L332+4
	ldr	r7, .L332+8
	ldr	r2, [r6, #32]
	ldr	r3, [r4, #44]
	ldr	r9, .L332+12
	ldr	r1, [r7, #32]
	ldr	r8, .L332+16
	orr	r3, r3, r2
	ldr	r5, .L332+20
	ldr	r2, [r9, #32]
	orr	r3, r3, r1
	ldr	r1, [r8, #32]
	orr	r3, r3, r2
	ldr	r2, [r5, #20]
	orr	r3, r3, r1
	orrs	r3, r3, r2
	bne	.L322
	ldr	r3, .L332+24
	ldrh	r10, [r3, #48]
	ands	r10, r10, #64
	beq	.L323
.L223:
	ldr	r3, .L332+24
	ldrh	r10, [r3, #48]
	ands	r10, r10, #128
	bne	.L225
	ldr	r2, [r4]
	ldr	r3, [r4, #20]
	add	r2, r2, r3
	cmp	r2, #576
	blt	.L324
.L225:
	ldr	r3, .L332+24
	ldrh	r10, [r3, #48]
	ands	r10, r10, #32
	bne	.L226
	ldr	r3, [r4, #4]
	cmp	r3, #0
	bgt	.L325
.L226:
	ldr	r3, .L332+24
	ldrh	r10, [r3, #48]
	ands	r10, r10, #16
	bne	.L227
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #16]
	add	r3, r3, r2
	cmp	r3, #512
	blt	.L326
.L227:
	mov	r3, #1
	str	r3, [r4, #28]
.L322:
	ldr	fp, .L332+28
.L222:
	ldr	r10, .L332+32
	ldr	r3, [r10, #44]
	cmp	r3, #0
	beq	.L327
.L228:
	mov	r1, #512
	ldr	r2, .L332+36
	ldr	r3, .L332+40
	ldrh	r2, [r2]
	strh	r1, [r3], #8	@ movhi
	tst	r2, #256
	strh	r1, [r3]	@ movhi
	and	r2, r2, #1
	beq	.L238
	ldr	r3, .L332+44
	ldrh	r3, [r3]
	tst	r3, #256
	bne	.L238
.L249:
	ldr	r3, [r4, #48]
	add	r3, r3, #1
	cmp	r3, #2
	str	r3, [r4, #48]
	movgt	r3, #0
	strgt	r3, [r4, #48]
	bgt	.L240
	cmp	r3, #1
	beq	.L328
	cmp	r3, #2
	bne	.L242
	mov	r3, #0
	mov	r0, #1
	mov	r1, #30
	ldr	ip, .L332+48
	str	r3, [r5, #24]
	str	r3, [ip, #20]
	ldr	r3, .L332+52
	str	r0, [r3, #20]
	str	r1, [r3, #28]
.L238:
	cmp	r2, #0
	beq	.L244
	ldr	r3, .L332+44
.L243:
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L244
.L251:
	ldr	r3, .L332+48
	ldr	r3, [r3, #16]
	cmp	r3, #2
	bgt	.L329
.L244:
	ldr	r3, [fp]
	cmp	r3, #256
	ble	.L246
	ldr	r2, .L332+56
	ldr	r1, [r2]
	cmp	r1, #26
	beq	.L330
.L248:
	mov	r2, #67108864
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [r2, #18]	@ movhi
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L246:
	cmp	r3, #0
	bgt	.L248
	ldr	r2, .L332+56
	ldr	r1, [r2]
	cmp	r1, #28
	bne	.L248
	mov	ip, #26
	mov	r1, #67108864
	ldr	r0, .L332+60
	add	r3, r3, #256
	str	r3, [fp]
	str	ip, [r2]
	strh	r0, [r1, #8]	@ movhi
	b	.L248
.L327:
	ldr	r2, .L332+64
	mov	r1, #512
	ldr	r0, [r2]
	ldr	r3, [r4]
	ldr	r2, [r4, #4]
	ldr	ip, .L332+68
	mov	lr, pc
	bx	ip
	cmp	r0, #2
	bne	.L229
.L232:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	bne	.L331
	mov	r1, #496
	mov	lr, #150
	mov	ip, #107
	mov	r0, #480
	mov	r2, #116
	ldr	r3, .L332+72
	strh	r1, [r3, #-4]	@ movhi
	ldr	r1, .L332+76
	strh	ip, [r3, #2]	@ movhi
	strh	lr, [r3]	@ movhi
	strh	r0, [r3, #4]	@ movhi
	strh	r1, [r3, #-8]!	@ movhi
	strh	r2, [r3, #2]	@ movhi
.L233:
	ldr	r3, .L332+36
	ldrh	r3, [r3]
	ands	r2, r3, #1
	and	r1, r3, #256
	beq	.L234
	ldr	r3, .L332+44
	ldrh	r0, [r3]
	ands	ip, r0, #1
	bne	.L235
	ldr	lr, [r4, #44]
	cmp	lr, #0
	moveq	ip, #1
	cmp	r1, #0
	str	ip, [r4, #44]
	beq	.L251
.L250:
	tst	r0, #256
	beq	.L249
	b	.L243
.L330:
	mov	ip, #28
	mov	r1, #67108864
	ldr	r0, .L332+80
	sub	r3, r3, #256
	str	r3, [fp]
	str	ip, [r2]
	strh	r0, [r1, #8]	@ movhi
	b	.L248
.L229:
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #4]
	ldr	r0, .L332+64
	add	r2, r2, r3
	mov	r1, #512
	ldr	r3, [r4]
	ldr	r0, [r0]
	ldr	ip, .L332+68
	sub	r2, r2, #1
	mov	lr, pc
	bx	ip
	cmp	r0, #2
	beq	.L232
	ldr	r2, [r4, #20]
	ldr	r3, [r4]
	ldr	r0, .L332+64
	add	r3, r3, r2
	mov	r1, #512
	ldr	r2, [r4, #4]
	ldr	r0, [r0]
	ldr	ip, .L332+68
	sub	r3, r3, #1
	mov	lr, pc
	bx	ip
	cmp	r0, #2
	beq	.L232
	ldr	r0, [r4, #20]
	ldr	r3, [r4]
	ldr	r1, [r4, #16]
	ldr	r2, [r4, #4]
	add	r3, r3, r0
	ldr	r0, .L332+64
	add	r2, r2, r1
	ldr	r0, [r0]
	mov	r1, #512
	ldr	ip, .L332+68
	sub	r3, r3, #1
	sub	r2, r2, #1
	mov	lr, pc
	bx	ip
	cmp	r0, #2
	bne	.L228
	b	.L232
.L331:
	mov	r2, #512
	ldr	r3, .L332+40
	strh	r2, [r3], #8	@ movhi
	strh	r2, [r3]	@ movhi
	b	.L233
.L329:
	ldr	r2, [r10, #32]
	ldr	r3, [r6, #16]
	orrs	r3, r2, r3
	bne	.L244
	mov	r1, #1
	ldr	r3, .L332+84
	ldmib	r3, {r2, r3}
	ldr	r0, .L332+88
	stm	r6, {r2, r3}
	str	r2, [r7]
	str	r2, [r9]
	add	r2, r2, #24
	stm	r8, {r2, r3}
	str	r2, [r0]
	add	r2, r3, #24
	add	r3, r3, #48
	str	r2, [r7, #4]
	str	r3, [r9, #4]
	str	r3, [r0, #4]
	str	r1, [r0, #16]
	str	r1, [r6, #16]
	str	r1, [r7, #16]
	str	r1, [r9, #16]
	str	r1, [r8, #16]
	b	.L244
.L242:
	cmp	r3, #0
	bne	.L238
.L240:
	mov	r3, #0
	mov	ip, #1
	mov	r0, #30
	ldr	r1, .L332+48
	str	r3, [r1, #20]
	ldr	r1, .L332+52
	str	ip, [r5, #24]
	str	r0, [r5, #28]
	str	r3, [r1, #20]
	b	.L238
.L234:
	cmp	r1, #0
	beq	.L244
	ldr	r3, .L332+44
	ldrh	r2, [r3]
	ands	r2, r2, #256
	bne	.L244
	b	.L249
.L328:
	mov	r1, #0
	ldr	ip, .L332+52
	ldr	r0, .L332+48
	str	r1, [r5, #24]
	str	r1, [ip, #20]
	str	r3, [r0, #20]
	b	.L238
.L235:
	cmp	r1, #0
	beq	.L244
	b	.L250
.L323:
	ldr	r3, [r4]
	cmp	r3, #1
	ble	.L223
	ldr	r2, [r4, #8]
	ldr	fp, .L332+64
	sub	r3, r3, r2
	mov	r1, #512
	ldr	r0, [fp]
	ldr	r2, [r4, #4]
	ldr	ip, .L332+68
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L223
	ldr	r0, [r4, #16]
	ldr	r2, [r4, #4]
	ldr	r1, [r4]
	ldr	r3, [r4, #8]
	add	r2, r2, r0
	sub	r3, r1, r3
	ldr	r0, [fp]
	mov	r1, #512
	ldr	ip, .L332+68
	sub	r2, r2, #1
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L223
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
	ldr	ip, .L332+68
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L223
	ldr	r3, .L332+56
	ldr	r1, [r4]
	ldr	r2, [r4, #8]
	ldr	fp, .L332+28
	ldr	r3, [r3]
	sub	r1, r1, r2
	sub	r3, r3, #26
	ldr	r2, [fp]
	sub	r3, r1, r3, lsl #7
	sub	r3, r3, r2
	cmp	r3, #80
	movle	r3, #1
	movgt	r3, #0
	cmp	r2, #0
	movle	r3, #0
	mov	r0, #1
	cmp	r3, #0
	subne	r2, r2, #1
	str	r10, [r4, #28]
	str	r1, [r4]
	str	r0, [r4, #32]
	strne	r2, [fp]
	b	.L222
.L325:
	ldr	r2, [r4, #12]
	ldr	fp, .L332+64
	sub	r2, r3, r2
	mov	r1, #512
	ldr	r0, [fp]
	ldr	r3, [r4]
	ldr	ip, .L332+68
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L226
	ldr	r0, [r4, #20]
	ldr	r3, [r4]
	ldr	r1, [r4, #4]
	ldr	r2, [r4, #12]
	add	r3, r3, r0
	sub	r2, r1, r2
	ldr	r0, [fp]
	mov	r1, #512
	ldr	ip, .L332+68
	sub	r3, r3, #1
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L226
	ldr	r0, .L332+92
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
	beq	.L322
	sub	r3, r3, #1
	str	r3, [r0]
	ldr	fp, .L332+28
	b	.L222
.L324:
	ldr	r3, [r4, #8]
	ldr	fp, .L332+64
	sub	r2, r2, #1
	add	r3, r2, r3
	mov	r1, #512
	ldr	r0, [fp]
	ldr	r2, [r4, #4]
	ldr	ip, .L332+68
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L225
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
	ldr	ip, .L332+68
	sub	r2, r2, #1
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L225
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
	ldr	ip, .L332+68
	sub	r2, r2, #1
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L225
	ldr	fp, .L332+28
	ldr	r2, [r4]
	ldr	r1, [r4, #8]
	ldr	r3, [fp]
	add	r2, r2, r1
	sub	r1, r2, r3
	ldr	r0, .L332+96
	cmp	r1, #79
	movgt	r1, #1
	movle	r1, #0
	cmp	r3, r0
	movgt	r1, #0
	cmp	r1, #0
	str	r10, [r4, #32]
	str	r10, [r4, #28]
	str	r2, [r4]
	beq	.L222
	cmp	r3, #159
	movgt	r2, #0
	movle	r2, #1
	ldr	r1, .L332+56
	ldr	r1, [r1]
	cmp	r1, #28
	orrne	r2, r2, #1
	cmp	r2, #0
	addne	r3, r3, #1
	strne	r3, [fp]
	b	.L222
.L326:
	ldr	r2, [r4, #12]
	ldr	fp, .L332+64
	sub	r3, r3, #1
	add	r2, r3, r2
	mov	r1, #512
	ldr	r0, [fp]
	ldr	r3, [r4]
	ldr	ip, .L332+68
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L227
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
	ldr	ip, .L332+68
	sub	r3, r3, #1
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L227
	ldr	r0, .L332+92
	ldr	r2, [r4, #4]
	ldr	r1, [r4, #12]
	ldr	r3, [r0]
	add	r2, r2, r1
	sub	r1, r2, r3
	ldr	ip, .L332+100
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
	beq	.L322
	add	r3, r3, #1
	str	r3, [r0]
	ldr	fp, .L332+28
	b	.L222
.L333:
	.align	2
.L332:
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
	.word	screenBlock
	.word	-9600
	.word	.LANCHOR0
	.word	collisionCheck
	.word	shadowOAM+376
	.word	16534
	.word	-9088
	.word	ghostspot
	.word	uvlight
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
	ldr	r4, .L340
	ldr	r3, .L340+4
	ldr	r5, [r4, #24]
	smull	r1, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #2
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #1
	bne	.L335
	ldr	r0, [r4, #36]
	ldr	r3, .L340+8
	ldr	r1, [r4, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #36]
.L335:
	ldr	r1, [r4, #44]
	cmp	r1, #0
	beq	.L336
	mov	r2, #512
	ldr	r3, .L340+12
	pop	{r4, r5, r6, lr}
	strh	r2, [r3, #56]	@ movhi
	bx	lr
.L336:
	ldr	r2, .L340+16
	ldr	r0, [r2]
	ldr	r2, .L340+20
	ldr	r3, [r4, #4]
	ldr	ip, [r2]
	ldr	r2, [r4]
	sub	r3, r3, r0
	sub	r2, r2, ip
	lsl	r3, r3, #23
	ldr	ip, [r4, #28]
	ldr	r0, .L340+12
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
.L341:
	.align	2
.L340:
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
	ldr	r4, .L359
	ldr	r3, [r4, #32]
	cmp	r3, #0
	sub	sp, sp, #20
	beq	.L343
	ldr	r3, [r4, #48]
	sub	r2, r3, #1
	cmp	r3, #5
	cmpne	r2, #1
	movls	r0, #4
	movhi	r0, #3
	mvnhi	r2, #46336
	ldrls	r1, .L359+4
	ldrls	r3, .L359+8
	ldrls	r2, .L359+12
	ldrhi	r1, .L359+4
	ldrhi	r3, .L359+8
	str	r0, [r1, #16]
	strh	r2, [r3, #4]	@ movhi
.L342:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L343:
	ldr	r6, .L359+16
	ldmib	r6, {r2, r3}
	ldr	r0, [r6, #16]
	ldr	r1, [r6, #12]
	ldr	r5, .L359+20
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	ldr	r7, .L359+24
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L346
	ldr	r3, .L359+28
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L347
	ldr	r3, [r4, #48]
	sub	r2, r3, #1
	cmp	r3, #5
	cmpne	r2, #1
	bhi	.L347
	mov	r0, #4
	ldr	r1, .L359+4
	ldr	r3, .L359+8
	ldr	r2, .L359+12
	str	r0, [r1, #16]
	strh	r2, [r3, #4]	@ movhi
	b	.L348
.L347:
	mov	r0, #3
	mvn	r2, #46336
	ldr	r1, .L359+4
	ldr	r3, .L359+8
	str	r0, [r1, #16]
	strh	r2, [r3, #4]	@ movhi
.L348:
	ldr	r3, .L359+32
	ldr	r3, [r3, #16]
	cmp	r3, #0
	moveq	r0, #150
	moveq	r1, #116
	moveq	r2, #480
	movne	r2, #512
	ldreq	r3, .L359+36
	ldrne	r3, .L359+36
	strheq	r0, [r3]	@ movhi
	strheq	r1, [r3, #2]	@ movhi
	strheq	r2, [r3, #4]	@ movhi
	strhne	r2, [r3]	@ movhi
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L346:
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
	beq	.L350
	mov	lr, #512
	mov	r0, #2
	mvn	r2, #46080
	ldr	ip, .L359+36
	ldr	r1, .L359+4
	ldr	r3, .L359+8
	strh	lr, [ip]	@ movhi
	str	r0, [r1, #16]
	strh	r2, [r3, #4]	@ movhi
	b	.L342
.L350:
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
	ldrne	r1, .L359+4
	ldrne	r3, .L359+8
	ldrne	r2, .L359+40
	ldreq	r1, .L359+4
	ldreq	r3, .L359+8
	ldreq	r2, .L359+44
	str	r0, [r1, #16]
	strh	r2, [r3, #4]	@ movhi
	b	.L342
.L360:
	.align	2
.L359:
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
	ldr	r3, .L363
	ldr	r3, [r3, #20]
	cmp	r3, #0
	bne	drawEMFReader.part.0
.L362:
	mov	r2, #512
	ldr	r3, .L363+4
	strh	r2, [r3], #-8	@ movhi
	strh	r2, [r3]	@ movhi
	bx	lr
.L364:
	.align	2
.L363:
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
	ldr	r3, .L367
	ldr	r3, [r3, #16]
	cmp	r3, #0
	bxeq	lr
	b	drawEquipment.part.0
.L368:
	.align	2
.L367:
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
	ldr	r3, .L371
	ldr	r3, [r3, #24]
	cmp	r3, #0
	bxeq	lr
	b	updateWeapon.part.0
.L372:
	.align	2
.L371:
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
	ldr	r3, .L389
	ldr	r2, [r3, #20]
	cmp	r2, #0
	beq	.L374
	ldr	r2, [r3, #28]
	cmp	r2, #9
	bgt	.L374
	push	{r4, lr}
	mov	lr, #10
	ldr	r2, .L389+4
	ldr	r1, [r3, #4]
	ldr	r0, [r2]
	ldr	r2, .L389+8
	ldr	ip, [r3]
	sub	r1, r1, r0
	ldr	r0, [r2]
	sub	ip, ip, r0
	ldr	r0, [r3, #16]
	ldr	r3, [r3, #24]
	ldr	r2, .L389+12
	lsl	r1, r1, #23
	and	ip, ip, #255
	cmp	r3, #0
	lsr	r1, r1, #23
	add	r0, r0, #4
	ldr	r4, .L389+16
	orr	r1, r1, #16384
	lsl	r0, r0, #1
	strh	ip, [r2, #8]	@ movhi
	ldrne	r3, .L389+20
	ldr	ip, .L389+24
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
.L374:
	mov	r1, #512
	ldr	r3, [r3, #24]
	cmp	r3, #0
	ldr	r2, .L389+12
	ldrne	r3, .L389+20
	strh	r1, [r2, #8]	@ movhi
	strhne	r3, [r2, #28]	@ movhi
	bx	lr
.L390:
	.align	2
.L389:
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
	ldr	r3, .L393
	ldr	r3, [r3, #20]
	cmp	r3, #0
	bxeq	lr
	b	updateCamera.part.0
.L394:
	.align	2
.L393:
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
	ldr	r3, .L397
	ldr	r3, [r3, #20]
	cmp	r3, #0
	bne	drawCamera.part.0
.L396:
	mov	r2, #512
	ldr	r3, .L397+4
	strh	r2, [r3], #-56	@ movhi
	strh	r2, [r3]	@ movhi
	bx	lr
.L398:
	.align	2
.L397:
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
	ldr	r4, .L407
	ldr	r3, .L407+4
	ldr	r5, [r4, #24]
	smull	r1, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #2
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #1
	bne	.L400
	ldr	r0, [r4, #36]
	ldr	r3, .L407+8
	ldr	r1, [r4, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #36]
.L400:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L401
	ldr	r3, .L407+12
	ldr	r3, [r3]
	ldr	r0, .L407+16
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
	bgt	.L406
.L402:
	mov	r2, #512
	ldr	r3, .L407+20
	strh	r2, [r3, #16]	@ movhi
.L403:
	add	r5, r5, #1
	str	r5, [r4, #24]
	b	.L404
.L401:
	mov	r2, #512
	ldr	r3, .L407+20
	strh	r2, [r3, #16]	@ movhi
.L404:
	mov	r3, #67108864
	mov	r1, #272
	mov	r2, #2064
	strh	r1, [r3, #80]	@ movhi
	strh	r2, [r3, #82]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L406:
	add	r2, r0, #160
	add	r3, r2, r3
	cmp	r1, r3
	bge	.L402
	ldr	r3, .L407+24
	ldr	r2, [r3]
	ldr	r3, [r4, #4]
	sub	r3, r3, r2
	ldr	r2, [r4, #36]
	add	ip, r2, #3
	ldr	r2, [r4, #28]
	sub	r1, r1, r0
	lsl	r3, r3, #23
	ldr	r0, .L407+20
	and	r1, r1, #255
	lsr	r3, r3, #23
	add	r2, r2, ip, lsl #5
	orr	r1, r1, #1024
	orr	r3, r3, #16384
	lsl	r2, r2, #1
	strh	r1, [r0, #16]	@ movhi
	strh	r3, [r0, #18]	@ movhi
	strh	r2, [r0, #20]	@ movhi
	b	.L403
.L408:
	.align	2
.L407:
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
	ldr	r4, .L430
	ldr	r3, [r4, #28]
	cmp	r3, #2
	beq	.L427
	cmp	r3, #3
	beq	.L428
	cmp	r3, #0
	bne	.L417
	ldr	r2, [r4, #60]
	ldr	r0, [r4, #20]
	ldr	r3, [r4, #56]
	add	r1, r2, r0
	add	r1, r1, r3
	cmp	r1, #528
	bgt	.L429
.L418:
	ldr	r1, [r4]
	add	r3, r2, r3
	cmp	r1, r3
	bge	.L419
	ldr	r3, [r4, #8]
	add	r1, r3, r1
	str	r1, [r4]
.L409:
	pop	{r4, r5, r6, lr}
	bx	lr
.L428:
	ldr	r2, [r4, #64]
	ldr	r3, [r4, #56]
	sub	r3, r2, r3
	cmp	r3, #47
	bgt	.L415
	sub	r2, r2, #48
	cmp	r2, #99
	movle	r3, #2
	str	r2, [r4, #56]
	strle	r3, [r4, #28]
	ble	.L409
	mov	r3, #48
.L415:
	ldr	r2, [r4, #4]
	cmp	r2, r3
	ble	.L416
	ldr	r3, [r4, #12]
	sub	r2, r2, r3
	str	r2, [r4, #4]
	pop	{r4, r5, r6, lr}
	bx	lr
.L427:
	ldr	r2, [r4, #64]
	ldr	r0, [r4, #16]
	ldr	r3, [r4, #56]
	add	r1, r2, r0
	add	r1, r1, r3
	cmp	r1, #464
	ble	.L411
	rsb	r3, r2, #464
	sub	r3, r3, r0
	cmp	r3, #99
	str	r3, [r4, #56]
	movle	r3, #3
	strle	r3, [r4, #28]
	ble	.L409
.L411:
	ldr	r1, [r4, #4]
	add	r3, r2, r3
	cmp	r1, r3
	bge	.L413
	ldr	r3, [r4, #12]
	add	r1, r3, r1
	str	r1, [r4, #4]
	pop	{r4, r5, r6, lr}
	bx	lr
.L417:
	cmp	r3, #1
	bne	.L409
	ldr	r2, [r4, #60]
	ldr	r3, [r4, #56]
	sub	r3, r2, r3
	cmp	r3, #47
	bgt	.L420
	sub	r2, r2, #48
	cmp	r2, #99
	movle	r3, #0
	str	r2, [r4, #56]
	strle	r3, [r4, #28]
	ble	.L409
	mov	r3, #48
.L420:
	ldr	r2, [r4]
	cmp	r2, r3
	ble	.L421
	ldr	r3, [r4, #8]
	sub	r2, r2, r3
	str	r2, [r4]
	b	.L409
.L429:
	rsb	r3, r2, #528
	sub	r3, r3, r0
	cmp	r3, #99
	str	r3, [r4, #56]
	movle	r3, #1
	strle	r3, [r4, #28]
	bgt	.L418
	b	.L409
.L413:
	ldr	r3, [r4]
	ldr	r5, .L430+4
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
	ldr	r3, .L430+8
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #7
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl #4
	add	r0, r0, #200
	str	r0, [r4, #56]
	b	.L409
.L416:
	ldr	r3, [r4]
	ldr	r5, .L430+4
	str	r2, [r4, #64]
	str	r3, [r4, #60]
.L425:
	mov	lr, pc
	bx	r5
	rsbs	r2, r0, #0
	and	r2, r2, #3
	and	r3, r0, #3
	rsbpl	r3, r2, #0
	str	r3, [r4, #28]
	mov	lr, pc
	bx	r5
	ldr	r3, .L430+8
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #7
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #4
	str	r3, [r4, #56]
	pop	{r4, r5, r6, lr}
	bx	lr
.L419:
	ldr	r3, [r4, #4]
	ldr	r5, .L430+4
	str	r1, [r4, #60]
.L426:
	str	r3, [r4, #64]
	b	.L425
.L421:
	ldr	r3, [r4, #4]
	ldr	r5, .L430+4
	str	r2, [r4, #60]
	b	.L426
.L431:
	.align	2
.L430:
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
	ldr	r3, .L444
	ldr	lr, .L444+4
	ldr	ip, [r3]
	ldr	r1, [lr]
	cmp	ip, r1
	sub	sp, sp, #20
	ble	.L433
	mov	r2, #1
	ldr	r0, [r3, #8]
	str	r2, [r3, #28]
	sub	ip, ip, r0
	ldr	r2, [r3, #4]
	ldr	r0, [lr, #4]
	cmp	r2, r0
	str	ip, [r3]
	ble	.L435
.L443:
	mov	r4, #3
	ldr	r5, [r3, #12]
	sub	r2, r2, r5
	str	r2, [r3, #4]
	str	r4, [r3, #28]
.L436:
	add	r3, r3, #16
	ldm	r3, {r3, r4}
	stm	sp, {r2, ip}
	str	r4, [sp, #12]
	str	r3, [sp, #8]
	add	r2, lr, #16
	ldm	r2, {r2, r3}
	ldr	r4, .L444+8
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	bne	.L442
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L433:
	movlt	r2, #0
	ldrlt	r0, [r3, #8]
	strlt	r2, [r3, #28]
	addlt	ip, ip, r0
	ldr	r2, [r3, #4]
	ldr	r0, [lr, #4]
	strlt	ip, [r3]
	cmp	r2, r0
	bgt	.L443
.L435:
	movlt	r4, #2
	ldrlt	r5, [r3, #12]
	addlt	r2, r2, r5
	strlt	r2, [r3, #4]
	strlt	r4, [r3, #28]
	b	.L436
.L442:
	ldr	r3, .L444+12
	mov	lr, pc
	bx	r3
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L445:
	.align	2
.L444:
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
	ldr	r4, .L458
	ldr	r3, [r4, #32]
	cmp	r3, #0
	sub	sp, sp, #20
	beq	.L446
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L456
	bl	chase
	ldr	r0, .L458+4
	ldr	r3, [r0, #44]
	cmp	r3, #0
	beq	.L457
.L446:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L456:
	bl	ghostMovement
	ldr	r0, .L458+4
	ldr	r3, [r0, #44]
	cmp	r3, #0
	bne	.L446
.L457:
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
	ldr	r5, .L458+8
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
.L459:
	.align	2
.L458:
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
	ldr	r5, .L470
	ldr	r3, [r5]
	cmp	r3, #99
	ldr	r6, .L470+4
	ble	.L469
	ldr	r3, [r6]
	cmp	r3, #3
	bgt	.L467
.L469:
	ldr	r4, .L470+8
.L461:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L462
	ldr	r2, [r6]
	cmp	r2, #0
	ble	.L460
	ldr	r2, [r5]
	cmp	r2, #99
	addle	r2, r2, #1
	strle	r2, [r5]
	strle	r3, [r6]
.L460:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L462:
	mov	r3, #0
	str	r3, [r6]
	str	r3, [r5]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L467:
	mov	r3, #0
	mov	r7, #1
	ldr	r4, .L470+8
	ldr	r8, .L470+12
	str	r3, [r4, #44]
	str	r7, [r4, #32]
	mov	lr, pc
	bx	r8
	ldr	r2, .L470+16
	rsbs	r3, r0, #0
	and	r3, r3, r2
	and	r0, r0, r2
	rsbpl	r0, r3, #0
	str	r0, [r4, #4]
	mov	lr, pc
	bx	r8
	ldr	r3, .L470+20
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
	ldr	r3, .L470+24
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #7
	ldr	r1, .L470+28
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #4
	mov	r2, r7
	ldr	r1, [r1]
	ldr	r0, .L470+32
	ldr	r7, .L470+36
	str	r3, [r4, #56]
	mov	lr, pc
	bx	r7
	b	.L461
.L471:
	.align	2
.L470:
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
	ldr	r3, .L477
	ldr	r3, [r3, #32]
	cmp	r3, #0
	push	{r4, r5, r6, lr}
	bne	.L473
	ldr	r3, .L477+4
	ldr	r2, [r3]
	cmp	r2, #99
	ble	.L474
	ldr	r3, .L477+8
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L474
.L473:
	mov	r0, #428
	mov	lr, #432
	mov	r2, #512
	ldr	r3, .L477+12
	ldr	r1, .L477+16
	ldr	ip, .L477+20
	strh	r1, [r3, #90]	@ movhi
	strh	r0, [r3, #92]	@ movhi
	ldr	r1, .L477+24
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
.L474:
	ldr	r3, .L477+28
	smull	r0, r1, r3, r2
	mov	ip, #512
	mov	r5, #424
	mov	r4, #214
	mov	lr, #222
	mov	r0, #12
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #5
	add	r3, r3, r3, lsl #2
	ldr	r1, .L477+32
	add	r3, r3, r3, lsl #2
	sub	r3, r2, r3, lsl #2
	smull	r6, r2, r1, r3
	asr	r1, r3, #31
	rsb	r1, r1, r2, asr #2
	add	r2, r1, r1, lsl #2
	sub	r3, r3, r2, lsl #1
	ldr	r2, .L477+12
	add	r3, r3, ip
	add	r1, r1, ip
	strh	r3, [r2, #76]	@ movhi
	ldr	r3, .L477+24
	strh	r1, [r2, #84]	@ movhi
	ldr	r1, .L477+16
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
.L478:
	.align	2
.L477:
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
	ldr	r3, .L489
	ldr	r3, [r3, #20]
	cmp	r3, #0
	beq	.L480
	bl	drawEMFReader.part.0
.L481:
	ldr	r3, .L489+4
	ldr	r3, [r3, #20]
	cmp	r3, #0
	beq	.L482
	bl	drawCamera.part.0
.L483:
	ldr	r3, .L489+8
	ldr	r3, [r3, #16]
	cmp	r3, #0
	blne	drawEquipment.part.0
.L484:
	bl	drawSanity
	bl	drawOccurrences
	bl	drawItems
	ldr	r3, .L489+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L482:
	mov	r2, #512
	ldr	r3, .L489+16
	strh	r2, [r3], #-56	@ movhi
	strh	r2, [r3]	@ movhi
	b	.L483
.L480:
	mov	r2, #512
	ldr	r3, .L489+20
	strh	r2, [r3], #-8	@ movhi
	strh	r2, [r3]	@ movhi
	b	.L481
.L490:
	.align	2
.L489:
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
	ldr	r3, .L528
	ldr	r3, [r3]
	ldr	r4, .L528+4
	cmp	r3, #0
	sub	sp, sp, #16
	ldr	r3, [r4, #24]
	beq	.L492
	ldr	r2, .L528+8
	ldr	r2, [r2, #48]
	bic	r1, r2, #2
	cmp	r1, #0
	cmpne	r2, #5
	bne	.L492
	mov	r2, #0
	cmp	r3, #1
	str	r2, [r4, #28]
	beq	.L495
.L494:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	bne	.L527
.L491:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L492:
	cmp	r3, #1
	bne	.L494
	ldr	r3, [r4, #28]
	cmp	r3, #0
	ble	.L495
	ldr	r2, .L528+8
	ldr	r2, [r2, #48]
	bic	r1, r2, #2
	cmp	r1, #0
	cmpne	r2, #5
	bne	.L497
.L526:
	sub	r3, r3, #3
	str	r3, [r4, #28]
.L495:
	mov	r3, #4
	str	r3, [r4, #24]
	ldr	r3, [r4, #16]
	cmp	r3, #0
	beq	.L491
.L527:
	ldr	r5, .L528+12
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
	ldr	r6, .L528+16
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L499
	ldr	r2, [r4, #32]
.L500:
	cmp	r2, #1
	beq	.L503
.L504:
	mov	r2, #512
	ldr	r3, .L528+20
	strh	r2, [r3, #104]	@ movhi
	strh	r2, [r3, #112]	@ movhi
	strh	r2, [r3, #120]	@ movhi
	strh	r2, [r3, #128]	@ movhi
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L499:
	ldr	r3, .L528+24
	ldrh	r3, [r3]
	tst	r3, #1
	ldr	r2, [r4, #32]
	beq	.L501
	ldr	r3, .L528+28
	ldrh	r3, [r3]
	ands	r3, r3, #1
	bne	.L501
	cmp	r2, #0
	bne	.L502
	ldr	r3, .L528+32
	mov	ip, #107
	mov	r1, #480
	mov	r2, r3
	mov	lr, #150
	mov	r0, #1
	strh	ip, [r3, #2]	@ movhi
	ldr	ip, .L528+36
	strh	r1, [r3, #4]	@ movhi
	sub	r1, r1, #10
	strh	lr, [r3]	@ movhi
	strh	ip, [r2, #8]!	@ movhi
	strh	r1, [r3, #12]	@ movhi
	ldr	r3, .L528+40
	str	r0, [r4, #32]
	strh	r3, [r2, #2]	@ movhi
.L503:
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
	beq	.L504
	mov	r3, #512
	mov	r1, #1
	ldr	r2, .L528+20
	ldr	ip, .L528+44
	strh	ip, [r2, #128]	@ movhi
	ldr	ip, .L528+48
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
	ldr	r3, .L528+52
	strhlt	ip, [r2, #120]	@ movhi
	strhlt	r1, [r2, #122]	@ movhi
	smull	ip, r1, r3, r0
	mov	lr, #152
	asr	r3, r0, #31
	rsb	r3, r3, r1, asr #5
	add	r3, r3, r3, lsl #2
	ldr	r1, .L528+56
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
	b	.L491
.L497:
	cmp	r3, #5
	bgt	.L526
	b	.L495
.L501:
	ldr	r3, .L528+32
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
	ldr	r3, .L528+40
	strh	r3, [r1, #2]	@ movhi
	b	.L500
.L502:
	ldr	r2, .L528+32
	mov	r1, r2
	mov	r5, #150
	mov	lr, #107
	mov	ip, #480
	str	r3, [r4, #32]
	ldr	r3, .L528+36
	ldr	r0, .L528+60
	strh	r3, [r1, #8]!	@ movhi
	sub	r3, r3, #34
	strh	r5, [r2]	@ movhi
	strh	lr, [r2, #2]	@ movhi
	strh	ip, [r2, #4]	@ movhi
	strh	r0, [r2, #12]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	b	.L504
.L529:
	.align	2
.L528:
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
	ldr	r3, .L532
	ldr	r3, [r3, #16]
	cmp	r3, #0
	bxeq	lr
	b	updateUVLight.part.0
.L533:
	.align	2
.L532:
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
	ldr	r3, .L564
	ldr	r3, [r3]
	ldr	r4, .L564+4
	cmp	r3, #0
	sub	sp, sp, #16
	ldr	r3, [r4, #24]
	beq	.L535
	ldr	r2, .L564+8
	ldr	r2, [r2, #48]
	sub	r1, r2, #3
	cmp	r2, #0
	cmpne	r1, #1
	bls	.L562
.L537:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	bne	.L563
.L534:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L562:
	mov	r2, #1
	cmp	r3, r2
	str	r2, [r4, #28]
	beq	.L539
	ldr	r3, [r4, #16]
	cmp	r3, #0
	beq	.L534
.L563:
	ldr	r5, .L564+12
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
	ldr	r6, .L564+16
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L541
	ldr	r2, [r4, #32]
.L542:
	cmp	r2, #0
	bne	.L545
.L546:
	mov	r2, #512
	ldr	r3, .L564+20
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #40]	@ movhi
	strh	r2, [r3, #48]	@ movhi
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L535:
	cmp	r3, #1
	bne	.L537
	ldr	r3, .L564+8
	ldr	r3, [r3, #48]
	sub	r2, r3, #3
	cmp	r3, #0
	cmpne	r2, #1
	bhi	.L537
.L539:
	mov	r3, #1
	str	r3, [r4, #28]
	b	.L537
.L541:
	ldr	r3, .L564+24
	ldrh	r3, [r3]
	tst	r3, #1
	ldr	r2, [r4, #32]
	beq	.L543
	ldr	r3, .L564+28
	ldrh	r3, [r3]
	ands	r3, r3, #1
	bne	.L543
	cmp	r2, #0
	bne	.L544
	ldr	r3, .L564+32
	mov	ip, #107
	mov	r1, #480
	mov	r2, r3
	mov	lr, #150
	mov	r0, #1
	strh	ip, [r3, #2]	@ movhi
	ldr	ip, .L564+36
	strh	r1, [r3, #4]	@ movhi
	sub	r1, r1, #10
	strh	lr, [r3]	@ movhi
	strh	ip, [r2, #8]!	@ movhi
	strh	r1, [r3, #12]	@ movhi
	ldr	r3, .L564+40
	str	r0, [r4, #32]
	strh	r3, [r2, #2]	@ movhi
.L545:
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
	beq	.L546
	mov	r0, #1
	mov	r1, #80
	mov	r2, #512
	mov	ip, #16
	ldr	r3, [r4, #28]
	cmp	r3, r0
	ldr	r3, .L564+20
	ldr	lr, .L564+44
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
	bne	.L534
	mov	ip, #24
	mov	r0, #26
	ldr	r2, .L564+48
	ldr	r1, .L564+52
	strh	ip, [r3, #4]	@ movhi
	strh	r0, [r3, #44]	@ movhi
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	strh	r2, [r3, #40]	@ movhi
	strh	r1, [r3, #42]	@ movhi
	b	.L534
.L543:
	ldr	r3, .L564+32
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
	ldr	r3, .L564+40
	strh	r3, [r1, #2]	@ movhi
	b	.L542
.L544:
	ldr	r2, .L564+32
	mov	r1, r2
	mov	r5, #150
	mov	lr, #107
	mov	ip, #480
	str	r3, [r4, #32]
	ldr	r3, .L564+36
	ldr	r0, .L564+56
	strh	r3, [r1, #8]!	@ movhi
	sub	r3, r3, #34
	strh	r5, [r2]	@ movhi
	strh	lr, [r2, #2]	@ movhi
	strh	ip, [r2, #4]	@ movhi
	strh	r0, [r2, #12]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	b	.L546
.L565:
	.align	2
.L564:
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
	ldr	r3, .L597
	ldr	r3, [r3]
	ldr	r4, .L597+4
	cmp	r3, #0
	ldr	r2, [r4, #24]
	sub	sp, sp, #20
	beq	.L567
	ldr	r3, .L597+8
	ldr	r3, [r3, #48]
	sub	r3, r3, #3
	cmp	r3, #2
	bls	.L593
.L569:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	bne	.L594
.L566:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L593:
	mov	r3, #1
	cmp	r2, r3
	str	r3, [r4, #28]
	beq	.L571
	ldr	r3, [r4, #16]
	cmp	r3, #0
	beq	.L566
.L594:
	ldr	r5, .L597+12
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
	ldr	r6, .L597+16
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L573
	ldr	r7, [r4, #32]
.L574:
	cmp	r7, #1
	beq	.L595
.L577:
	mov	r2, #512
	ldr	r3, .L597+20
	strh	r2, [r3, #208]	@ movhi
	strh	r2, [r3, #216]	@ movhi
	strh	r2, [r3, #224]	@ movhi
	strh	r2, [r3, #232]	@ movhi
	strh	r2, [r3, #240]	@ movhi
.L591:
	strh	r2, [r3, #248]	@ movhi
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L567:
	cmp	r2, #1
	bne	.L569
	ldr	r3, .L597+8
	ldr	r3, [r3, #48]
	sub	r3, r3, #3
	cmp	r3, #2
	bhi	.L569
.L571:
	mov	r3, #1
	str	r3, [r4, #28]
	b	.L569
.L573:
	ldr	r3, .L597+24
	ldrh	r3, [r3]
	tst	r3, #1
	ldr	r7, [r4, #32]
	beq	.L575
	ldr	r3, .L597+28
	ldrh	r3, [r3]
	ands	r3, r3, #1
	bne	.L575
	cmp	r7, #0
	beq	.L596
	ldr	r2, .L597+32
	mov	r1, r2
	mov	r5, #150
	mov	lr, #107
	mov	ip, #480
	str	r3, [r4, #32]
	ldr	r3, .L597+36
	ldr	r0, .L597+40
	strh	r3, [r1, #8]!	@ movhi
	sub	r3, r3, #34
	strh	r5, [r2]	@ movhi
	strh	lr, [r2, #2]	@ movhi
	strh	ip, [r2, #4]	@ movhi
	strh	r0, [r2, #12]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	b	.L577
.L596:
	mov	r3, #1
	ldr	r8, .L597+44
	str	r3, [r4, #32]
	mov	lr, pc
	bx	r8
	ldr	r7, .L597+48
	smull	r3, r2, r7, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	ldr	r2, .L597+52
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
	ldr	r2, .L597+56
	sub	r3, r0, r3, lsl #3
	add	r3, r3, #20
	str	r3, [r2]
	ldr	r7, [r4, #32]
.L575:
	ldr	r3, .L597+32
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
	ldr	r3, .L597+60
	strh	r3, [r2, #2]	@ movhi
	b	.L574
.L595:
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
	beq	.L577
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
	ldr	r3, .L597+20
	strh	r0, [r3, #244]	@ movhi
	add	r0, r3, #400
	strh	r2, [r0]	@ movhi
	add	r0, r3, #408
	ldr	r4, .L597+64
	strh	r2, [r0]	@ movhi
	ldr	r0, .L597+68
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
	bne	.L591
	ldr	ip, .L597+72
	ldr	r1, .L597+76
	ldr	r2, [ip]
	smull	lr, r0, r1, r2
	asr	r1, r2, #31
	rsb	r1, r1, r0, asr #2
	ldr	lr, .L597+52
	add	r1, r1, r1, lsl #2
	cmp	r2, r1, lsl #1
	ldr	r0, [lr]
	bne	.L579
	cmp	r0, #100
	subgt	r0, r0, #1
	addle	r0, r0, #1
	str	r0, [lr]
.L579:
	mov	lr, #396
	ldr	r1, .L597+56
	ldr	r1, [r1]
	lsl	r1, r1, #23
	add	r2, r2, #1
	and	r0, r0, #255
	lsr	r1, r1, #23
	str	r2, [ip]
	strh	r0, [r3, #248]	@ movhi
	strh	r1, [r3, #250]	@ movhi
	strh	lr, [r3, #252]	@ movhi
	b	.L566
.L598:
	.align	2
.L597:
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
	ldr	r3, .L632
	ldr	r3, [r3]
	ldr	r4, .L632+4
	cmp	r3, #0
	sub	sp, sp, #16
	ldr	r3, [r4, #24]
	beq	.L600
	ldr	r2, .L632+8
	ldr	r2, [r2, #48]
	sub	r1, r2, #1
	cmp	r2, #4
	cmpne	r1, #1
	bls	.L628
.L602:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	bne	.L629
.L599:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L628:
	mov	r2, #1
	cmp	r3, r2
	str	r2, [r4, #28]
	beq	.L604
	ldr	r3, [r4, #16]
	cmp	r3, #0
	beq	.L599
.L629:
	ldr	r5, .L632+12
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
	ldr	r6, .L632+16
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L607
	ldr	r2, [r4, #32]
	cmp	r2, #0
	bne	.L630
.L611:
	mov	r1, #128
	ldr	r2, .L632+20
	ldr	r3, .L632+24
	strh	r1, [r2, #2]	@ movhi
	ldr	r3, [r3]
	ldr	r0, .L632+28
	ldr	r1, .L632+32
	cmp	r3, r1
	cmpne	r3, r0
	moveq	r3, #0
	strheq	r3, [r2, #6]	@ movhi
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L600:
	cmp	r3, #1
	bne	.L602
	ldr	r3, .L632+8
	ldr	r3, [r3, #48]
	sub	r2, r3, #1
	cmp	r3, #4
	cmpne	r2, #1
	bhi	.L602
.L604:
	mov	r3, #1
	str	r3, [r4, #28]
	b	.L602
.L607:
	ldr	r3, .L632+36
	ldrh	r3, [r3]
	tst	r3, #1
	ldr	r2, [r4, #32]
	beq	.L609
	ldr	r3, .L632+40
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L609
	rsbs	r3, r2, #1
	movcc	r3, #0
	ldr	r2, [r4, #28]
	cmp	r2, #1
	str	r3, [r4, #32]
	ldreq	r3, .L632+44
	ldrne	r3, .L632+48
	movne	r2, #1
	ldreq	r1, [r3]
	ldrne	r1, [r3]
	ldreq	r0, .L632+32
	ldrne	r0, .L632+28
	ldr	r3, .L632+52
	mov	lr, pc
	bx	r3
	ldr	r2, [r4, #32]
.L609:
	ldr	r3, .L632+56
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
	ldr	r3, .L632+60
	cmp	r2, #0
	strh	r3, [r1, #2]	@ movhi
	beq	.L611
.L630:
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
	beq	.L611
	mov	r1, #0
	ldr	r2, [r4, #28]
	ldr	r3, .L632+20
	cmp	r2, #1
	strh	r1, [r3, #2]	@ movhi
	beq	.L631
.L612:
	mov	r2, #512
	mov	r1, #1
	ldr	r3, .L632+56
	strh	r2, [r3], #8	@ movhi
	str	r1, [r5, #28]
	strh	r2, [r3]	@ movhi
	b	.L599
.L631:
	ldr	r1, .L632+24
	ldr	r3, .L632+28
	ldr	r1, [r1]
	cmp	r1, r3
	bne	.L612
	ldr	r3, .L632+44
	ldr	r0, .L632+32
	ldr	r1, [r3]
	ldr	r3, .L632+52
	mov	lr, pc
	bx	r3
	b	.L612
.L633:
	.align	2
.L632:
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
	ldr	r3, .L646
	ldr	r0, [r3, #12]
	ldr	r1, [r3, #8]
	ldm	r3, {r2, r3}
	sub	sp, sp, #20
	ldr	r4, .L646+4
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	ldr	r7, .L646+8
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L644
.L636:
	mov	r6, #6
	mov	r8, #512
	ldr	r5, .L646+12
	ldr	r9, .L646+16
	b	.L641
.L639:
	subs	r6, r6, #1
	beq	.L645
.L641:
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
	bne	.L639
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
	bne	.L639
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
	bne	.L639
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
	bne	.L639
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
	bne	.L639
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
	ldreq	r3, .L646+20
	strheq	r8, [r9]	@ movhi
	strheq	r8, [r3]	@ movhi
	b	.L639
.L645:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L644:
	ldr	r3, .L646+24
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
	bne	.L636
	ldr	r3, .L646+28
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
	bne	.L636
	ldr	r3, .L646+32
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
	ldreq	r3, .L646+36
	strheq	r2, [r3], #8	@ movhi
	strheq	r2, [r3]	@ movhi
	b	.L636
.L647:
	.align	2
.L646:
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
	ldr	r3, .L662
	ldr	r3, [r3, #24]
	cmp	r3, #0
	blne	updateWeapon.part.0
.L649:
	bl	updateEMFReader
	bl	updateThermometer
	ldr	r3, .L662+4
	ldr	r3, [r3, #16]
	cmp	r3, #0
	blne	updateUVLight.part.0
.L650:
	bl	updateGhostbook
	bl	updateVideoCam
	bl	updateSpiritBox
	ldr	r3, .L662+8
	ldr	r3, [r3, #20]
	cmp	r3, #0
	blne	updateCamera.part.0
.L651:
	bl	updateItems
	bl	hideText
	mov	r2, #67108864
	ldr	r3, .L662+12
	ldrh	r1, [r3]
	ldr	r3, .L662+16
	strh	r1, [r2, #16]	@ movhi
	ldrh	r1, [r3]
	ldr	r4, .L662+20
	strh	r1, [r2, #18]	@ movhi
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L662+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L663:
	.align	2
.L662:
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
