#include "game.h"
#include "gba.h"
#include "print.h"
#include "collisionmap.h"
#include "sound.h"
#include "gamemusic.h"
#include "ghostmusic.h"
#include "gunsound.h"
#include "camerasound.h"
#include "staticsound.h"
#include "spiritboxsound.h"
#include "manual.h"
#include <stdlib.h>


OBJ_ATTR shadowOAM[128];
OCCURRENCE occurrences[OCCURRENCECOUNT];
OCCURRENCE items[ITEMCOUNT];
PLAYER player;
WEAPON weapon;
ENEMY ghost;
EMF EMFReader;
THERMOMETER thermometer;
EQUIPMENT ghostbook;
EQUIPMENT videocam;
EQUIPMENT spiritbox;
EQUIPMENT uvlight;
GHOSTSPOT ghostspot;
CAMERA camera;

unsigned char* collisionMap = (unsigned char*) collisionmapBitmap; 

// Initialize Game
void initGame() {
    cursor.type = DEMON;
    ghostBanished = 0;
    seconds = 0;
    sanity = 0;
    sanityTimer = 0;
    hOff = 0;
    vOff = 0;
    score = 0;
    occurrencesCaught = 0;
    itemsCollected = 0;
    screenBlock = 26;
    setupInterrupts();
    initPlayer();
    initGhost();
    initghostSpot();
    initEquipment();
    initOccurrences();
    initItems();
    playSoundA(((signed char*) gamemusic_data), gamemusic_length, 1);
}

// Update Game
void updateGame() {
    updatePlayer();
    updateSanity();
    updateGhost();
    updateWeapon();
    updateEMFReader();
    updateThermometer();
    updateUVLight();
    updateGhostbook();
    updateVideoCam();
    updateSpiritBox();
    updateCamera();
    updateItems();
    hideText();
    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;
    DMANow(3, shadowOAM, OAM, sizeof(shadowOAM)/2);
}

// Draw Game to Screen
void drawGame() {
    drawPlayer();
    drawWeapon();
    drawGhost();
    drawEMFReader();
    drawCamera();
    drawEquipment();
    drawSanity();
    drawOccurrences(); 
    drawItems();
    waitForVBlank();
}

// Interrupt Functions
void interruptHandler() {
    REG_IME = 0; 
    if (REG_IF & INT_TM2) {
        seconds++;
        // Increment Sanity when Ghost is not Active
        if (!ghost.active) {
            sanityTimer++;
        }
        // Chance to change equipment status every few seconds
        if (thermometer.active && seconds % 3 == 0) {
            thermometer.randvar = rand() % 2;
        }
        if (thermometer.active && seconds % 10 == 0) {
            ghostbook.randvar = rand() % 3;
            videocam.randvar = rand() % 3;
            spiritbox.randvar = rand() % 3;
        }
    }
    // Sound interrupts
    if (REG_IF & INT_VBLANK) {
        if (soundA.isPlaying) {
            soundA.vBlankCount = soundA.vBlankCount + 1;
            if (soundA.vBlankCount > soundA.duration) {
                if (soundA.loops) {
                    playSoundA(soundA.data, soundA.length, soundA.loops);
                } else {
                    soundA.isPlaying = 0;
                    dma[1].cnt = 0;
                    REG_TM0CNT = TIMER_OFF;
                }
            }
        }

        if (soundB.isPlaying) {
            soundB.vBlankCount = soundB.vBlankCount + 1;
            if (soundB.vBlankCount > soundB.duration) {
                if (soundB.loops) {
                    playSoundB(soundB.data, soundB.length, soundB.loops);
                } else {
                    soundB.isPlaying = 0;
                    dma[2].cnt = 0;
                    REG_TM1CNT = TIMER_OFF;
                }
            }
        }

        REG_IF = INT_VBLANK;
    }

    REG_IF = REG_IF;  
    REG_IME = 1;      
}
void enableTimerInterrupts() {
  REG_IE |= INT_VBLANK | INT_TM2; 
  REG_DISPSTAT |= INT_VBLANK_ENABLE;

  REG_TM2CNT = 0;
  REG_TM2D = 0;
  REG_TM2CNT =  TM_FREQ_256 | TIMER_ON | TM_IRQ;
}

void setupInterrupts() {
    REG_IME = 0;
    REG_INTERRUPT = interruptHandler; 
    enableTimerInterrupts();
    REG_IME = 1;
}

// Initialize Functions
void initPlayer() {
    player.width = 16;
    player.height = 16;
    player.cdel = 1;
    player.rdel = 1;
    player.col = SCREENWIDTH/2 - player.width/2 + hOff;
    player.row = SCREENHEIGHT/2 - player.height/2 + vOff;
    player.aniCounter = 0;
    player.curFrame = 0;
    player.numFrames = 3;
    player.aniState = SPRITEFRONT;
    player.idle = 1;
    player.hidden = 0;
    player.equipped = 0;

    weapon.col = player.col + 1;
    weapon.row = player.row;
    weapon.width = 16;
    weapon.height = 8;
    weapon.active = 0;
    weapon.state = SPRITEFRONT;
    weapon.timer = 0;
    weapon.equipped = 0;
}

void initEquipment() {
    camera.row = player.row;
    camera.col = player.col;
    camera.height = player.height + 8;
    camera.width = player.width + 16;
    camera.active = 0;
    camera.timer = 0;
    camera.state = player.aniState;
    camera.equipped = 0;

    EMFReader.row = 0;
    EMFReader.col = 0;
    EMFReader.width = 16;
    EMFReader.height = 16;
    EMFReader.state = 0;
    EMFReader.equipped = 1;

    thermometer.row = ghostspot.row;
    thermometer.col = ghostspot.col + 8;
    thermometer.width = 8;
    thermometer.height = 8;
    thermometer.active = 0;
    thermometer.state = 0;
    thermometer.randvar = 0;
    thermometer.temperature = rand() % 5 + 13;
    thermometer.checking = 0;

    ghostbook.row = thermometer.row;
    ghostbook.col = thermometer.col + 16;
    ghostbook.width = 8;
    ghostbook.height = 8;
    ghostbook.active = 0;
    ghostbook.state = 0;
    ghostbook.randvar = 0;
    ghostbook.clue = 0;
    ghostbook.checking = 0;

    videocam.row = ghostbook.row;
    videocam.col = ghostbook.col + 16;
    videocam.width = 8;
    videocam.height = 8;
    videocam.active = 0;
    videocam.state = 0;
    videocam.randvar = 0;
    videocam.clue = 0;
    videocam.checking = 0;

    spiritbox.row = thermometer.row + 16;
    spiritbox.col = thermometer.col;
    spiritbox.width = 8;
    spiritbox.height = 8;
    spiritbox.active = 0;
    spiritbox.state = 0;
    spiritbox.randvar = 0;
    spiritbox.clue = 0;
    spiritbox.checking = 0;

    uvlight.row = videocam.row + 16;
    uvlight.col = videocam.col;
    uvlight.width = 8;
    uvlight.height = 8;
    uvlight.active = 0;
    uvlight.state = 0;
    uvlight.randvar = 0;
    uvlight.clue = 0;
    uvlight.checking = 0;
}

