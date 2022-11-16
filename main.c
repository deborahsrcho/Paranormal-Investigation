/*
Milestone 2
Deborah Cho
NAVIGATING THE STATE MACHINE
- START - press *start* while in WIN or LOSE, press *select* while in INSTRUCTIONS, press *R* while in PAUSE
- INSTRUCTIONS - press *select* while in START
- GAME - press *start* while in START or MANUAL, *select* while in PAUSE
- MANUAL - press *start* while in GAME
- PAUSE - press *select* while in GAME
- WIN - shoot and kill the ghost in the GAME state
- LOSE - collide with the ghost in the GAME state
CONTROLS
- GAME state: 
    - up, down, left, right to move
    - B to shoot or hide/unhide while colliding with hiding spot (green block)
    - R to trigger ghost attack (dev only)
    - start to go to MANUAL
    - select to go to PAUSE
- see above for state machine controls
MILESTONE 2 IMPLEMENTATIONS
- State Machine
- Game: complex movement, hiding spots, shooting, ghost movement (one path), ghost types (as enums),
ghost chases player, lose/win condition, sanity meter (not currently displayed)
- Collision map for hiding spots
NOT IMPLEMENTED
- Conditions for ghost types - cannot be implemented until later, requires implementation of Equipment objects
KNOWN BUGS
- Wide background - moving to the right past the screen width will not properly display the background
- Some flickering in when transitioning between states
ADDITIONAL NOTES
- the ghost attack will trigger after about 10 seconds, but for the purpose of demonstration,
you may trigger one at any time by pressing *R*
- the ghost attack will begin in the top left corner of the map 
- if the player gets too close to the ghost, it will begin to chase the player, at which point the player will no longer
be able to hide and must kill the ghost 
- I have decided to combine the GHOST state described in M1 with the GAME state
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
    DMANow(3, backgroundMap, &SCREENBLOCK[20], 1024*2);

    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(20) | BG_4BPP | BG_SIZE_WIDE;

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