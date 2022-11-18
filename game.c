#include "game.h"
#include "gba.h"
#include "collisionmap.h"


OBJ_ATTR shadowOAM[128];
OCCURRENCE occurrences[OCCURRENCECOUNT];
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
int tempText;

void initGame() {
    tempText = 0;
    seconds = 0;
    sanity = 0;
    sanityTimer = 0;
    buttonTimer = 0;
    hOff = 0;
    vOff = 0;
    setupInterrupts();
    initPlayer();
    initGhost();
    initghostSpot();
    initEquipment();
    initOccurrences();
}

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
    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;
    DMANow(3, shadowOAM, OAM, sizeof(shadowOAM)/2);
}

void drawGame() {
    drawPlayer();
    drawWeapon();
    drawGhost();
    drawEMFReader();
    drawEquipment();
    drawSanity();
}

void interruptHandler() {
  REG_IME = 0; 
  if (REG_IF & INT_TM0) {
    sanityTimer++;
  }
  if (REG_IF & INT_TM1) {
    seconds++;
    if (thermometer.active && seconds % 15 == 0) {
        thermometer.randvar = rand() % 3;
        ghostbook.randvar = rand() % 5;
        videocam.randvar = rand() % 5;
        spiritbox.randvar = rand() % 5;
    }
  }
  REG_IF = REG_IF;  
  REG_IME = 1;      
}
void enableTimerInterrupts() {
  REG_IE = INT_TM0 | INT_TM1; 

  REG_TM0CNT = 0;
  REG_TM0D = 0;
  REG_TM0CNT =  TM_FREQ_256 | TIMER_ON | TM_IRQ;

  REG_TM1CNT = 0;
  REG_TM1D = 0;
  REG_TM1CNT =  TM_FREQ_256 | TIMER_ON | TM_IRQ;
}

void setupInterrupts() {
  REG_IME = 0;
  REG_INTERRUPT = interruptHandler; 
  enableTimerInterrupts();
  REG_IME = 1;
}


void initPlayer() {
    player.width = 16;
    player.height = 16;
    player.cdel = 1;
    player.rdel = 1;
    player.col = SCREENWIDTH/2 - player.width/2 + hOff;
    player.row = SCREENHEIGHT/2 - player.height/2 + vOff;
    player.aniCounter = 0;
    player.curFrame = 0;
    player.numFrames = 2;
    player.aniState = SPRITEFRONT;
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
    thermometer.temperature = 18;

    ghostbook.row = thermometer.row;
    ghostbook.col = thermometer.col + 16;
    ghostbook.width = 8;
    ghostbook.height = 8;
    ghostbook.active = 0;
    ghostbook.state = 0;
    ghostbook.randvar = 0;
    ghostbook.clue = 0;

    videocam.row = ghostbook.row;
    videocam.col = ghostbook.col + 16;
    videocam.width = 8;
    videocam.height = 8;
    videocam.active = 0;
    videocam.state = 0;
    videocam.randvar = 0;
    videocam.clue = 0;

    spiritbox.row = thermometer.row + 16;
    spiritbox.col = thermometer.col;
    spiritbox.width = 8;
    spiritbox.height = 8;
    spiritbox.active = 0;
    spiritbox.state = 0;
    spiritbox.randvar = 0;
    spiritbox.clue = 0;

    uvlight.row = videocam.row + 16;
    uvlight.col = videocam.col;
    uvlight.width = 8;
    uvlight.height = 8;
    uvlight.active = 0;
    uvlight.state = 0;
    uvlight.randvar = 0;
    uvlight.clue = 0;
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
    ghost.numFrames = 0;
    ghost.aniState = SPRITEFRONT;
    ghost.active = 0;
    ghost.alert = 0;
    ghost.path = 0;
    ghost.route = 1;
    ghost.type =  rand() % 5;
}

void initghostSpot() {
    ghostspot.col = 0;
    ghostspot.row = 140;
    ghostspot.width = 64;
    ghostspot.height = 64;
}

void initOccurrences() {
    for (int i = 1; i < OCCURRENCECOUNT; i++) {
        occurrences[i].col = 0;
        occurrences[i].row = 0;
        occurrences[i].width = 8;
        occurrences[i].height = 8;
        occurrences[i].caught = 0;
    }
}

