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
	ldr	r3, .L12
	ldrh	r1, [r3, #2]
	tst	r1, #8
	push	{r4, r5, r6, lr}
	strh	r2, [r3, #8]	@ movhi
	ldrne	r2, .L12+4
	ldrne	r3, [r2]
	addne	r3, r3, #1
	strne	r3, [r2]
	ldr	r3, .L12
	ldrh	r3, [r3, #2]
	tst	r3, #16
	beq	.L4
	ldr	r1, .L12+8
	ldr	r3, [r1]
	ldr	r4, .L12+12
	add	r3, r3, #1
	smull	r2, r0, r4, r3
	asr	r2, r3, #31
	rsb	r2, r2, r0, asr #1
	add	r2, r2, r2, lsl #2
	cmp	r3, r2
	str	r3, [r1]
	beq	.L11
.L4:
	mov	r1, #1
	ldr	r3, .L12
	ldrh	r2, [r3, #2]
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L11:
	ldr	r5, .L12+16
	mov	lr, pc
	bx	r5
	ldr	r3, .L12+20
	smull	r2, r3, r0, r3
	sub	r3, r3, r0, asr #31
	ldr	r2, .L12+24
	add	r3, r3, r3, lsl #1
	sub	r3, r0, r3
	str	r3, [r2, #24]
	mov	lr, pc
	bx	r5
	smull	r3, r2, r4, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #1
	add	r3, r3, r3, lsl #2
	ldr	r2, .L12+28
	sub	r0, r0, r3
	str	r0, [r2, #24]
	mov	lr, pc
	bx	r5
	smull	r3, r2, r4, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #1
	add	r3, r3, r3, lsl #2
	ldr	r2, .L12+32
	sub	r0, r0, r3
	str	r0, [r2, #24]
	mov	lr, pc
	bx	r5
	smull	r3, r4, r0, r4
	asr	r3, r0, #31
	rsb	r4, r3, r4, asr #1
	add	r4, r4, r4, lsl #2
	ldr	r3, .L12+36
	sub	r0, r0, r4
	str	r0, [r3, #24]
	b	.L4
.L13:
	.align	2
.L12:
	.word	67109376
	.word	sanityTimer
	.word	seconds
	.word	1717986919
	.word	rand
	.word	1431655766
	.word	thermometer
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
	ldr	r3, .L15
	ldr	r3, [r3, #16]
	ldr	r2, .L15+4
	ldr	r1, .L15+8
	add	r3, r3, #128
	lsl	r3, r3, #1
	strh	r3, [r2, #28]	@ movhi
	strh	r0, [r2, #24]	@ movhi
	strh	r1, [r2, #26]	@ movhi
	bx	lr
.L16:
	.align	2
.L15:
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
	ldr	r2, .L19
	ldr	r3, .L19+4
	ldr	r0, .L19+8
	ldrh	r6, [r2]
	ldrh	r5, [r0]
	ldm	r3, {r1, r2}
	ldr	r4, .L19+12
	ldr	r3, .L19+16
	ldr	r8, .L19+20
	sub	r1, r1, r6
	sub	r2, r2, r5
	and	r2, r2, r4
	and	r1, r1, #255
	strh	r1, [r3, #32]	@ movhi
	strh	r2, [r3, #34]	@ movhi
	ldm	r8, {r1, r2}
	ldr	ip, .L19+24
	sub	r2, r2, r5
	and	r2, r2, r4
	strh	r2, [r3, #42]	@ movhi
	strh	lr, [r3, #68]	@ movhi
	sub	r1, r1, r6
	ldm	ip, {r2, lr}
	and	r1, r1, #255
	ldr	r0, .L19+28
	ldr	r7, .L19+32
	strh	r1, [r3, #40]	@ movhi
	sub	r2, r2, r6
	ldr	r1, .L19+36
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
	ldr	lr, .L19+40
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
.L20:
	.align	2
.L19:
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
	ldr	r3, .L42
	ldrh	r3, [r3]
	tst	r3, #2
	ldr	r4, .L42+4
	sub	sp, sp, #16
	beq	.L22
	ldr	r3, .L42+8
	ldrh	r3, [r3]
	ands	r3, r3, #2
	streq	r3, [r4, #28]
	beq	.L23
.L22:
	ldr	r3, [r4, #28]
	cmp	r3, #199
	ble	.L23
	mov	r2, #0
	mov	r3, #4
	str	r2, [r4, #20]
	str	r3, [r4, #16]
.L31:
	ldr	r3, [r4, #28]
	add	r3, r3, #1
	str	r3, [r4, #28]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L23:
	mov	r1, #1
	ldr	r3, .L42+12
	ldr	r2, [r3, #28]
	cmp	r2, #0
	str	r2, [r4, #16]
	str	r1, [r4, #20]
	bne	.L40
	mov	r0, #16
	mov	r1, #24
	ldm	r3, {r2, ip}
	add	r3, r2, r0
	stm	r4, {r3, ip}
	str	r0, [r4, #8]
	str	r1, [r4, #12]
.L28:
	ldr	r5, .L42+16
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
	ldr	r6, .L42+20
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L31
	mov	r2, #0
	ldr	r3, .L42+24
	str	r2, [r5, #32]
	mov	lr, pc
	bx	r3
	b	.L31
.L40:
	cmp	r2, #1
	beq	.L41
	cmp	r2, #2
	bne	.L30
	mov	r0, #24
	mov	r1, #16
	ldr	r2, [r3, #4]
	ldr	ip, [r3]
	add	r3, r2, #14
	str	r3, [r4, #4]
	str	ip, [r4]
	str	r0, [r4, #8]
	str	r1, [r4, #12]
	b	.L28
.L41:
	mov	r0, #16
	mov	r1, #24
	ldm	r3, {r2, ip}
	sub	r3, r2, #22
	stm	r4, {r3, ip}
	str	r0, [r4, #8]
	str	r1, [r4, #12]
	b	.L28
.L30:
	cmp	r2, #3
	bne	.L28
	mov	r0, #24
	mov	r1, #16
	ldr	r2, [r3, #4]
	ldr	ip, [r3]
	sub	r3, r2, #22
	str	r3, [r4, #4]
	str	ip, [r4]
	str	r0, [r4, #8]
	str	r1, [r4, #12]
	b	.L28
.L43:
	.align	2
.L42:
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
	ldr	r1, .L45
	ldr	r2, .L45+4
	ldr	r3, [r1, #4]
	ldr	r2, [r2]
	sub	r3, r3, r2
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r0, .L45+8
	ldr	r2, [r1]
	ldr	ip, [r0]
	ldr	r1, [r1, #16]
	ldr	r0, .L45+12
	sub	r2, r2, ip
	add	r1, r1, #16
	ldr	ip, .L45+16
	lsl	r1, r1, #2
	and	r2, r2, #255
	strh	r3, [r0, #10]	@ movhi
	strh	r1, [r0, #12]	@ movhi
	strh	r2, [r0, #8]	@ movhi
	strh	ip, [r0, #28]	@ movhi
	bx	lr
.L46:
	.align	2
.L45:
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
	ldr	r3, .L48
	ldr	r0, .L48+4
	strh	r2, [r3, #2]	@ movhi
	strh	ip, [r0]	@ movhi
	strh	r2, [r3]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	strh	r2, [r3, #6]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	strh	r1, [r3, #6]	@ movhi
	bx	lr
.L49:
	.align	2
.L48:
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
	ldr	r3, .L52
	ldr	r0, .L52+4
	strh	r2, [r3, #2]	@ movhi
	strh	ip, [r0]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	ip, .L52+8
	strh	lr, [r0, #8]	@ movhi
	ldr	r0, .L52+12
	strh	r1, [r3, #2]	@ movhi
	ldr	lr, [sp], #4
	str	r0, [ip, #4092]
	strh	r2, [r3, #6]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	strh	r1, [r3, #6]	@ movhi
	bx	lr
.L53:
	.align	2
.L52:
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
	ldr	r3, .L56
	ldr	r0, .L56+4
	ldr	r1, [r3]
	ldr	r0, [r0]
	ldr	r3, .L56+8
	add	r7, r1, #112
	add	ip, r1, #113
	ldr	r1, .L56+12
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
.L57:
	.align	2
.L56:
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
	push	{r4, r5, r6, r7, lr}
	mov	r2, #8
	mov	r4, #18
	mov	r3, #0
	mov	r7, #16
	ldr	r1, .L60
	ldr	r0, .L60+4
	ldr	ip, [r1, #4]
	ldr	lr, [r1]
	ldr	r1, .L60+8
	add	r6, ip, r2
	str	r4, [r0, #28]
	add	r5, ip, #24
	add	r4, ip, #40
	ldr	ip, .L60+12
	str	r6, [r0, #4]
	str	lr, [r0]
	str	r5, [r1, #4]
	str	lr, [r1]
	ldr	r5, .L60+16
	str	r2, [r0, #8]
	str	r2, [r0, #12]
	str	r2, [r1, #8]
	str	r2, [r1, #12]
	str	r3, [r0, #16]
	str	r3, [r0, #20]
	str	r3, [r0, #24]
	str	r3, [r1, #16]
	ldr	r0, .L60+20
	str	r3, [r1, #20]
	str	r3, [r1, #24]
	str	r3, [r1, #28]
	ldr	r1, .L60+24
	str	lr, [ip]
	add	lr, lr, r7
	str	r4, [ip, #4]
	str	r3, [r5]
	str	r3, [r5, #4]
	str	r3, [r5, #16]
	str	r3, [r5, #20]
	str	r7, [r5, #8]
	str	r2, [ip, #8]
	str	r2, [ip, #12]
	str	r3, [ip, #16]
	str	r3, [ip, #20]
	str	r3, [ip, #24]
	str	r3, [ip, #28]
	str	r7, [r5, #12]
	str	lr, [r0]
	str	r6, [r0, #4]
	str	lr, [r1]
	str	r4, [r1, #4]
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
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L61:
	.align	2
.L60:
	.word	ghostspot
	.word	thermometer
	.word	ghostbook
	.word	videocam
	.word	EMFReader
	.word	spiritbox
	.word	uvlight
	.size	initEquipment, .-initEquipment
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
	mov	r5, #1
	mov	r0, #24
	mov	r2, #194
	ldr	r3, .L64
	ldr	r1, .L64+4
	str	r4, [r3]
	str	r4, [r1]
	ldr	r3, .L64+8
	ldr	r1, .L64+12
	str	r4, [r3]
	str	r4, [r1]
	ldr	r3, .L64+16
	ldr	r1, .L64+20
	str	r4, [r3]
	str	r4, [r1]
	ldr	r3, .L64+24
	ldr	r1, .L64+28
	strh	r4, [r3, #2]	@ movhi
	strh	r0, [r1]	@ movhi
	strh	r4, [r3]	@ movhi
	ldr	r0, .L64+32
	strh	r5, [r1, #8]	@ movhi
	ldr	r1, .L64+36
	strh	r2, [r3, #2]	@ movhi
	str	r1, [r0, #4092]
	strh	r4, [r3, #6]	@ movhi
	strh	r4, [r3, #4]	@ movhi
	strh	r2, [r3, #6]	@ movhi
	bl	initPlayer
	mov	r0, #16
	mov	r1, #64
	mov	ip, #140
	ldr	r3, .L64+40
	ldr	r2, .L64+44
	stmib	r3, {r4, r5}
	str	r4, [r3]
	str	r5, [r3, #12]
	str	r4, [r3, #24]
	str	r4, [r3, #36]
	str	r4, [r3, #40]
	str	r4, [r3, #28]
	str	r4, [r3, #32]
	str	r4, [r3, #44]
	str	r4, [r3, #52]
	str	r5, [r3, #48]
	str	r5, [r3, #56]
	str	r4, [r2, #4]
	pop	{r4, r5, r6, lr}
	str	ip, [r2]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r1, [r2, #8]
	str	r1, [r2, #12]
	b	initEquipment
.L65:
	.align	2
.L64:
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
	.word	ghost
	.word	ghostspot
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
	ldr	r3, .L67
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #24]
	str	r2, [r3, #36]
	str	r2, [r3, #40]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	str	r2, [r3, #44]
	str	r2, [r3, #52]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r1, [r3, #48]
	str	r1, [r3, #56]
	bx	lr
.L68:
	.align	2
.L67:
	.word	ghost
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
	mov	r2, #64
	mov	r0, #0
	mov	r1, #140
	ldr	r3, .L70
	str	r0, [r3, #4]
	str	r1, [r3]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	bx	lr
.L71:
	.align	2
.L70:
	.word	ghostspot
	.size	initghostSpot, .-initghostSpot
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
	ldr	r5, .L130
	ldr	r3, .L130+4
	ldr	r2, [r5]
	smull	r0, r1, r3, r2
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #4
	ldr	r4, .L130+8
	add	r3, r3, r3, lsl #2
	ldr	r1, [r4, #40]
	add	r3, r3, r3, lsl #2
	sub	r3, r2, r3, lsl #1
	orrs	r3, r3, r1
	bne	.L74
	ldr	r3, .L130+12
	ldrh	r3, [r3, #48]
	tst	r3, #64
	bne	.L75
	ldr	r3, [r4]
	cmp	r3, #1
	ble	.L75
	ldr	r0, .L130+16
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
	bne	.L125
.L74:
	ldr	r7, .L130+20
	ldr	r3, [r7, #44]
	cmp	r3, #0
	beq	.L126
.L79:
	ldr	r3, .L130+24
	ldrh	r3, [r3]
	tst	r3, #1
	and	r3, r3, #2
	beq	.L84
	ldr	r2, .L130+28
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L84
.L92:
	ldr	r2, [r4, #44]
	add	r2, r2, #1
	cmp	r2, #2
	str	r2, [r4, #44]
	movgt	r2, #0
	strgt	r2, [r4, #44]
	bgt	.L86
	cmp	r2, #1
	beq	.L127
	cmp	r2, #2
	bne	.L88
	mov	ip, #0
	mov	r0, #1
	mov	r1, #512
	ldr	r2, .L130+32
	str	ip, [r2, #20]
	ldr	r2, .L130+36
	str	r0, [r2, #24]
	ldr	r2, .L130+40
	strh	r1, [r2, #24]	@ movhi
.L84:
	cmp	r3, #0
	beq	.L90
	ldr	r2, .L130+28
.L89:
	ldrh	r3, [r2]
	tst	r3, #2
	bne	.L90
.L94:
	ldr	r3, .L130+32
	ldr	r3, [r3, #16]
	cmp	r3, #2
	ble	.L90
	ldr	r2, .L130+44
	ldr	r1, [r7, #32]
	ldr	r3, [r2, #16]
	orrs	r3, r1, r3
	bne	.L90
	mov	r1, #1
	ldm	r4, {r0, r3}
	ldr	ip, .L130+48
	ldr	r4, .L130+52
	sub	r6, r0, #8
	str	r6, [ip]
	str	r6, [r2]
	str	r6, [r4]
	add	r6, r3, #6
	str	r6, [ip, #4]
	ldr	lr, .L130+56
	str	r1, [ip, #16]
	ldr	ip, .L130+60
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
.L90:
	ldr	r3, [r5]
	add	r3, r3, #1
	str	r3, [r5]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L126:
	ldr	r9, .L130+64
	ldr	r8, .L130+68
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
	beq	.L79
	ldr	r3, .L130+24
	ldrh	r2, [r3]
	ands	r3, r2, #2
	and	r1, r2, #1
	beq	.L80
	ldr	r2, .L130+28
	ldrh	r0, [r2]
	ands	ip, r0, #2
	beq	.L128
	cmp	r1, #0
	beq	.L90
.L93:
	tst	r0, #1
	beq	.L92
	b	.L89
.L75:
	ldr	r3, .L130+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #128
	bne	.L77
	ldr	r2, [r4]
	ldr	r1, [r4, #20]
	add	r1, r2, r1
	cmp	r1, #255
	ble	.L129
.L77:
	ldr	r3, .L130+12
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L78
	ldr	r3, [r4, #4]
	cmp	r3, #0
	ble	.L78
	ldr	r0, .L130+72
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
	beq	.L74
.L125:
	sub	r1, r1, #1
	str	r1, [r0]
	b	.L74
.L88:
	cmp	r2, #0
	bne	.L84
.L86:
	mov	r2, #0
	mov	r1, #512
	ldr	r0, .L130+32
	str	r2, [r0, #20]
	ldr	r0, .L130+36
	str	r2, [r0, #24]
	ldr	r2, .L130+40
	strh	r1, [r2, #24]	@ movhi
	b	.L84
.L78:
	ldr	r3, .L130+12
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L74
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #16]
	add	r2, r3, r2
	cmp	r2, #512
	bge	.L74
	ldr	r0, .L130+72
	ldr	r2, [r4, #12]
	ldr	r1, [r0]
	add	r3, r3, r2
	sub	r2, r3, r1
	ldr	ip, .L130+76
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
	b	.L74
.L127:
	mov	ip, #0
	ldr	r0, .L130+36
	ldr	r1, .L130+32
	str	ip, [r0, #24]
	str	r2, [r1, #20]
	b	.L84
.L80:
	cmp	r1, #0
	beq	.L90
	ldr	r2, .L130+28
	ldrh	r3, [r2]
	ands	r3, r3, #1
	beq	.L92
	b	.L90
.L129:
	ldr	ip, .L130+16
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
	b	.L74
.L128:
	ldr	lr, [r4, #40]
	cmp	lr, #0
	moveq	ip, #1
	cmp	r1, #0
	str	ip, [r4, #40]
	beq	.L94
	b	.L93
.L131:
	.align	2
.L130:
	.word	buttonTimer
	.word	1374389535
	.word	player
	.word	67109120
	.word	vOff
	.word	ghost
	.word	oldButtons
	.word	buttons
	.word	EMFReader
	.word	weapon
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
	ldr	r1, .L135
	ldr	r0, .L135+4
	ldr	ip, [r0]
	ldr	r0, [r1, #40]
	cmp	r0, #0
	movne	r0, #9
	ldr	r2, .L135+8
	ldr	r3, [r1, #4]
	ldr	r2, [r2]
	sub	r3, r3, r2
	ldr	r2, [r1]
	ldreq	r0, [r1, #28]
	lsl	r3, r3, #23
	ldrne	r1, .L135+12
	ldreq	r1, .L135+12
	lsr	r3, r3, #23
	sub	r2, r2, ip
	orr	r3, r3, #16384
	and	r2, r2, #255
	lsleq	r0, r0, #1
	strh	r0, [r1, #4]	@ movhi
	strh	r2, [r1]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	bx	lr
.L136:
	.align	2
.L135:
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
	ldr	r3, .L151
	ldr	r2, [r3, #32]
	cmp	r2, #0
	beq	.L138
	ldr	r3, [r3, #56]
	sub	r2, r3, #1
	cmp	r3, #5
	cmpne	r2, #1
	bhi	.L147
	mov	r2, #4
	ldr	r3, .L151+4
	str	r2, [r3, #16]
	bx	lr
.L147:
	mov	r2, #3
	ldr	r3, .L151+4
	str	r2, [r3, #16]
	bx	lr
.L138:
	push	{r4, r5, r6, lr}
	ldr	r5, .L151+8
	ldm	r5, {r2, r3}
	ldr	r0, [r5, #12]
	ldr	r1, [r5, #8]
	sub	sp, sp, #16
	ldr	r4, .L151+12
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	ldr	r6, .L151+16
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L150
	mov	r2, #3
	ldr	r3, .L151+4
	str	r2, [r3, #16]
.L137:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L150:
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
	ldrne	r3, .L151+4
	strne	r2, [r3, #16]
	bne	.L137
.L141:
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
	ldrne	r3, .L151+4
	ldreq	r3, .L151+4
	strne	r2, [r3, #16]
	streq	r0, [r3, #16]
	b	.L137
.L152:
	.align	2
.L151:
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
	ldr	r3, .L155
	ldr	r3, [r3, #20]
	cmp	r3, #0
	bxeq	lr
	b	drawEMFReader.part.0
.L156:
	.align	2
.L155:
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
	ldr	r3, .L159
	ldr	r3, [r3, #16]
	cmp	r3, #0
	bxeq	lr
	b	drawEquipment.part.0
.L160:
	.align	2
.L159:
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
	ldr	r3, .L163
	ldr	r3, [r3, #24]
	cmp	r3, #0
	bxeq	lr
	b	updateWeapon.part.0
.L164:
	.align	2
.L163:
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
	ldr	r3, .L167
	ldr	r3, [r3, #24]
	cmp	r3, #0
	bxeq	lr
	b	drawWeapon.part.0
.L168:
	.align	2
.L167:
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
	ldr	r2, .L173
	ldr	r3, [r2, #32]
	cmp	r3, #0
	bne	.L172
	mov	r0, #201
	ldr	r1, .L173+4
	ldr	r3, [r2, #4]
	ldr	ip, [r1]
	ldr	r1, .L173+8
	sub	r3, r3, ip
	ldr	r2, [r2]
	ldr	ip, [r1]
	lsl	r3, r3, #23
	ldr	r1, .L173+12
	lsr	r3, r3, #23
	sub	r2, r2, ip
	orr	r3, r3, #16384
	and	r2, r2, #255
	strh	r3, [r1, #18]	@ movhi
	strh	r2, [r1, #16]	@ movhi
	strh	r0, [r1, #20]	@ movhi
	bx	lr
.L172:
	ldr	r3, .L173+16
	ldr	r1, .L173+20
	ldr	r0, .L173+24
	ldr	r3, [r3]
	mla	r3, r0, r3, r1
	ldr	r1, .L173+28
	cmp	r1, r3, ror #2
	bxcc	lr
	ldr	r1, .L173+4
	ldr	r3, [r2, #4]
	ldr	r0, [r1]
	ldr	r1, .L173+8
	sub	r3, r3, r0
	ldr	ip, [r1]
	ldr	r1, [r2]
	ldr	r2, [r2, #28]
	lsl	r3, r3, #23
	ldr	r0, .L173+12
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
.L174:
	.align	2
.L173:
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
	ldr	r3, .L187
	ldr	lr, .L187+4
	ldr	ip, [r3]
	ldr	r1, [lr]
	cmp	ip, r1
	sub	sp, sp, #16
	ble	.L176
	ldr	r2, [r3, #8]
	ldr	r0, [lr, #4]
	sub	ip, ip, r2
	ldr	r2, [r3, #4]
	cmp	r2, r0
	str	ip, [r3]
	ble	.L178
.L186:
	ldr	r4, [r3, #12]
	sub	r2, r2, r4
	str	r2, [r3, #4]
.L179:
	add	r3, r3, #16
	ldm	r3, {r3, r4}
	stm	sp, {r2, ip}
	str	r4, [sp, #12]
	str	r3, [sp, #8]
	add	r2, lr, #16
	ldm	r2, {r2, r3}
	ldr	r4, .L187+8
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	bne	.L185
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L176:
	ldrlt	r2, [r3, #8]
	ldr	r0, [lr, #4]
	addlt	ip, ip, r2
	ldr	r2, [r3, #4]
	strlt	ip, [r3]
	cmp	r2, r0
	bgt	.L186
.L178:
	ldrlt	r4, [r3, #12]
	addlt	r2, r2, r4
	strlt	r2, [r3, #4]
	b	.L179
.L185:
	ldr	r3, .L187+12
	mov	lr, pc
	bx	r3
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L188:
	.align	2
.L187:
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
	ldr	r4, .L211
	ldr	r3, [r4, #32]
	cmp	r3, #0
	sub	sp, sp, #20
	beq	.L207
	ldr	r3, .L211+4
	ldr	r2, .L211+8
	ldr	r1, .L211+12
	ldr	r3, [r3]
	mla	r3, r1, r3, r2
	ldr	r2, .L211+16
	cmp	r2, r3, ror #2
	bcc	.L189
	ldr	r3, [r4, #44]
	cmp	r3, #0
	bne	.L195
.L194:
	ldr	r3, [r4, #4]
	cmp	r3, #200
	bgt	.L196
	ldr	r2, [r4, #52]
	cmp	r2, #0
	beq	.L208
.L196:
	ldr	r2, [r4]
	cmp	r2, #120
	bgt	.L199
	ldr	r1, [r4, #52]
	cmp	r1, #1
	beq	.L209
.L199:
	cmp	r3, #29
	ble	.L201
	ldr	r1, [r4, #52]
	cmp	r1, #2
	beq	.L210
.L201:
	cmp	r2, #19
	ble	.L198
	ldr	r3, [r4, #52]
	cmp	r3, #3
	bne	.L198
	ldr	r3, [r4, #8]
	sub	r2, r2, r3
	cmp	r2, #20
	moveq	r3, #0
	str	r2, [r4]
	streq	r3, [r4, #32]
	streq	r3, [r4, #52]
.L198:
	ldr	r0, .L211+20
	ldr	r3, [r0, #40]
	cmp	r3, #0
	bne	.L189
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
	ldr	r5, .L211+24
	add	r2, r2, r2, lsl #1
	sub	r1, r1, #16
	sub	r0, r0, #16
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	movne	r3, #1
	strne	r3, [r4, #44]
.L189:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L207:
	ldr	r3, .L211+28
	ldrh	r3, [r3]
	tst	r3, #256
	beq	.L189
	ldr	r3, .L211+32
	ldrh	r3, [r3]
	ands	r3, r3, #256
	bne	.L189
	mov	r1, #1
	ldr	r2, .L211+4
	ldr	r0, .L211+8
	ldr	ip, .L211+12
	ldr	r2, [r2]
	mla	r2, ip, r2, r0
	ldr	r0, .L211+16
	cmp	r0, r2, ror #2
	str	r3, [r4, #4]
	str	r3, [r4]
	str	r3, [r4, #52]
	str	r3, [r4, #44]
	str	r1, [r4, #32]
	bcs	.L194
	b	.L189
.L195:
	bl	chase
	b	.L198
.L208:
	ldr	r2, [r4, #12]
	add	r3, r3, r2
	cmp	r3, #200
	str	r3, [r4, #4]
	moveq	r3, #1
	streq	r3, [r4, #52]
	b	.L198
.L209:
	ldr	r3, [r4, #8]
	add	r2, r2, r3
	cmp	r2, #120
	moveq	r3, #2
	str	r2, [r4]
	streq	r3, [r4, #52]
	b	.L198
.L210:
	ldr	r2, [r4, #12]
	sub	r3, r3, r2
	cmp	r3, #30
	str	r3, [r4, #4]
	moveq	r3, #3
	streq	r3, [r4, #52]
	b	.L198
.L212:
	.align	2
.L211:
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
	ldr	r2, .L230
	ldr	ip, [r2]
	cmp	ip, #9
	push	{r4, r5, lr}
	ldr	r1, .L230+4
	ble	.L228
	ldr	r3, [r1]
	cmp	r3, #2
	bgt	.L215
	mov	r0, #0
	ldr	r3, .L230+8
	ldr	r4, [r3, #32]
	cmp	r4, #0
	str	r0, [r3, #4]
	str	r0, [r3]
	str	r0, [r3, #52]
	str	r0, [r3, #44]
	beq	.L229
.L216:
	mov	r3, #0
	ldr	r0, .L230+12
	pop	{r4, r5, lr}
	strh	r3, [r0, #2]	@ movhi
	str	r3, [r1]
	str	r3, [r2]
	bx	lr
.L215:
	cmp	r3, #3
	bne	.L226
.L228:
	ldr	r3, .L230+8
	ldr	r4, [r3, #32]
	cmp	r4, #0
	bne	.L216
.L229:
	ldr	r0, [r1]
	ldr	r3, .L230+16
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
	ldr	r3, .L230+12
	strne	r4, [r1]
	strh	r2, [r3, #2]	@ movhi
	pop	{r4, r5, lr}
	bx	lr
.L226:
	mov	r0, #1
	ldr	r3, .L230+8
	str	r0, [r3, #32]
	b	.L216
.L231:
	.align	2
.L230:
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
	ldr	r2, .L234
	ldr	r3, .L234+4
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
	ldr	r2, .L234+8
	add	r3, r3, r3, lsl #2
	sub	r3, r1, r3, lsl #2
	smull	r6, r1, r2, r3
	asr	r2, r3, #31
	rsb	r2, r2, r1, asr #2
	ldr	r1, .L234+12
	ldr	r6, .L234+16
	str	r2, [r1]
	add	r1, r2, r2, lsl #2
	sub	r3, r3, r1, lsl #1
	add	r1, r2, #352
	ldr	r2, .L234+20
	str	r3, [r6]
	add	r3, r3, #352
	strh	r3, [r2, #76]	@ movhi
	ldr	r3, .L234+24
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
.L235:
	.align	2
.L234:
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
	ldr	r3, .L250
	ldr	r3, [r3, #24]
	cmp	r3, #0
	blne	drawWeapon.part.0
.L237:
	bl	drawGhost
	ldr	r3, .L250+4
	ldr	r3, [r3, #20]
	cmp	r3, #0
	blne	drawEMFReader.part.0
.L238:
	ldr	r3, .L250+8
	ldr	r3, [r3, #16]
	cmp	r3, #0
	blne	drawEquipment.part.0
.L239:
	pop	{r4, lr}
	b	drawSanity
.L251:
	.align	2
.L250:
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
	ldr	r3, .L265
	ldr	r2, [r3, #24]
	cmp	r2, #3
	beq	.L264
.L253:
	ldr	r0, .L265+4
	ldr	r2, [r0, #44]
	cmp	r2, #0
	bxne	lr
	ldr	r2, .L265+8
	ldrh	r2, [r2]
	tst	r2, #2
	bxeq	lr
	ldr	r2, .L265+12
	ldrh	r2, [r2]
	tst	r2, #2
	bxne	lr
	push	{r4, lr}
	add	r1, r3, #8
	ldm	r1, {r1, ip}
	ldm	r3, {r2, r3}
	sub	sp, sp, #16
	str	r2, [sp, #4]
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r0, #16
	ldr	r1, [r0]
	ldm	r2, {r2, r3}
	ldr	r4, .L265+16
	ldr	r0, [r0, #4]
	mov	lr, pc
	bx	r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L264:
	ldr	r2, [r3, #28]
	cmp	r2, #0
	ble	.L253
	ldr	r1, .L265+20
	ldr	r1, [r1, #56]
	bic	r0, r1, #2
	cmp	r0, #0
	cmpne	r1, #5
	subeq	r2, r2, #3
	streq	r2, [r3, #28]
	beq	.L253
.L254:
	cmp	r2, #5
	subgt	r2, r2, #3
	strgt	r2, [r3, #28]
	b	.L253
.L266:
	.align	2
.L265:
	.word	thermometer
	.word	player
	.word	oldButtons
	.word	buttons
	.word	collision
	.word	ghost
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
	ldr	r3, .L279
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bxeq	lr
	ldr	r2, .L279+4
	ldr	r2, [r2, #56]
	cmp	r2, #3
	cmpne	r2, #1
	bxhi	lr
	mov	ip, #1
	ldr	r1, .L279+8
	str	lr, [sp, #-4]!
	ldr	r2, [r3, #4]
	ldr	lr, .L279+12
	ldr	r0, [r1]
	ldr	r1, [r3]
	ldr	lr, [lr]
	add	r2, r2, #10
	sub	r2, r2, r0
	add	r1, r1, #10
	ldr	r0, .L279+16
	sub	r1, r1, lr
	lsl	r2, r2, #23
	ldr	lr, .L279+20
	lsr	r2, r2, #23
	and	r1, r1, #255
	strh	lr, [r0, #100]	@ movhi
	strh	r2, [r0, #98]	@ movhi
	strh	r1, [r0, #96]	@ movhi
	str	ip, [r3, #28]
	ldr	lr, [sp], #4
	bx	lr
.L280:
	.align	2
.L279:
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
	ldr	r3, .L294
	ldr	r2, [r3, #24]
	cmp	r2, #3
	bne	.L282
	ldr	r2, .L294+4
	ldr	r2, [r2, #56]
	sub	r1, r2, #3
	cmp	r2, #0
	cmpne	r1, #1
	movls	r2, #1
	strls	r2, [r3, #28]
.L282:
	ldr	r0, .L294+8
	ldr	r2, [r0, #44]
	cmp	r2, #0
	bxne	lr
	ldr	r2, .L294+12
	ldrh	r2, [r2]
	tst	r2, #2
	bxeq	lr
	ldr	r2, .L294+16
	ldrh	r2, [r2]
	tst	r2, #2
	bxne	lr
	push	{r4, lr}
	add	r1, r3, #8
	ldm	r1, {r1, ip}
	ldm	r3, {r2, r3}
	sub	sp, sp, #16
	str	r2, [sp, #4]
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r0, #16
	ldr	r1, [r0]
	ldm	r2, {r2, r3}
	ldr	r4, .L294+20
	ldr	r0, [r0, #4]
	mov	lr, pc
	bx	r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L295:
	.align	2
.L294:
	.word	ghostbook
	.word	ghost
	.word	player
	.word	oldButtons
	.word	buttons
	.word	collision
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
	ldr	r3, .L309
	ldr	r2, [r3, #24]
	cmp	r2, #3
	bne	.L297
	ldr	r2, .L309+4
	ldr	r2, [r2, #56]
	sub	r1, r2, #4
	cmp	r2, #2
	cmpne	r1, #1
	movls	r2, #1
	strls	r2, [r3, #28]
.L297:
	ldr	r0, .L309+8
	ldr	r2, [r0, #44]
	cmp	r2, #0
	bxne	lr
	ldr	r2, .L309+12
	ldrh	r2, [r2]
	tst	r2, #2
	bxeq	lr
	ldr	r2, .L309+16
	ldrh	r2, [r2]
	tst	r2, #2
	bxne	lr
	push	{r4, lr}
	add	r1, r3, #8
	ldm	r1, {r1, ip}
	ldm	r3, {r2, r3}
	sub	sp, sp, #16
	str	r2, [sp, #4]
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r0, #16
	ldr	r1, [r0]
	ldm	r2, {r2, r3}
	ldr	r4, .L309+20
	ldr	r0, [r0, #4]
	mov	lr, pc
	bx	r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L310:
	.align	2
.L309:
	.word	videocam
	.word	ghost
	.word	player
	.word	oldButtons
	.word	buttons
	.word	collision
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
	ldr	r3, .L324
	ldr	r2, [r3, #24]
	cmp	r2, #3
	bne	.L312
	ldr	r2, .L324+4
	ldr	r2, [r2, #56]
	sub	r1, r2, #3
	cmp	r2, #1
	cmpne	r1, #1
	movls	r2, #1
	strls	r2, [r3, #28]
.L312:
	ldr	r0, .L324+8
	ldr	r2, [r0, #44]
	cmp	r2, #0
	bxne	lr
	ldr	r2, .L324+12
	ldrh	r2, [r2]
	tst	r2, #2
	bxeq	lr
	ldr	r2, .L324+16
	ldrh	r2, [r2]
	tst	r2, #2
	bxne	lr
	push	{r4, lr}
	add	r1, r3, #8
	ldm	r1, {r1, ip}
	ldm	r3, {r2, r3}
	sub	sp, sp, #16
	str	r2, [sp, #4]
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r0, #16
	ldr	r1, [r0]
	ldm	r2, {r2, r3}
	ldr	r4, .L324+20
	ldr	r0, [r0, #4]
	mov	lr, pc
	bx	r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L325:
	.align	2
.L324:
	.word	spiritbox
	.word	ghost
	.word	player
	.word	oldButtons
	.word	buttons
	.word	collision
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
	ldr	r3, .L332
	ldr	r3, [r3, #24]
	cmp	r3, #0
	blne	updateWeapon.part.0
.L327:
	bl	updateEMFReader
	bl	updateThermometer
	bl	updateUVLight
	bl	updateGhostbook
	bl	updateVideoCam
	bl	updateSpiritBox
	mov	r2, #67108864
	ldr	r3, .L332+4
	ldrh	r1, [r3]
	ldr	r3, .L332+8
	strh	r1, [r2, #16]	@ movhi
	ldrh	r1, [r3]
	ldr	r4, .L332+12
	strh	r1, [r2, #18]	@ movhi
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L332+16
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L333:
	.align	2
.L332:
	.word	weapon
	.word	hOff
	.word	vOff
	.word	DMANow
	.word	shadowOAM
	.size	updateGame, .-updateGame
	.global	collisionMap
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