void initGhost() {
    ghost.row = 0;
    ghost.col = 0;
    ghost.width = 16;
    ghost.height = 16;
    ghost.rdel = 1;
    ghost.cdel = 1;
    ghost.aniCounter = 0;
    ghost.curFrame = 0;
    ghost.numFrames = 3;
    ghost.aniState = SPRITEFRONT;
    ghost.active = 0;
    ghost.alert = 0;
    ghost.type =  rand() % 6; // Assign random type to ghost at start of game
    ghost.caught = 0;
    ghost.colPrev = ghost.col;
    ghost.rowPrev = ghost.row;
    ghost.distance = 0;
}

void initghostSpot() {
    // Assign random ghost spot at start of game
    ghostspot.location = rand() % 5;
    if (ghostspot.location == 0) {
        ghostspot.col = 32;
        ghostspot.row = 80;
    } else if (ghostspot.location == 1) {
        ghostspot.col = 160;
        ghostspot.row = 304;
    } else if (ghostspot.location == 2) {
        ghostspot.col = 288;
        ghostspot.row = 256;
    } else if (ghostspot.location == 3) {
        ghostspot.col = 32;
        ghostspot.row = 448;
    } else {
        ghostspot.col = 336;
        ghostspot.row = 464;
    }
    
    ghostspot.width = 48;
    ghostspot.height = 48;
}

// Initialize Items
void initItems() {
    for (int i = 0; i < ITEMCOUNT; i++) {
        items[i].width = 8;
        items[i].height = 8;
        items[i].caught = 0;
    }
    if (!cheat) {
        items[0].col = 80;
        items[0].row = 120;
        items[1].col = 224;
        items[1].row = 320;
        items[2].col = 272;
        items[2].row = 448;
        items[3].col = 432;
        items[3].row = 528;
        items[4].col = 96;
        items[4].row = 288;
        items[5].col = 480;
        items[5].row = 160;
    } else { // Spawns items in front of player during cheat
        items[0].col = player.col - 16;
        items[0].row = player.row + player.height;
        items[1].col = player.col - 8;
        items[1].row = player.row + player.height;
        items[2].col = player.col;
        items[2].row = player.row + player.height;
        items[3].col = player.col + 8;
        items[3].row = player.row + player.height;
        items[4].col = player.col + 16;
        items[4].row = player.row + player.height;
        items[5].col = player.col + 24;
        items[5].row = player.row + player.height;
    }
}

