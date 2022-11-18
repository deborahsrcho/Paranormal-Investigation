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
	ldr	r3, .L15
	ldrh	r1, [r3, #2]
	tst	r1, #8
	push	{r4, r5, r6, lr}
	strh	r2, [r3, #8]	@ movhi
	ldrne	r2, .L15+4
	ldrne	r3, [r2]
	addne	r3, r3, #1
	strne	r3, [r2]
	ldr	r3, .L15
	ldrh	r3, [r3, #2]
	tst	r3, #16
	beq	.L4
	ldr	r2, .L15+8
	ldr	r4, .L15+12
	ldr	r3, [r2]
	ldr	r1, [r4, #16]
	add	r3, r3, #1
	cmp	r1, #0
	str	r3, [r2]
	beq	.L4
	add	r3, r3, r3, lsl #4
	ldr	r2, .L15+16
	add	r3, r3, r3, lsl #8
	ldr	r1, .L15+20
	add	r3, r3, r3, lsl #16
	sub	r2, r2, r3
	cmp	r2, r1
	bcc	.L14
.L4:
	mov	r1, #1
	ldr	r3, .L15
	ldrh	r2, [r3, #2]
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L14:
	ldr	r5, .L15+24
	mov	lr, pc
	bx	r5
	ldr	r3, .L15+28
	smull	r2, r3, r0, r3
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	sub	r3, r0, r3
	str	r3, [r4, #24]
	mov	lr, pc
	bx	r5
	ldr	r4, .L15+32
	smull	r3, r2, r4, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #1
	add	r3, r3, r3, lsl #2
	ldr	r2, .L15+36
	sub	r0, r0, r3
	str	r0, [r2, #24]
	mov	lr, pc
	bx	r5
	smull	r2, r3, r4, r0
	asr	r2, r0, #31
	rsb	r2, r2, r3, asr #1
	add	r2, r2, r2, lsl #2
	ldr	r3, .L15+40
	sub	r0, r0, r2
	str	r0, [r3, #24]
	mov	lr, pc
	bx	r5
	smull	r3, r4, r0, r4
	asr	r3, r0, #31
	rsb	r3, r3, r4, asr #1
	ldr	r2, .L15+44
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3
	str	r0, [r2, #24]
	b	.L4
.L16:
	.align	2
.L15:
	.word	67109376
	.word	sanityTimer
	.word	seconds
	.word	thermometer
	.word	143165576
	.word	286331153
	.word	rand
	.word	1431655766
	.word	1717986919
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
	ldr	r3, .L18
	ldr	r3, [r3, #16]
	ldr	r2, .L18+4
	ldr	r1, .L18+8
	add	r3, r3, #128
	lsl	r3, r3, #1
	strh	r3, [r2, #28]	@ movhi
	strh	r0, [r2, #24]	@ movhi
	strh	r1, [r2, #26]	@ movhi
	bx	lr
.L19:
	.align	2
.L18:
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
	ldr	r2, .L22
	ldr	r3, .L22+4
	ldr	r0, .L22+8
	ldrh	r6, [r2]
	ldrh	r5, [r0]
	ldm	r3, {r1, r2}
	ldr	r4, .L22+12
	ldr	r3, .L22+16
	ldr	r8, .L22+20
	sub	r1, r1, r6
	sub	r2, r2, r5
	and	r2, r2, r4
	and	r1, r1, #255
	strh	r1, [r3, #32]	@ movhi
	strh	r2, [r3, #34]	@ movhi
	ldm	r8, {r1, r2}
	ldr	ip, .L22+24
	sub	r2, r2, r5
	and	r2, r2, r4
	strh	r2, [r3, #42]	@ movhi
	strh	lr, [r3, #68]	@ movhi
	sub	r1, r1, r6
	ldm	ip, {r2, lr}
	and	r1, r1, #255
	ldr	r0, .L22+28
	ldr	r7, .L22+32
	strh	r1, [r3, #40]	@ movhi
	sub	r2, r2, r6
	ldr	r1, .L22+36
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
	ldr	lr, .L22+40
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
.L23:
	.align	2
.L22:
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
	ldr	r3, .L45
	ldrh	r3, [r3]
	tst	r3, #2
	ldr	r4, .L45+4
	sub	sp, sp, #16
	beq	.L25
	ldr	r3, .L45+8
	ldrh	r3, [r3]
	ands	r3, r3, #2
	streq	r3, [r4, #28]
	beq	.L26
.L25:
	ldr	r3, [r4, #28]
	cmp	r3, #199
	ble	.L26
	mov	r2, #0
	mov	r3, #4
	str	r2, [r4, #20]
	str	r3, [r4, #16]
.L34:
	ldr	r3, [r4, #28]
	add	r3, r3, #1
	str	r3, [r4, #28]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L26:
	mov	r1, #1
	ldr	r3, .L45+12
	ldr	r2, [r3, #28]
	cmp	r2, #0
	str	r2, [r4, #16]
	str	r1, [r4, #20]
	bne	.L43
	mov	r0, #16
	mov	r1, #24
	ldm	r3, {r2, ip}
	add	r3, r2, r0
	stm	r4, {r3, ip}
	str	r0, [r4, #8]
	str	r1, [r4, #12]
.L31:
	ldr	r5, .L45+16
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
	ldr	r6, .L45+20
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L34
	mov	r2, #0
	ldr	r3, .L45+24
	str	r2, [r5, #32]
	mov	lr, pc
	bx	r3
	b	.L34
.L43:
	cmp	r2, #1
	beq	.L44
	cmp	r2, #2
	bne	.L33
	mov	r0, #24
	mov	r1, #16
	ldr	r2, [r3, #4]
	ldr	ip, [r3]
	add	r3, r2, #14
	str	r3, [r4, #4]
	str	ip, [r4]
	str	r0, [r4, #8]
	str	r1, [r4, #12]
	b	.L31
.L44:
	mov	r0, #16
	mov	r1, #24
	ldm	r3, {r2, ip}
	sub	r3, r2, #22
	stm	r4, {r3, ip}
	str	r0, [r4, #8]
	str	r1, [r4, #12]
	b	.L31
.L33:
	cmp	r2, #3
	bne	.L31
	mov	r0, #24
	mov	r1, #16
	ldr	r2, [r3, #4]
	ldr	ip, [r3]
	sub	r3, r2, #22
	str	r3, [r4, #4]
	str	ip, [r4]
	str	r0, [r4, #8]
	str	r1, [r4, #12]
	b	.L31
.L46:
	.align	2
.L45:
	.word	oldButtons
	.word	weapon
	.word	buttons
	.word	player
	.word	ghost
	.word	collision
	.word	goToWin
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
	ldr	r1, .L48
	ldr	r2, .L48+4
	ldr	r3, [r1, #4]
	ldr	r2, [r2]
	sub	r3, r3, r2
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r0, .L48+8
	ldr	r2, [r1]
	ldr	ip, [r0]
	ldr	r1, [r1, #16]
	ldr	r0, .L48+12
	sub	r2, r2, ip
	add	r1, r1, #16
	ldr	ip, .L48+16
	lsl	r1, r1, #2
	and	r2, r2, #255
	strh	r3, [r0, #10]	@ movhi
	strh	r1, [r0, #12]	@ movhi
	strh	r2, [r0, #8]	@ movhi
	strh	ip, [r0, #28]	@ movhi
	bx	lr
.L49:
	.align	2
.L48:
	.word	weapon
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.word	266
	.size	drawWeapon.part.0, .-drawWeapon.part.0
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
	ldr	r3, .L51
	ldr	r0, .L51+4
	strh	r2, [r3, #2]	@ movhi
	strh	ip, [r0]	@ movhi
	strh	r2, [r3]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	strh	r2, [r3, #6]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	strh	r1, [r3, #6]	@ movhi
	bx	lr
.L52:
	.align	2
.L51:
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
	ldr	r3, .L55
	ldr	r0, .L55+4
	strh	r2, [r3, #2]	@ movhi
	strh	ip, [r0]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	ip, .L55+8
	strh	lr, [r0, #8]	@ movhi
	ldr	r0, .L55+12
	strh	r1, [r3, #2]	@ movhi
	ldr	lr, [sp], #4
	str	r0, [ip, #4092]
	strh	r2, [r3, #6]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	strh	r1, [r3, #6]	@ movhi
	bx	lr
.L56:
	.align	2
.L55:
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
	ldr	r3, .L59
	ldr	r0, .L59+4
	ldr	r1, [r3]
	ldr	r0, [r0]
	ldr	r3, .L59+8
	add	r7, r1, #112
	add	ip, r1, #113
	ldr	r1, .L59+12
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
.L60:
	.align	2
.L59:
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
	mov	r2, #8
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r7, #16
	mov	r3, #0
	mov	r9, #18
	mov	r8, #1
	ldr	ip, .L63
	ldr	r0, .L63+4
	add	r6, ip, #16
	ldm	r6, {r6, lr}
	ldr	r5, [r0]
	ldr	r1, [r0, #4]
	ldr	r0, .L63+8
	add	lr, lr, r2
	str	lr, [r0, #12]
	ldr	lr, [ip]
	ldr	ip, [ip, #4]
	add	r6, r6, r7
	ldr	r4, .L63+12
	str	lr, [r0]
	str	ip, [r0, #4]
	ldr	lr, .L63+16
	str	r6, [r0, #8]
	str	r3, [r0, #16]
	str	r3, [r0, #20]
	ldr	r0, .L63+20
	add	ip, r1, #24
	stm	lr, {r5, ip}
	add	r6, r1, r2
	ldr	ip, .L63+24
	str	r9, [r4, #28]
	str	r8, [r0, #20]
	add	r9, r1, #40
	str	r7, [r0, #8]
	ldr	r1, .L63+28
	str	r7, [r0, #12]
	str	r3, [r0]
	str	r3, [r0, #4]
	str	r3, [r0, #16]
	ldr	r0, .L63+32
	stm	r4, {r5, r6}
	str	r3, [r4, #16]
	str	r3, [r4, #20]
	str	r3, [r4, #24]
	str	r3, [lr, #16]
	str	r3, [lr, #20]
	str	r2, [r4, #8]
	str	r2, [r4, #12]
	str	r2, [lr, #8]
	str	r2, [lr, #12]
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
.L64:
	.align	2
.L63:
	.word	player
	.word	ghostspot
	.word	camera
	.word	thermometer
	.word	ghostbook
	.word	EMFReader
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
	push	{r4, lr}
	ldr	r4, .L67
	ldr	r0, .L67+4
	str	r3, [r4]
	str	r3, [r4, #4]
	str	r3, [r4, #24]
	str	r3, [r4, #36]
	str	r3, [r4, #40]
	str	r3, [r4, #28]
	str	r3, [r4, #32]
	str	r3, [r4, #44]
	str	r3, [r4, #52]
	str	r1, [r4, #16]
	str	r1, [r4, #20]
	str	r2, [r4, #8]
	str	r2, [r4, #12]
	str	r2, [r4, #48]
	mov	lr, pc
	bx	r0
	ldr	r3, .L67+8
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #1
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3
	str	r0, [r4, #56]
	pop	{r4, lr}
	bx	lr
.L68:
	.align	2
.L67:
	.word	ghost
	.word	rand
	.word	1717986919
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
	push	{r4, lr}
	mov	r4, #0
	mov	ip, #1
	mov	r0, #24
	mov	r2, #194
	ldr	r1, .L73
	ldr	r3, .L73+4
	str	r4, [r1]
	ldr	r1, .L73+8
	str	r4, [r3]
	str	r4, [r1]
	ldr	r3, .L73+12
	ldr	r1, .L73+16
	str	r4, [r3]
	str	r4, [r1]
	ldr	r3, .L73+20
	ldr	r1, .L73+24
	str	r4, [r3]
	str	r4, [r1]
	ldr	r3, .L73+28
	ldr	r1, .L73+32
	strh	r4, [r3, #2]	@ movhi
	strh	r0, [r1]	@ movhi
	strh	r4, [r3]	@ movhi
	ldr	r0, .L73+36
	strh	ip, [r1, #8]	@ movhi
	ldr	r1, .L73+40
	strh	r2, [r3, #2]	@ movhi
	str	r1, [r0, #4092]
	strh	r4, [r3, #6]	@ movhi
	strh	r4, [r3, #4]	@ movhi
	strh	r2, [r3, #6]	@ movhi
	bl	initPlayer
	bl	initGhost
	mov	r2, #64
	mov	r1, #140
	ldr	r3, .L73+44
	stm	r3, {r1, r4}
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	bl	initEquipment
	mov	r2, #8
	ldr	r3, .L73+48
	add	r1, r3, #60
.L70:
	str	r4, [r3, #24]
	str	r4, [r3, #20]
	str	r2, [r3, #32]
	str	r2, [r3, #28]
	str	r4, [r3, #36]
	add	r3, r3, #20
	cmp	r3, r1
	bne	.L70
	pop	{r4, lr}
	bx	lr
.L74:
	.align	2
.L73:
	.word	tempText
	.word	seconds
	.word	sanity
	.word	sanityTimer
	.word	buttonTimer
	.word	hOff
	.word	vOff
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
	ldr	r3, .L76
	str	r0, [r3, #4]
	str	r1, [r3]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	bx	lr
.L77:
	.align	2
.L76:
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
	@ link register save eliminated.
	mov	r2, #0
	mov	r1, #8
	ldr	r3, .L82
	add	r0, r3, #60
.L79:
	str	r2, [r3, #24]
	str	r2, [r3, #20]
	str	r1, [r3, #32]
	str	r1, [r3, #28]
	str	r2, [r3, #36]
	add	r3, r3, #20
	cmp	r3, r0
	bne	.L79
	bx	lr
.L83:
	.align	2
.L82:
	.word	occurrences
	.size	initOccurrences, .-initOccurrences
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
	ldr	r5, .L142
	ldr	r3, .L142+4
	ldr	r2, [r5]
	smull	r0, r1, r3, r2
	ldr	r4, .L142+8
	asr	r3, r2, #31
	ldr	r0, .L142+12
	rsb	r3, r3, r1, asr #4
	ldr	r0, [r0]
	ldr	r1, [r4, #40]
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r2, r3, lsl #1
	orr	r2, r1, r0
	orrs	r3, r2, r3
	bne	.L86
	ldr	r3, .L142+16
	ldrh	r3, [r3, #48]
	tst	r3, #64
	bne	.L87
	ldr	r3, [r4]
	cmp	r3, #1
	ble	.L87
	ldr	r0, .L142+20
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
	beq	.L86
.L137:
	sub	r1, r1, #1
	str	r1, [r0]
.L86:
	ldr	r7, .L142+24
	ldr	r3, [r7, #44]
	cmp	r3, #0
	beq	.L138
.L91:
	ldr	r3, .L142+28
	ldrh	r3, [r3]
	tst	r3, #256
	and	r3, r3, #1
	beq	.L96
	ldr	r2, .L142+32
	ldrh	r2, [r2]
	tst	r2, #256
	bne	.L96
.L104:
	ldr	r2, [r4, #44]
	add	r2, r2, #1
	cmp	r2, #2
	str	r2, [r4, #44]
	movgt	r2, #0
	strgt	r2, [r4, #44]
	bgt	.L98
	cmp	r2, #1
	beq	.L139
	cmp	r2, #2
	bne	.L100
	mov	r2, #0
	mov	r0, #1
	mov	r1, #512
	ldr	ip, .L142+36
	str	r2, [ip, #20]
	ldr	ip, .L142+40
	str	r2, [ip, #24]
	ldr	r2, .L142+44
	str	r0, [r2, #20]
	ldr	r2, .L142+48
	strh	r1, [r2, #24]	@ movhi
.L96:
	cmp	r3, #0
	beq	.L102
	ldr	r2, .L142+32
.L101:
	ldrh	r3, [r2]
	tst	r3, #1
	bne	.L102
.L106:
	ldr	r3, .L142+36
	ldr	r3, [r3, #16]
	cmp	r3, #2
	ble	.L102
	ldr	r2, .L142+52
	ldr	r1, [r7, #32]
	ldr	r3, [r2, #16]
	orrs	r3, r1, r3
	bne	.L102
	mov	r1, #1
	ldm	r4, {r0, r3}
	ldr	ip, .L142+56
	ldr	r4, .L142+60
	sub	r6, r0, #8
	str	r6, [ip]
	str	r6, [r2]
	str	r6, [r4]
	add	r6, r3, #6
	str	r6, [ip, #4]
	ldr	lr, .L142+64
	str	r1, [ip, #16]
	ldr	ip, .L142+68
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
.L102:
	ldr	r3, [r5]
	add	r3, r3, #1
	str	r3, [r5]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L138:
	ldr	r9, .L142+72
	ldr	r8, .L142+76
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
	beq	.L91
	ldr	r3, .L142+28
	ldrh	r2, [r3]
	ands	r3, r2, #1
	and	r1, r2, #256
	beq	.L92
	ldr	r2, .L142+32
	ldrh	r0, [r2]
	ands	ip, r0, #1
	beq	.L140
	cmp	r1, #0
	beq	.L102
.L105:
	tst	r0, #256
	beq	.L104
	b	.L101
.L100:
	cmp	r2, #0
	bne	.L96
.L98:
	mov	r2, #0
	mov	r0, #1
	mov	r1, #512
	ldr	ip, .L142+36
	str	r2, [ip, #20]
	ldr	ip, .L142+44
	str	r2, [ip, #20]
	ldr	r2, .L142+40
	str	r0, [r2, #24]
	ldr	r2, .L142+48
	strh	r1, [r2, #24]	@ movhi
	b	.L96
.L87:
	ldr	r3, .L142+16
	ldrh	r3, [r3, #48]
	ands	r3, r3, #128
	bne	.L89
	ldr	r2, [r4]
	ldr	r1, [r4, #20]
	add	r1, r2, r1
	cmp	r1, #255
	bgt	.L89
	ldr	ip, .L142+20
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
	b	.L86
.L89:
	ldr	r3, .L142+16
	ldrh	r3, [r3, #48]
	tst	r3, #32
	beq	.L141
.L90:
	ldr	r3, .L142+16
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L86
	ldr	r2, [r4, #4]
	ldr	r3, [r4, #16]
	add	r3, r2, r3
	cmp	r3, #512
	bge	.L86
	ldr	r0, .L142+80
	ldr	r3, [r4, #12]
	ldr	r1, [r0]
	add	r2, r2, r3
	sub	r3, r2, r1
	ldr	ip, .L142+84
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
	b	.L86
.L139:
	mov	r1, #0
	ldr	r0, .L142+40
	ldr	ip, .L142+44
	str	r1, [r0, #24]
	ldr	r0, .L142+36
	str	r1, [ip, #20]
	str	r2, [r0, #20]
	b	.L96
.L92:
	cmp	r1, #0
	beq	.L102
	ldr	r2, .L142+32
	ldrh	r3, [r2]
	ands	r3, r3, #256
	beq	.L104
	b	.L102
.L140:
	ldr	lr, [r4, #40]
	cmp	lr, #0
	moveq	ip, #1
	cmp	r1, #0
	str	ip, [r4, #40]
	beq	.L106
	b	.L105
.L141:
	ldr	r3, [r4, #4]
	cmp	r3, #0
	ble	.L90
	ldr	r0, .L142+80
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
	beq	.L86
	b	.L137
.L143:
	.align	2
.L142:
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
	ldr	r1, .L147
	ldr	r0, .L147+4
	ldr	ip, [r0]
	ldr	r0, [r1, #40]
	cmp	r0, #0
	movne	r0, #9
	ldr	r2, .L147+8
	ldr	r3, [r1, #4]
	ldr	r2, [r2]
	sub	r3, r3, r2
	ldr	r2, [r1]
	ldreq	r0, [r1, #28]
	lsl	r3, r3, #23
	ldrne	r1, .L147+12
	ldreq	r1, .L147+12
	lsr	r3, r3, #23
	sub	r2, r2, ip
	orr	r3, r3, #16384
	and	r2, r2, #255
	lsleq	r0, r0, #1
	strh	r0, [r1, #4]	@ movhi
	strh	r2, [r1]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	bx	lr
.L148:
	.align	2
.L147:
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
	ldr	r3, .L163
	ldr	r2, [r3, #32]
	cmp	r2, #0
	beq	.L150
	ldr	r3, [r3, #56]
	sub	r2, r3, #1
	cmp	r3, #5
	cmpne	r2, #1
	bhi	.L159
	mov	r2, #4
	ldr	r3, .L163+4
	str	r2, [r3, #16]
	bx	lr
.L159:
	mov	r2, #3
	ldr	r3, .L163+4
	str	r2, [r3, #16]
	bx	lr
.L150:
	push	{r4, r5, r6, lr}
	ldr	r5, .L163+8
	ldm	r5, {r2, r3}
	ldr	r0, [r5, #12]
	ldr	r1, [r5, #8]
	sub	sp, sp, #16
	ldr	r4, .L163+12
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	ldr	r6, .L163+16
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L162
	mov	r2, #3
	ldr	r3, .L163+4
	str	r2, [r3, #16]
.L149:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L162:
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
	ldrne	r3, .L163+4
	strne	r2, [r3, #16]
	bne	.L149
.L153:
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
	ldrne	r3, .L163+4
	ldreq	r3, .L163+4
	strne	r2, [r3, #16]
	streq	r0, [r3, #16]
	b	.L149
.L164:
	.align	2
.L163:
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
	ldr	r3, .L167
	ldr	r3, [r3, #20]
	cmp	r3, #0
	bxeq	lr
	b	drawEMFReader.part.0
.L168:
	.align	2
.L167:
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
	ldr	r3, .L171
	ldr	r3, [r3, #16]
	cmp	r3, #0
	bxeq	lr
	b	drawEquipment.part.0
.L172:
	.align	2
.L171:
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
	ldr	r3, .L175
	ldr	r3, [r3, #24]
	cmp	r3, #0
	bxeq	lr
	b	updateWeapon.part.0
.L176:
	.align	2
.L175:
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
	ldr	r3, .L179
	ldr	r3, [r3, #24]
	cmp	r3, #0
	bxeq	lr
	b	drawWeapon.part.0
.L180:
	.align	2
.L179:
	.word	weapon
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
	ldr	r2, .L185
	ldr	r3, [r2, #32]
	cmp	r3, #0
	bne	.L184
	mov	r0, #201
	ldr	r1, .L185+4
	ldr	r3, [r2, #4]
	ldr	ip, [r1]
	ldr	r1, .L185+8
	sub	r3, r3, ip
	ldr	r2, [r2]
	ldr	ip, [r1]
	lsl	r3, r3, #23
	ldr	r1, .L185+12
	lsr	r3, r3, #23
	sub	r2, r2, ip
	orr	r3, r3, #16384
	and	r2, r2, #255
	strh	r3, [r1, #18]	@ movhi
	strh	r2, [r1, #16]	@ movhi
	strh	r0, [r1, #20]	@ movhi
	bx	lr
.L184:
	ldr	r3, .L185+16
	ldr	r1, .L185+20
	ldr	r0, .L185+24
	ldr	r3, [r3]
	mla	r3, r0, r3, r1
	ldr	r1, .L185+28
	cmp	r1, r3, ror #2
	bxcc	lr
	ldr	r1, .L185+4
	ldr	r3, [r2, #4]
	ldr	r0, [r1]
	ldr	r1, .L185+8
	sub	r3, r3, r0
	ldr	ip, [r1]
	ldr	r1, [r2]
	ldr	r2, [r2, #28]
	lsl	r3, r3, #23
	ldr	r0, .L185+12
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
.L186:
	.align	2
.L185:
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
	ldr	r3, .L199
	ldr	lr, .L199+4
	ldr	ip, [r3]
	ldr	r1, [lr]
	cmp	ip, r1
	sub	sp, sp, #16
	ble	.L188
	ldr	r2, [r3, #8]
	ldr	r0, [lr, #4]
	sub	ip, ip, r2
	ldr	r2, [r3, #4]
	cmp	r2, r0
	str	ip, [r3]
	ble	.L190
.L198:
	ldr	r4, [r3, #12]
	sub	r2, r2, r4
	str	r2, [r3, #4]
.L191:
	add	r3, r3, #16
	ldm	r3, {r3, r4}
	stm	sp, {r2, ip}
	str	r4, [sp, #12]
	str	r3, [sp, #8]
	add	r2, lr, #16
	ldm	r2, {r2, r3}
	ldr	r4, .L199+8
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	bne	.L197
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L188:
	ldrlt	r2, [r3, #8]
	ldr	r0, [lr, #4]
	addlt	ip, ip, r2
	ldr	r2, [r3, #4]
	strlt	ip, [r3]
	cmp	r2, r0
	bgt	.L198
.L190:
	ldrlt	r4, [r3, #12]
	addlt	r2, r2, r4
	strlt	r2, [r3, #4]
	b	.L191
.L197:
	ldr	r3, .L199+12
	mov	lr, pc
	bx	r3
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L200:
	.align	2
.L199:
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
	ldr	r4, .L223
	ldr	r3, [r4, #32]
	cmp	r3, #0
	sub	sp, sp, #20
	beq	.L219
	ldr	r3, .L223+4
	ldr	r2, .L223+8
	ldr	r1, .L223+12
	ldr	r3, [r3]
	mla	r3, r1, r3, r2
	ldr	r2, .L223+16
	cmp	r2, r3, ror #2
	bcc	.L201
	ldr	r3, [r4, #44]
	cmp	r3, #0
	bne	.L207
.L206:
	ldr	r3, [r4, #4]
	cmp	r3, #200
	bgt	.L208
	ldr	r2, [r4, #52]
	cmp	r2, #0
	beq	.L220
.L208:
	ldr	r2, [r4]
	cmp	r2, #120
	bgt	.L211
	ldr	r1, [r4, #52]
	cmp	r1, #1
	beq	.L221
.L211:
	cmp	r3, #29
	ble	.L213
	ldr	r1, [r4, #52]
	cmp	r1, #2
	beq	.L222
.L213:
	cmp	r2, #19
	ble	.L210
	ldr	r3, [r4, #52]
	cmp	r3, #3
	bne	.L210
	ldr	r3, [r4, #8]
	sub	r2, r2, r3
	cmp	r2, #20
	moveq	r3, #0
	str	r2, [r4]
	streq	r3, [r4, #32]
	streq	r3, [r4, #52]
.L210:
	ldr	r0, .L223+20
	ldr	r3, [r0, #40]
	cmp	r3, #0
	bne	.L201
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
	ldr	r5, .L223+24
	add	r2, r2, r2, lsl #1
	sub	r1, r1, #16
	sub	r0, r0, #16
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	movne	r3, #1
	strne	r3, [r4, #44]
.L201:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L219:
	ldr	r3, .L223+28
	ldrh	r3, [r3]
	tst	r3, #512
	beq	.L201
	ldr	r3, .L223+32
	ldrh	r3, [r3]
	ands	r3, r3, #512
	bne	.L201
	mov	r1, #1
	ldr	r2, .L223+4
	ldr	r0, .L223+8
	ldr	ip, .L223+12
	ldr	r2, [r2]
	mla	r2, ip, r2, r0
	ldr	r0, .L223+16
	cmp	r0, r2, ror #2
	str	r3, [r4, #4]
	str	r3, [r4]
	str	r3, [r4, #52]
	str	r3, [r4, #44]
	str	r1, [r4, #32]
	bcs	.L206
	b	.L201
.L207:
	bl	chase
	b	.L210
.L220:
	ldr	r2, [r4, #12]
	add	r3, r3, r2
	cmp	r3, #200
	str	r3, [r4, #4]
	moveq	r3, #1
	streq	r3, [r4, #52]
	b	.L210
.L221:
	ldr	r3, [r4, #8]
	add	r2, r2, r3
	cmp	r2, #120
	moveq	r3, #2
	str	r2, [r4]
	streq	r3, [r4, #52]
	b	.L210
.L222:
	ldr	r2, [r4, #12]
	sub	r3, r3, r2
	cmp	r3, #30
	str	r3, [r4, #4]
	moveq	r3, #3
	streq	r3, [r4, #52]
	b	.L210
.L224:
	.align	2
.L223:
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
	ldr	r2, .L242
	ldr	ip, [r2]
	cmp	ip, #9
	push	{r4, r5, lr}
	ldr	r1, .L242+4
	ble	.L240
	ldr	r3, [r1]
	cmp	r3, #2
	bgt	.L227
	mov	r0, #0
	ldr	r3, .L242+8
	ldr	r4, [r3, #32]
	cmp	r4, #0
	str	r0, [r3, #4]
	str	r0, [r3]
	str	r0, [r3, #52]
	str	r0, [r3, #44]
	beq	.L241
.L228:
	mov	r3, #0
	ldr	r0, .L242+12
	pop	{r4, r5, lr}
	strh	r3, [r0, #2]	@ movhi
	str	r3, [r1]
	str	r3, [r2]
	bx	lr
.L227:
	cmp	r3, #3
	bne	.L238
.L240:
	ldr	r3, .L242+8
	ldr	r4, [r3, #32]
	cmp	r4, #0
	bne	.L228
.L241:
	ldr	r0, [r1]
	ldr	r3, .L242+16
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
	ldr	r3, .L242+12
	strne	r4, [r1]
	strh	r2, [r3, #2]	@ movhi
	pop	{r4, r5, lr}
	bx	lr
.L238:
	mov	r0, #1
	ldr	r3, .L242+8
	str	r0, [r3, #32]
	b	.L228
.L243:
	.align	2
.L242:
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
	ldr	r2, .L246
	ldr	r3, .L246+4
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
	ldr	r2, .L246+8
	add	r3, r3, r3, lsl #2
	sub	r3, r1, r3, lsl #2
	smull	r6, r1, r2, r3
	asr	r2, r3, #31
	rsb	r2, r2, r1, asr #2
	ldr	r1, .L246+12
	ldr	r6, .L246+16
	str	r2, [r1]
	add	r1, r2, r2, lsl #2
	sub	r3, r3, r1, lsl #1
	add	r1, r2, #352
	ldr	r2, .L246+20
	str	r3, [r6]
	add	r3, r3, #352
	strh	r3, [r2, #76]	@ movhi
	ldr	r3, .L246+24
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
.L247:
	.align	2
.L246:
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
	ldr	r3, .L262
	ldr	r3, [r3, #24]
	cmp	r3, #0
	blne	drawWeapon.part.0
.L249:
	bl	drawGhost
	ldr	r3, .L262+4
	ldr	r3, [r3, #20]
	cmp	r3, #0
	blne	drawEMFReader.part.0
.L250:
	ldr	r3, .L262+8
	ldr	r3, [r3, #16]
	cmp	r3, #0
	blne	drawEquipment.part.0
.L251:
	pop	{r4, lr}
	b	drawSanity
.L263:
	.align	2
.L262:
	.word	weapon
	.word	EMFReader
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
	push	{r4, r5, r6, lr}
	ldr	r4, .L284
	ldr	r3, [r4, #24]
	cmp	r3, #3
	sub	sp, sp, #16
	beq	.L282
.L265:
	ldr	r3, .L284+4
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L267
	ldr	r3, .L284+8
	ldrh	r3, [r3]
	ands	r5, r3, #1
	beq	.L283
.L267:
	ldr	r3, .L284+12
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L269
.L270:
	mov	r2, #512
	ldr	r3, .L284+16
	strh	r2, [r3, #104]	@ movhi
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L282:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	ble	.L265
	ldr	r2, .L284+20
	ldr	r2, [r2, #56]
	bic	r1, r2, #2
	cmp	r1, #0
	cmpne	r2, #5
	bne	.L266
	sub	r3, r3, #3
	str	r3, [r4, #28]
	b	.L265
.L283:
	ldr	r0, .L284+24
	ldr	ip, [r4, #8]
	add	r2, r0, #16
	ldr	r1, [r0]
	ldm	r2, {r2, r3}
	ldr	r0, [r0, #4]
	ldr	r6, [r4, #12]
	ldr	lr, [r4]
	str	ip, [sp, #8]
	ldr	ip, [r4, #4]
	str	r6, [sp, #12]
	stm	sp, {ip, lr}
	ldr	r6, .L284+28
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L267
	ldr	r3, .L284+12
	ldr	r2, [r3]
	cmp	r2, #0
	moveq	r2, #1
	strne	r5, [r3]
	streq	r2, [r3]
	bne	.L270
.L269:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	mov	r0, #140
	movlt	r2, #384
	movge	r2, #388
	ldr	r3, .L284+16
	ldr	r1, .L284+32
	strh	r0, [r3, #104]	@ movhi
	strh	r1, [r3, #106]	@ movhi
	strh	r2, [r3, #108]	@ movhi
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L266:
	cmp	r3, #5
	subgt	r3, r3, #3
	strgt	r3, [r4, #28]
	b	.L265
.L285:
	.align	2
.L284:
	.word	thermometer
	.word	oldButtons
	.word	buttons
	.word	tempText
	.word	shadowOAM
	.word	ghost
	.word	player
	.word	collision
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
	ldr	r3, .L298
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bxeq	lr
	ldr	r2, .L298+4
	ldr	r2, [r2, #56]
	cmp	r2, #3
	cmpne	r2, #1
	bxhi	lr
	mov	ip, #1
	ldr	r1, .L298+8
	str	lr, [sp, #-4]!
	ldr	r2, [r3, #4]
	ldr	lr, .L298+12
	ldr	r0, [r1]
	ldr	r1, [r3]
	ldr	lr, [lr]
	add	r2, r2, #10
	sub	r2, r2, r0
	add	r1, r1, #10
	ldr	r0, .L298+16
	sub	r1, r1, lr
	lsl	r2, r2, #23
	ldr	lr, .L298+20
	lsr	r2, r2, #23
	and	r1, r1, #255
	strh	lr, [r0, #100]	@ movhi
	strh	r2, [r0, #98]	@ movhi
	strh	r1, [r0, #96]	@ movhi
	str	ip, [r3, #28]
	ldr	lr, [sp], #4
	bx	lr
.L299:
	.align	2
.L298:
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
	push	{r4, r5, r6, lr}
	ldr	r4, .L320
	ldr	r3, [r4, #24]
	cmp	r3, #3
	sub	sp, sp, #16
	bne	.L301
	ldr	r3, .L320+4
	ldr	r3, [r3, #56]
	sub	r2, r3, #3
	cmp	r3, #0
	cmpne	r2, #1
	movls	r3, #1
	strls	r3, [r4, #28]
.L301:
	ldr	r3, .L320+8
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L302
	ldr	r3, .L320+12
	ldrh	r3, [r3]
	ands	r5, r3, #1
	beq	.L319
.L302:
	ldr	r3, .L320+16
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L304
.L305:
	mov	r2, #512
	ldr	r3, .L320+20
	strh	r2, [r3, #104]	@ movhi
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L319:
	ldr	r0, .L320+24
	ldr	ip, [r4, #8]
	add	r2, r0, #16
	ldr	r1, [r0]
	ldm	r2, {r2, r3}
	ldr	r0, [r0, #4]
	ldr	r6, [r4, #12]
	ldr	lr, [r4]
	str	ip, [sp, #8]
	ldr	ip, [r4, #4]
	str	r6, [sp, #12]
	stm	sp, {ip, lr}
	ldr	r6, .L320+28
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L302
	ldr	r3, .L320+16
	ldr	r2, [r3]
	cmp	r2, #0
	moveq	r2, #1
	strne	r5, [r3]
	streq	r2, [r3]
	bne	.L305
.L304:
	ldr	r3, [r4, #28]
	cmp	r3, #1
	mov	r0, #140
	moveq	r2, #384
	movne	r2, #388
	ldr	r3, .L320+20
	ldr	r1, .L320+32
	strh	r0, [r3, #104]	@ movhi
	strh	r1, [r3, #106]	@ movhi
	strh	r2, [r3, #108]	@ movhi
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L321:
	.align	2
.L320:
	.word	ghostbook
	.word	ghost
	.word	oldButtons
	.word	buttons
	.word	tempText
	.word	shadowOAM
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
	push	{r4, r5, r6, lr}
	ldr	r4, .L342
	ldr	r3, [r4, #24]
	cmp	r3, #3
	sub	sp, sp, #16
	bne	.L323
	ldr	r3, .L342+4
	ldr	r3, [r3, #56]
	sub	r2, r3, #4
	cmp	r3, #2
	cmpne	r2, #1
	movls	r3, #1
	strls	r3, [r4, #28]
.L323:
	ldr	r3, .L342+8
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L324
	ldr	r3, .L342+12
	ldrh	r3, [r3]
	ands	r5, r3, #1
	beq	.L341
.L324:
	ldr	r3, .L342+16
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L326
.L327:
	mov	r2, #512
	ldr	r3, .L342+20
	strh	r2, [r3, #104]	@ movhi
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L341:
	ldr	r0, .L342+24
	ldr	ip, [r4, #8]
	add	r2, r0, #16
	ldr	r1, [r0]
	ldm	r2, {r2, r3}
	ldr	r0, [r0, #4]
	ldr	r6, [r4, #12]
	ldr	lr, [r4]
	str	ip, [sp, #8]
	ldr	ip, [r4, #4]
	str	r6, [sp, #12]
	stm	sp, {ip, lr}
	ldr	r6, .L342+28
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L324
	ldr	r3, .L342+16
	ldr	r2, [r3]
	cmp	r2, #0
	moveq	r2, #1
	strne	r5, [r3]
	streq	r2, [r3]
	bne	.L327
.L326:
	ldr	r3, [r4, #28]
	cmp	r3, #1
	mov	r0, #140
	moveq	r2, #384
	movne	r2, #388
	ldr	r3, .L342+20
	ldr	r1, .L342+32
	strh	r0, [r3, #104]	@ movhi
	strh	r1, [r3, #106]	@ movhi
	strh	r2, [r3, #108]	@ movhi
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L343:
	.align	2
.L342:
	.word	videocam
	.word	ghost
	.word	oldButtons
	.word	buttons
	.word	tempText
	.word	shadowOAM
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
	push	{r4, r5, r6, lr}
	ldr	r4, .L364
	ldr	r3, [r4, #24]
	cmp	r3, #3
	sub	sp, sp, #16
	bne	.L345
	ldr	r3, .L364+4
	ldr	r3, [r3, #56]
	sub	r2, r3, #3
	cmp	r3, #1
	cmpne	r2, #1
	movls	r3, #1
	strls	r3, [r4, #28]
.L345:
	ldr	r3, .L364+8
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L346
	ldr	r3, .L364+12
	ldrh	r3, [r3]
	ands	r5, r3, #1
	beq	.L363
.L346:
	ldr	r3, .L364+16
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L348
.L349:
	mov	r2, #512
	ldr	r3, .L364+20
	strh	r2, [r3, #104]	@ movhi
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L363:
	ldr	r0, .L364+24
	ldr	ip, [r4, #8]
	add	r2, r0, #16
	ldr	r1, [r0]
	ldm	r2, {r2, r3}
	ldr	r0, [r0, #4]
	ldr	r6, [r4, #12]
	ldr	lr, [r4]
	str	ip, [sp, #8]
	ldr	ip, [r4, #4]
	str	r6, [sp, #12]
	stm	sp, {ip, lr}
	ldr	r6, .L364+28
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L346
	ldr	r3, .L364+16
	ldr	r2, [r3]
	cmp	r2, #0
	moveq	r2, #1
	strne	r5, [r3]
	streq	r2, [r3]
	bne	.L349
.L348:
	ldr	r3, [r4, #28]
	cmp	r3, #1
	mov	r0, #140
	moveq	r2, #384
	movne	r2, #388
	ldr	r3, .L364+20
	ldr	r1, .L364+32
	strh	r0, [r3, #104]	@ movhi
	strh	r1, [r3, #106]	@ movhi
	strh	r2, [r3, #108]	@ movhi
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L365:
	.align	2
.L364:
	.word	spiritbox
	.word	ghost
	.word	oldButtons
	.word	buttons
	.word	tempText
	.word	shadowOAM
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
	ldr	r3, .L372
	ldr	r3, [r3, #24]
	cmp	r3, #0
	blne	updateWeapon.part.0
.L367:
	bl	updateEMFReader
	bl	updateThermometer
	bl	updateUVLight
	bl	updateGhostbook
	bl	updateVideoCam
	bl	updateSpiritBox
	mov	r2, #67108864
	ldr	r3, .L372+4
	ldrh	r1, [r3]
	ldr	r3, .L372+8
	strh	r1, [r2, #16]	@ movhi
	ldrh	r1, [r3]
	ldr	r4, .L372+12
	strh	r1, [r2, #18]	@ movhi
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L372+16
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L373:
	.align	2
.L372:
	.word	weapon
	.word	hOff
	.word	vOff
	.word	DMANow
	.word	shadowOAM
	.size	updateGame, .-updateGame
	.comm	tempText,4,4
	.global	collisionMap
	.comm	camera,24,4
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
