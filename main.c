/*
Milestone 3
Deborah Cho
NAVIGATING THE STATE MACHINE
- START - press *start* while in WIN or LOSE, press *select* while in INSTRUCTIONS, press *R* while in PAUSE
- INSTRUCTIONS - press *select* while in START
- GAME - press *start* while in START or MANUAL, *select* while in PAUSE
- MANUAL - press *start* while in GAME
- PAUSE - press *select* while in GAME
- WIN - select the right ghost type in MANUAL
- LOSE - collide with the ghost in the GAME state
CONTROLS
- GAME state: 
    - up, down, left, right to move
    - B to use equipped item
    - A to interact with equipment, place equipment, and hide/unhide
    - R to change equipped item (camera, shotgun, EMF reader)
    - L to trigger ghost attack (dev only)
    - start to go to MANUAL
    - select to go to PAUSE
- MANUAL state:
    - left, right to change selection
    - A to select ghost type
- see above for state machine controls
MILESTONE 3 IMPLEMENTATIONS
- Wide bg, Equipment and ability to interact with equipment, EMF Reader, Ghost type requirements, Camera, Strange Occurrences, 
select ghost type in MANUAL state, sanity meter
NOT IMPLEMENTED
- Ghost Routes - will implement with bigger bg
- Score
    - killing ghost, finding strange occurrences, identifying ghost type correctly affect score
- Finding strange occurrences affects sanity
- different displays for equipment
KNOWN BUGS
- temperature will not decrement properly (see debugging)
ADDITIONAL NOTES
- the ghost attack will trigger after about 100 seconds, but for the purpose of demonstration,
you may trigger one at any time by pressing *L*
*/
#include "gba.h"
#include "print.h"
#include "game.h"
#include "startBg.h"
#include "instructionsBg.h"
#include "manualBg.h"
#include "pauseBg.h"
#include "winBg.h" 
#include "loseBg.h"
#include "spritesheet.h"
#include "background.h"
#include "manual.h"

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
int seed;
extern OBJ_ATTR shadowOAM[128];

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
    seed++;
    if (BUTTON_PRESSED(BUTTON_START)) {
        srand(seed);
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
    DMANow(3, backgroundTiles, &CHARBLOCK[0], backgroundTilesLen / 2);
    DMANow(3, backgroundPal, PALETTE, backgroundPalLen / 2);
    DMANow(3, backgroundMap, &SCREENBLOCK[30], 1024*2);

    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(30) | BG_4BPP | BG_SIZE_WIDE;

    DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen/2);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen/2);

    waitForVBlank();
    state = GAME;
}

void game() {
    updateGame();
    drawGame();
    if(BUTTON_PRESSED(BUTTON_SELECT)) {
        goToPause();
    }
    if(BUTTON_PRESSED(BUTTON_START)) {
        goToManual();
    }
}

void goToManual() {
    
    REG_DISPCTL = MODE0 | BG1_ENABLE | SPRITE_ENABLE;
    REG_BG1CNT = BG_CHARBLOCK(2) | BG_SCREENBLOCK(20) | BG_4BPP | BG_SIZE_SMALL;
    DMANow(3, manualBgTiles, &CHARBLOCK[2], manualBgTilesLen / 2);
    DMANow(3, manualBgPal, PALETTE, manualBgPalLen / 2);
    DMANow(3, manualBgMap, &SCREENBLOCK[20], 1024);
    
    waitForVBlank();
    hideSprites();
    DMANow(3, shadowOAM, OAM, sizeof(shadowOAM)/2);

    initCursor();
    state = MANUAL;
}

void manual() {
    drawManual();
    updateCursor();

    if(BUTTON_PRESSED(BUTTON_START)) {
        shadowOAM[17].attr0 = ATTR0_HIDE;
        goToGame();
    }
    if (BUTTON_PRESSED(BUTTON_A)) {
        if (cursor.type == ghost.type) {
            score += 500;
            goToWin();
        }      
    }
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