// Update Items
void updateItems() {
    // Handle Player-Item Collision and Interaction
    for (int i = 0; i < ITEMCOUNT; i++) {
        if (!items[i].caught
        && collision(items[i].col, items[i].row, items[i].width, items[i].height, player.col, player.row, player.width, player.height)) {
            shadowOAM[48].attr0 = ((150) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[48].attr1 = ((SCREENWIDTH/2 - 12 - 1) & COLMASK) | ATTR1_TINY;
            shadowOAM[48].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 15);
            shadowOAM[49].attr0 = ((150) & ROWMASK) | ATTR0_4BPP | ATTR0_WIDE;
            shadowOAM[49].attr1 = ((SCREENWIDTH/2 - 12 + 8) & COLMASK) | ATTR1_SMALL;
            shadowOAM[49].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(26, 14);
            if (BUTTON_PRESSED(BUTTON_A)) {
                items[i].caught = 1;
                itemsCollected++;
                shadowOAM[48].attr0 = ATTR0_HIDE;
                shadowOAM[49].attr0 = ATTR0_HIDE;
            }
        } 
    } 
    // End Game at Altar if all Items are Collected
    if(collision(448, 32, 24, 32, player.col, player.row, player.width, player.height)) {
        if (itemsCollected == 6) {
            shadowOAM[52].attr0 = ((150) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[52].attr1 = ((SCREENWIDTH/2 - 12 - 1) & COLMASK) | ATTR1_TINY;
            shadowOAM[52].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 15);
            shadowOAM[53].attr0 = ((150) & ROWMASK) | ATTR0_4BPP | ATTR0_WIDE;
            shadowOAM[53].attr1 = ((SCREENWIDTH/2 - 12 + 8) & COLMASK) | ATTR1_TINY;
            shadowOAM[53].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(16, 16);
            if (BUTTON_PRESSED(BUTTON_A)) {
                ghostBanished = 1;
            }
        }
    } else {
        shadowOAM[52].attr0 = ATTR0_HIDE;
        shadowOAM[53].attr0 = ATTR0_HIDE;
    }
    // Update Item Count
    shadowOAM[42].attr0 = ((150) & ROWMASK) | ATTR0_4BPP | ATTR0_WIDE;
    shadowOAM[42].attr1 = ((10) & COLMASK) | ATTR1_SMALL;
    shadowOAM[42].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(24, 15);
    shadowOAM[17].attr0 = ((150) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[17].attr1 = ((36) & COLMASK) | ATTR1_TINY;
    shadowOAM[17].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(itemsCollected, 16);
}

// Draw Items to Screen at appropriate place on map
void drawItems() {
    for (int i = 0; i < ITEMCOUNT; i++) {
        if (!items[i].caught && items[i].row + items[i].height - 1 > vOff + ((screenBlock - 26)/2 * 256) 
        && items[i].row < SCREENHEIGHT + vOff + ((screenBlock - 26)/2 * 256)) {
            shadowOAM[90 + i].attr0 = ((items[i].row - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[90 + i].attr1 = ((items[i].col - hOff) & COLMASK) | ATTR1_TINY;
            shadowOAM[90 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(i + 6, 12);
        } else {
            shadowOAM[90 + i].attr0 = ATTR0_HIDE;
        } 
    }
}

// Initialize Occurrences
void initOccurrences() {
    for (int i = 0; i < OCCURRENCECOUNT; i++) {
        occurrences[i].width = 16;
        occurrences[i].height = 16;
        occurrences[i].caught = 0;
    }
    if (!cheat) {
        occurrences[0].col = 350;
        occurrences[0].row = 130;
        occurrences[1].col = 480;
        occurrences[1].row = 288;
        occurrences[2].col = 140;
        occurrences[2].row = 450;
        occurrences[3].col = 20;
        occurrences[3].row = 500;
        occurrences[4].col = 480;
        occurrences[4].row = 360;
    } else { // Spawns occurrences in front of player during cheat
        occurrences[0].col = player.col;
        occurrences[0].row = player.row + 24;
        occurrences[1].col = player.col;
        occurrences[1].row = player.row + 48;
        occurrences[2].col = player.col;
        occurrences[2].row = player.row + 72;
        occurrences[3].col = player.col;
        occurrences[3].row = player.row + 96;
        occurrences[4].col = player.col;
        occurrences[4].row = player.row + 120;
    }
    
}

// Draws Occurrences to at appropriate place on map
void drawOccurrences() {
    for (int i = 0; i < OCCURRENCECOUNT; i++) {
        if (occurrences[i].row + occurrences[i].height - 1 > vOff + ((screenBlock - 26)/2 * 256) 
        && occurrences[i].row < SCREENHEIGHT + vOff + ((screenBlock - 26)/2 * 256)) {
            shadowOAM[118 + i].attr0 = ((occurrences[i].row - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[118 + i].attr1 = ((occurrences[i].col - hOff) & COLMASK) | ATTR1_SMALL;
            shadowOAM[118 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(i*2, 17);
        } else {
            shadowOAM[118 + i].attr0 = ATTR0_HIDE;
        } 
    }
}

// Update Player
void updatePlayer() {
    // Button Input and Player Movement
    if (!player.hidden && !thermometer.checking && !ghostbook.checking && !videocam.checking && !spiritbox.checking
    && !weapon.active) {
        if(BUTTON_HELD(BUTTON_UP) && player.row > 1 && collisionCheck(collisionMap, MAPWIDTH, player.col, player.row - player.rdel) 
            && collisionCheck(collisionMap, MAPWIDTH, player.col + player.width - 1, player.row - player.rdel) 
            && collisionCheck(collisionMap, MAPWIDTH, player.col + player.width/2 - 1, player.row - player.rdel)) {
            player.aniState = SPRITEBACK;
            player.row -= player.rdel;
            player.idle = 0;
            if (player.row - ((screenBlock - 26) * 256)/2 - vOff <= SCREENHEIGHT/2 && vOff - 1 >= 0) {
                vOff--;
            }
        } else if(BUTTON_HELD(BUTTON_DOWN) && player.row + player.height < MAPHEIGHT && collisionCheck(collisionMap, MAPWIDTH, player.col, player.row + player.height - 1 + player.rdel) 
            && collisionCheck(collisionMap, MAPWIDTH, player.col + player.width - 1, player.row + player.height - 1 + player.rdel)
            && collisionCheck(collisionMap, MAPWIDTH, player.col + player.width/2 - 1, player.row + player.height - 1 + player.rdel)) {
            player.aniState = SPRITEFRONT;
            player.row += player.rdel;
            player.idle = 0;
            if (player.row - vOff >= SCREENHEIGHT/2 && (vOff + 1) < (MAPHEIGHT - SCREENHEIGHT) 
            && !(screenBlock == 28 && vOff >= (320 - SCREENHEIGHT))) {
                vOff++;
            }
        } else if(BUTTON_HELD(BUTTON_LEFT)  && player.col > 0 && collisionCheck(collisionMap, MAPWIDTH, player.col - player.cdel, player.row) 
            && collisionCheck(collisionMap, MAPWIDTH, player.col - player.cdel, player.row + player.height - 1)) {
            player.aniState = SPRITELEFT;
            player.col -= player.cdel;
            player.idle = 0;
            if (player.col - hOff <= SCREENWIDTH/2 && hOff - 1 >= 0) {
                hOff--;
            }
        } else if(BUTTON_HELD(BUTTON_RIGHT) && player.col + player.width < MAPWIDTH && collisionCheck(collisionMap, MAPWIDTH, player.col + player.width - 1 + player.cdel, player.row) 
            && collisionCheck(collisionMap, MAPWIDTH, player.col + player.width - 1 + player.cdel, player.row + player.height - 1)) {
            player.aniState = SPRITERIGHT;
            player.col += player.cdel;
            player.idle = 0;
            if (player.col - hOff >= SCREENWIDTH/2 && (hOff + 1) < (MAPWIDTH - SCREENWIDTH)) {
                hOff++;
            }
        } else {
            player.idle = 1;
        }
    } 

    // Handle Player-Hiding Spot Collision
    if (!ghost.alert && (collisionCheck(collisionMap, MAPWIDTH, player.col, player.row) == 2 | collisionCheck(collisionMap, MAPWIDTH, player.col + player.width-1, player.row) == 2
    | collisionCheck(collisionMap, MAPWIDTH, player.col, player.row + player.height-1) == 2 | collisionCheck(collisionMap, MAPWIDTH, player.col + player.width-1, player.row + player.height-1) == 2)) {
        if (player.hidden == 0) {
            shadowOAM[47].attr0 = ((150) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[47].attr1 = ((SCREENWIDTH/2 - 12 - 1) & COLMASK) | ATTR1_TINY;
            shadowOAM[47].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 15);
            shadowOAM[46].attr0 = ((150) & ROWMASK) | ATTR0_4BPP | ATTR0_WIDE;
            shadowOAM[46].attr1 = ((SCREENWIDTH/2 - 12 + 8) & COLMASK) | ATTR1_TINY;
            shadowOAM[46].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(16, 15);
        } else {
            shadowOAM[46].attr0 = ATTR0_HIDE;
            shadowOAM[47].attr0 = ATTR0_HIDE;
        }
        if (BUTTON_PRESSED(BUTTON_A)) {
            if (player.hidden == 0) {
                player.hidden = 1;
            } else {
                player.hidden = 0;
            }
        }
    } else {
        shadowOAM[46].attr0 = ATTR0_HIDE;
        shadowOAM[47].attr0 = ATTR0_HIDE;
    }

    // Change Equipped Item
    if (BUTTON_PRESSED(BUTTON_R)) {
        player.equipped++;
        if (player.equipped >= 3) {
            player.equipped = 0;
        }
        if (player.equipped == 1) { // EMF Reader
            weapon.equipped = 0;
            camera.equipped = 0;
            EMFReader.equipped = 1;
        } else if (player.equipped == 2) { // Camera
            EMFReader.equipped = 0;
            weapon.equipped = 0;
            camera.equipped = 1;
            camera.timer = 30;
        } else if (player.equipped == 0) { // Weapon
            EMFReader.equipped = 0;
            camera.equipped = 0;
            weapon.equipped = 1;
            weapon.timer = 30;
        }
    }

    // Place Equipment on Ghost Spot
    if (BUTTON_PRESSED(BUTTON_A) && !ghost.active && EMFReader.state >= 3 && thermometer.active == 0) {
        thermometer.active = 1;
        thermometer.row = ghostspot.row;
        thermometer.col = ghostspot.col;
        ghostbook.active = 1;
        ghostbook.row = thermometer.row;
        ghostbook.col = thermometer.col + 24;
        videocam.active = 1;
        videocam.row = ghostbook.row;
        videocam.col = ghostbook.col + 24;
        spiritbox.active = 1;
        spiritbox.row = thermometer.row + 24;
        spiritbox.col = thermometer.col;
        uvlight.active = 1;
        uvlight.row = videocam.row + 24;
        uvlight.col = videocam.col;
    }

    // Handle XL Background
    if (vOff > 256 && screenBlock == 26) {
        screenBlock += 2;
        vOff -= 256;
        REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(screenBlock) | BG_8BPP | BG_SIZE_LARGE;
    }
    if (vOff <= 0 && screenBlock == 28) {
        screenBlock -= 2;
        vOff += 256;
        REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(screenBlock) | BG_8BPP | BG_SIZE_LARGE;
    }
    REG_BG0VOFF = vOff;
}

// Draw Player to Screen and Animate Player
void drawPlayer() {
    if (player.aniCounter % 10 == 0) {
        player.curFrame = (player.curFrame + 1) % player.numFrames;
    }

    if (player.hidden) {
        shadowOAM[7].attr0 = ATTR0_HIDE;
    } else {
        shadowOAM[7].attr0 = ((player.row - (vOff + ((screenBlock - 26)/2 * 256))) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[7].attr1 = ((player.col - hOff) & COLMASK) | ATTR1_SMALL;
        if (player.idle) {
            shadowOAM[7].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(player.aniState*2, 0);
            player.curFrame = 0;
            player.aniCounter = 0;
        } else {
            shadowOAM[7].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(player.aniState*2, player.curFrame*2);
            player.aniCounter++;
        }
    }
    
}

// Update EMF Reader
void updateEMFReader() {
    // Change EMF Level and Modify Sprite Palette at Runtime
    if (ghost.active) {
        if (ghost.type == JINN || ghost.type == ONI || ghost.type == WRAITH) {
                EMFReader.state = 4;
                SPRITEPALETTE[2] = COLOR(31, 18, 19);
            } else {
                EMFReader.state = 3;
                SPRITEPALETTE[2] = COLOR(31, 23, 18);
            }
    } else {
        if (collision(player.col, player.row, player.width, player.height, ghostspot.col, ghostspot.row, ghostspot.width, ghostspot.height)) {
            if (cheat && (ghost.type == JINN || ghost.type == ONI || ghost.type == WRAITH)) {
                EMFReader.state = 4;
                SPRITEPALETTE[2] = COLOR(31, 18, 19);
            } else {
                EMFReader.state = 3;
                SPRITEPALETTE[2] = COLOR(31, 23, 18);
            }
            if (!thermometer.active) {
                shadowOAM[58].attr0 = ((150) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
                shadowOAM[58].attr1 = ((SCREENWIDTH/2 - 4) & COLMASK) | ATTR1_TINY;
                shadowOAM[58].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 15);
            } else {
                shadowOAM[58].attr0 = ATTR0_HIDE;
            }
        } else if (collision(player.col, player.row, player.width, player.height, ghostspot.col - 48, ghostspot.row - 48, ghostspot.width + 96, ghostspot.height + 96)) {
            shadowOAM[58].attr0 = ATTR0_HIDE;
            EMFReader.state = 2;
            SPRITEPALETTE[2] = COLOR(31, 31, 18);
        } else if (collision(player.col, player.row, player.width, player.height, ghostspot.col - 96, ghostspot.row - 96, ghostspot.width + 192, ghostspot.height + 192)) {
            EMFReader.state = 1;
            SPRITEPALETTE[2] = COLOR(22, 31, 18);
        } else {
            EMFReader.state = 0;
            SPRITEPALETTE[2] = COLOR(18, 29, 31);
        }
    }
}

// Draw EMF Reader and Level to screen when equipped
void drawEMFReader() {
    if (EMFReader.equipped) {
        shadowOAM[3].attr0 = ((10) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[3].attr1 = ((10) & COLMASK) | ATTR1_SMALL;
        shadowOAM[3].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 13);
        shadowOAM[34].attr0 = ((10) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[34].attr1 = ((10) & COLMASK) | ATTR1_SMALL;
        shadowOAM[34].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(20, 13);
        shadowOAM[44].attr0 = ((28) & ROWMASK) | ATTR0_4BPP | ATTR0_WIDE;
        shadowOAM[44].attr1 = ((10) & COLMASK) | ATTR1_TINY;
        shadowOAM[44].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(22, 15);
        shadowOAM[45].attr0 = ((28) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[45].attr1 = ((26) & COLMASK) | ATTR1_TINY;
        shadowOAM[45].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(EMFReader.state + 1, 16);
    } else {
        shadowOAM[45].attr0 = ATTR0_HIDE;
        shadowOAM[44].attr0 = ATTR0_HIDE;
    }

}

// Draw Equipment at appropriate place on map
void drawEquipment() {
    if (thermometer.active) {
        if (ghostspot.row + 48 > vOff + ((screenBlock - 26)/2 * 256) && ghostspot.row < SCREENHEIGHT + vOff + ((screenBlock - 26)/2 * 256)) {
            shadowOAM[104].attr0 = ((thermometer.row - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[104].attr1 = ((thermometer.col - hOff) & COLMASK) | ATTR1_TINY;
            shadowOAM[104].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 12);

            shadowOAM[105].attr0 = ((ghostbook.row - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[105].attr1 = ((ghostbook.col - hOff) & COLMASK) | ATTR1_TINY;
            shadowOAM[105].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(1, 12);

            shadowOAM[106].attr0 = ((videocam.row - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[106].attr1 = ((videocam.col - hOff) & COLMASK) | ATTR1_TINY;
            shadowOAM[106].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(2, 12);

            shadowOAM[107].attr0 = ((spiritbox.row - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[107].attr1 = ((spiritbox.col - hOff) & COLMASK) | ATTR1_TINY;
            shadowOAM[107].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(3, 12);

            shadowOAM[108].attr0 = ((uvlight.row - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[108].attr1 = ((uvlight.col - hOff) & COLMASK) | ATTR1_TINY;
            shadowOAM[108].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, 12);
            if (uvlight.clue == 1) {
                shadowOAM[112].attr0 = ((uvlight.row + 10 - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
                shadowOAM[112].attr1 = ((uvlight.col + 10 - hOff) & COLMASK) | ATTR1_TINY;
                shadowOAM[112].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(5, 12);
            }
        } else {
            shadowOAM[104].attr0 = ATTR0_HIDE;
            shadowOAM[105].attr0 = ATTR0_HIDE;
            shadowOAM[106].attr0 = ATTR0_HIDE;
            shadowOAM[107].attr0 = ATTR0_HIDE;
            shadowOAM[108].attr0 = ATTR0_HIDE;
            shadowOAM[112].attr0 = ATTR0_HIDE;
        }
    }
}

// Update Shotgun
void updateWeapon() {
    // Button Input 
    if (weapon.equipped) {
        if (BUTTON_PRESSED(BUTTON_B) && weapon.timer > 20){
            playSoundB(((signed char*) gunsound_data), gunsound_length, 0);
            weapon.state = player.aniState;
            weapon.timer = 0;
        } 
        if (weapon.timer < 20) {
            weapon.state = player.aniState;
            weapon.active = 1;
        } else {
            weapon.active = 0; 
        }

        // Weapon State
        if (weapon.state == SPRITEFRONT) {
            weapon.col = player.col;
            weapon.row = player.row + 16;
            weapon.width = 16;
            weapon.height = 24;
        } else if (weapon.state == SPRITEBACK) {
            weapon.col = player.col;
            weapon.row = player.row - 15;
            weapon.width = 16;
            weapon.height = 24;
        } else if (weapon.state == SPRITERIGHT) {
            weapon.col = player.col + 14;
            weapon.row = player.row;
            weapon.width = 24;
            weapon.height = 16;
        } else if (weapon.state == SPRITELEFT) {
            weapon.col = player.col - 15;
            weapon.row = player.row;
            weapon.width = 24;
            weapon.height = 16;
        }

        // Handle Weapon-Ghost Collision
        if (ghost.active && weapon.active 
        && collision(weapon.col, weapon.row, weapon.width, weapon.height, ghost.col, ghost.row, ghost.width, ghost.height)) {
            ghost.active = 0;
            score += 300;
            playSoundA(((signed char*) gamemusic_data), gamemusic_length, 1);
        }

        weapon.timer++;
    }
}

// Draw Weapon to Screen
void drawWeapon() {
    if(weapon.active && weapon.timer < 10) {
        shadowOAM[1].attr0 = ((weapon.row - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[1].attr1 = ((weapon.col - hOff) & COLMASK) | ATTR1_SMALL;
        shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(8 + weapon.state*2, 0);
        shadowOAM[34].attr0 = ((10) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[34].attr1 = ((10) & COLMASK) | ATTR1_SMALL;
        shadowOAM[34].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(6, 13);
    } else {
        shadowOAM[1].attr0 = ATTR0_HIDE;
    }
    if (weapon.equipped) {
        shadowOAM[3].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(2, 13);
    }
}

// Update Camera
void updateCamera() {
    // Button Input
    if (camera.equipped) {
        if (BUTTON_PRESSED(BUTTON_B) && camera.timer > 10){
            playSoundB(((signed char*) camerasound_data), camerasound_length, 0);
            camera.state = player.aniState;
            camera.timer = 0;
        } 
        if (camera.timer < 10) {
            camera.state = player.aniState;
            camera.active = 1;
        } else {
            camera.active = 0; 
            camera.state = 4;
        }

        // camera State
        if (camera.state == SPRITEFRONT) {
            camera.width = 48;
            camera.height = 32;
            camera.col = player.col - 16;
            camera.row = player.row + player.height;
        } else if (camera.state == SPRITEBACK) {
            camera.width = 48;
            camera.height = 32;
            camera.col = player.col - 16;
            camera.row = player.row - camera.height;
        } else if (camera.state == SPRITERIGHT) {
            camera.width = 32;
            camera.height = 48;
            camera.col = player.col + player.width;
            camera.row = player.row - 16;
        } else if (camera.state == SPRITELEFT) {
            camera.col = player.col - camera.width;
            camera.row = player.row - 16;
            camera.width = 32;
            camera.height = 48;
        }

        // Handle Camera-Occurrence Collision
        for (int i = 0; i < OCCURRENCECOUNT; i++) {
            if (camera.active && (occurrences[i].caught == 0)
            && collision(camera.col, camera.row, camera.width, camera.height, occurrences[i].col, occurrences[i].row, occurrences[i].width, occurrences[i].height)) {
                occurrences[i].caught = 1;
                occurrencesCaught++;
                sanity += 10;
                score += 100;
            }
        }
        // Handle Camera-Ghost Collision
        if (camera.active && ghost.active && !ghost.caught
        && collision(camera.col, camera.row, camera.width, camera.height, ghost.col, ghost.row, ghost.width, ghost.height)) {
            ghost.caught = 1;
            score += 100;
            occurrencesCaught++;
        }

        camera.timer++;
    }
}

// Draw Camera to Screen
void drawCamera() {
    if (camera.equipped) {
        shadowOAM[3].attr0 = ((10) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[3].attr1 = ((10) & COLMASK) | ATTR1_SMALL;
        shadowOAM[3].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, 13);
        shadowOAM[34].attr0 = ((10) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[34].attr1 = ((10) & COLMASK) | ATTR1_SMALL;
        shadowOAM[34].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(6, 13);

        shadowOAM[36].attr0 = ((15) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[36].attr1 = ((30) & COLMASK) | ATTR1_TINY;
        shadowOAM[36].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(occurrencesCaught, 16);

        shadowOAM[43].attr0 = ((15) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[43].attr1 = ((28) & COLMASK) | ATTR1_TINY;
        shadowOAM[43].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(11, 16);
    } else {
        shadowOAM[43].attr0 = ATTR0_HIDE;
        shadowOAM[36].attr0 = ATTR0_HIDE;
    }
}

// Update Ghost
void updateGhost() {
    // Ghost Movement
    if (ghost.active) {
        if (!ghost.alert) {
            ghostMovement();       
        } else {
            chase();
        }

        // Handle Player-Ghost Vicinity Collision
        if (!player.hidden && collision(player.col - 32, player.row - 32, player.width*5, player.height*5, ghost.col, ghost.row, ghost.width, ghost.height)) {
            ghost.alert = 1;
        }
    } 
  
}

// Draw Ghost to Screen and Animate Ghost
void drawGhost() {
    if (ghost.aniCounter % 10 == 0) {
        ghost.curFrame = (ghost.curFrame + 1) % ghost.numFrames;
    }
    if (ghost.active) {
        if (ghost.row + ghost.height - 1 > vOff + ((screenBlock - 26)/2 * 256) && ghost.row < SCREENHEIGHT + vOff + ((screenBlock - 26)/2 * 256)) {
            shadowOAM[2].attr0 = ((ghost.row - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_BLEND;
            shadowOAM[2].attr1 = ((ghost.col - hOff) & COLMASK) | ATTR1_SMALL;
            shadowOAM[2].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(ghost.aniState*2, 6 + ghost.curFrame*2);
        } else {
            shadowOAM[2].attr0 = ATTR0_HIDE;
        } 
        ghost.aniCounter++;
    } else if (!ghost.active) {
        shadowOAM[2].attr0 = ATTR0_HIDE;
    }
    // Alpha-Blending for Transluscent Effect
    REG_BLDCNT = 1 << 4 | 1 << 8;
    REG_BLDALPHA = 1 << 4 | 1 << 11;
}

// Randomly Move the Ghost on the Map
void ghostMovement() {
    if (ghost.aniState == SPRITERIGHT) {
        if (ghost.colPrev + ghost.width + ghost.distance > MAPWIDTH - 48) {
            ghost.distance = MAPWIDTH - 48 - ghost.colPrev - ghost.width;
            if (ghost.distance < 100) {
                ghost.aniState = SPRITELEFT;
                return;
            }
        }
        if (ghost.col < ghost.colPrev + ghost.distance) {
            ghost.col += ghost.cdel;
        } else {
            ghost.colPrev = ghost.col;
            ghost.rowPrev = ghost.row;
            ghost.aniState = rand() % 4;
            ghost.distance = rand() % 400 + 200;
        }
    } else if (ghost.aniState == SPRITELEFT) {
        if (ghost.colPrev - ghost.distance < 48) {
            ghost.distance =  ghost.colPrev - 48;
            if (ghost.distance < 100) {
                ghost.aniState = SPRITERIGHT;
                return;
            }
        }
        if (ghost.col > ghost.colPrev - ghost.distance) {
            ghost.col -= ghost.cdel;
        } else {
            ghost.colPrev = ghost.col;
            ghost.rowPrev = ghost.row;
            ghost.aniState = rand() % 4;
            ghost.distance = rand() % 400;
        }
    } else if (ghost.aniState == SPRITEFRONT) {
        if (ghost.rowPrev + ghost.height + ghost.distance > MAPHEIGHT - 48) {
            ghost.distance = MAPHEIGHT - 48 - ghost.rowPrev - ghost.height;
            if (ghost.distance < 100) {
                ghost.aniState = SPRITEBACK;
                return;
            }
        }
        if (ghost.row < ghost.rowPrev + ghost.distance) {
            ghost.row += ghost.rdel;
        } else {
            ghost.colPrev = ghost.col;
            ghost.rowPrev = ghost.row;
            ghost.aniState = rand() % 4;
            ghost.distance = rand() % 400;
        }
    } else if (ghost.aniState == SPRITEBACK) {
        if (ghost.rowPrev - ghost.distance < 48) {
            ghost.distance =  ghost.rowPrev - 48;
            if (ghost.distance < 100) {
                ghost.aniState = SPRITEFRONT;
                return;
            }
        }
        if (ghost.row > ghost.rowPrev - ghost.distance) {
            ghost.row -= ghost.rdel;
        } else {
            ghost.colPrev = ghost.col;
            ghost.rowPrev = ghost.row;
            ghost.aniState = rand() % 4;
            ghost.distance = rand() % 400;
        }
    }

}

// Chase/Follow the Player
void chase() {
    if (ghost.row > player.row) {
        ghost.aniState = SPRITEBACK;
        ghost.row -= ghost.rdel;
    } else if (ghost.row < player.row) {
        ghost.aniState = SPRITEFRONT;
        ghost.row += ghost.rdel;
    }
    if (ghost.col > player.col) {
        ghost.aniState = SPRITELEFT;
        ghost.col -= ghost.cdel;
    } else if (ghost.col < player.col) {
        ghost.aniState = SPRITERIGHT;
        ghost.col += ghost.cdel;
    }
    if (collision(player.col, player.row, player.width, player.height, ghost.col, ghost.row, ghost.width, ghost.height)) {
        goToLose();
    }
}

// Update Sanity
void updateSanity() {
    // When Sanity > 100, Trigger Ghost Attack after a 3 second delay
    if (sanity >= SANITYMAX && sanityTimer > 3) {
        ghost.alert = 0;
        ghost.active = 1;
        ghost.col = rand() % 512;
        ghost.row = rand() % 576;
        ghost.colPrev = ghost.col;
        ghost.rowPrev = ghost.row;
        ghost.aniState = rand() % 4;
        ghost.distance = rand() % 400;
        playSoundA(((signed char*) ghostmusic_data), ghostmusic_length, 1);
    }
    if (!ghost.active && sanityTimer % 1 == 0 && sanityTimer > 0 && sanity < SANITYMAX) {
        sanity += 1;
        sanityTimer = 0;
    } 
    if (ghost.active) {
        sanityTimer = 0;
        sanity = 0;
    } 
}

// Draw Sanity Percentage to Screen
void drawSanity() {
    if (ghost.active || (sanity >= SANITYMAX && sanityTimer <= 3)) {
        shadowOAM[11].attr0 = ((8) & ROWMASK) | ATTR0_4BPP | ATTR0_WIDE;
        shadowOAM[11].attr1 = ((240 - 16 - 10) & COLMASK) | ATTR1_MEDIUM;
        shadowOAM[11].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(12, 13);
        shadowOAM[10].attr0 = ATTR0_HIDE;
        shadowOAM[9].attr0 = ATTR0_HIDE;

        shadowOAM[35].attr0 = ((8) & ROWMASK) | ATTR0_4BPP | ATTR0_WIDE;
        shadowOAM[35].attr1 = ((SCREENWIDTH/2 - 16) & COLMASK) | ATTR1_MEDIUM;
        shadowOAM[35].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(16, 13);
    } else {
        shadowOAM[11].attr0 = ((8) & ROWMASK) | ATTR0_4BPP | ATTR0_WIDE;
        shadowOAM[11].attr1 = ((240 - 16 - 10) & COLMASK) | ATTR1_MEDIUM;
        shadowOAM[11].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(8, 13);
        
        shadowOAM[10].attr0 = ((12) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[10].attr1 = ((240 - 16 - 10) & COLMASK) | ATTR1_TINY;
        shadowOAM[10].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID((sanity % 100)/10, 16);

        shadowOAM[9].attr0 = ((12) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[9].attr1 = ((240 - 16 - 10 + 8) & COLMASK) | ATTR1_TINY;
        shadowOAM[9].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(((sanity % 100) % 10), 16);

        shadowOAM[35].attr0 = ATTR0_HIDE;
    }
}

// Update Thermometer
void updateThermometer() {
    if (cheat && (ghost.type == DEMON) | (ghost.type == ONI) | (ghost.type == WRAITH)) { // Display Clue Immediately during Cheat
        thermometer.temperature = 0;
    }
    // Decrement Temperature
    if (thermometer.randvar == 1) {
        if (thermometer.temperature > 0 && ((ghost.type == DEMON) | (ghost.type == ONI) | (ghost.type == WRAITH))) {
            thermometer.temperature -= 3;
        } else if (thermometer.temperature > 5) {
            thermometer.temperature -= 3;
        }   
        thermometer.randvar = 4;
    } 
    // Handle Thermometer-Player Collision and Display
    if (thermometer.active) {
        if (collision(player.col, player.row, player.width, player.height, thermometer.col, thermometer.row, thermometer.width, thermometer.height)) {
            if (BUTTON_PRESSED(BUTTON_A)) {
                if (thermometer.checking == 0) {
                    thermometer.checking = 1;
                } else {
                    thermometer.checking = 0;
                }
            }
            shadowOAM[50].attr0 = ((150) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[50].attr1 = ((SCREENWIDTH/2 - 12 - 1) & COLMASK) | ATTR1_TINY;
            shadowOAM[50].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 15);
            shadowOAM[51].attr0 = ((150) & ROWMASK) | ATTR0_4BPP | ATTR0_WIDE;
            shadowOAM[51].attr1 = ((SCREENWIDTH/2 - 12 + 8) & COLMASK) | ATTR1_SMALL;
            shadowOAM[51].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(22, 14);
        } 
        if (thermometer.checking == 1
        && collision(player.col, player.row, player.width, player.height, thermometer.col, thermometer.row, thermometer.width, thermometer.height)) {
            player.idle = 1;
            shadowOAM[50].attr0 = ATTR0_HIDE;
            shadowOAM[51].attr0 = ATTR0_HIDE;
            shadowOAM[16].attr0 = ((120) & ROWMASK) | ATTR0_4BPP | ATTR0_WIDE;
            shadowOAM[16].attr1 = ((88) & COLMASK) | ATTR1_LARGE;
            shadowOAM[16].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(24, 4);
            if (thermometer.temperature < 0) {
                shadowOAM[15].attr0 = ((137) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
                shadowOAM[15].attr1 = ((100) & COLMASK) | ATTR1_TINY;
                shadowOAM[15].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(10, 16);
            } else {
                shadowOAM[15].attr0 = ATTR0_HIDE;
            }
            shadowOAM[14].attr0 = ((137) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[14].attr1 = ((108) & COLMASK) | ATTR1_TINY;
            shadowOAM[14].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(abs((thermometer.temperature % 100)/10), 16);
            shadowOAM[13].attr0 = ((137) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[13].attr1 = ((118) & COLMASK) | ATTR1_TINY;
            shadowOAM[13].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(abs((thermometer.temperature % 100) % 10), 16);
        } else {
            shadowOAM[13].attr0 = ATTR0_HIDE;
            shadowOAM[14].attr0 = ATTR0_HIDE;
            shadowOAM[15].attr0 = ATTR0_HIDE;
            shadowOAM[16].attr0 = ATTR0_HIDE;
        }
    }
}

// Update UV Light
void updateUVLight() {
    if (uvlight.active) {
        if ((ghost.type == DEMON) | (ghost.type == JINN) | (ghost.type == POLTERGEIST)) {
            uvlight.clue = 1;
        }
    }
}

// Update Ghostbook
void updateGhostbook() {
    if (cheat && (ghost.type == DEMON) | (ghost.type == BANSHEE)| (ghost.type == POLTERGEIST)) { // Display Immediately during cheat
        ghostbook.clue = 1;
    }
    // Update Ghostbook Status
    if (ghostbook.randvar == 1) {
        if ((ghost.type == DEMON) | (ghost.type == BANSHEE)| (ghost.type == POLTERGEIST)) {
            ghostbook.clue = 1;
        }
    }
    // Handle Ghostbook-Player Collision and Display
    if (ghostbook.active) {
        if (collision(player.col, player.row, player.width, player.height, ghostbook.col, ghostbook.row, ghostbook.width, ghostbook.height)) {
            if (BUTTON_PRESSED(BUTTON_A)) {
                if (ghostbook.checking == 0) {
                    ghostbook.checking = 1;
                } else {
                    ghostbook.checking = 0;
                }
            }
            shadowOAM[50].attr0 = ((150) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[50].attr1 = ((SCREENWIDTH/2 - 12 - 1) & COLMASK) | ATTR1_TINY;
            shadowOAM[50].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 15);
            shadowOAM[51].attr0 = ((150) & ROWMASK) | ATTR0_4BPP | ATTR0_WIDE;
            shadowOAM[51].attr1 = ((SCREENWIDTH/2 - 12 + 8) & COLMASK) | ATTR1_SMALL;
            shadowOAM[51].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(22, 14);
        }
        if (ghostbook.checking
        && collision(player.col, player.row, player.width, player.height, ghostbook.col, ghostbook.row, ghostbook.width, ghostbook.height)) {
            player.idle = 1;
            shadowOAM[50].attr0 = ATTR0_HIDE;
            shadowOAM[51].attr0 = ATTR0_HIDE;
            shadowOAM[6].attr0 = ((80) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[6].attr1 = ((80) & COLMASK) | ATTR1_LARGE;
            shadowOAM[6].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(16, 0);
            if (ghostbook.clue == 1) {
                shadowOAM[0].attr0 = ((90) & ROWMASK) | ATTR0_4BPP | ATTR0_TALL;
                shadowOAM[0].attr1 = ((90) & COLMASK) | ATTR1_MEDIUM;
                shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(24, 0);
                shadowOAM[5].attr0 = ((90) & ROWMASK) | ATTR0_4BPP | ATTR0_TALL;
                shadowOAM[5].attr1 = ((122) & COLMASK) | ATTR1_MEDIUM;
                shadowOAM[5].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(26, 0);
            } else {
                shadowOAM[0].attr0 = ATTR0_HIDE;
                shadowOAM[5].attr0 = ATTR0_HIDE;
            }
        } else {
            shadowOAM[0].attr0 = ATTR0_HIDE;
            shadowOAM[5].attr0 = ATTR0_HIDE;
            shadowOAM[6].attr0 = ATTR0_HIDE;
        }
    }
    
}

// Update Videocam
void updateVideoCam() {
    if (cheat && (ghost.type == POLTERGEIST) | (ghost.type == BANSHEE) | (ghost.type == WRAITH)) { // Display Immediately during cheat
        videocam.clue = 1;
    }
    // Update Videocam Status
    if (videocam.randvar == 1) {
        if ((ghost.type == POLTERGEIST) | (ghost.type == BANSHEE) | (ghost.type == WRAITH)) {
            videocam.clue = 1;
        }
    }
    // Handle Videocam-Player Collision and Display
    if (videocam.active) {
        if (collision(player.col, player.row, player.width, player.height, videocam.col, videocam.row, videocam.width, videocam.height)) {
            if (BUTTON_PRESSED(BUTTON_A) ) {
                if (videocam.checking == 0) {
                videocam.checking = 1;
                orbRow = rand() % 100 + 30;
                orbCol = rand() % 200 + 20;
            } else {
                videocam.checking = 0;
            }
            }
            shadowOAM[50].attr0 = ((150) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[50].attr1 = ((SCREENWIDTH/2 - 12 - 1) & COLMASK) | ATTR1_TINY;
            shadowOAM[50].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 15);
            shadowOAM[51].attr0 = ((150) & ROWMASK) | ATTR0_4BPP | ATTR0_WIDE;
            shadowOAM[51].attr1 = ((SCREENWIDTH/2 - 12 + 8) & COLMASK) | ATTR1_SMALL;
            shadowOAM[51].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(22, 14);
        }
        if (videocam.checking == 1
        && collision(player.col, player.row, player.width, player.height, videocam.col, videocam.row, videocam.width, videocam.height)) {
            player.idle = 1;
            shadowOAM[50].attr0 = ATTR0_HIDE;
            shadowOAM[51].attr0 = ATTR0_HIDE;
            shadowOAM[26].attr0 = ((0) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[26].attr1 = ((0) & COLMASK) | ATTR1_SMALL;
            shadowOAM[26].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(8, 2);
            shadowOAM[27].attr0 = ((0) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[27].attr1 = ((224) & COLMASK) | ATTR1_SMALL;
            shadowOAM[27].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(10, 2);
            shadowOAM[28].attr0 = ((144) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[28].attr1 = ((0) & COLMASK) | ATTR1_SMALL;
            shadowOAM[28].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(12, 2);
            shadowOAM[29].attr0 = ((144) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[29].attr1 = ((224) & COLMASK) | ATTR1_SMALL;
            shadowOAM[29].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(14, 2);
            shadowOAM[30].attr0 = ((8) & ROWMASK) | ATTR0_4BPP | ATTR0_WIDE;
            shadowOAM[30].attr1 = ((116) & COLMASK) | ATTR1_TINY;
            shadowOAM[30].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(8, 4);
            if (videocam.clue == 1) {
                // Animate Ghost Orb
                if (orbTimer % 10 == 0) {
                    if (orbRow > 100) {
                        orbRow--;
                    } else {
                        orbRow++;
                    }
                }
                orbTimer++;
                shadowOAM[31].attr0 = ((orbRow) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
                shadowOAM[31].attr1 = ((orbCol) & COLMASK) | ATTR1_TINY;
                shadowOAM[31].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(12, 12);
            } else {
                shadowOAM[31].attr0 = ATTR0_HIDE;
            }
        } else {
            shadowOAM[26].attr0 = ATTR0_HIDE;
            shadowOAM[27].attr0 = ATTR0_HIDE;
            shadowOAM[28].attr0 = ATTR0_HIDE;
            shadowOAM[29].attr0 = ATTR0_HIDE;
            shadowOAM[30].attr0 = ATTR0_HIDE;
            shadowOAM[31].attr0 = ATTR0_HIDE;
        }
    }
}

// Update SpiritBox
void updateSpiritBox() {
    if (cheat && (ghost.type == JINN) | (ghost.type == BANSHEE) | (ghost.type == ONI)) { // Display Immediately During Cheat
        spiritbox.clue = 1;
    }
    // Update Spiritbox Status
    if (spiritbox.randvar == 1) {
        if ((ghost.type == JINN) | (ghost.type == BANSHEE) | (ghost.type == ONI)) {
            spiritbox.clue = 1;
        }
    }
    // Handle Spiritbox-Player Collision and Sound 
    if (spiritbox.active) {
        if (collision(player.col, player.row, player.width, player.height, spiritbox.col, spiritbox.row, spiritbox.width, spiritbox.height)) {
            if (BUTTON_PRESSED(BUTTON_A)) {
                if (spiritbox.checking == 0) {
                    spiritbox.checking = 1;
                } else {
                    spiritbox.checking = 0;
                }
                if (spiritbox.clue == 1) {
                    playSoundB(((signed char*) spiritboxsound_data), spiritboxsound_length, 1);
                } else {
                    playSoundB(((signed char*) staticsound_data), staticsound_length, 1);
                }
            } 
            shadowOAM[50].attr0 = ((150) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[50].attr1 = ((SCREENWIDTH/2 - 12 - 1) & COLMASK) | ATTR1_TINY;
            shadowOAM[50].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 15);
            shadowOAM[51].attr0 = ((150) & ROWMASK) | ATTR0_4BPP | ATTR0_WIDE;
            shadowOAM[51].attr1 = ((SCREENWIDTH/2 - 12 + 8) & COLMASK) | ATTR1_SMALL;
            shadowOAM[51].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(22, 14);
        }
        if (spiritbox.checking 
        && collision(player.col, player.row, player.width, player.height, spiritbox.col, spiritbox.row, spiritbox.width, spiritbox.height)) {
            REG_TM0CNT = TIMER_OFF;
            if (spiritbox.clue == 1) {
                if (soundB.data == ((signed char*) staticsound_data)) {
                    playSoundB(((signed char*) spiritboxsound_data), spiritboxsound_length, 1);
                }
            }
            player.idle = 1;
            shadowOAM[50].attr0 = ATTR0_HIDE;
            shadowOAM[51].attr0 = ATTR0_HIDE;
        } else {
            REG_TM0CNT = TIMER_ON;
            if (soundB.data == ((signed char*) spiritboxsound_data) || soundB.data == ((signed char*) staticsound_data)) {
                REG_TM1CNT = TIMER_OFF;
            }     
        }
    }
    
}

// Hide Helper Text for Equipment and Items
void hideText() {
    if (!(collision(player.col, player.row, player.width, player.height, spiritbox.col, spiritbox.row, spiritbox.width, spiritbox.height)
    || collision(player.col, player.row, player.width, player.height, videocam.col, videocam.row, videocam.width, videocam.height)
    || collision(player.col, player.row, player.width, player.height, ghostbook.col, ghostbook.row, ghostbook.width, ghostbook.height)
    || collision(player.col, player.row, player.width, player.height, thermometer.col, thermometer.row, thermometer.width, thermometer.height))) {
        shadowOAM[50].attr0 = ATTR0_HIDE;
        shadowOAM[51].attr0 = ATTR0_HIDE;
    }
    for (int i = 0; i < ITEMCOUNT; i++) {
        if (!(collision(items[0].col, items[0].row, items[0].width, items[0].height, player.col, player.row, player.width, player.height)
        || collision(items[1].col, items[1].row, items[1].width, items[1].height, player.col, player.row, player.width, player.height)
        || collision(items[2].col, items[2].row, items[2].width, items[2].height, player.col, player.row, player.width, player.height)
        || collision(items[3].col, items[3].row, items[3].width, items[3].height, player.col, player.row, player.width, player.height)
        || collision(items[4].col, items[4].row, items[4].width, items[4].height, player.col, player.row, player.width, player.height)
        || collision(items[5].col, items[5].row, items[5].width, items[5].height, player.col, player.row, player.width, player.height))
        ) {
            shadowOAM[48].attr0 = ATTR0_HIDE;
            shadowOAM[49].attr0 = ATTR0_HIDE;
        }
    } 
} 