#include "gba.h" // Mode 0 Scaffold
#include "print.h"
#include "game.h"
#include "startBg.h"
#include "instructionsBg.h"
#include "manualBg.h"
#include "pauseBg.h"
#include "winBg.h" 
#include "loseBg.h"
#include "spritesheet.h"
#include "gameBg.h"

unsigned short buttons;
unsigned short oldButtons;

void goToStart();
void goToInstructions();
void goToGame();
void goToManual();
void goToPause();
void goToLose();
void goToWin();
void start();
void instructions();
void manual();
void game();
void pause();
void lose();
void win();
void initialize();

enum {START, INSTRUCTIONS, GAME, MANUAL, PAUSE, WIN, LOSE};
int state;

int main() {
    initialize();
    while (1) {
        oldButtons = buttons;
        buttons = BUTTONS;
        
        switch(state) {
            case START:
                start();
                break;
            case INSTRUCTIONS:
                instructions();
                break;
            case GAME:
                game();
                break;
            case MANUAL:
                manual();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
        }
    }
}

void initialize() {

    REG_DISPCTL = MODE4 | BG2_ENABLE | DISP_BACKBUFFER;
    
    oldButtons = buttons;
    buttons = BUTTONS;

    hideSprites();
    goToStart();
}

void goToStart() {
    REG_DISPCTL = MODE4 | BG2_ENABLE | DISP_BACKBUFFER;
    DMANow(3, startBgPal, PALETTE, startBgPalLen);
    drawFullscreenImage4(startBgBitmap); 
    waitForVBlank();
    flipPage();
    
    state = START;
}

void start() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
        initGame();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToInstructions();
    }
}

void goToInstructions() {
    REG_DISPCTL = MODE4 | BG2_ENABLE | DISP_BACKBUFFER;
    DMANow(3, startBgPal, PALETTE, startBgPalLen);
    drawFullscreenImage4(instructionsBgBitmap); 
    waitForVBlank();
    flipPage();
    hideSprites();
    state = INSTRUCTIONS;
}

void instructions() {
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
        waitForVBlank();
        flipPage();
    }
}

void goToGame() {
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    DMANow(3, gameBgTiles, &CHARBLOCK[0], gameBgTilesLen / 2);
    DMANow(3, gameBgPal, PALETTE, gameBgPalLen / 2);
    DMANow(3, gameBgMap, &SCREENBLOCK[31], gameBgMapLen / 2);

    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_4BPP | BG_SIZE_SMALL;

    DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen/2);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen/2);

    for (int i = 0; i < 30; i++) {
        for (int j = 0; j < 20; j++) {
            SCREENBLOCK[31].tilemap[OFFSET(i, j, 32)] = 1;
        }
    }
    for (int i = 0; i < 2; i++) {
        for (int j = 15; j < 17; j++) {
            SCREENBLOCK[31].tilemap[OFFSET(i, j, 32)] = 2;
        }
    }

    waitForVBlank();
    state = GAME;
}

void game() {
    updateGame();
    if(BUTTON_PRESSED(BUTTON_SELECT)) {
        goToPause();
    }
    if(BUTTON_PRESSED(BUTTON_START)) {
        goToManual();
    }
}

void goToManual() {
    waitForVBlank();
    flipPage();
    REG_DISPCTL = MODE4 | BG2_ENABLE | DISP_BACKBUFFER;
    DMANow(3, startBgPal, PALETTE, startBgPalLen);
    drawFullscreenImage4(manualBgBitmap); 
    waitForVBlank();
    flipPage();
    hideSprites();
    state = MANUAL;
}

void manual() {
    if(BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }
    // win con
}

void goToPause() {
     waitForVBlank();
    flipPage();
    REG_DISPCTL = MODE4 | BG2_ENABLE | DISP_BACKBUFFER;
    DMANow(3, startBgPal, PALETTE, startBgPalLen);
    drawFullscreenImage4(pauseBgBitmap); 
    waitForVBlank();
    flipPage();
    hideSprites();
    state = PAUSE;
}

void pause() {
    if(BUTTON_PRESSED(BUTTON_SELECT)) {
        goToGame();
    }
    if(BUTTON_PRESSED(BUTTON_R)) {
        goToStart();
        waitForVBlank();
        flipPage();
    }
}

void goToWin() {
    waitForVBlank();
    flipPage();
    REG_DISPCTL = MODE4 | BG2_ENABLE | DISP_BACKBUFFER;
    DMANow(3, startBgPal, PALETTE, startBgPalLen);
    drawFullscreenImage4(winBgBitmap); 
    waitForVBlank();
    flipPage();
    hideSprites();
    state = WIN;
}

void win() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
        waitForVBlank();
        flipPage();
    }
}

void goToLose() {
    waitForVBlank();
    flipPage();
    REG_DISPCTL = MODE4 | BG2_ENABLE | DISP_BACKBUFFER;
    DMANow(3, startBgPal, PALETTE, startBgPalLen);
    drawFullscreenImage4(loseBgBitmap); 
    waitForVBlank();
    flipPage();
    hideSprites();
    state = LOSE;
}

void lose() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
        waitForVBlank();
        flipPage();
    }
}