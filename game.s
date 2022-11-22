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
	ldr	r3, .L20
	ldrh	r1, [r3, #2]
	tst	r1, #8
	push	{r4, r5, r6, lr}
	strh	r2, [r3, #8]	@ movhi
	ldrne	r2, .L20+4
	ldrne	r3, [r2]
	addne	r3, r3, #1
	strne	r3, [r2]
	ldr	r3, .L20
	ldrh	r3, [r3, #2]
	tst	r3, #16
	beq	.L4
	ldr	r4, .L20+8
	ldr	r5, .L20+12
	ldr	r3, [r4]
	ldr	r2, [r5, #16]
	add	r3, r3, #1
	cmp	r2, #0
	str	r3, [r4]
	beq	.L4
	ldr	r2, .L20+16
	smull	r1, r2, r3, r2
	sub	r2, r2, r3, asr #31
	add	r2, r2, r2, lsl #1
	cmp	r3, r2
	asr	r2, r3, #31
	beq	.L18
.L6:
	ldr	r1, .L20+20
	smull	r0, r1, r3, r1
	rsb	r2, r2, r1, asr #2
	add	r2, r2, r2, lsl #2
	cmp	r3, r2, lsl #1
	beq	.L19
.L4:
	mov	r1, #1
	ldr	r3, .L20
	ldrh	r2, [r3, #2]
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L19:
	ldr	r5, .L20+24
	mov	lr, pc
	bx	r5
	ldr	r4, .L20+16
	smull	r2, r3, r4, r0
	sub	r3, r3, r0, asr #31
	ldr	r2, .L20+28
	add	r3, r3, r3, lsl #1
	sub	r0, r0, r3
	str	r0, [r2, #24]
	mov	lr, pc
	bx	r5
	smull	r2, r3, r4, r0
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	ldr	r2, .L20+32
	sub	r0, r0, r3
	str	r0, [r2, #24]
	mov	lr, pc
	bx	r5
	smull	r3, r4, r0, r4
	sub	r4, r4, r0, asr #31
	ldr	r3, .L20+36
	add	r4, r4, r4, lsl #1
	sub	r4, r0, r4
	str	r4, [r3, #24]
	b	.L4
.L18:
	ldr	r3, .L20+24
	mov	lr, pc
	bx	r3
	ldr	r3, [r5, #16]
	cmp	r0, #0
	and	r0, r0, #1
	rsblt	r0, r0, #0
	cmp	r3, #0
	str	r0, [r5, #24]
	beq	.L4
	ldr	r3, [r4]
	asr	r2, r3, #31
	b	.L6
.L21:
	.align	2
.L20:
	.word	67109376
	.word	sanityTimer
	.word	seconds
	.word	thermometer
	.word	1431655766
	.word	1717986919
	.word	rand
	.word	ghostbook
	.word	videocam
	.word	spiritbox
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
	@ link register save eliminated.
	mov	r0, #10
	ldr	r3, .L23
	ldr	r3, [r3, #16]
	ldr	r2, .L23+4
	ldr	r1, .L23+8
	add	r3, r3, #128
	lsl	r3, r3, #1
	strh	r3, [r2, #28]	@ movhi
	strh	r0, [r2, #24]	@ movhi
	strh	r1, [r2, #26]	@ movhi
	bx	lr
.L24:
	.align	2
.L23:
	.word	EMFReader
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
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	lr, #324
	mov	r9, #320
	ldr	r2, .L27
	ldr	r3, .L27+4
	ldr	r0, .L27+8
	ldrh	r6, [r2]
	ldrh	r5, [r0]
	ldm	r3, {r1, r2}
	ldr	r4, .L27+12
	ldr	r3, .L27+16
	ldr	r8, .L27+20
	sub	r1, r1, r6
	sub	r2, r2, r5
	and	r2, r2, r4
	and	r1, r1, #255
	strh	r1, [r3, #32]	@ movhi
	strh	r2, [r3, #34]	@ movhi
	ldm	r8, {r1, r2}
	ldr	ip, .L27+24
	sub	r2, r2, r5
	and	r2, r2, r4
	strh	r2, [r3, #42]	@ movhi
	strh	lr, [r3, #68]	@ movhi
	sub	r1, r1, r6
	ldm	ip, {r2, lr}
	and	r1, r1, #255
	ldr	r0, .L27+28
	ldr	r7, .L27+32
	strh	r1, [r3, #40]	@ movhi
	sub	r2, r2, r6
	ldr	r1, .L27+36
	and	r2, r2, #255
	ldr	ip, [r0]
	strh	r1, [r3, #44]	@ movhi
	ldr	r0, [r0, #4]
	strh	r2, [r3, #48]	@ movhi
	sub	lr, lr, r5
	ldm	r7, {r1, r2}
	and	lr, lr, r4
	strh	lr, [r3, #50]	@ movhi
	sub	ip, ip, r6
	ldr	lr, .L27+40
	sub	r0, r0, r5
	sub	r1, r1, r6
	sub	r2, r2, r5
	and	r0, r0, r4
	and	r2, r2, r4
	and	ip, ip, #255
	sub	r4, r4, #189
	and	r1, r1, #255
	strh	r9, [r3, #36]	@ movhi
	strh	r4, [r3, #52]	@ movhi
	strh	ip, [r3, #56]	@ movhi
	strh	r0, [r3, #58]	@ movhi
	strh	r1, [r3, #64]	@ movhi
	strh	r2, [r3, #66]	@ movhi
	strh	lr, [r3, #60]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L28:
	.align	2
.L27:
	.word	vOff
	.word	thermometer
	.word	hOff
	.word	511
	.word	shadowOAM
	.word	ghostbook
	.word	videocam
	.word	spiritbox
	.word	uvlight
	.word	321
	.word	323
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
	ldr	r3, .L50
	ldrh	r3, [r3]
	tst	r3, #2
	ldr	r4, .L50+4
	sub	sp, sp, #16
	beq	.L30
	ldr	r3, .L50+8
	ldrh	r3, [r3]
	ands	r3, r3, #2
	streq	r3, [r4, #28]
	beq	.L31
.L30:
	ldr	r3, [r4, #28]
	cmp	r3, #199
	ble	.L31
	mov	r2, #0
	mov	r3, #4
	str	r2, [r4, #20]
	str	r3, [r4, #16]
.L39:
	ldr	r3, [r4, #28]
	add	r3, r3, #1
	str	r3, [r4, #28]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L31:
	mov	r1, #1
	ldr	r3, .L50+12
	ldr	r2, [r3, #28]
	cmp	r2, #0
	str	r2, [r4, #16]
	str	r1, [r4, #20]
	bne	.L48
	mov	r0, #16
	mov	r1, #24
	ldm	r3, {r2, ip}
	add	r3, r2, r0
	stm	r4, {r3, ip}
	str	r0, [r4, #8]
	str	r1, [r4, #12]
.L36:
	ldr	r5, .L50+16
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
	ldr	r6, .L50+20
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	movne	r3, #0
	strne	r3, [r5, #32]
	b	.L39
.L48:
	cmp	r2, #1
	beq	.L49
	cmp	r2, #2
	bne	.L38
	mov	r0, #24
	mov	r1, #16
	ldr	r2, [r3, #4]
	ldr	ip, [r3]
	add	r3, r2, #14
	str	r3, [r4, #4]
	str	ip, [r4]
	str	r0, [r4, #8]
	str	r1, [r4, #12]
	b	.L36
.L49:
	mov	r0, #16
	mov	r1, #24
	ldm	r3, {r2, ip}
	sub	r3, r2, #22
	stm	r4, {r3, ip}
	str	r0, [r4, #8]
	str	r1, [r4, #12]
	b	.L36
.L38:
	cmp	r2, #3
	bne	.L36
	mov	r0, #24
	mov	r1, #16
	ldr	r2, [r3, #4]
	ldr	ip, [r3]
	sub	r3, r2, #22
	str	r3, [r4, #4]
	str	ip, [r4]
	str	r0, [r4, #8]
	str	r1, [r4, #12]
	b	.L36
.L51:
	.align	2
.L50:
	.word	oldButtons
	.word	weapon
	.word	buttons
	.word	player
	.word	ghost
	.word	collision
	.size	updateWeapon.part.0, .-updateWeapon.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawWeapon.part.0, %function
drawWeapon.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L53
	ldr	r2, .L53+4
	ldr	r3, [r1, #4]
	ldr	r2, [r2]
	sub	r3, r3, r2
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r0, .L53+8
	ldr	r2, [r1]
	ldr	ip, [r0]
	ldr	r1, [r1, #16]
	ldr	r0, .L53+12
	sub	r2, r2, ip
	add	r1, r1, #16
	ldr	ip, .L53+16
	lsl	r1, r1, #2
	and	r2, r2, #255
	strh	r3, [r0, #10]	@ movhi
	strh	r1, [r0, #12]	@ movhi
	strh	r2, [r0, #8]	@ movhi
	strh	ip, [r0, #28]	@ movhi
	bx	lr
.L54:
	.align	2
.L53:
	.word	weapon
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.word	266
	.size	drawWeapon.part.0, .-drawWeapon.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCamera.part.0, %function
updateCamera.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r3, .L83
	ldrh	r3, [r3]
	tst	r3, #2
	ldr	r5, .L83+4
	sub	sp, sp, #16
	beq	.L56
	ldr	r3, .L83+8
	ldrh	r3, [r3]
	ands	r3, r3, #2
	streq	r3, [r5, #28]
	bne	.L56
.L57:
	mov	r1, #1
	ldr	r2, .L83+12
	ldr	r3, [r2, #28]
	cmp	r3, #0
	str	r3, [r5, #24]
	str	r1, [r5, #16]
	bne	.L79
	mov	lr, #48
	mov	ip, #32
	ldr	r0, [r2, #4]
	ldr	r3, [r2]
	ldr	r2, [r2, #20]
	sub	r0, r0, #16
	add	r2, r3, r2
.L78:
	mov	r3, r1
	str	r0, [r5, #4]
	str	r2, [r5]
	str	lr, [r5, #8]
	str	ip, [r5, #12]
.L61:
	ldr	r4, .L83+16
	cmp	r3, #0
	mov	r8, #1
	ldr	r7, .L83+20
	add	r6, r4, #80
	bne	.L80
.L66:
	add	r4, r4, #20
	cmp	r4, r6
	beq	.L81
.L68:
	ldr	r3, [r5, #16]
	cmp	r3, #0
	beq	.L66
.L80:
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
	strne	r8, [r4, #16]
	add	r4, r4, #20
	cmp	r4, r6
	bne	.L68
.L81:
	ldr	r3, [r5, #28]
	add	r3, r3, #1
	str	r3, [r5, #28]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L56:
	ldr	r3, [r5, #28]
	cmp	r3, #199
	ble	.L57
	mov	r3, #0
	mov	r2, #4
	str	r3, [r5, #16]
	str	r2, [r5, #24]
	b	.L61
.L79:
	cmp	r3, #1
	beq	.L82
	cmp	r3, #2
	bne	.L64
	ldr	r0, [r2, #4]
	ldr	r3, [r2, #16]
	ldr	r2, [r2]
	mov	lr, #32
	mov	ip, #48
	add	r0, r0, r3
	sub	r2, r2, #16
	b	.L78
.L82:
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
	b	.L61
.L64:
	cmp	r3, #3
	bne	.L69
	mov	lr, #32
	mov	ip, #48
	ldm	r2, {r0, r3}
	ldr	r2, [r5, #8]
	sub	r0, r0, #16
	sub	r2, r3, r2
	stm	r5, {r0, r2, lr}
	mov	r3, r1
	str	ip, [r5, #12]
	b	.L61
.L69:
	mov	r3, r1
	b	.L61
.L84:
	.align	2
.L83:
	.word	oldButtons
	.word	camera
	.word	buttons
	.word	player
	.word	occurrences
	.word	collision
	.size	updateCamera.part.0, .-updateCamera.part.0
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
	@ link register save eliminated.
	mov	r2, #0
	mov	r1, #194
	mov	ip, #24
	ldr	r3, .L86
	ldr	r0, .L86+4
	strh	r2, [r3, #2]	@ movhi
	strh	ip, [r0]	@ movhi
	strh	r2, [r3]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	strh	r2, [r3, #6]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	strh	r1, [r3, #6]	@ movhi
	bx	lr
.L87:
	.align	2
.L86:
	.word	67109120
	.word	67109376
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
	str	lr, [sp, #-4]!
	mov	r2, #0
	mov	ip, #24
	mov	lr, #1
	mov	r1, #194
	ldr	r3, .L90
	ldr	r0, .L90+4
	strh	r2, [r3, #2]	@ movhi
	strh	ip, [r0]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	ip, .L90+8
	strh	lr, [r0, #8]	@ movhi
	ldr	r0, .L90+12
	strh	r1, [r3, #2]	@ movhi
	ldr	lr, [sp], #4
	str	r0, [ip, #4092]
	strh	r2, [r3, #6]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	strh	r1, [r3, #6]	@ movhi
	bx	lr
.L91:
	.align	2
.L90:
	.word	67109120
	.word	67109376
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
	mov	lr, #16
	mov	r4, #1
	mov	r6, #2
	mov	r5, #8
	ldr	r3, .L94
	ldr	r0, .L94+4
	ldr	r1, [r3]
	ldr	r0, [r0]
	ldr	r3, .L94+8
	add	r7, r1, #112
	add	ip, r1, #113
	ldr	r1, .L94+12
	add	r0, r0, #72
	str	r7, [r3, #4]
	str	r6, [r3, #36]
	str	r5, [r1, #12]
	str	lr, [r3, #16]
	str	lr, [r3, #20]
	str	lr, [r1, #8]
	str	r4, [r3, #12]
	str	r4, [r3, #8]
	str	ip, [r1, #4]
	str	r0, [r3]
	str	r0, [r1]
	str	r2, [r3, #24]
	str	r2, [r3, #32]
	str	r2, [r3, #28]
	str	r2, [r3, #40]
	str	r2, [r3, #44]
	str	r2, [r1, #20]
	str	r2, [r1, #16]
	str	r2, [r1, #28]
	str	r2, [r1, #24]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L95:
	.align	2
.L94:
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
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r2, #8
	mov	r7, #16
	mov	r3, #0
	mov	r9, #18
	mov	r8, #1
	ldr	ip, .L98
	ldr	r1, .L98+4
	ldr	r4, [ip, #20]
	ldr	lr, [ip, #16]
	ldr	r5, [r1]
	ldr	r0, [r1, #4]
	ldr	r1, .L98+8
	add	lr, lr, r7
	add	r4, r4, r2
	str	r4, [r1, #12]
	str	lr, [r1, #8]
	ldr	r4, [ip]
	ldr	lr, [ip, #4]
	ldr	ip, [ip, #28]
	str	r4, [r1]
	str	lr, [r1, #4]
	ldr	r4, .L98+12
	ldr	lr, .L98+16
	str	ip, [r1, #24]
	str	r3, [r1, #16]
	str	r3, [r1, #20]
	str	r3, [r1, #28]
	ldr	r1, .L98+20
	add	ip, r0, #24
	stm	lr, {r5, ip}
	add	r6, r0, r2
	ldr	ip, .L98+24
	str	r9, [r4, #28]
	str	r8, [r1, #20]
	add	r9, r0, #40
	str	r7, [r1, #8]
	ldr	r0, .L98+28
	str	r7, [r1, #12]
	str	r3, [r1]
	str	r3, [r1, #4]
	str	r3, [r1, #16]
	ldr	r1, .L98+32
	stm	r4, {r5, r6}
	str	r3, [r4, #16]
	str	r3, [r4, #20]
	str	r3, [r4, #24]
	str	r2, [r4, #8]
	str	r2, [r4, #12]
	str	r2, [lr, #8]
	str	r2, [lr, #12]
	str	r3, [lr, #16]
	str	r3, [lr, #20]
	str	r3, [lr, #24]
	str	r3, [lr, #28]
	add	lr, r5, r7
	stm	r1, {r5, r9}
	str	r6, [ip, #4]
	str	r2, [ip, #8]
	str	r2, [ip, #12]
	str	r3, [ip, #16]
	str	r3, [ip, #20]
	str	r3, [ip, #24]
	str	r3, [ip, #28]
	str	lr, [ip]
	str	lr, [r0]
	str	r9, [r0, #4]
	str	r2, [r0, #8]
	str	r2, [r0, #12]
	str	r3, [r0, #16]
	str	r3, [r0, #20]
	str	r3, [r0, #24]
	str	r3, [r0, #28]
	str	r2, [r1, #8]
	str	r2, [r1, #12]
	str	r3, [r1, #16]
	str	r3, [r1, #20]
	str	r3, [r1, #24]
	str	r3, [r1, #28]
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L99:
	.align	2
.L98:
	.word	player
	.word	ghostspot
	.word	camera
	.word	thermometer
	.word	ghostbook
	.word	EMFReader
	.word	spiritbox
	.word	uvlight
	.word	videocam
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
	push	{r4, lr}
	ldr	r4, .L102
	ldr	r0, .L102+4
	str	r3, [r4]
	str	r3, [r4, #4]
	str	r3, [r4, #24]
	str	r3, [r4, #36]
	str	r3, [r4, #40]
	str	r3, [r4, #28]
	str	r3, [r4, #32]
	str	r3, [r4, #44]
	str	r3, [r4, #52]
	str	r2, [r4, #8]
	str	r2, [r4, #12]
	str	r2, [r4, #48]
	str	r1, [r4, #16]
	str	r1, [r4, #20]
	mov	lr, pc
	bx	r0
	ldr	r3, .L102+8
	smull	r2, r3, r0, r3
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	sub	r3, r0, r3, lsl #1
	str	r3, [r4, #56]
	pop	{r4, lr}
	bx	lr
.L103:
	.align	2
.L102:
	.word	ghost
	.word	rand
	.word	715827883
	.size	initGhost, .-initGhost
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
	push	{r4, r5, r6, lr}
	mov	r4, #0
	mov	ip, #1
	mov	r0, #24
	mov	r2, #194
	ldr	r3, .L108
	ldr	r1, .L108+4
	str	r4, [r3]
	str	r4, [r1]
	ldr	r3, .L108+8
	ldr	r1, .L108+12
	str	r4, [r3]
	str	r4, [r1]
	ldr	r3, .L108+16
	ldr	r1, .L108+20
	str	r4, [r3]
	str	r4, [r1]
	ldr	r3, .L108+24
	ldr	r1, .L108+28
	str	r4, [r3]
	str	r4, [r1]
	ldr	r3, .L108+32
	ldr	r1, .L108+36
	strh	r4, [r3, #2]	@ movhi
	strh	r0, [r1]	@ movhi
	strh	r4, [r3]	@ movhi
	ldr	r0, .L108+40
	strh	ip, [r1, #8]	@ movhi
	ldr	r1, .L108+44
	strh	r2, [r3, #2]	@ movhi
	str	r1, [r0, #4092]
	strh	r4, [r3, #6]	@ movhi
	strh	r4, [r3, #4]	@ movhi
	strh	r2, [r3, #6]	@ movhi
	bl	initPlayer
	bl	initGhost
	mov	r2, #64
	mov	r1, #140
	ldr	r3, .L108+48
	stm	r3, {r1, r4}
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	bl	initEquipment
	ldr	r2, .L108+52
	mov	r1, #8
	mov	r3, r2
	add	r0, r2, #80
.L105:
	str	r1, [r3, #12]
	str	r1, [r3, #8]
	str	r4, [r3, #16]
	add	r3, r3, #20
	cmp	r3, r0
	bne	.L105
	mov	r3, #10
	mov	r5, #200
	mov	r4, #300
	mov	lr, #240
	mov	ip, #100
	mov	r0, #500
	mov	r1, #150
	str	r5, [r2]
	str	r4, [r2, #24]
	str	lr, [r2, #20]
	str	r3, [r2, #4]
	str	r3, [r2, #40]
	str	ip, [r2, #44]
	str	r0, [r2, #64]
	str	r1, [r2, #60]
	pop	{r4, r5, r6, lr}
	bx	lr
.L109:
	.align	2
.L108:
	.word	tempText
	.word	seconds
	.word	sanity
	.word	sanityTimer
	.word	buttonTimer
	.word	hOff
	.word	vOff
	.word	score
	.word	67109120
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.word	ghostspot
	.word	occurrences
	.size	initGame, .-initGame
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
	mov	r2, #64
	mov	r0, #0
	mov	r1, #140
	ldr	r3, .L111
	str	r0, [r3, #4]
	str	r1, [r3]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	bx	lr
.L112:
	.align	2
.L111:
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
	ldr	r2, .L117
	mov	r1, #8
	mov	r3, r2
	mov	ip, #0
	push	{r4, r5, lr}
	add	r0, r2, #80
.L114:
	str	r1, [r3, #12]
	str	r1, [r3, #8]
	str	ip, [r3, #16]
	add	r3, r3, #20
	cmp	r3, r0
	bne	.L114
	mov	r3, #10
	mov	r5, #200
	mov	r4, #300
	mov	lr, #240
	mov	ip, #100
	mov	r0, #500
	mov	r1, #150
	str	r5, [r2]
	str	r4, [r2, #24]
	str	lr, [r2, #20]
	str	r3, [r2, #4]
	str	r3, [r2, #40]
	str	ip, [r2, #44]
	str	r0, [r2, #64]
	str	r1, [r2, #60]
	pop	{r4, r5, lr}
	bx	lr
.L118:
	.align	2
.L117:
	.word	occurrences
	.size	initOccurrences, .-initOccurrences
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
	push	{r4, r5, r6, r7, r8, lr}
	mov	r7, #264
	ldr	r1, .L125
	ldr	r2, .L125+4
	ldr	r3, .L125+8
	ldrh	r5, [r1]
	ldrh	r4, [r2]
	ldr	r0, .L125+12
	ldr	lr, .L125+16
	ldr	r6, .L125+20
	add	ip, r3, #32
.L122:
	ldm	r0, {r1, r2}
	ldr	r8, [r0, #16]
	sub	r1, r1, r5
	sub	r2, r2, r4
	cmp	r8, #0
	and	r1, r1, #255
	and	r2, r2, lr
	strh	r1, [r3, #144]	@ movhi
	strh	r2, [r3, #146]	@ movhi
	strhne	r6, [r3, #148]	@ movhi
	strheq	r7, [r3, #148]	@ movhi
	add	r3, r3, #8
	cmp	r3, ip
	add	r0, r0, #20
	bne	.L122
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L126:
	.align	2
.L125:
	.word	vOff
	.word	hOff
	.word	shadowOAM
	.word	occurrences
	.word	511
	.word	262
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
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r5, .L185
	ldr	r3, .L185+4
	ldr	r2, [r5]
	smull	r0, r1, r3, r2
	ldr	r4, .L185+8
	asr	r3, r2, #31
	ldr	r0, .L185+12
	rsb	r3, r3, r1, asr #4
	ldr	r0, [r0]
	ldr	r1, [r4, #40]
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r2, r3, lsl #1
	orr	r2, r1, r0
	orrs	r3, r2, r3
	bne	.L129
	ldr	r3, .L185+16
	ldrh	r3, [r3, #48]
	tst	r3, #64
	bne	.L130
	ldr	r3, [r4]
	cmp	r3, #1
	ble	.L130
	ldr	r0, .L185+20
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
	beq	.L129
.L180:
	sub	r1, r1, #1
	str	r1, [r0]
.L129:
	ldr	r7, .L185+24
	ldr	r3, [r7, #44]
	cmp	r3, #0
	beq	.L181
.L134:
	ldr	r3, .L185+28
	ldrh	r3, [r3]
	tst	r3, #256
	and	r3, r3, #1
	beq	.L139
	ldr	r2, .L185+32
	ldrh	r2, [r2]
	tst	r2, #256
	bne	.L139
.L147:
	ldr	r2, [r4, #44]
	add	r2, r2, #1
	cmp	r2, #2
	str	r2, [r4, #44]
	movgt	r2, #0
	strgt	r2, [r4, #44]
	bgt	.L141
	cmp	r2, #1
	beq	.L182
	cmp	r2, #2
	bne	.L143
	mov	r2, #0
	mov	r0, #1
	mov	r1, #512
	ldr	ip, .L185+36
	str	r2, [ip, #20]
	ldr	ip, .L185+40
	str	r2, [ip, #24]
	ldr	r2, .L185+44
	str	r0, [r2, #20]
	ldr	r2, .L185+48
	strh	r1, [r2, #24]	@ movhi
.L139:
	cmp	r3, #0
	beq	.L145
	ldr	r2, .L185+32
.L144:
	ldrh	r3, [r2]
	tst	r3, #1
	bne	.L145
.L149:
	ldr	r3, .L185+36
	ldr	r3, [r3, #16]
	cmp	r3, #2
	ble	.L145
	ldr	r2, .L185+52
	ldr	r1, [r7, #32]
	ldr	r3, [r2, #16]
	orrs	r3, r1, r3
	bne	.L145
	mov	r1, #1
	ldm	r4, {r0, r3}
	ldr	ip, .L185+56
	ldr	r4, .L185+60
	sub	r6, r0, #8
	str	r6, [ip]
	str	r6, [r2]
	str	r6, [r4]
	add	r6, r3, #6
	str	r6, [ip, #4]
	ldr	lr, .L185+64
	str	r1, [ip, #16]
	ldr	ip, .L185+68
	add	r6, r3, #22
	add	r0, r0, #8
	sub	r3, r3, #10
	stm	lr, {r0, r3}
	stm	ip, {r0, r6}
	str	r1, [r2, #16]
	str	r1, [r4, #16]
	str	r6, [r4, #4]
	str	r3, [r2, #4]
	str	r1, [lr, #16]
	str	r1, [ip, #16]
.L145:
	ldr	r3, [r5]
	add	r3, r3, #1
	str	r3, [r5]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L181:
	ldr	r9, .L185+72
	ldr	r8, .L185+76
	mov	r1, #512
	ldr	r3, [r4]
	ldr	r2, [r4, #4]
	ldr	r0, [r9]
	mov	lr, pc
	bx	r8
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #4]
	add	r2, r2, r3
	mov	r10, r0
	mov	r1, #512
	ldr	r3, [r4]
	sub	r2, r2, #1
	ldr	r0, [r9]
	mov	lr, pc
	bx	r8
	ldr	r2, [r4, #20]
	ldr	r3, [r4]
	rsbs	r6, r0, #1
	add	r3, r3, r2
	movcc	r6, #0
	mov	r1, #512
	cmp	r10, #0
	ldr	r2, [r4, #4]
	sub	r3, r3, #1
	ldr	r0, [r9]
	moveq	r6, #1
	mov	lr, pc
	bx	r8
	mov	ip, r0
	ldr	r1, [r4, #16]
	ldr	r0, [r4, #20]
	ldr	r3, [r4]
	ldr	r2, [r4, #4]
	add	r3, r3, r0
	add	r2, r2, r1
	cmp	ip, #0
	mov	r1, #512
	ldr	r0, [r9]
	sub	r3, r3, #1
	sub	r2, r2, #1
	moveq	r6, #1
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	moveq	r6, #1
	cmp	r6, #0
	beq	.L134
	ldr	r3, .L185+28
	ldrh	r2, [r3]
	ands	r3, r2, #1
	and	r1, r2, #256
	beq	.L135
	ldr	r2, .L185+32
	ldrh	r0, [r2]
	ands	ip, r0, #1
	beq	.L183
	cmp	r1, #0
	beq	.L145
.L148:
	tst	r0, #256
	beq	.L147
	b	.L144
.L143:
	cmp	r2, #0
	bne	.L139
.L141:
	mov	r2, #0
	mov	r0, #1
	mov	r1, #512
	ldr	ip, .L185+36
	str	r2, [ip, #20]
	ldr	ip, .L185+44
	str	r2, [ip, #20]
	ldr	r2, .L185+40
	str	r0, [r2, #24]
	ldr	r2, .L185+48
	strh	r1, [r2, #24]	@ movhi
	b	.L139
.L130:
	ldr	r3, .L185+16
	ldrh	r3, [r3, #48]
	ands	r3, r3, #128
	bne	.L132
	ldr	r2, [r4]
	ldr	r1, [r4, #20]
	add	r1, r2, r1
	cmp	r1, #255
	bgt	.L132
	ldr	ip, .L185+20
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
	b	.L129
.L132:
	ldr	r3, .L185+16
	ldrh	r3, [r3, #48]
	tst	r3, #32
	beq	.L184
.L133:
	ldr	r3, .L185+16
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L129
	ldr	r2, [r4, #4]
	ldr	r3, [r4, #16]
	add	r3, r2, r3
	cmp	r3, #512
	bge	.L129
	ldr	r0, .L185+80
	ldr	r3, [r4, #12]
	ldr	r1, [r0]
	add	r2, r2, r3
	sub	r3, r2, r1
	ldr	ip, .L185+84
	cmp	r3, #119
	movgt	r3, #1
	movle	r3, #0
	cmp	r1, ip
	movgt	r3, #0
	mov	ip, #2
	cmp	r3, #0
	addne	r1, r1, #1
	str	r2, [r4, #4]
	str	ip, [r4, #28]
	strne	r1, [r0]
	b	.L129
.L182:
	mov	r1, #0
	ldr	r0, .L185+40
	ldr	ip, .L185+44
	str	r1, [r0, #24]
	ldr	r0, .L185+36
	str	r1, [ip, #20]
	str	r2, [r0, #20]
	b	.L139
.L135:
	cmp	r1, #0
	beq	.L145
	ldr	r2, .L185+32
	ldrh	r3, [r2]
	ands	r3, r3, #256
	beq	.L147
	b	.L145
.L183:
	ldr	lr, [r4, #40]
	cmp	lr, #0
	moveq	ip, #1
	cmp	r1, #0
	str	ip, [r4, #40]
	beq	.L149
	b	.L148
.L184:
	ldr	r3, [r4, #4]
	cmp	r3, #0
	ble	.L133
	ldr	r0, .L185+80
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
	beq	.L129
	b	.L180
.L186:
	.align	2
.L185:
	.word	buttonTimer
	.word	1374389535
	.word	player
	.word	tempText
	.word	67109120
	.word	vOff
	.word	ghost
	.word	oldButtons
	.word	buttons
	.word	EMFReader
	.word	weapon
	.word	camera
	.word	shadowOAM
	.word	thermometer
	.word	ghostbook
	.word	videocam
	.word	spiritbox
	.word	uvlight
	.word	.LANCHOR0
	.word	collisionCheck
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
	ldr	r1, .L190
	ldr	r0, .L190+4
	ldr	ip, [r0]
	ldr	r0, [r1, #40]
	cmp	r0, #0
	movne	r0, #9
	ldr	r2, .L190+8
	ldr	r3, [r1, #4]
	ldr	r2, [r2]
	sub	r3, r3, r2
	ldr	r2, [r1]
	ldreq	r0, [r1, #28]
	lsl	r3, r3, #23
	ldrne	r1, .L190+12
	ldreq	r1, .L190+12
	lsr	r3, r3, #23
	sub	r2, r2, ip
	orr	r3, r3, #16384
	and	r2, r2, #255
	lsleq	r0, r0, #1
	strh	r0, [r1, #4]	@ movhi
	strh	r2, [r1]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	bx	lr
.L191:
	.align	2
.L190:
	.word	player
	.word	vOff
	.word	hOff
	.word	shadowOAM
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
	ldr	r3, .L206
	ldr	r2, [r3, #32]
	cmp	r2, #0
	beq	.L193
	ldr	r3, [r3, #56]
	sub	r2, r3, #1
	cmp	r3, #5
	cmpne	r2, #1
	bhi	.L202
	mov	r2, #4
	ldr	r3, .L206+4
	str	r2, [r3, #16]
	bx	lr
.L202:
	mov	r2, #3
	ldr	r3, .L206+4
	str	r2, [r3, #16]
	bx	lr
.L193:
	push	{r4, r5, r6, lr}
	ldr	r5, .L206+8
	ldm	r5, {r2, r3}
	ldr	r0, [r5, #12]
	ldr	r1, [r5, #8]
	sub	sp, sp, #16
	ldr	r4, .L206+12
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	ldr	r6, .L206+16
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L205
	mov	r2, #3
	ldr	r3, .L206+4
	str	r2, [r3, #16]
.L192:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L205:
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
	movne	r2, #2
	ldrne	r3, .L206+4
	strne	r2, [r3, #16]
	bne	.L192
.L196:
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
	movne	r2, #1
	ldrne	r3, .L206+4
	ldreq	r3, .L206+4
	strne	r2, [r3, #16]
	streq	r0, [r3, #16]
	b	.L192
.L207:
	.align	2
.L206:
	.word	ghost
	.word	EMFReader
	.word	ghostspot
	.word	player
	.word	collision
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
	ldr	r3, .L210
	ldr	r3, [r3, #20]
	cmp	r3, #0
	bxeq	lr
	b	drawEMFReader.part.0
.L211:
	.align	2
.L210:
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
	ldr	r3, .L214
	ldr	r3, [r3, #16]
	cmp	r3, #0
	bxeq	lr
	b	drawEquipment.part.0
.L215:
	.align	2
.L214:
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
	ldr	r3, .L218
	ldr	r3, [r3, #24]
	cmp	r3, #0
	bxeq	lr
	b	updateWeapon.part.0
.L219:
	.align	2
.L218:
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
	@ link register save eliminated.
	ldr	r3, .L222
	ldr	r3, [r3, #24]
	cmp	r3, #0
	bxeq	lr
	b	drawWeapon.part.0
.L223:
	.align	2
.L222:
	.word	weapon
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
	ldr	r3, .L226
	ldr	r3, [r3, #20]
	cmp	r3, #0
	bxeq	lr
	b	updateCamera.part.0
.L227:
	.align	2
.L226:
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
	ldr	r3, .L233
	ldr	r3, [r3, #20]
	cmp	r3, #0
	bxeq	lr
	mov	r2, #10
	ldr	r3, .L233+4
	ldr	r1, .L233+8
	strh	r2, [r3, #24]	@ movhi
	strh	r2, [r3, #26]	@ movhi
	strh	r1, [r3, #28]	@ movhi
	bx	lr
.L234:
	.align	2
.L233:
	.word	camera
	.word	shadowOAM
	.word	322
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
	@ link register save eliminated.
	ldr	r2, .L239
	ldr	r3, [r2, #32]
	cmp	r3, #0
	bne	.L238
	mov	r0, #201
	ldr	r1, .L239+4
	ldr	r3, [r2, #4]
	ldr	ip, [r1]
	ldr	r1, .L239+8
	sub	r3, r3, ip
	ldr	r2, [r2]
	ldr	ip, [r1]
	lsl	r3, r3, #23
	ldr	r1, .L239+12
	lsr	r3, r3, #23
	sub	r2, r2, ip
	orr	r3, r3, #16384
	and	r2, r2, #255
	strh	r3, [r1, #18]	@ movhi
	strh	r2, [r1, #16]	@ movhi
	strh	r0, [r1, #20]	@ movhi
	bx	lr
.L238:
	ldr	r3, .L239+16
	ldr	r1, .L239+20
	ldr	r0, .L239+24
	ldr	r3, [r3]
	mla	r3, r0, r3, r1
	ldr	r1, .L239+28
	cmp	r1, r3, ror #2
	bxcc	lr
	ldr	r1, .L239+4
	ldr	r3, [r2, #4]
	ldr	r0, [r1]
	ldr	r1, .L239+8
	sub	r3, r3, r0
	ldr	ip, [r1]
	ldr	r1, [r2]
	ldr	r2, [r2, #28]
	lsl	r3, r3, #23
	ldr	r0, .L239+12
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
.L240:
	.align	2
.L239:
	.word	ghost
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.word	buttonTimer
	.word	85899344
	.word	-1030792151
	.word	42949672
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
	push	{r4, lr}
	ldr	r3, .L253
	ldr	lr, .L253+4
	ldr	ip, [r3]
	ldr	r1, [lr]
	cmp	ip, r1
	sub	sp, sp, #16
	ble	.L242
	ldr	r2, [r3, #8]
	ldr	r0, [lr, #4]
	sub	ip, ip, r2
	ldr	r2, [r3, #4]
	cmp	r2, r0
	str	ip, [r3]
	ble	.L244
.L252:
	ldr	r4, [r3, #12]
	sub	r2, r2, r4
	str	r2, [r3, #4]
.L245:
	add	r3, r3, #16
	ldm	r3, {r3, r4}
	stm	sp, {r2, ip}
	str	r4, [sp, #12]
	str	r3, [sp, #8]
	add	r2, lr, #16
	ldm	r2, {r2, r3}
	ldr	r4, .L253+8
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	bne	.L251
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L242:
	ldrlt	r2, [r3, #8]
	ldr	r0, [lr, #4]
	addlt	ip, ip, r2
	ldr	r2, [r3, #4]
	strlt	ip, [r3]
	cmp	r2, r0
	bgt	.L252
.L244:
	ldrlt	r4, [r3, #12]
	addlt	r2, r2, r4
	strlt	r2, [r3, #4]
	b	.L245
.L251:
	ldr	r3, .L253+12
	mov	lr, pc
	bx	r3
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L254:
	.align	2
.L253:
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
	ldr	r4, .L277
	ldr	r3, [r4, #32]
	cmp	r3, #0
	sub	sp, sp, #20
	beq	.L273
	ldr	r3, .L277+4
	ldr	r2, .L277+8
	ldr	r1, .L277+12
	ldr	r3, [r3]
	mla	r3, r1, r3, r2
	ldr	r2, .L277+16
	cmp	r2, r3, ror #2
	bcc	.L255
	ldr	r3, [r4, #44]
	cmp	r3, #0
	bne	.L261
.L260:
	ldr	r3, [r4, #4]
	cmp	r3, #200
	bgt	.L262
	ldr	r2, [r4, #52]
	cmp	r2, #0
	beq	.L274
.L262:
	ldr	r2, [r4]
	cmp	r2, #120
	bgt	.L265
	ldr	r1, [r4, #52]
	cmp	r1, #1
	beq	.L275
.L265:
	cmp	r3, #29
	ble	.L267
	ldr	r1, [r4, #52]
	cmp	r1, #2
	beq	.L276
.L267:
	cmp	r2, #19
	ble	.L264
	ldr	r3, [r4, #52]
	cmp	r3, #3
	bne	.L264
	ldr	r3, [r4, #8]
	sub	r2, r2, r3
	cmp	r2, #20
	moveq	r3, #0
	str	r2, [r4]
	streq	r3, [r4, #32]
	streq	r3, [r4, #52]
.L264:
	ldr	r0, .L277+20
	ldr	r3, [r0, #40]
	cmp	r3, #0
	bne	.L255
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
	ldr	r5, .L277+24
	add	r2, r2, r2, lsl #1
	sub	r1, r1, #16
	sub	r0, r0, #16
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	movne	r3, #1
	strne	r3, [r4, #44]
.L255:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L273:
	ldr	r3, .L277+28
	ldrh	r3, [r3]
	tst	r3, #512
	beq	.L255
	ldr	r3, .L277+32
	ldrh	r3, [r3]
	ands	r3, r3, #512
	bne	.L255
	mov	r1, #1
	ldr	r2, .L277+4
	ldr	r0, .L277+8
	ldr	ip, .L277+12
	ldr	r2, [r2]
	mla	r2, ip, r2, r0
	ldr	r0, .L277+16
	cmp	r0, r2, ror #2
	str	r3, [r4, #4]
	str	r3, [r4]
	str	r3, [r4, #52]
	str	r3, [r4, #44]
	str	r1, [r4, #32]
	bcs	.L260
	b	.L255
.L261:
	bl	chase
	b	.L264
.L274:
	ldr	r2, [r4, #12]
	add	r3, r3, r2
	cmp	r3, #200
	str	r3, [r4, #4]
	moveq	r3, #1
	streq	r3, [r4, #52]
	b	.L264
.L275:
	ldr	r3, [r4, #8]
	add	r2, r2, r3
	cmp	r2, #120
	moveq	r3, #2
	str	r2, [r4]
	streq	r3, [r4, #52]
	b	.L264
.L276:
	ldr	r2, [r4, #12]
	sub	r3, r3, r2
	cmp	r3, #30
	str	r3, [r4, #4]
	moveq	r3, #3
	streq	r3, [r4, #52]
	b	.L264
.L278:
	.align	2
.L277:
	.word	ghost
	.word	buttonTimer
	.word	85899344
	.word	-1030792151
	.word	42949672
	.word	player
	.word	collision
	.word	oldButtons
	.word	buttons
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
	ldr	r2, .L296
	ldr	ip, [r2]
	cmp	ip, #9
	push	{r4, r5, lr}
	ldr	r1, .L296+4
	ble	.L294
	ldr	r3, [r1]
	cmp	r3, #2
	bgt	.L281
	mov	r0, #0
	ldr	r3, .L296+8
	ldr	r4, [r3, #32]
	cmp	r4, #0
	str	r0, [r3, #4]
	str	r0, [r3]
	str	r0, [r3, #52]
	str	r0, [r3, #44]
	beq	.L295
.L282:
	mov	r3, #0
	ldr	r0, .L296+12
	pop	{r4, r5, lr}
	strh	r3, [r0, #2]	@ movhi
	str	r3, [r1]
	str	r3, [r2]
	bx	lr
.L281:
	cmp	r3, #3
	bne	.L292
.L294:
	ldr	r3, .L296+8
	ldr	r4, [r3, #32]
	cmp	r4, #0
	bne	.L282
.L295:
	ldr	r0, [r1]
	ldr	r3, .L296+16
	smull	r5, lr, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, lr, asr #2
	add	r3, r3, r3, lsl #2
	cmp	r0, #0
	lsl	r3, r3, #1
	movle	lr, #0
	movgt	lr, #1
	cmp	r3, r0
	movne	lr, #0
	cmp	lr, #0
	addne	ip, ip, #1
	strne	ip, [r2]
	mov	r2, #194
	ldr	r3, .L296+12
	strne	r4, [r1]
	strh	r2, [r3, #2]	@ movhi
	pop	{r4, r5, lr}
	bx	lr
.L292:
	mov	r0, #1
	ldr	r3, .L296+8
	str	r0, [r3, #32]
	b	.L282
.L297:
	.align	2
.L296:
	.word	sanity
	.word	sanityTimer
	.word	ghost
	.word	67109120
	.word	1717986919
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
	ldr	r2, .L300
	ldr	r3, .L300+4
	ldr	r1, [r2]
	smull	r0, r2, r3, r1
	push	{r4, r5, r6, lr}
	mov	r0, #12
	mov	r5, #10
	mov	r4, #264
	mov	lr, #214
	mov	ip, #222
	asr	r3, r1, #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, lsl #2
	ldr	r2, .L300+8
	add	r3, r3, r3, lsl #2
	sub	r3, r1, r3, lsl #2
	smull	r6, r1, r2, r3
	asr	r2, r3, #31
	rsb	r2, r2, r1, asr #2
	ldr	r1, .L300+12
	ldr	r6, .L300+16
	str	r2, [r1]
	add	r1, r2, r2, lsl #2
	sub	r3, r3, r1, lsl #1
	add	r1, r2, #352
	ldr	r2, .L300+20
	str	r3, [r6]
	add	r3, r3, #352
	strh	r3, [r2, #76]	@ movhi
	ldr	r3, .L300+24
	strh	r5, [r2, #88]	@ movhi
	strh	r4, [r2, #92]	@ movhi
	strh	lr, [r2, #82]	@ movhi
	strh	r1, [r2, #84]	@ movhi
	strh	r3, [r2, #90]	@ movhi
	strh	ip, [r2, #74]	@ movhi
	strh	r0, [r2, #80]	@ movhi
	strh	r0, [r2, #72]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L301:
	.align	2
.L300:
	.word	sanity
	.word	1374389535
	.word	1717986919
	.word	tens
	.word	ones
	.word	shadowOAM
	.word	16598
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
	ldr	r3, .L320
	ldr	r3, [r3, #24]
	cmp	r3, #0
	blne	drawWeapon.part.0
.L303:
	bl	drawGhost
	ldr	r3, .L320+4
	ldr	r3, [r3, #20]
	cmp	r3, #0
	blne	drawEMFReader.part.0
.L304:
	ldr	r3, .L320+8
	ldr	r3, [r3, #20]
	cmp	r3, #0
	beq	.L305
	mov	r2, #10
	ldr	r3, .L320+12
	ldr	r1, .L320+16
	strh	r2, [r3, #24]	@ movhi
	strh	r2, [r3, #26]	@ movhi
	strh	r1, [r3, #28]	@ movhi
.L305:
	ldr	r3, .L320+20
	ldr	r3, [r3, #16]
	cmp	r3, #0
	blne	drawEquipment.part.0
.L306:
	bl	drawSanity
	pop	{r4, lr}
	b	drawOccurrences
.L321:
	.align	2
.L320:
	.word	weapon
	.word	EMFReader
	.word	camera
	.word	shadowOAM
	.word	322
	.word	thermometer
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
	ldr	r4, .L350
	ldr	r3, [r4, #24]
	cmp	r3, #1
	sub	sp, sp, #20
	beq	.L347
.L323:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	beq	.L322
	ldr	r3, .L350+4
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L348
.L326:
	ldr	r3, .L350+8
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L349
.L329:
	mov	r2, #512
	ldr	r3, .L350+12
	strh	r2, [r3, #104]	@ movhi
.L322:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L348:
	ldr	r3, .L350+16
	ldrh	r3, [r3]
	ands	r5, r3, #1
	bne	.L326
	ldr	r6, .L350+20
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
	ldr	r7, .L350+24
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L326
	ldr	r3, .L350+8
	ldr	r2, [r3]
	cmp	r2, #0
	moveq	r2, #1
	strne	r5, [r3]
	streq	r2, [r3]
	bne	.L329
	b	.L328
.L347:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	ble	.L323
	ldr	r2, .L350+28
	ldr	r2, [r2, #56]
	bic	r1, r2, #2
	cmp	r1, #0
	cmpne	r2, #5
	subeq	r3, r3, #3
	streq	r3, [r4, #28]
	beq	.L323
.L324:
	cmp	r3, #5
	subgt	r3, r3, #3
	strgt	r3, [r4, #28]
	b	.L323
.L349:
	ldr	r6, .L350+20
	ldr	r7, .L350+24
.L328:
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
	beq	.L329
	ldr	r3, [r4, #28]
	cmp	r3, #0
	mov	r0, #140
	movle	r2, #384
	movgt	r2, #388
	ldr	r3, .L350+12
	ldr	r1, .L350+32
	strh	r0, [r3, #104]	@ movhi
	strh	r1, [r3, #106]	@ movhi
	strh	r2, [r3, #108]	@ movhi
	b	.L322
.L351:
	.align	2
.L350:
	.word	thermometer
	.word	oldButtons
	.word	tempText
	.word	shadowOAM
	.word	buttons
	.word	player
	.word	collision
	.word	ghost
	.word	-32748
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
	ldr	r3, .L364
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bxeq	lr
	ldr	r2, .L364+4
	ldr	r2, [r2, #56]
	cmp	r2, #3
	cmpne	r2, #1
	bxhi	lr
	mov	ip, #1
	ldr	r1, .L364+8
	str	lr, [sp, #-4]!
	ldr	r2, [r3, #4]
	ldr	lr, .L364+12
	ldr	r0, [r1]
	ldr	r1, [r3]
	ldr	lr, [lr]
	add	r2, r2, #10
	sub	r2, r2, r0
	add	r1, r1, #10
	ldr	r0, .L364+16
	sub	r1, r1, lr
	lsl	r2, r2, #23
	ldr	lr, .L364+20
	lsr	r2, r2, #23
	and	r1, r1, #255
	strh	lr, [r0, #100]	@ movhi
	strh	r2, [r0, #98]	@ movhi
	strh	r1, [r0, #96]	@ movhi
	str	ip, [r3, #28]
	ldr	lr, [sp], #4
	bx	lr
.L365:
	.align	2
.L364:
	.word	uvlight
	.word	ghost
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.word	325
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
	ldr	r4, .L394
	ldr	r3, [r4, #24]
	cmp	r3, #1
	sub	sp, sp, #20
	bne	.L367
	ldr	r2, .L394+4
	ldr	r2, [r2, #56]
	sub	r1, r2, #3
	cmp	r2, #0
	cmpne	r1, #1
	strls	r3, [r4, #28]
.L367:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	beq	.L366
	ldr	r3, .L394+8
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L392
.L369:
	ldr	r3, .L394+12
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L393
.L372:
	mov	r2, #512
	ldr	r3, .L394+16
	strh	r2, [r3, #112]	@ movhi
.L366:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L392:
	ldr	r3, .L394+20
	ldrh	r3, [r3]
	ands	r5, r3, #1
	bne	.L369
	ldr	r6, .L394+24
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
	ldr	r7, .L394+28
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L369
	ldr	r3, .L394+12
	ldr	r2, [r3]
	cmp	r2, #0
	moveq	r2, #1
	strne	r5, [r3]
	streq	r2, [r3]
	bne	.L372
	b	.L371
.L393:
	ldr	r6, .L394+24
	ldr	r7, .L394+28
.L371:
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
	beq	.L372
	ldr	r3, [r4, #28]
	cmp	r3, #1
	mov	r0, #140
	moveq	r2, #384
	movne	r2, #388
	ldr	r3, .L394+16
	ldr	r1, .L394+32
	strh	r0, [r3, #112]	@ movhi
	strh	r1, [r3, #114]	@ movhi
	strh	r2, [r3, #116]	@ movhi
	b	.L366
.L395:
	.align	2
.L394:
	.word	ghostbook
	.word	ghost
	.word	oldButtons
	.word	tempText
	.word	shadowOAM
	.word	buttons
	.word	player
	.word	collision
	.word	-32748
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
	push	{r4, r5, r6, r7, lr}
	ldr	r4, .L421
	ldr	r3, [r4, #24]
	cmp	r3, #1
	sub	sp, sp, #20
	bne	.L397
	ldr	r2, .L421+4
	ldr	r2, [r2, #56]
	sub	r2, r2, #3
	cmp	r2, #2
	strls	r3, [r4, #28]
.L397:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	beq	.L396
	ldr	r3, .L421+8
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L419
.L399:
	ldr	r3, .L421+12
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L420
.L402:
	mov	r2, #512
	ldr	r3, .L421+16
	strh	r2, [r3, #120]	@ movhi
.L396:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L419:
	ldr	r3, .L421+20
	ldrh	r3, [r3]
	ands	r5, r3, #1
	bne	.L399
	ldr	r6, .L421+24
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
	ldr	r7, .L421+28
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L399
	ldr	r3, .L421+12
	ldr	r2, [r3]
	cmp	r2, #0
	moveq	r2, #1
	strne	r5, [r3]
	streq	r2, [r3]
	bne	.L402
	b	.L401
.L420:
	ldr	r6, .L421+24
	ldr	r7, .L421+28
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
	ldr	r3, [r4, #28]
	cmp	r3, #1
	mov	r0, #140
	moveq	r2, #384
	movne	r2, #388
	ldr	r3, .L421+16
	ldr	r1, .L421+32
	strh	r0, [r3, #120]	@ movhi
	strh	r1, [r3, #122]	@ movhi
	strh	r2, [r3, #124]	@ movhi
	b	.L396
.L422:
	.align	2
.L421:
	.word	videocam
	.word	ghost
	.word	oldButtons
	.word	tempText
	.word	shadowOAM
	.word	buttons
	.word	player
	.word	collision
	.word	-32748
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
	ldr	r4, .L451
	ldr	r3, [r4, #24]
	cmp	r3, #1
	sub	sp, sp, #20
	bne	.L424
	ldr	r2, .L451+4
	ldr	r2, [r2, #56]
	sub	r1, r2, #1
	cmp	r2, #4
	cmpne	r1, #1
	strls	r3, [r4, #28]
.L424:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	beq	.L423
	ldr	r3, .L451+8
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L449
.L426:
	ldr	r3, .L451+12
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L450
.L429:
	mov	r2, #512
	ldr	r3, .L451+16
	strh	r2, [r3, #128]	@ movhi
.L423:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L449:
	ldr	r3, .L451+20
	ldrh	r3, [r3]
	ands	r5, r3, #1
	bne	.L426
	ldr	r6, .L451+24
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
	ldr	r7, .L451+28
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L426
	ldr	r3, .L451+12
	ldr	r2, [r3]
	cmp	r2, #0
	moveq	r2, #1
	strne	r5, [r3]
	streq	r2, [r3]
	bne	.L429
	b	.L428
.L450:
	ldr	r6, .L451+24
	ldr	r7, .L451+28
.L428:
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
	beq	.L429
	ldr	r3, [r4, #28]
	cmp	r3, #1
	mov	r0, #140
	moveq	r2, #384
	movne	r2, #388
	ldr	r3, .L451+16
	ldr	r1, .L451+32
	strh	r0, [r3, #128]	@ movhi
	strh	r1, [r3, #130]	@ movhi
	strh	r2, [r3, #132]	@ movhi
	b	.L423
.L452:
	.align	2
.L451:
	.word	spiritbox
	.word	ghost
	.word	oldButtons
	.word	tempText
	.word	shadowOAM
	.word	buttons
	.word	player
	.word	collision
	.word	-32748
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
	ldr	r3, .L463
	ldr	r3, [r3, #24]
	cmp	r3, #0
	blne	updateWeapon.part.0
.L454:
	bl	updateEMFReader
	bl	updateThermometer
	bl	updateUVLight
	bl	updateGhostbook
	bl	updateVideoCam
	bl	updateSpiritBox
	ldr	r3, .L463+4
	ldr	r3, [r3, #20]
	cmp	r3, #0
	blne	updateCamera.part.0
.L455:
	mov	r2, #67108864
	ldr	r3, .L463+8
	ldrh	r1, [r3]
	ldr	r3, .L463+12
	strh	r1, [r2, #16]	@ movhi
	ldrh	r1, [r3]
	ldr	r4, .L463+16
	strh	r1, [r2, #18]	@ movhi
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L463+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L464:
	.align	2
.L463:
	.word	weapon
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
	.comm	uvlight,32,4
	.comm	spiritbox,32,4
	.comm	videocam,32,4
	.comm	ghostbook,32,4
	.comm	thermometer,32,4
	.comm	EMFReader,24,4
	.comm	ghost,60,4
	.comm	weapon,32,4
	.comm	player,48,4
	.comm	occurrences,80,4
	.comm	shadowOAM,1024,4
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
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	collisionMap, %object
	.size	collisionMap, 4
collisionMap:
	.word	collisionmapBitmap
	.ident	"GCC: (devkitARM release 53) 9.1.0"