void updatePlayer() {
    // Button Input and Player Movement
    if (!player.hidden && buttonTimer % 50 == 0 && !tempText) {
        if(BUTTON_HELD(BUTTON_UP) && player.row > 1) {
            player.aniState = SPRITEBACK;
            player.row -= player.rdel;
            if (player.row - vOff <= SCREENHEIGHT/2 && vOff - 1 >= 0) {
                vOff--;
            }
        } else if(BUTTON_HELD(BUTTON_DOWN) && player.row + player.height < MAPHEIGHT) {
            player.aniState = SPRITEFRONT;
            player.row += player.rdel;
            if (player.row - vOff >= SCREENHEIGHT/2 && (vOff + 1) < (MAPHEIGHT - SCREENHEIGHT)) {
                vOff++;
            }
        } else if(BUTTON_HELD(BUTTON_LEFT)  && player.col > 0) {
            player.aniState = SPRITELEFT;
            player.col -= player.cdel;
            if (player.col - hOff <= SCREENWIDTH/2 && hOff - 1 >= 0) {
                hOff--;
            }
        } else if(BUTTON_HELD(BUTTON_RIGHT) && player.col + player.width < MAPWIDTH) {
            player.aniState = SPRITERIGHT;
            player.col += player.cdel;
            if (player.col - hOff >= SCREENWIDTH/2 && (hOff + 1) < (MAPWIDTH - SCREENWIDTH)) {
                hOff++;
            }
        }
    }

    if (!ghost.alert && (!collisionCheck(collisionMap, MAPWIDTH, player.col, player.row) | !collisionCheck(collisionMap, MAPWIDTH, player.col + player.width-1, player.row)
    | !collisionCheck(collisionMap, MAPWIDTH, player.col, player.row + player.height-1) | !collisionCheck(collisionMap, MAPWIDTH, player.col + player.width-1, player.row + player.height-1))
    && BUTTON_PRESSED(BUTTON_A)) {
        if (player.hidden == 0) {
            player.hidden = 1;
        } else {
            player.hidden = 0;
        }
    } 

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
            shadowOAM[3].attr0 = ATTR0_HIDE;
        } else if (player.equipped == 0) { // Weapon
            EMFReader.equipped = 0;
            camera.equipped = 0;
            weapon.equipped = 1;
            shadowOAM[3].attr0 = ATTR0_HIDE;
        }
    }

    if (BUTTON_PRESSED(BUTTON_A) && !ghost.active && EMFReader.state >= 3 && thermometer.active == 0) {
        thermometer.active = 1;
        thermometer.row = player.row - 8;
        thermometer.col = player.col - 10;
        ghostbook.active = 1;
        ghostbook.row = thermometer.row;
        ghostbook.col = thermometer.col + 16;
        videocam.active = 1;
        videocam.row = ghostbook.row;
        videocam.col = ghostbook.col + 16;
        spiritbox.active = 1;
        spiritbox.row = thermometer.row + 16;
        spiritbox.col = thermometer.col;
        uvlight.active = 1;
        uvlight.row = videocam.row + 16;
        uvlight.col = videocam.col;
    }
    buttonTimer++;
}

