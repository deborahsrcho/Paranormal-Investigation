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
	ldr	r3, .L31
	ldrh	r1, [r3, #2]
	tst	r1, #32
	push	{r4, r5, r6, lr}
	strh	r2, [r3, #8]	@ movhi
	beq	.L3
	ldr	r1, .L31+4
	ldr	r4, .L31+8
	ldr	r5, .L31+12
	ldr	r2, [r1]
	ldr	r3, [r4]
	ldr	r0, [r5, #16]
	add	r2, r2, #1
	add	r3, r3, #1
	cmp	r0, #0
	str	r2, [r1]
	str	r3, [r4]
	bne	.L26
.L3:
	ldr	r3, .L31
	ldrh	r3, [r3, #2]
	tst	r3, #1
	beq	.L6
	ldr	r3, .L31+16
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L8
	ldr	r2, [r3, #28]
	ldr	r1, [r3, #20]
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #28]
	ble	.L8
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L27
	ldr	r0, .L31+20
	ldr	r1, .L31+24
	ldr	r0, [r0]
	str	r2, [r3, #12]
	str	r2, [r0, #20]
	strh	r2, [r1, #2]	@ movhi
.L8:
	ldr	r3, .L31+28
	ldr	r2, [r3, #12]
	cmp	r2, #0
	bne	.L28
.L12:
	mov	r2, #1
	ldr	r3, .L31
	strh	r2, [r3, #2]	@ movhi
.L6:
	mov	r1, #1
	ldr	r3, .L31
	ldrh	r2, [r3, #2]
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L28:
	ldr	r2, [r3, #28]
	ldr	r1, [r3, #20]
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #28]
	ble	.L12
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L29
	ldr	r0, .L31+20
	ldr	r1, .L31+24
	ldr	r0, [r0]
	str	r2, [r3, #12]
	str	r2, [r0, #32]
	strh	r2, [r1, #6]	@ movhi
	b	.L12
.L26:
	ldr	r2, .L31+32
	smull	r1, r2, r3, r2
	sub	r2, r2, r3, asr #31
	add	r2, r2, r2, lsl #1
	cmp	r3, r2
	asr	r2, r3, #31
	beq	.L30
.L5:
	ldr	r1, .L31+36
	smull	r0, r1, r3, r1
	rsb	r2, r2, r1, asr #2
	add	r2, r2, r2, lsl #2
	cmp	r3, r2, lsl #1
	bne	.L3
	ldr	r5, .L31+40
	mov	lr, pc
	bx	r5
	ldr	r4, .L31+32
	smull	r2, r3, r4, r0
	sub	r3, r3, r0, asr #31
	ldr	r2, .L31+44
	add	r3, r3, r3, lsl #1
	sub	r0, r0, r3
	str	r0, [r2, #24]
	mov	lr, pc
	bx	r5
	smull	r2, r3, r4, r0
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	ldr	r2, .L31+48
	sub	r0, r0, r3
	str	r0, [r2, #24]
	mov	lr, pc
	bx	r5
	smull	r3, r4, r0, r4
	sub	r4, r4, r0, asr #31
	ldr	r3, .L31+52
	add	r4, r4, r4, lsl #1
	sub	r4, r0, r4
	str	r4, [r3, #24]
	b	.L3
.L30:
	ldr	r3, .L31+40
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
	b	.L5
.L27:
	ldm	r3, {r0, r1}
	ldr	r3, .L31+56
	mov	lr, pc
	bx	r3
	b	.L8
.L29:
	ldm	r3, {r0, r1}
	ldr	r3, .L31+60
	mov	lr, pc
	bx	r3
	b	.L12
.L32:
	.align	2
.L31:
	.word	67109376
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
	mov	ip, #416
	str	lr, [sp, #-4]!
	mov	r0, #10
	mov	lr, #436
	ldr	r3, .L35
	ldr	r2, .L35+4
	add	r1, r3, #272
	strh	ip, [r3, #28]	@ movhi
	add	ip, r3, #276
	strh	lr, [ip]	@ movhi
	strh	r0, [r1]	@ movhi
	strh	r0, [r3, #24]	@ movhi
	strh	r2, [r1, #2]	@ movhi
	strh	r2, [r3, #26]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L36:
	.align	2
.L35:
	.word	shadowOAM
	.word	16394
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
	ldr	r3, .L45
	ldr	r3, [r3]
	ldr	r2, .L45+4
	ldr	r1, .L45+8
	sub	r3, r3, #26
	ldr	r2, [r2]
	ldr	r1, [r1]
	add	r3, r3, r3, lsr #31
	asr	r3, r3, #1
	add	r0, r2, r3, lsl #8
	add	ip, r1, #47
	cmp	ip, r0
	blt	.L38
	lsl	r3, r3, #8
	add	r0, r2, #160
	add	r3, r0, r3
	cmp	r1, r3
	bge	.L38
	mov	r0, #384
	push	{r4, r5, r6, r7, r8, lr}
	mov	r4, #388
	ldr	r3, .L45+12
	lsl	r2, r2, #16
	ldr	ip, [r3]
	lsr	r2, r2, #16
	ldr	lr, .L45+16
	ldr	r1, [r3, #4]
	sub	ip, ip, r2
	ldr	r3, .L45+20
	ldrh	r5, [lr]
	and	ip, ip, #255
	strh	ip, [r3, #32]	@ movhi
	ldr	ip, .L45+24
	sub	r1, r1, r5
	ldr	r8, .L45+28
	and	r1, r1, ip
	strh	r1, [r3, #34]	@ movhi
	strh	r0, [r3, #36]	@ movhi
	ldm	r8, {r0, r1}
	sub	r0, r0, r2
	sub	r1, r1, r5
	and	r0, r0, #255
	ldr	r7, .L45+32
	ldr	r6, .L45+36
	and	r1, r1, ip
	ldr	lr, .L45+40
	strh	r0, [r3, #40]	@ movhi
	ldr	r0, .L45+44
	strh	r1, [r3, #42]	@ movhi
	ldm	r7, {r1, r7}
	strh	r4, [r3, #68]	@ movhi
	strh	r0, [r3, #44]	@ movhi
	ldm	lr, {r4, lr}
	ldr	r0, [r6]
	sub	r1, r1, r2
	and	r1, r1, #255
	sub	r4, r4, r2
	sub	r2, r0, r2
	ldr	r0, [r6, #28]
	strh	r1, [r3, #48]	@ movhi
	ldr	r1, [r6, #4]
	cmp	r0, #1
	ldr	r0, .L45+48
	sub	r1, r1, r5
	sub	r7, r7, r5
	sub	lr, lr, r5
	and	r4, r4, #255
	ldr	r5, .L45+52
	strh	r4, [r3, #56]	@ movhi
	strh	r0, [r3, #52]	@ movhi
	and	r4, r2, #255
	and	r0, r1, ip
	and	r7, r7, ip
	and	lr, lr, ip
	lsl	r2, r2, #16
	lsl	r1, r1, #16
	strh	r7, [r3, #50]	@ movhi
	strh	lr, [r3, #58]	@ movhi
	strh	r5, [r3, #60]	@ movhi
	strh	r4, [r3, #64]	@ movhi
	strh	r0, [r3, #66]	@ movhi
	lsr	r2, r2, #16
	lsr	r1, r1, #16
	beq	.L44
.L37:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L38:
	mov	r2, #512
	ldr	r3, .L45+20
	strh	r2, [r3, #32]	@ movhi
	strh	r2, [r3, #40]	@ movhi
	strh	r2, [r3, #48]	@ movhi
	strh	r2, [r3, #56]	@ movhi
	strh	r2, [r3, #64]	@ movhi
	strh	r2, [r3, #96]	@ movhi
	bx	lr
.L44:
	ldr	r0, .L45+56
	add	r2, r2, #10
	add	r1, r1, #10
	and	r2, r2, #255
	and	r1, r1, ip
	strh	r2, [r3, #96]	@ movhi
	strh	r1, [r3, #98]	@ movhi
	strh	r0, [r3, #100]	@ movhi
	b	.L37
.L46:
	.align	2
.L45:
	.word	screenBlock
	.word	vOff
	.word	ghostspot
	.word	thermometer
	.word	hOff
	.word	shadowOAM
	.word	511
	.word	ghostbook
	.word	videocam
	.word	uvlight
	.word	spiritbox
	.word	385
	.word	386
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
	ldr	r3, .L71
	ldrh	r3, [r3]
	ldr	r4, .L71+4
	tst	r3, #2
	sub	sp, sp, #16
	ldr	r3, [r4, #28]
	beq	.L48
	ldr	r2, .L71+8
	ldrh	r2, [r2]
	ands	r5, r2, #2
	beq	.L66
.L48:
	cmp	r3, #400
	blt	.L49
	mov	r3, #0
	mov	r2, r3
	str	r3, [r4, #20]
	ldr	r3, [r4, #16]
	cmp	r3, #0
	bne	.L52
.L68:
	mov	ip, #16
	mov	r0, #24
	ldr	r1, .L71+12
	ldr	r3, [r1]
	ldr	r1, [r1, #4]
	add	r3, r3, ip
	stmib	r4, {r1, ip}
	str	r3, [r4]
	str	r0, [r4, #12]
.L53:
	cmp	r2, #0
	bne	.L67
.L57:
	ldr	r3, [r4, #28]
	add	r3, r3, #1
	str	r3, [r4, #28]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L66:
	cmp	r3, #400
	ble	.L48
	ldr	r3, .L71+16
	mov	r2, r5
	ldr	r1, [r3]
	ldr	r0, .L71+20
	ldr	r3, .L71+24
	mov	lr, pc
	bx	r3
	str	r5, [r4, #28]
.L49:
	mov	r2, #1
	ldr	r3, .L71+12
	ldr	r3, [r3, #32]
	cmp	r3, #0
	str	r2, [r4, #20]
	str	r3, [r4, #16]
	beq	.L68
.L52:
	cmp	r3, #1
	beq	.L69
	cmp	r3, #2
	beq	.L70
	cmp	r3, #3
	bne	.L53
	mov	ip, #24
	mov	r0, #16
	ldr	r1, .L71+12
	ldm	r1, {r1, r3}
	sub	r3, r3, #15
	stm	r4, {r1, r3, ip}
	str	r0, [r4, #12]
	b	.L53
.L67:
	ldr	r5, .L71+28
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
	ldr	r6, .L71+32
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L57
	mov	ip, #0
	ldr	r2, .L71+36
	ldr	r3, [r2]
	ldr	r1, .L71+40
	add	r3, r3, #300
	str	r3, [r2]
	ldr	r1, [r1]
	mov	r2, #1
	ldr	r0, .L71+44
	ldr	r3, .L71+48
	str	ip, [r5, #32]
	mov	lr, pc
	bx	r3
	b	.L57
.L69:
	mov	ip, #16
	mov	r0, #24
	ldr	r1, .L71+12
	ldr	r3, [r1]
	ldr	r1, [r1, #4]
	sub	r3, r3, #15
	stmib	r4, {r1, ip}
	str	r3, [r4]
	str	r0, [r4, #12]
	b	.L53
.L70:
	mov	ip, #24
	mov	r0, #16
	ldr	r1, .L71+12
	ldm	r1, {r1, r3}
	add	r3, r3, #14
	stm	r4, {r1, r3, ip}
	str	r0, [r4, #12]
	b	.L53
.L72:
	.align	2
.L71:
	.word	oldButtons
	.word	weapon
	.word	buttons
	.word	player
	.word	gunsound_length
	.word	gunsound_data
	.word	playSoundB
	.word	ghost
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
	ldr	r3, .L102
	ldrh	r3, [r3]
	tst	r3, #2
	sub	sp, sp, #20
	beq	.L74
	ldr	r3, .L102+4
	ldrh	r2, [r3]
	ands	r4, r2, #2
	beq	.L97
.L74:
	ldr	r5, .L102+8
	ldr	r3, [r5, #28]
	cmp	r3, #199
	ble	.L75
	mov	r3, #0
	mov	r2, #4
	str	r3, [r5, #16]
	str	r2, [r5, #24]
.L79:
	ldr	r4, .L102+12
	cmp	r3, #0
	mov	fp, #1
	ldr	r7, .L102+16
	ldr	r10, .L102+20
	ldr	r9, .L102+24
	ldr	r8, .L102+28
	add	r6, r4, #100
	beq	.L84
	ldr	r3, [r4, #16]
	cmp	r3, #0
	beq	.L98
.L84:
	add	r4, r4, #20
	cmp	r4, r6
	beq	.L99
.L86:
	ldr	r3, [r5, #16]
	cmp	r3, #0
	beq	.L84
	ldr	r3, [r4, #16]
	cmp	r3, #0
	bne	.L84
.L98:
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
	beq	.L84
	ldr	r1, [r10]
	ldr	r2, [r9]
	ldr	r3, [r8]
	str	fp, [r4, #16]
	add	r4, r4, #20
	add	r1, r1, #1
	add	r2, r2, #10
	add	r3, r3, #100
	cmp	r4, r6
	str	r1, [r10]
	str	r2, [r9]
	str	r3, [r8]
	bne	.L86
.L99:
	ldr	r3, [r5, #28]
	add	r3, r3, #1
	str	r3, [r5, #28]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L97:
	ldr	r3, .L102+32
	ldr	r5, .L102+8
	ldr	r1, [r3]
	mov	r2, r4
	ldr	r0, .L102+36
	ldr	r3, .L102+40
	mov	lr, pc
	bx	r3
	str	r4, [r5, #28]
.L75:
	mov	r1, #1
	ldr	r2, .L102+44
	ldr	r3, [r2, #32]
	cmp	r3, #0
	str	r3, [r5, #24]
	str	r1, [r5, #16]
	bne	.L100
	mov	lr, #48
	mov	ip, #32
	ldr	r0, [r2, #4]
	ldr	r3, [r2]
	ldr	r2, [r2, #20]
	sub	r0, r0, #16
	add	r2, r3, r2
.L96:
	mov	r3, r1
	str	r0, [r5, #4]
	str	r2, [r5]
	str	lr, [r5, #8]
	str	ip, [r5, #12]
	b	.L79
.L100:
	cmp	r3, #1
	beq	.L101
	cmp	r3, #2
	bne	.L82
	ldr	r0, [r2, #4]
	ldr	r3, [r2, #16]
	ldr	r2, [r2]
	mov	lr, #32
	mov	ip, #48
	add	r0, r0, r3
	sub	r2, r2, #16
	b	.L96
.L101:
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
	b	.L79
.L82:
	cmp	r3, #3
	bne	.L87
	mov	lr, #32
	mov	ip, #48
	ldm	r2, {r0, r3}
	ldr	r2, [r5, #8]
	sub	r0, r0, #16
	sub	r2, r3, r2
	stm	r5, {r0, r2, lr}
	mov	r3, r1
	str	ip, [r5, #12]
	b	.L79
.L87:
	mov	r3, r1
	b	.L79
.L103:
	.align	2
.L102:
	.word	oldButtons
	.word	buttons
	.word	camera
	.word	occurrences
	.word	collision
	.word	occurrencesCaught
	.word	sanity
	.word	score
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
	mov	r1, #420
	mov	r0, #10
	push	{r4, lr}
	mov	ip, #30
	mov	lr, #15
	ldr	r2, .L106
	ldr	r3, .L106+4
	ldr	r2, [r2]
	add	r4, r3, #292
	add	r2, r2, #512
	strh	r2, [r4]	@ movhi
	ldr	r2, .L106+8
	strh	r1, [r3, #28]	@ movhi
	ldr	r4, .L106+12
	add	r1, r3, #272
	strh	r0, [r1]	@ movhi
	strh	r0, [r3, #24]	@ movhi
	strh	r2, [r1, #2]	@ movhi
	strh	r2, [r3, #26]	@ movhi
	add	r1, r3, #276
	add	r3, r3, #288
	strh	r4, [r1]	@ movhi
	strh	lr, [r3]	@ movhi
	strh	ip, [r3, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L107:
	.align	2
.L106:
	.word	occurrencesCaught
	.word	shadowOAM
	.word	16394
	.word	422
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
	ldr	r3, .L113
	ldr	r3, [r3, #56]
	cmp	r3, #3
	cmpne	r3, #1
	movls	r2, #1
	ldrls	r3, .L113+4
	strls	r2, [r3, #28]
	bx	lr
.L114:
	.align	2
.L113:
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
	ldr	r0, .L117
	orr	r3, r3, #8
	ldrh	r2, [r0]
	strh	r3, [ip, #4]	@ movhi
	ldr	r3, .L117+4
	orr	r2, r2, #33
	strh	r2, [r0]	@ movhi
	strh	r1, [r3, #10]	@ movhi
	strh	r1, [r3, #8]	@ movhi
	strh	lr, [r3, #10]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L118:
	.align	2
.L117:
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
	ldr	r2, .L121
	orr	r3, r3, #8
	ldrh	r1, [r2]
	strh	r3, [ip, #4]	@ movhi
	ldr	r3, .L121+4
	orr	r1, r1, #33
	strh	r1, [r2]	@ movhi
	strh	r0, [r3, #10]	@ movhi
	ldr	r1, .L121+8
	strh	r4, [r2, #8]	@ movhi
	ldr	r2, .L121+12
	strh	r0, [r3, #8]	@ movhi
	str	r2, [r1, #4092]
	strh	lr, [r3, #10]	@ movhi
	pop	{r4, lr}
	bx	lr
.L122:
	.align	2
.L121:
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
	ldr	r3, .L125
	ldr	r0, .L125+4
	ldr	r1, [r3]
	ldr	r0, [r0]
	ldr	r3, .L125+8
	add	r7, r1, #112
	add	ip, r1, #113
	ldr	r1, .L125+12
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
.L126:
	.align	2
.L125:
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
	ldr	r2, .L129
	ldr	r1, [r2, #20]
	ldr	r3, .L129+4
	add	r1, r1, r6
	str	r1, [r3, #12]
	ldr	r1, [r2]
	str	r1, [r3]
	ldr	r1, [r2, #4]
	str	r1, [r3, #4]
	ldr	r1, [r2, #16]
	ldr	lr, .L129+8
	ldr	r5, [r2, #32]
	add	r2, r1, r0
	str	r2, [r3, #8]
	ldm	lr, {r1, r2}
	str	r5, [r3, #24]
	ldr	r5, .L129+12
	str	r4, [r3, #16]
	str	r4, [r3, #20]
	str	r4, [r3, #28]
	add	r2, r2, r6
	ldr	r3, .L129+16
	str	r2, [r5, #4]
	ldr	r2, .L129+20
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
	ldr	r3, .L129+24
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	ldr	r7, [r5, #4]
	rsb	r3, r3, r2, asr #1
	ldr	ip, .L129+28
	add	r3, r3, r3, lsl #2
	ldr	lr, [r5]
	sub	r0, r0, r3
	add	r3, r7, #16
	ldr	r1, .L129+32
	ldr	r2, .L129+36
	str	r3, [ip, #4]
	add	r0, r0, #13
	ldr	r3, .L129+40
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
.L130:
	.align	2
.L129:
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
	mov	r3, #0
	mov	r2, #1
	mov	r1, #16
	mov	ip, #3
	push	{r4, lr}
	ldr	r4, .L133
	ldr	r0, .L133+4
	str	r3, [r4]
	str	r3, [r4, #4]
	str	r3, [r4, #24]
	str	r3, [r4, #36]
	str	r3, [r4, #28]
	str	r3, [r4, #32]
	str	r3, [r4, #44]
	str	r3, [r4, #52]
	str	r2, [r4, #8]
	str	r2, [r4, #12]
	str	r2, [r4, #48]
	str	ip, [r4, #40]
	str	r1, [r4, #16]
	str	r1, [r4, #20]
	mov	lr, pc
	bx	r0
	ldr	r3, .L133+8
	smull	r2, r3, r0, r3
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	sub	r3, r0, r3, lsl #1
	str	r3, [r4, #56]
	pop	{r4, lr}
	bx	lr
.L134:
	.align	2
.L133:
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
	@ link register save eliminated.
	mov	r2, #48
	mov	r0, #32
	mov	r1, #80
	ldr	r3, .L136
	str	r0, [r3, #4]
	str	r1, [r3]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	bx	lr
.L137:
	.align	2
.L136:
	.word	ghostspot
	.size	initghostSpot, .-initghostSpot
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
	ldr	r2, .L142
	mov	r1, #16
	mov	r3, r2
	mov	ip, #0
	push	{r4, r5, r6, lr}
	add	r0, r2, #100
.L139:
	str	r1, [r3, #12]
	str	r1, [r3, #8]
	str	ip, [r3, #16]
	add	r3, r3, #20
	cmp	r3, r0
	bne	.L139
	mov	r3, #20
	mov	r1, #140
	mov	r6, #130
	mov	r5, #300
	mov	r4, #240
	mov	lr, #500
	mov	ip, #480
	mov	r0, #360
	str	r3, [r2, #64]
	ldr	r3, .L142+4
	str	r1, [r2, #44]
	add	r1, r1, #210
	str	r6, [r2]
	str	r5, [r2, #24]
	str	r4, [r2, #20]
	str	lr, [r2, #60]
	str	ip, [r2, #84]
	str	r0, [r2, #80]
	str	r1, [r2, #4]
	str	r3, [r2, #40]
	pop	{r4, r5, r6, lr}
	bx	lr
.L143:
	.align	2
.L142:
	.word	occurrences
	.word	450
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
	push	{r4, lr}
	mov	r4, #1
	mov	lr, #194
	ldr	r1, .L146
	str	r3, [r1]
	ldr	r1, .L146+4
	ldr	r0, .L146+8
	str	r3, [r1]
	ldr	r1, .L146+12
	str	r3, [r0]
	str	r3, [r1]
	ldr	r0, .L146+16
	ldr	r1, .L146+20
	str	r3, [r0]
	str	r3, [r1]
	ldr	r0, .L146+24
	ldr	r1, .L146+28
	str	r3, [r0]
	str	r3, [r1]
	ldr	r0, .L146+32
	ldr	r1, .L146+36
	str	r3, [r0]
	ldrh	ip, [r1]
	ldrh	r0, [r2, #4]
	orr	ip, ip, #33
	orr	r0, r0, #8
	strh	ip, [r1]	@ movhi
	strh	r4, [r1, #8]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	ldr	r2, .L146+40
	ldr	r0, .L146+44
	strh	r3, [r1, #-246]	@ movhi
	str	r0, [r2, #4092]
	strh	r3, [r1, #-248]	@ movhi
	strh	lr, [r1, #-246]	@ movhi
	bl	initPlayer
	bl	initGhost
	mov	r2, #48
	mov	r0, #32
	mov	r1, #80
	ldr	r3, .L146+48
	str	r0, [r3, #4]
	str	r1, [r3]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	bl	initEquipment
	bl	initOccurrences
	ldr	r3, .L146+52
	mov	r2, r4
	ldr	r1, [r3]
	ldr	r0, .L146+56
	ldr	r3, .L146+60
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L147:
	.align	2
.L146:
	.word	tempText
	.word	sanity
	.word	seconds
	.word	buttonTimer
	.word	sanityTimer
	.word	vOff
	.word	hOff
	.word	occurrencesCaught
	.word	score
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.word	ghostspot
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
	ldr	r2, .L154
	ldr	r3, .L154+4
	ldr	r5, [r2]
	ldr	lr, [r3]
	ldr	r2, .L154+8
	sub	r5, r5, #26
	add	r5, r5, r5, lsr #31
	asr	r3, r5, #1
	lsl	r4, lr, #16
	add	r5, lr, #160
	ldrh	r8, [r2]
	ldr	r1, .L154+12
	ldr	r2, .L154+16
	ldr	r7, .L154+20
	add	lr, lr, r3, lsl #8
	add	r5, r5, r3, lsl #8
	lsr	r4, r4, #16
.L151:
	ldr	ip, [r2]
	ldr	r3, [r2, #8]
	add	r3, ip, r3
	sub	r3, r3, #1
	cmp	r3, lr
	ble	.L149
	sub	r9, ip, r4
	lsl	r3, r0, #1
	cmp	ip, r5
	and	r9, r9, #255
	add	r3, r3, #544
	bge	.L149
	ldr	ip, [r2, #4]
	sub	ip, ip, r8
	and	ip, ip, r7
	orr	ip, ip, #16384
	strh	r9, [r1, #144]	@ movhi
	strh	r3, [r1, #148]	@ movhi
	strh	ip, [r1, #146]	@ movhi
.L150:
	add	r0, r0, #1
	cmp	r0, #5
	add	r2, r2, #20
	add	r1, r1, #8
	bne	.L151
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L149:
	strh	r6, [r1, #144]	@ movhi
	b	.L150
.L155:
	.align	2
.L154:
	.word	screenBlock
	.word	vOff
	.word	hOff
	.word	shadowOAM
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
	ldr	r5, .L256
	ldr	r2, .L256+4
	ldr	r1, [r5]
	smull	r3, r0, r2, r1
	ldr	r4, .L256+8
	ldr	r7, .L256+12
	ldr	r9, .L256+16
	asr	r2, r1, #31
	rsb	r2, r2, r0, asr #4
	ldr	r3, [r4, #44]
	ldr	lr, [r7, #32]
	ldr	r0, .L256+20
	ldr	ip, [r9, #32]
	ldr	r0, [r0, #32]
	ldr	r8, .L256+24
	orr	r3, r3, lr
	orr	r3, r3, ip
	orr	r3, r3, r0
	ldr	r6, .L256+28
	ldr	r0, [r8, #32]
	add	r2, r2, r2, lsl #2
	orr	r3, r3, r0
	ldr	r0, [r6, #20]
	add	r2, r2, r2, lsl #2
	sub	r2, r1, r2, lsl #1
	orr	r3, r3, r0
	orrs	r3, r3, r2
	sub	sp, sp, #12
	bne	.L246
	ldr	r3, .L256+32
	ldrh	r10, [r3, #48]
	ands	r10, r10, #64
	beq	.L247
.L159:
	ldr	r3, .L256+32
	ldrh	r10, [r3, #48]
	ands	r10, r10, #128
	bne	.L161
	ldr	r2, [r4]
	ldr	r3, [r4, #20]
	add	r2, r2, r3
	cmp	r2, #576
	blt	.L248
.L161:
	ldr	r3, .L256+32
	ldrh	r10, [r3, #48]
	ands	r10, r10, #32
	bne	.L162
	ldr	r3, [r4, #4]
	cmp	r3, #0
	bgt	.L249
.L162:
	ldr	r3, .L256+32
	ldrh	r10, [r3, #48]
	ands	r10, r10, #16
	bne	.L163
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #16]
	add	r3, r3, r2
	cmp	r3, #512
	blt	.L250
.L163:
	mov	r3, #1
	str	r3, [r4, #28]
.L246:
	ldr	r3, .L256+36
	str	r3, [sp, #4]
.L158:
	ldr	r10, .L256+40
	ldr	r3, [r10, #44]
	cmp	r3, #0
	beq	.L251
.L164:
	ldr	r3, .L256+44
	ldrh	r3, [r3]
	tst	r3, #256
	and	r3, r3, #1
	beq	.L169
	ldr	r2, .L256+48
	ldrh	r2, [r2]
	tst	r2, #256
	bne	.L169
.L180:
	ldr	r2, [r4, #48]
	add	r2, r2, #1
	cmp	r2, #2
	str	r2, [r4, #48]
	movgt	r2, #0
	strgt	r2, [r4, #48]
	bgt	.L171
	cmp	r2, #1
	beq	.L252
	cmp	r2, #2
	bne	.L173
	mov	r2, #0
	mov	r0, #1
	mov	r1, #200
	ldr	ip, .L256+52
	str	r2, [r6, #24]
	str	r2, [ip, #20]
	ldr	r2, .L256+56
	str	r0, [r2, #20]
	str	r1, [r2, #28]
.L169:
	cmp	r3, #0
	beq	.L175
	ldr	r2, .L256+48
.L174:
	ldrh	r3, [r2]
	tst	r3, #1
	bne	.L175
.L182:
	ldr	r3, .L256+52
	ldr	r3, [r3, #16]
	cmp	r3, #2
	bgt	.L253
.L175:
	ldr	r3, [sp, #4]
	ldr	r2, [r5]
	ldr	r3, [r3]
	add	r2, r2, #1
	cmp	r3, #256
	str	r2, [r5]
	ble	.L177
	ldr	r2, .L256+60
	ldr	r1, [r2]
	cmp	r1, #26
	beq	.L254
.L179:
	mov	r2, #67108864
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [r2, #18]	@ movhi
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L177:
	cmp	r3, #0
	bgt	.L179
	ldr	r2, .L256+60
	ldr	r1, [r2]
	cmp	r1, #28
	bne	.L179
	mov	ip, #26
	mov	r1, #67108864
	ldr	lr, [sp, #4]
	ldr	r0, .L256+64
	add	r3, r3, #256
	str	r3, [lr]
	str	ip, [r2]
	strh	r0, [r1, #8]	@ movhi
	b	.L179
.L251:
	ldr	r2, .L256+68
	mov	r1, #512
	ldr	r3, [r4]
	ldr	r0, [r2]
	ldr	ip, .L256+72
	ldr	r2, [r4, #4]
	mov	lr, pc
	bx	ip
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #4]
	add	r2, r2, r3
	ldr	r3, .L256+68
	mov	fp, r0
	mov	r1, #512
	ldr	r0, [r3]
	ldr	ip, .L256+72
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
	ldr	r2, .L256+68
	mov	r1, #512
	ldr	r0, [r2]
	ldr	ip, .L256+72
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
	ldr	r1, .L256+68
	add	r3, r3, r0
	cmp	ip, #2
	orreq	fp, fp, #1
	ldr	r0, [r1]
	ldr	ip, .L256+72
	mov	r1, #512
	sub	r3, r3, #1
	sub	r2, r2, #1
	mov	lr, pc
	bx	ip
	cmp	r0, #2
	orreq	fp, fp, #1
	cmp	fp, #0
	beq	.L164
	ldr	r3, .L256+44
	ldrh	r2, [r3]
	ands	r3, r2, #1
	and	r1, r2, #256
	beq	.L165
	ldr	r2, .L256+48
	ldrh	r0, [r2]
	ands	ip, r0, #1
	beq	.L255
	cmp	r1, #0
	beq	.L175
.L181:
	tst	r0, #256
	beq	.L180
	b	.L174
.L254:
	mov	ip, #28
	mov	r1, #67108864
	ldr	lr, [sp, #4]
	ldr	r0, .L256+76
	sub	r3, r3, #256
	str	r3, [lr]
	str	ip, [r2]
	strh	r0, [r1, #8]	@ movhi
	b	.L179
.L253:
	ldr	r2, [r10, #32]
	ldr	r3, [r7, #16]
	orrs	r3, r2, r3
	bne	.L175
	mov	r2, #1
	ldr	r3, .L256+80
	ldm	r3, {r1, r3}
	ldr	r0, .L256+84
	sub	ip, r1, #8
	add	r1, r1, #8
	ldr	lr, .L256+20
	str	r1, [r8]
	str	r1, [r0]
	sub	r1, r3, #10
	str	r1, [r7, #4]
	str	r1, [r8, #4]
	add	r1, r3, #6
	add	r3, r3, #22
	str	ip, [r7]
	str	ip, [r9]
	str	ip, [lr]
	str	r1, [r9, #4]
	str	r3, [lr, #4]
	str	r3, [r0, #4]
	str	r2, [r0, #16]
	str	r2, [r7, #16]
	str	r2, [r9, #16]
	str	r2, [lr, #16]
	str	r2, [r8, #16]
	b	.L175
.L173:
	cmp	r2, #0
	bne	.L169
.L171:
	mov	r2, #0
	mov	ip, #1
	mov	r0, #400
	ldr	r1, .L256+52
	str	r2, [r1, #20]
	ldr	r1, .L256+56
	str	ip, [r6, #24]
	str	r0, [r6, #28]
	str	r2, [r1, #20]
	b	.L169
.L252:
	mov	r1, #0
	ldr	ip, .L256+56
	ldr	r0, .L256+52
	str	r1, [r6, #24]
	str	r1, [ip, #20]
	str	r2, [r0, #20]
	b	.L169
.L165:
	cmp	r1, #0
	beq	.L175
	ldr	r2, .L256+48
	ldrh	r3, [r2]
	ands	r3, r3, #256
	beq	.L180
	b	.L175
.L255:
	ldr	lr, [r4, #44]
	cmp	lr, #0
	moveq	ip, #1
	cmp	r1, #0
	str	ip, [r4, #44]
	beq	.L182
	b	.L181
.L247:
	ldr	r3, [r4]
	cmp	r3, #1
	ble	.L159
	ldr	r2, [r4, #8]
	ldr	fp, .L256+68
	sub	r3, r3, r2
	mov	r1, #512
	ldr	r0, [fp]
	ldr	r2, [r4, #4]
	ldr	ip, .L256+72
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L159
	ldr	r0, [r4, #16]
	ldr	r2, [r4, #4]
	ldr	r1, [r4]
	ldr	r3, [r4, #8]
	add	r2, r2, r0
	sub	r3, r1, r3
	ldr	r0, [fp]
	mov	r1, #512
	ldr	ip, .L256+72
	sub	r2, r2, #1
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L159
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
	ldr	ip, .L256+72
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L159
	ldr	r1, [r4]
	ldr	r2, [r4, #8]
	ldr	r3, .L256+60
	sub	r1, r1, r2
	ldr	r3, [r3]
	ldr	r2, .L256+36
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
	ldrne	r3, .L256+36
	subne	r2, r2, #1
	strne	r2, [r3]
	b	.L158
.L249:
	ldr	r2, [r4, #12]
	ldr	fp, .L256+68
	sub	r2, r3, r2
	mov	r1, #512
	ldr	r0, [fp]
	ldr	r3, [r4]
	ldr	ip, .L256+72
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L162
	ldr	r0, [r4, #20]
	ldr	r3, [r4]
	ldr	r1, [r4, #4]
	ldr	r2, [r4, #12]
	add	r3, r3, r0
	sub	r2, r1, r2
	ldr	r0, [fp]
	mov	r1, #512
	ldr	ip, .L256+72
	sub	r3, r3, #1
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L162
	ldr	r0, .L256+88
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
	beq	.L246
	sub	r3, r3, #1
	str	r3, [r0]
	ldr	r3, .L256+36
	str	r3, [sp, #4]
	b	.L158
.L248:
	ldr	r3, [r4, #8]
	ldr	fp, .L256+68
	sub	r2, r2, #1
	add	r3, r2, r3
	mov	r1, #512
	ldr	r0, [fp]
	ldr	r2, [r4, #4]
	ldr	ip, .L256+72
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L161
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
	ldr	ip, .L256+72
	sub	r2, r2, #1
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L161
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
	ldr	ip, .L256+72
	sub	r2, r2, #1
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L161
	ldr	r3, .L256+36
	ldr	r2, [r4]
	ldr	r1, [r4, #8]
	str	r3, [sp, #4]
	ldr	r3, [r3]
	add	r2, r2, r1
	sub	r1, r2, r3
	ldr	r0, .L256+92
	cmp	r1, #79
	movgt	r1, #1
	movle	r1, #0
	cmp	r3, r0
	movgt	r1, #0
	cmp	r1, #0
	str	r10, [r4, #32]
	str	r10, [r4, #28]
	str	r2, [r4]
	beq	.L158
	cmp	r3, #159
	movgt	r2, #0
	movle	r2, #1
	ldr	r1, .L256+60
	ldr	r1, [r1]
	cmp	r1, #28
	orrne	r2, r2, #1
	cmp	r2, #0
	ldrne	r2, .L256+36
	addne	r3, r3, #1
	strne	r3, [r2]
	b	.L158
.L250:
	ldr	r2, [r4, #12]
	ldr	fp, .L256+68
	sub	r3, r3, #1
	add	r2, r3, r2
	mov	r1, #512
	ldr	r0, [fp]
	ldr	r3, [r4]
	ldr	ip, .L256+72
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L163
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
	ldr	ip, .L256+72
	sub	r3, r3, #1
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L163
	ldr	r0, .L256+88
	ldr	r1, [r4, #4]
	ldr	r2, [r4, #12]
	ldr	r3, [r0]
	add	r2, r1, r2
	sub	r1, r2, r3
	ldr	ip, .L256+96
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
	beq	.L246
	add	r3, r3, #1
	str	r3, [r0]
	ldr	r3, .L256+36
	str	r3, [sp, #4]
	b	.L158
.L257:
	.align	2
.L256:
	.word	buttonTimer
	.word	1374389535
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
	.word	buttons
	.word	EMFReader
	.word	camera
	.word	screenBlock
	.word	-9600
	.word	.LANCHOR0
	.word	collisionCheck
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
	ldr	r4, .L264
	ldr	r2, .L264+4
	ldr	r3, .L264+8
	ldr	r5, [r4, #24]
	mla	r3, r5, r3, r2
	ldr	r2, .L264+12
	cmp	r2, r3, ror #3
	bcc	.L259
	ldr	r0, [r4, #36]
	ldr	r3, .L264+16
	ldr	r1, [r4, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #36]
.L259:
	ldr	r1, [r4, #44]
	cmp	r1, #0
	beq	.L260
	mov	r2, #512
	ldr	r3, .L264+20
	pop	{r4, r5, r6, lr}
	strh	r2, [r3]	@ movhi
	bx	lr
.L260:
	ldr	r2, .L264+24
	ldr	r0, [r2]
	ldr	r2, .L264+28
	ldr	r3, [r4, #4]
	ldr	ip, [r2]
	ldr	r2, [r4]
	sub	r3, r3, r0
	sub	r2, r2, ip
	lsl	r3, r3, #23
	ldr	ip, [r4, #28]
	ldr	r0, .L264+20
	lsr	r3, r3, #23
	cmp	ip, #0
	and	r2, r2, #255
	orr	r3, r3, #16384
	strh	r3, [r0, #2]	@ movhi
	strh	r2, [r0]	@ movhi
	ldr	r3, [r4, #32]
	ldreq	r2, [r4, #36]
	addeq	r3, r3, r2, lsl #5
	addeq	r5, r5, #1
	lslne	r3, r3, #1
	lsleq	r3, r3, #1
	strne	r1, [r4, #36]
	strne	r1, [r4, #24]
	streq	r5, [r4, #24]
	strhne	r3, [r0, #4]	@ movhi
	strheq	r3, [r0, #4]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L265:
	.align	2
.L264:
	.word	player
	.word	85899344
	.word	-1030792151
	.word	21474836
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
	push	{r4, r5, r6, lr}
	ldr	r3, .L277
	ldr	r2, [r3, #32]
	cmp	r2, #0
	sub	sp, sp, #16
	beq	.L267
	ldr	r3, [r3, #56]
	sub	r2, r3, #1
	cmp	r3, #5
	cmpne	r2, #1
	bls	.L276
.L268:
	mov	r0, #3
	mvn	r2, #46336
	ldr	r1, .L277+4
	ldr	r3, .L277+8
	str	r0, [r1, #16]
	strh	r2, [r3, #6]	@ movhi
.L266:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L276:
	mov	r0, #4
	ldr	r1, .L277+4
	ldr	r3, .L277+8
	ldr	r2, .L277+12
	str	r0, [r1, #16]
	strh	r2, [r3, #6]	@ movhi
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L267:
	ldr	r5, .L277+16
	ldm	r5, {r2, r3}
	ldr	r0, [r5, #12]
	ldr	r1, [r5, #8]
	ldr	r4, .L277+20
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	ldr	r6, .L277+24
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L268
	ldm	r5, {r2, r3}
	ldr	r0, [r5, #12]
	ldr	r1, [r5, #8]
	add	r0, r0, #96
	add	r1, r1, #96
	sub	r2, r2, #48
	sub	r3, r3, #48
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L270
	mov	r0, #2
	mvn	r2, #46080
	ldr	r1, .L277+4
	ldr	r3, .L277+8
	str	r0, [r1, #16]
	strh	r2, [r3, #6]	@ movhi
	b	.L266
.L270:
	ldm	r5, {r2, r3}
	ldr	r0, [r5, #12]
	ldr	r1, [r5, #8]
	add	r0, r0, #192
	add	r1, r1, #192
	sub	r2, r2, #96
	sub	r3, r3, #96
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	movne	r0, #1
	ldrne	r1, .L277+4
	ldrne	r3, .L277+8
	ldrne	r2, .L277+28
	ldreq	r1, .L277+4
	ldreq	r3, .L277+8
	ldreq	r2, .L277+32
	str	r0, [r1, #16]
	strh	r2, [r3, #6]	@ movhi
	b	.L266
.L278:
	.align	2
.L277:
	.word	ghost
	.word	EMFReader
	.word	83886592
	.word	20063
	.word	ghostspot
	.word	player
	.word	collision
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
	ldr	r3, .L281
	ldr	r3, [r3, #20]
	cmp	r3, #0
	bxeq	lr
	b	drawEMFReader.part.0
.L282:
	.align	2
.L281:
	.word	EMFReader
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
	ldr	r3, .L285
	ldr	r3, [r3, #16]
	cmp	r3, #0
	bxeq	lr
	b	drawEquipment.part.0
.L286:
	.align	2
.L285:
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
	ldr	r3, .L289
	ldr	r3, [r3, #24]
	cmp	r3, #0
	bxeq	lr
	b	updateWeapon.part.0
.L290:
	.align	2
.L289:
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
	ldr	r1, .L305
	ldr	r3, [r1, #20]
	cmp	r3, #0
	beq	.L304
	push	{r4, lr}
	mov	lr, #10
	ldr	r2, .L305+4
	ldr	r3, [r1, #4]
	ldr	r0, [r2]
	ldr	r2, .L305+8
	sub	r3, r3, r0
	lsl	r3, r3, #23
	ldr	r0, [r2]
	lsr	r3, r3, #23
	ldr	r2, .L305+12
	ldr	r4, .L305+16
	orr	r3, r3, #16384
	ldr	ip, [r1]
	strh	r3, [r2, #10]	@ movhi
	add	r3, r2, #272
	strh	lr, [r3]	@ movhi
	strh	r4, [r3, #2]	@ movhi
	sub	ip, ip, r0
	ldr	r3, [r1, #24]
	ldr	r0, [r1, #16]
	and	ip, ip, #255
	cmp	r3, #0
	add	r0, r0, #4
	lsl	r0, r0, #1
	strh	ip, [r2, #8]	@ movhi
	ldrne	r3, .L305+20
	ldr	ip, .L305+24
	strh	r0, [r2, #12]	@ movhi
	add	r0, r2, #276
	strh	ip, [r0]	@ movhi
	strhne	r3, [r2, #28]	@ movhi
	pop	{r4, lr}
	bx	lr
.L304:
	mov	r3, #512
	ldr	r2, .L305+12
	strh	r3, [r2, #8]	@ movhi
	ldr	r3, [r1, #24]
	cmp	r3, #0
	ldrne	r3, .L305+20
	strhne	r3, [r2, #28]	@ movhi
	bx	lr
.L306:
	.align	2
.L305:
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
	ldr	r3, .L309
	ldr	r3, [r3, #20]
	cmp	r3, #0
	bxeq	lr
	b	updateCamera.part.0
.L310:
	.align	2
.L309:
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
	ldr	r3, .L313
	ldr	r3, [r3, #20]
	cmp	r3, #0
	bne	drawCamera.part.0
.L312:
	mov	r2, #512
	ldr	r3, .L313+4
	strh	r2, [r3]	@ movhi
	bx	lr
.L314:
	.align	2
.L313:
	.word	camera
	.word	shadowOAM+288
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
	ldr	r4, .L323
	ldr	r3, .L323+4
	ldr	r5, [r4, #24]
	smull	r1, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #2
	bne	.L316
	ldr	r0, [r4, #36]
	ldr	r3, .L323+8
	ldr	r1, [r4, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #36]
.L316:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L322
	mov	r2, #512
	ldr	r3, .L323+12
	strh	r2, [r3, #16]	@ movhi
.L315:
	pop	{r4, r5, r6, lr}
	bx	lr
.L322:
	ldr	r3, .L323+16
	ldr	r2, .L323+20
	ldr	r1, .L323+24
	ldr	r3, [r3]
	mla	r3, r1, r3, r2
	ldr	r2, .L323+28
	cmp	r2, r3, ror #2
	bcc	.L315
	ldr	r3, .L323+32
	ldr	r3, [r3]
	ldr	r0, .L323+36
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
	ble	.L319
	add	r2, r0, #160
	add	r3, r2, r3
	cmp	r1, r3
	bge	.L319
	ldr	r3, .L323+40
	ldr	r2, [r3]
	ldr	r3, [r4, #4]
	sub	r3, r3, r2
	ldr	r2, [r4, #36]
	add	ip, r2, #3
	ldr	r2, [r4, #28]
	lsl	r3, r3, #23
	sub	r1, r1, r0
	lsr	r3, r3, #23
	ldr	r0, .L323+12
	add	r2, r2, ip, lsl #5
	and	r1, r1, #255
	orr	r3, r3, #16384
	lsl	r2, r2, #1
	strh	r1, [r0, #16]	@ movhi
	strh	r3, [r0, #18]	@ movhi
	strh	r2, [r0, #20]	@ movhi
	b	.L320
.L319:
	mov	r2, #512
	ldr	r3, .L323+12
	strh	r2, [r3, #16]	@ movhi
.L320:
	add	r5, r5, #1
	str	r5, [r4, #24]
	pop	{r4, r5, r6, lr}
	bx	lr
.L324:
	.align	2
.L323:
	.word	ghost
	.word	1717986919
	.word	__aeabi_idivmod
	.word	shadowOAM
	.word	buttonTimer
	.word	85899344
	.word	-1030792151
	.word	42949672
	.word	screenBlock
	.word	vOff
	.word	hOff
	.size	drawGhost, .-drawGhost
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
	ldr	r3, .L337
	ldr	lr, .L337+4
	ldr	ip, [r3]
	ldr	r1, [lr]
	cmp	ip, r1
	sub	sp, sp, #20
	ble	.L326
	mov	r2, #1
	ldr	r0, [r3, #8]
	str	r2, [r3, #28]
	sub	ip, ip, r0
	ldr	r2, [r3, #4]
	ldr	r0, [lr, #4]
	cmp	r2, r0
	str	ip, [r3]
	ble	.L328
.L336:
	mov	r4, #3
	ldr	r5, [r3, #12]
	sub	r2, r2, r5
	str	r2, [r3, #4]
	str	r4, [r3, #28]
.L329:
	add	r3, r3, #16
	ldm	r3, {r3, r4}
	stm	sp, {r2, ip}
	str	r4, [sp, #12]
	str	r3, [sp, #8]
	add	r2, lr, #16
	ldm	r2, {r2, r3}
	ldr	r4, .L337+8
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	bne	.L335
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L326:
	movlt	r2, #0
	ldrlt	r0, [r3, #8]
	strlt	r2, [r3, #28]
	addlt	ip, ip, r0
	ldr	r2, [r3, #4]
	ldr	r0, [lr, #4]
	strlt	ip, [r3]
	cmp	r2, r0
	bgt	.L336
.L328:
	movlt	r4, #2
	ldrlt	r5, [r3, #12]
	addlt	r2, r2, r5
	strlt	r2, [r3, #4]
	strlt	r4, [r3, #28]
	b	.L329
.L335:
	ldr	r3, .L337+12
	mov	lr, pc
	bx	r3
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L338:
	.align	2
.L337:
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
	ldr	r4, .L360
	ldr	r3, [r4, #32]
	cmp	r3, #0
	sub	sp, sp, #20
	beq	.L340
.L345:
	ldr	r3, .L360+4
	ldr	r2, .L360+8
	ldr	r1, .L360+12
	ldr	r3, [r3]
	mla	r3, r1, r3, r2
	ldr	r2, .L360+16
	cmp	r2, r3, ror #2
	bcc	.L339
	ldr	r3, [r4, #44]
	cmp	r3, #0
	bne	.L346
	ldr	r3, [r4, #4]
	cmp	r3, #200
	bgt	.L347
	ldr	r2, [r4, #52]
	cmp	r2, #0
	beq	.L357
.L347:
	ldr	r1, [r4]
	cmp	r1, #120
	bgt	.L350
	ldr	r2, [r4, #52]
	cmp	r2, #1
	beq	.L358
.L350:
	cmp	r3, #29
	ble	.L352
	ldr	r2, [r4, #52]
	cmp	r2, #2
	beq	.L359
.L352:
	cmp	r1, #19
	ble	.L349
	ldr	r3, [r4, #52]
	cmp	r3, #3
	bne	.L349
	mov	r2, #1
	ldr	r3, [r4, #8]
	sub	r1, r1, r3
	cmp	r1, #20
	str	r1, [r4]
	str	r2, [r4, #28]
	bne	.L349
	ldr	r3, .L360+20
	ldr	r0, .L360+24
	ldr	r1, [r3]
	ldr	r3, .L360+28
	mov	lr, pc
	bx	r3
	mov	r3, #0
	str	r3, [r4, #32]
	str	r3, [r4, #52]
	b	.L349
.L346:
	bl	chase
.L349:
	ldr	r0, .L360+32
	ldr	r3, [r0, #44]
	cmp	r3, #0
	bne	.L339
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
	ldr	r5, .L360+36
	add	r2, r2, r2, lsl #2
	sub	r1, r1, #32
	sub	r0, r0, #32
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	movne	r3, #1
	strne	r3, [r4, #44]
.L339:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L340:
	ldr	r3, .L360+40
	ldrh	r3, [r3]
	tst	r3, #512
	beq	.L339
	ldr	r3, .L360+44
	ldrh	r3, [r3]
	ands	r3, r3, #512
	bne	.L339
	mov	r2, #1
	ldr	r1, .L360+48
	str	r3, [r4, #4]
	str	r3, [r4]
	str	r3, [r4, #52]
	str	r3, [r4, #44]
	ldr	r1, [r1]
	ldr	r3, .L360+28
	ldr	r0, .L360+52
	str	r2, [r4, #32]
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L339
	b	.L345
.L357:
	ldr	r1, [r4, #12]
	add	r3, r3, r1
	cmp	r3, #200
	mov	r2, #2
	str	r3, [r4, #4]
	moveq	r3, #1
	str	r2, [r4, #28]
	streq	r3, [r4, #52]
	b	.L349
.L358:
	mov	r3, #0
	ldr	r2, [r4, #8]
	add	r1, r1, r2
	cmp	r1, #120
	str	r3, [r4, #28]
	moveq	r3, #2
	str	r1, [r4]
	streq	r3, [r4, #52]
	b	.L349
.L359:
	mov	r2, #3
	ldr	r1, [r4, #12]
	sub	r3, r3, r1
	cmp	r3, #30
	str	r3, [r4, #4]
	str	r2, [r4, #28]
	streq	r2, [r4, #52]
	b	.L349
.L361:
	.align	2
.L360:
	.word	ghost
	.word	buttonTimer
	.word	85899344
	.word	-1030792151
	.word	42949672
	.word	gamemusic_length
	.word	gamemusic_data
	.word	playSoundA
	.word	player
	.word	collision
	.word	oldButtons
	.word	buttons
	.word	ghostmusic_length
	.word	ghostmusic_data
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
	push	{r4, r5, r6, lr}
	ldr	r5, .L371
	ldr	r3, [r5]
	cmp	r3, #99
	ldr	r6, .L371+4
	bgt	.L369
	ldr	r4, .L371+8
.L363:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L365
	ldr	r2, [r6]
	cmp	r2, #0
	ble	.L366
	ldr	r2, [r5]
	cmp	r2, #99
	addle	r2, r2, #1
	strle	r2, [r5]
	strle	r3, [r6]
.L366:
	mov	r2, #194
	ldr	r3, .L371+12
	pop	{r4, r5, r6, lr}
	strh	r2, [r3, #10]	@ movhi
	bx	lr
.L365:
	mov	r3, #0
	ldr	r2, .L371+12
	strh	r3, [r2, #10]	@ movhi
	str	r3, [r6]
	str	r3, [r5]
	pop	{r4, r5, r6, lr}
	bx	lr
.L369:
	ldr	r3, [r6]
	cmp	r3, #3
	bgt	.L364
	mov	r3, #0
	ldr	r4, .L371+8
	str	r3, [r4, #4]
	str	r3, [r4]
	str	r3, [r4, #52]
	str	r3, [r4, #44]
	b	.L363
.L364:
	mov	r2, #1
	ldr	r3, .L371+16
	ldr	r4, .L371+8
	ldr	r1, [r3]
	ldr	r0, .L371+20
	ldr	r3, .L371+24
	str	r2, [r4, #32]
	mov	lr, pc
	bx	r3
	b	.L363
.L372:
	.align	2
.L371:
	.word	sanity
	.word	sanityTimer
	.word	ghost
	.word	67109120
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
	ldr	r3, .L378
	ldr	r3, [r3, #32]
	cmp	r3, #0
	push	{r4, r5, r6, lr}
	bne	.L374
	ldr	r3, .L378+4
	ldr	r2, [r3]
	cmp	r2, #99
	ble	.L375
	ldr	r3, .L378+8
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L375
.L374:
	mov	r0, #428
	mov	lr, #432
	mov	r2, #512
	ldr	r3, .L378+12
	ldr	r1, .L378+16
	ldr	ip, .L378+20
	strh	r1, [r3, #90]	@ movhi
	strh	r0, [r3, #92]	@ movhi
	ldr	r1, .L378+24
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
.L375:
	ldr	r3, .L378+28
	smull	r0, r1, r3, r2
	mov	ip, #512
	mov	r5, #424
	mov	r4, #214
	mov	lr, #222
	mov	r0, #12
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #5
	add	r3, r3, r3, lsl #2
	ldr	r1, .L378+32
	add	r3, r3, r3, lsl #2
	sub	r3, r2, r3, lsl #2
	smull	r6, r2, r1, r3
	asr	r1, r3, #31
	rsb	r1, r1, r2, asr #2
	add	r2, r1, r1, lsl #2
	sub	r3, r3, r2, lsl #1
	ldr	r2, .L378+12
	add	r3, r3, ip
	add	r1, r1, ip
	strh	r3, [r2, #76]	@ movhi
	ldr	r3, .L378+24
	strh	r1, [r2, #84]	@ movhi
	ldr	r1, .L378+16
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
.L379:
	.align	2
.L378:
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
	ldr	r3, .L392
	ldr	r3, [r3, #20]
	cmp	r3, #0
	blne	drawEMFReader.part.0
.L381:
	ldr	r3, .L392+4
	ldr	r3, [r3, #20]
	cmp	r3, #0
	beq	.L382
	bl	drawCamera.part.0
.L383:
	ldr	r3, .L392+8
	ldr	r3, [r3, #16]
	cmp	r3, #0
	blne	drawEquipment.part.0
.L384:
	bl	drawSanity
	pop	{r4, lr}
	b	drawOccurrences
.L382:
	mov	r2, #512
	ldr	r3, .L392+12
	strh	r2, [r3]	@ movhi
	b	.L383
.L393:
	.align	2
.L392:
	.word	EMFReader
	.word	camera
	.word	thermometer
	.word	shadowOAM+288
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
	push	{r4, r5, r6, r7, lr}
	ldr	r4, .L423
	ldr	r3, [r4, #24]
	cmp	r3, #1
	sub	sp, sp, #20
	beq	.L420
.L395:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	beq	.L394
	ldr	r3, .L423+4
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L421
.L399:
	ldr	r3, [r4, #32]
	cmp	r3, #1
	beq	.L422
.L402:
	mov	r2, #512
	ldr	r3, .L423+8
	strh	r2, [r3, #104]	@ movhi
	strh	r2, [r3, #112]	@ movhi
	strh	r2, [r3, #120]	@ movhi
	strh	r2, [r3, #128]	@ movhi
.L394:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L421:
	ldr	r3, .L423+12
	ldrh	r3, [r3]
	ands	r5, r3, #1
	bne	.L399
	ldr	r6, .L423+16
	ldr	ip, [r4, #8]
	add	r2, r6, #16
	ldm	r2, {r2, r3}
	ldr	r7, [r4, #12]
	ldr	lr, [r4]
	str	ip, [sp, #8]
	ldr	ip, [r4, #4]
	str	r7, [sp, #12]
	stm	sp, {ip, lr}
	ldr	r1, [r6]
	ldr	r0, [r6, #4]
	ldr	r7, .L423+20
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L399
	ldr	r3, [r4, #32]
	cmp	r3, #0
	moveq	r3, #1
	strne	r5, [r4, #32]
	streq	r3, [r4, #32]
	bne	.L402
	b	.L401
.L420:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	ble	.L396
	ldr	r2, .L423+24
	ldr	r2, [r2, #56]
	bic	r1, r2, #2
	cmp	r1, #0
	cmpne	r2, #5
	bne	.L397
.L419:
	sub	r3, r3, #3
	str	r3, [r4, #28]
.L396:
	mov	r3, #4
	str	r3, [r4, #24]
	b	.L395
.L397:
	cmp	r3, #5
	bgt	.L419
	b	.L396
.L422:
	ldr	r6, .L423+16
	ldr	r7, .L423+20
.L401:
	ldm	r4, {r2, r3}
	ldr	r0, [r4, #12]
	ldr	r1, [r4, #8]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r6, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r6]
	ldr	r0, [r6, #4]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L402
	mov	r3, #1
	mov	ip, #152
	ldr	r0, [r4, #28]
	ldr	r2, .L423+8
	str	r3, [r6, #28]
	ldr	r3, .L423+28
	cmp	r0, #0
	ldr	r1, .L423+32
	strh	r3, [r2, #130]	@ movhi
	movge	r3, #512
	strh	ip, [r2, #132]	@ movhi
	strh	r1, [r2, #128]	@ movhi
	movlt	ip, #137
	movlt	r1, #100
	ldrlt	r3, .L423+36
	strhge	r3, [r2, #120]	@ movhi
	strhlt	r3, [r2, #124]	@ movhi
	ldr	r3, .L423+40
	strhlt	ip, [r2, #120]	@ movhi
	strhlt	r1, [r2, #122]	@ movhi
	smull	ip, r1, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r1, asr #5
	add	r3, r3, r3, lsl #2
	ldr	r1, .L423+44
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #2
	smull	ip, r0, r1, r3
	asr	r1, r3, #31
	rsb	r1, r1, r0, asr #2
	add	r0, r1, r1, lsl #2
	sub	r3, r3, r0, lsl #1
	mov	lr, #108
	mov	r0, #137
	mov	ip, #118
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
	b	.L394
.L424:
	.align	2
.L423:
	.word	thermometer
	.word	oldButtons
	.word	shadowOAM
	.word	buttons
	.word	player
	.word	collision
	.word	ghost
	.word	-16296
	.word	16504
	.word	522
	.word	1374389535
	.word	1717986919
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
	ldr	r3, .L427
	ldr	r3, [r3, #16]
	cmp	r3, #0
	bxeq	lr
	b	updateUVLight.part.0
.L428:
	.align	2
.L427:
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
	push	{r4, r5, r6, r7, lr}
	ldr	r4, .L459
	ldr	r3, [r4, #24]
	cmp	r3, #1
	sub	sp, sp, #20
	bne	.L430
	ldr	r2, .L459+4
	ldr	r2, [r2, #56]
	sub	r1, r2, #3
	cmp	r2, #0
	cmpne	r1, #1
	strls	r3, [r4, #28]
.L430:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	beq	.L429
	ldr	r3, .L459+8
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L457
.L432:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L458
.L435:
	mov	r2, #512
	ldr	r3, .L459+12
	strh	r2, [r3, #184]	@ movhi
	strh	r2, [r3, #192]	@ movhi
	strh	r2, [r3, #200]	@ movhi
.L429:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L457:
	ldr	r3, .L459+16
	ldrh	r3, [r3]
	ands	r6, r3, #1
	bne	.L432
	ldr	r5, .L459+20
	ldr	ip, [r4, #8]
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldr	r7, [r4, #12]
	ldr	lr, [r4]
	str	ip, [sp, #8]
	ldr	ip, [r4, #4]
	str	r7, [sp, #12]
	stm	sp, {ip, lr}
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	ldr	r7, .L459+24
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L432
	ldr	r3, [r4, #32]
	cmp	r3, #0
	moveq	r3, #1
	strne	r6, [r4, #32]
	streq	r3, [r4, #32]
	bne	.L435
	b	.L434
.L458:
	ldr	r5, .L459+20
	ldr	r7, .L459+24
.L434:
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
	bx	r7
	cmp	r0, #0
	beq	.L435
	mov	ip, #1
	mov	r2, #16
	ldr	r1, [r4, #28]
	ldr	r3, .L459+12
	cmp	r1, ip
	mov	r0, #80
	strh	r2, [r3, #204]	@ movhi
	movne	r2, #512
	ldr	r1, .L459+28
	str	ip, [r5, #28]
	strh	r0, [r3, #200]	@ movhi
	strh	r1, [r3, #202]	@ movhi
	strhne	r2, [r3, #184]	@ movhi
	strhne	r2, [r3, #192]	@ movhi
	bne	.L429
	mov	ip, #24
	mov	r0, #26
	ldr	r2, .L459+32
	ldr	r1, .L459+36
	strh	ip, [r3, #188]	@ movhi
	strh	r0, [r3, #196]	@ movhi
	strh	r2, [r3, #184]	@ movhi
	strh	r2, [r3, #186]	@ movhi
	strh	r2, [r3, #192]	@ movhi
	strh	r1, [r3, #194]	@ movhi
	b	.L429
.L460:
	.align	2
.L459:
	.word	ghostbook
	.word	ghost
	.word	oldButtons
	.word	shadowOAM
	.word	buttons
	.word	player
	.word	collision
	.word	-16304
	.word	-32678
	.word	-32646
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
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r4, .L485
	ldr	r3, [r4, #24]
	cmp	r3, #1
	sub	sp, sp, #20
	bne	.L462
	ldr	r2, .L485+4
	ldr	r2, [r2, #56]
	sub	r2, r2, #3
	cmp	r2, #2
	strls	r3, [r4, #28]
.L462:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	beq	.L461
	ldr	r3, .L485+8
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L483
.L464:
	ldr	r3, [r4, #32]
	cmp	r3, #1
	beq	.L484
.L467:
	mov	r2, #512
	ldr	r3, .L485+12
	strh	r2, [r3, #208]	@ movhi
	strh	r2, [r3, #216]	@ movhi
	strh	r2, [r3, #224]	@ movhi
	strh	r2, [r3, #232]	@ movhi
	strh	r2, [r3, #240]	@ movhi
	strh	r2, [r3, #248]	@ movhi
.L461:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L483:
	ldr	r3, .L485+16
	ldrh	r3, [r3]
	ands	r5, r3, #1
	bne	.L464
	ldr	r6, .L485+20
	ldr	r7, [r4, #12]
	ldr	ip, [r4, #8]
	add	r2, r6, #16
	ldr	lr, [r4]
	ldm	r2, {r2, r3}
	str	r7, [sp, #12]
	str	ip, [sp, #8]
	ldr	ip, [r4, #4]
	ldr	r1, [r6]
	stm	sp, {ip, lr}
	ldr	r0, [r6, #4]
	ldr	r7, .L485+24
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L464
	ldr	r3, [r4, #32]
	cmp	r3, #0
	moveq	r3, #1
	strne	r5, [r4, #32]
	streq	r3, [r4, #32]
	bne	.L467
	b	.L466
.L484:
	ldr	r6, .L485+20
	ldr	r7, .L485+24
.L466:
	ldm	r4, {r2, r3}
	ldr	r0, [r4, #12]
	ldr	r1, [r4, #8]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r6, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r6]
	ldr	r0, [r6, #4]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L467
	mov	r3, #1
	mov	r1, #0
	mov	r2, #144
	mov	r0, #16384
	ldr	r4, [r4, #28]
	str	r3, [r6, #28]
	cmp	r4, r3
	ldr	r3, .L485+12
	mov	lr, #78
	strh	r1, [r3, #208]	@ movhi
	strh	r1, [r3, #216]	@ movhi
	ldr	r1, .L485+28
	strh	r2, [r3, #224]	@ movhi
	strh	r2, [r3, #232]	@ movhi
	mov	r9, #72
	mov	r8, #74
	mov	r7, #76
	mov	r5, #116
	mov	ip, #136
	moveq	r2, #396
	movne	r2, #512
	strh	r0, [r3, #210]	@ movhi
	strh	r0, [r3, #226]	@ movhi
	strh	r1, [r3, #218]	@ movhi
	moveq	r0, #140
	strh	r1, [r3, #234]	@ movhi
	moveq	r1, #100
	strh	lr, [r3, #236]	@ movhi
	ldr	lr, .L485+32
	strh	r9, [r3, #212]	@ movhi
	strh	r8, [r3, #220]	@ movhi
	strh	r7, [r3, #228]	@ movhi
	strh	r5, [r3, #242]	@ movhi
	strh	lr, [r3, #240]	@ movhi
	strh	ip, [r3, #244]	@ movhi
	strheq	r0, [r3, #248]	@ movhi
	strheq	r1, [r3, #250]	@ movhi
	strheq	r2, [r3, #252]	@ movhi
	strhne	r2, [r3, #248]	@ movhi
	b	.L461
.L486:
	.align	2
.L485:
	.word	videocam
	.word	ghost
	.word	oldButtons
	.word	shadowOAM
	.word	buttons
	.word	player
	.word	collision
	.word	16608
	.word	16392
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
	push	{r4, r5, r6, r7, lr}
	ldr	r4, .L515
	ldr	r3, [r4, #24]
	cmp	r3, #1
	sub	sp, sp, #20
	bne	.L488
	ldr	r2, .L515+4
	ldr	r2, [r2, #56]
	sub	r1, r2, #1
	cmp	r2, #4
	cmpne	r1, #1
	strls	r3, [r4, #28]
.L488:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	beq	.L487
	ldr	r3, .L515+8
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L492
	ldr	r3, .L515+12
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L513
.L492:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L514
.L495:
	mov	r1, #128
	ldr	r2, .L515+16
	ldr	r3, .L515+20
	strh	r1, [r2, #2]	@ movhi
	ldr	r3, [r3]
	ldr	r0, .L515+24
	ldr	r1, .L515+28
	cmp	r3, r1
	cmpne	r3, r0
	moveq	r3, #0
	strheq	r3, [r2, #6]	@ movhi
.L487:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L514:
	ldr	r5, .L515+32
	add	r6, r4, #8
	ldr	lr, [r4]
	ldr	ip, [r4, #4]
	ldm	r6, {r6, r7}
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	ldr	r4, .L515+36
	stm	sp, {ip, lr}
	str	r7, [sp, #12]
	str	r6, [sp, #8]
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	beq	.L495
	mov	r2, #0
	mov	r1, #1
	ldr	r3, .L515+16
	str	r1, [r5, #28]
	strh	r2, [r3, #2]	@ movhi
	b	.L487
.L513:
	ldr	r0, .L515+32
	ldr	r5, [r4, #12]
	ldr	ip, [r4, #8]
	add	r2, r0, #16
	ldr	r1, [r0]
	ldr	lr, [r4]
	ldm	r2, {r2, r3}
	ldr	r0, [r0, #4]
	str	r5, [sp, #12]
	str	ip, [sp, #8]
	ldr	ip, [r4, #4]
	ldr	r5, .L515+36
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L492
	ldr	r3, [r4, #32]
	rsbs	r3, r3, #1
	movcc	r3, #0
	ldr	r2, [r4, #28]
	cmp	r2, #1
	str	r3, [r4, #32]
	ldreq	r3, .L515+40
	ldrne	r3, .L515+44
	ldreq	r1, [r3]
	ldrne	r1, [r3]
	movne	r2, #1
	ldreq	r0, .L515+28
	ldrne	r0, .L515+24
	ldr	r3, .L515+48
	mov	lr, pc
	bx	r3
	b	.L492
.L516:
	.align	2
.L515:
	.word	spiritbox
	.word	ghost
	.word	oldButtons
	.word	buttons
	.word	67109120
	.word	soundB
	.word	staticsound_data
	.word	spiritboxsound_data
	.word	player
	.word	collision
	.word	spiritboxsound_length
	.word	staticsound_length
	.word	playSoundB
	.size	updateSpiritBox, .-updateSpiritBox
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
	ldr	r3, .L531
	ldr	r3, [r3, #24]
	cmp	r3, #0
	blne	updateWeapon.part.0
.L518:
	bl	updateEMFReader
	bl	updateThermometer
	ldr	r3, .L531+4
	ldr	r3, [r3, #16]
	cmp	r3, #0
	blne	updateUVLight.part.0
.L519:
	bl	updateGhostbook
	bl	updateVideoCam
	bl	updateSpiritBox
	ldr	r3, .L531+8
	ldr	r3, [r3, #20]
	cmp	r3, #0
	blne	updateCamera.part.0
.L520:
	mov	r2, #67108864
	ldr	r3, .L531+12
	ldrh	r1, [r3]
	ldr	r3, .L531+16
	strh	r1, [r2, #16]	@ movhi
	ldrh	r1, [r3]
	ldr	r4, .L531+20
	strh	r1, [r2, #18]	@ movhi
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L531+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L532:
	.align	2
.L531:
	.word	weapon
	.word	uvlight
	.word	camera
	.word	hOff
	.word	vOff
	.word	DMANow
	.word	shadowOAM
	.size	updateGame, .-updateGame
	.comm	tempText,4,4
	.global	collisionMap
	.comm	camera,32,4
	.comm	ghostspot,16,4
	.comm	uvlight,36,4
	.comm	spiritbox,36,4
	.comm	videocam,36,4
	.comm	ghostbook,36,4
	.comm	thermometer,36,4
	.comm	EMFReader,24,4
	.comm	ghost,60,4
	.comm	weapon,32,4
	.comm	player,52,4
	.comm	occurrences,100,4
	.comm	shadowOAM,1024,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.comm	occurrencesCaught,4,4
	.comm	score,4,4
	.comm	buttonTimer,4,4
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