void drawPlayer() {
    if (player.hidden) {
        shadowOAM[0].attr0 = ((player.row - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[0].attr1 = ((player.col - hOff) & COLMASK) | ATTR1_SMALL;
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(9, 0);
    } else {
        shadowOAM[0].attr0 = ((player.row - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[0].attr1 = ((player.col - hOff) & COLMASK) | ATTR1_SMALL;
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(player.aniState*2, 0);
        player.hidden = 0;
    }
    
}

void updateEMFReader() {
    if (ghost.active) {
        if (ghost.type == JINN || ghost.type == ONI || ghost.type == WRAITH) {
                EMFReader.state = 4;
            } else {
                EMFReader.state = 3;
            }
    } else {
        if (collision(player.col, player.row, player.width, player.height, ghostspot.col, ghostspot.row, ghostspot.width, ghostspot.height)) {
            EMFReader.state = 3;
        } else if (collision(player.col, player.row, player.width, player.height, ghostspot.col - 48, ghostspot.row - 48, ghostspot.width + 96, ghostspot.height + 96)) {
            EMFReader.state = 2;
        } else if (collision(player.col, player.row, player.width, player.height, ghostspot.col - 96, ghostspot.row - 96, ghostspot.width + 192, ghostspot.height + 192)) {
            EMFReader.state = 1;
        } else {
            EMFReader.state = 0;
        }
    }
}

void drawEMFReader() {
    if (EMFReader.equipped) {
        shadowOAM[3].attr0 = ((10) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[3].attr1 = ((10) & COLMASK) | ATTR1_SMALL;
        shadowOAM[3].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(EMFReader.state*2, 8);
    } 
}

void drawEquipment() {
    if (thermometer.active) {
        shadowOAM[4].attr0 = ((thermometer.row - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[4].attr1 = ((thermometer.col - hOff) & COLMASK) | ATTR1_TINY;
        shadowOAM[4].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 10);

        shadowOAM[5].attr0 = ((ghostbook.row - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[5].attr1 = ((ghostbook.col - hOff) & COLMASK) | ATTR1_TINY;
        shadowOAM[5].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(1, 10);

        shadowOAM[6].attr0 = ((videocam.row - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[6].attr1 = ((videocam.col - hOff) & COLMASK) | ATTR1_TINY;
        shadowOAM[6].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(2, 10);

        shadowOAM[7].attr0 = ((spiritbox.row - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[7].attr1 = ((spiritbox.col - hOff) & COLMASK) | ATTR1_TINY;
        shadowOAM[7].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(3, 10);

        shadowOAM[8].attr0 = ((uvlight.row - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[8].attr1 = ((uvlight.col - hOff) & COLMASK) | ATTR1_TINY;
        shadowOAM[8].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, 10);
    }
}
void updateWeapon() {
    // Button Input 
    if (weapon.equipped) {
        if (BUTTON_PRESSED(BUTTON_B)){
            //weapon.active = 1;
            weapon.state = player.aniState;
            weapon.timer = 0;
        } 
        if (weapon.timer < 200) {
            weapon.state = player.aniState;
            weapon.active = 1;
        } else {
            weapon.active = 0; 
            weapon.state = 4;
        }

        // Weapon State
        if (weapon.state == SPRITEFRONT) {
            weapon.col = player.col;
            weapon.row = player.row + 16;
            weapon.width = 16;
            weapon.height = 24;
        } else if (weapon.state == SPRITEBACK) {
            weapon.col = player.col;
            weapon.row = player.row - 22;
            weapon.width = 16;
            weapon.height = 24;
        } else if (weapon.state == SPRITERIGHT) {
            weapon.col = player.col + 14;
            weapon.row = player.row;
            weapon.width = 24;
            weapon.height = 16;
        } else if (weapon.state == SPRITELEFT) {
            weapon.col = player.col - 22;
            weapon.row = player.row;
            weapon.width = 24;
            weapon.height = 16;
        }

        if (weapon.active 
        && collision(weapon.col, weapon.row, weapon.width, weapon.height, ghost.col, ghost.row, ghost.width, ghost.height)) {
            ghost.active = 0;
            goToWin();
        }
        

        weapon.timer++;
    }
}
void drawWeapon() {
    if(weapon.equipped) {
        shadowOAM[1].attr0 = ((weapon.row - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[1].attr1 = ((weapon.col - hOff) & COLMASK) | ATTR1_MEDIUM;
        shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(weapon.state*4, 2);
        shadowOAM[3].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(10, 8); // TEMP
    }
}

void updateGhost() {
    if (!ghost.active && BUTTON_PRESSED(BUTTON_L)) {
        ghost.col = 0;
        ghost.row = 0;
        ghost.path = 0;
        ghost.alert = 0;
        ghost.active = 1;
    }
    if (ghost.active && buttonTimer % 100 == 0) {
        if (!ghost.alert) {
            if (ghost.col <= 200 && ghost.path == 0) {
                ghost.col += ghost.cdel;
                if (ghost.col == 200) {
                    ghost.path = 1;
                }
            } else if (ghost.row <= 120 && ghost.path == 1) {
                ghost.row += ghost.rdel;
                if (ghost.row == 120) {
                    ghost.path = 2;
                }
            } else if (ghost.col >= 30 && ghost.path == 2) {
                ghost.col -= ghost.cdel;
                if (ghost.col == 30) {
                    ghost.path = 3;
                }
            } else if (ghost.row >= 20 && ghost.path == 3) {
                ghost.row -= ghost.rdel;
                if (ghost.row == 20) {
                    ghost.active = 0;
                    ghost.path = 0;
                }
        }
        } else {
            chase();
        }
        if (!player.hidden && collision(player.col - 16, player.row - 16, player.width*3, player.height*3, ghost.col, ghost.row, ghost.width, ghost.height)) {
            ghost.alert = 1;
        }
    } 
  
}
void drawGhost() {
    if (ghost.active && buttonTimer % 100 == 0) {
        shadowOAM[2].attr0 = ((ghost.row - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[2].attr1 = ((ghost.col - hOff) & COLMASK) | ATTR1_SMALL;
        shadowOAM[2].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(ghost.aniState*2, 6);
    } else if (!ghost.active) {
        shadowOAM[2].attr0 = ((ghost.row - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[2].attr1 = ((ghost.col - hOff) & COLMASK) | ATTR1_SMALL;
        shadowOAM[2].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(9, 6);
    }
}

void chase() {
    if (ghost.row > player.row) {
        ghost.row -= ghost.rdel;
    } else if (ghost.row < player.row) {
        ghost.row += ghost.rdel;
    }
    if (ghost.col > player.col) {
        ghost.col -= ghost.cdel;
    } else if (ghost.col < player.col) {
        ghost.col += ghost.cdel;
    }
    if (collision(player.col, player.row, player.width, player.height, ghost.col, ghost.row, ghost.width, ghost.height)) {
        goToLose();
    }
}

void updateSanity() {
    if (sanity >= 10 && sanityTimer < 3) {
        ghost.col = 0;
        ghost.row = 0;
        ghost.path = 0;
        ghost.alert = 0;
    } else if (sanity >= 10 && sanityTimer > 3) {
        ghost.active = 1;
    }
    if (!ghost.active && sanityTimer % 10 == 0 && sanityTimer > 0) {
        sanity++;
        sanityTimer = 0;
    } 
    if (ghost.active) {
        REG_TM0CNT = 0;
        sanityTimer = 0;
        sanity = 0;
    } else {
        REG_TM0CNT = TM_FREQ_256 | TIMER_ON | TM_IRQ;
    }
}

void drawSanity() {
    // TEMP
    tens = (sanity % 100)/10; 
    ones = ((sanity % 100) % 10); 
    shadowOAM[11].attr0 = ((10) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[11].attr1 = ((240 - 16 - 10) & COLMASK) | ATTR1_SMALL;
    shadowOAM[11].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(8, 8);

    shadowOAM[10].attr0 = ((12) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[10].attr1 = ((240 - 16 - 10) & COLMASK) | ATTR1_TINY;
    shadowOAM[10].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(tens, 11);

    shadowOAM[9].attr0 = ((12) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[9].attr1 = ((240 - 16 - 10 + 8) & COLMASK) | ATTR1_TINY;
    shadowOAM[9].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(ones, 11);
}

void updateThermometer() {
    if (thermometer.randvar == 3) {
        if (thermometer.temperature > 0 && ((ghost.type == DEMON) | (ghost.type == ONI) | (ghost.type == WRAITH))) {
            thermometer.temperature -= 3;
        } else if (thermometer.temperature > 5) {
            thermometer.temperature -= 3;
        }   
    }

    if (BUTTON_PRESSED(BUTTON_A) 
    && collision(player.col, player.row, player.width, player.height, thermometer.col, thermometer.row, thermometer.width, thermometer.height)) {
        if (tempText == 0) {
            tempText = 1;
        } else {
            tempText = 0;
        }
    }
    if (tempText == 1) {
        if (thermometer.temperature < 0) {
            shadowOAM[13].attr0 = ((140) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[13].attr1 = ((20) & COLMASK) | ATTR1_MEDIUM;
            shadowOAM[13].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 12);
        } else {
            shadowOAM[13].attr0 = ((140) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[13].attr1 = ((20) & COLMASK) | ATTR1_MEDIUM;
            shadowOAM[13].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, 12);
        }
    } else {
        shadowOAM[13].attr0 = ATTR0_HIDE;
    }
}

void updateUVLight() {
    if (uvlight.active) {
        if (ghost.type == DEMON | ghost.type == JINN | ghost.type == POLTERGEIST) {
            uvlight.clue = 1;
            shadowOAM[12].attr0 = ((uvlight.row + 10 - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[12].attr1 = ((uvlight.col + 10 - hOff) & COLMASK) | ATTR1_TINY;
            shadowOAM[12].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(5, 10);
        }
    }
}

void updateGhostbook() {
    if (ghostbook.randvar == 3) {
        if (ghost.type == DEMON | ghost.type == BANSHEE | ghost.type == POLTERGEIST) {
            ghostbook.clue = 1;
        }
    }

    if (BUTTON_PRESSED(BUTTON_A) 
    && collision(player.col, player.row, player.width, player.height, ghostbook.col, ghostbook.row, ghostbook.width, ghostbook.height)) {
        if (tempText == 0) {
            tempText = 1;
        } else {
            tempText = 0;
        }
    }
    if (tempText == 1) {
        if (ghostbook.clue == 1) {
            shadowOAM[13].attr0 = ((140) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[13].attr1 = ((20) & COLMASK) | ATTR1_MEDIUM;
            shadowOAM[13].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 12);
        } else {
            shadowOAM[13].attr0 = ((140) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[13].attr1 = ((20) & COLMASK) | ATTR1_MEDIUM;
            shadowOAM[13].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, 12);
        }
    } else {
        shadowOAM[13].attr0 = ATTR0_HIDE;
    }
}

void updateVideoCam() {
    if (videocam.randvar == 3) {
        if (ghost.type == ONI | ghost.type == BANSHEE | ghost.type == WRAITH) {
            videocam.clue = 1;
        }
    }
    if (BUTTON_PRESSED(BUTTON_A) 
    && collision(player.col, player.row, player.width, player.height, videocam.col, videocam.row, videocam.width, videocam.height)) {
        if (tempText == 0) {
            tempText = 1;
        } else {
            tempText = 0;
        }
    }
    if (tempText == 1) {
        if (videocam.clue == 1) {
            shadowOAM[13].attr0 = ((140) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[13].attr1 = ((20) & COLMASK) | ATTR1_MEDIUM;
            shadowOAM[13].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 12);
        } else {
            shadowOAM[13].attr0 = ((140) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[13].attr1 = ((20) & COLMASK) | ATTR1_MEDIUM;
            shadowOAM[13].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, 12);
        }
    } else {
        shadowOAM[13].attr0 = ATTR0_HIDE;
    }
}

void updateSpiritBox() {
    if (spiritbox.randvar == 3) {
        if (ghost.type == JINN | ghost.type == BANSHEE | ghost.type == POLTERGEIST) {
            spiritbox.clue = 1;
        }
    }
    if (BUTTON_PRESSED(BUTTON_A) 
    && collision(player.col, player.row, player.width, player.height, spiritbox.col, spiritbox.row, spiritbox.width, spiritbox.height)) {
         if (tempText == 0) {
            tempText = 1;
        } else {
            tempText = 0;
        }
    }
    if (tempText == 1) {
        if (spiritbox.clue == 1) {
            shadowOAM[13].attr0 = ((140) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[13].attr1 = ((20) & COLMASK) | ATTR1_MEDIUM;
            shadowOAM[13].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 12);
        } else {
            shadowOAM[13].attr0 = ((140) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[13].attr1 = ((20) & COLMASK) | ATTR1_MEDIUM;
            shadowOAM[13].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, 12);
        }
    } else {
        shadowOAM[13].attr0 = ATTR0_HIDE;
    }
}