/*
Milestone 4
Deborah Cho
NAVIGATING THE STATE MACHINE
- START - press *start* while in WIN or LOSE, press *select* while in INSTRUCTIONS, press *R* while in PAUSE
- INSTRUCTIONS - press *select* while in START
- GAME - press *start* while in START or MANUAL, *select* while in PAUSE
- MANUAL - press *start* while in GAME
- PAUSE - press *select* while in GAME
- WIN - collect all items and turn bring to altar
- LOSE - collide with the ghost in the GAME state
CONTROLS
- GAME state: 
    - up, down, left, right to move
    - B to use equipped item
    - A to place equipment, interact with equipment and altar, pick up items, and hide/unhide
    - R to change equipped item (camera, shotgun, EMF reader)
    - L to go to INSTRUCTIONS
    - start to go to MANUAL
    - select to go to PAUSE
- MANUAL state:
    - left, right to change selection
- see above for state machine controls
MILESTONE 4 IMPLEMENTATIONS
- Sprites, Backgrounds and Collision Maps, Music and Sound Effects, XL Background, Changing Sprite Palette and BG Tiles during runtime, Rank based
on score
- Win Condition
    - (NEW) When collecting all 6 items and turning them in to the altar, the game will end
NOT IMPLEMENTED
- Varying Ghost Routes
- Varying Ghost Spots
- Some display text/numbers
KNOWN BUGS
- some sprites are not overlapping correctly
- multiple equipment can be read at one time
*/
#include "gba.h"
#include "print.h"
#include "game.h"
#include "startBg.h"
#include "instructionsPg1.h"
#include "instructionsPg2.h"
#include "instructionsPg3.h"
#include "manualBg.h"
#include "pauseBg.h"
#include "winBg.h" 
#include "loseBg.h"
#include "spritesheet.h"
#include "background.h"
#include "manual.h"
#include "sound.h"
#include "losesound.h"
#include "startmusic.h"
#include "instructions.h"
#include "win.h"

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
void initStart();
void initialize();

enum {START, INSTRUCTIONS, GAME, MANUAL, PAUSE, WIN, LOSE};
int state;
int statePrev;
int seed;
int screenBlock;
int cheat;
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
    cheat = 0;

    REG_DISPCTL = MODE4 | BG2_ENABLE | DISP_BACKBUFFER;
    
    oldButtons = buttons;
    buttons = BUTTONS;

    screenBlock = 26;
    hideSprites();
    initStart();
    goToStart();
    
    setupSounds();
}

void initStart() {
    stopSound();
    playSoundA(((signed char*) startmusic_data), startmusic_length, 1);
}

void goToStart() {
    REG_DISPCTL = MODE0 | BG1_ENABLE;
    REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_4BPP | BG_SIZE_SMALL;
    DMANow(3, startBgTiles, &CHARBLOCK[0], startBgTilesLen / 2);
    DMANow(3, startBgPal, PALETTE, startBgPalLen / 2);
    DMANow(3, startBgMap, &SCREENBLOCK[31], 1024);
    
    waitForVBlank();
    hideSprites();
    DMANow(3, shadowOAM, OAM, sizeof(shadowOAM)/2);

    screenBlock = 26;
    
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
        statePrev = START;
        goToInstructions();
    }
    if (BUTTON_PRESSED(BUTTON_L)) {
        if (cheat == 0) {
            cheat = 1;
        } else {
            cheat = 0;
        }
    }
}

void goToInstructions() {
    initInstructions();
    REG_DISPCTL = MODE0 | BG1_ENABLE;
    REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_4BPP | BG_SIZE_SMALL;
    DMANow(3, instructionsPg1Tiles, &CHARBLOCK[0], instructionsPg1TilesLen / 2);
    DMANow(3, instructionsPg1Pal, PALETTE, instructionsPg1PalLen / 2);
    DMANow(3, instructionsPg1Map, &SCREENBLOCK[31], 1024);
    
    waitForVBlank();
    hideSprites();
    DMANow(3, shadowOAM, OAM, sizeof(shadowOAM)/2);

    state = INSTRUCTIONS;
}

void instructions() {
    updatePage();
    if (statePrev == GAME) {
        if (BUTTON_PRESSED(BUTTON_L)) {
            goToGame();
        }
    }
    if (statePrev == START) {
        if (BUTTON_PRESSED(BUTTON_SELECT)) {
            goToStart();
        }
    } 
}

void goToGame() {
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    DMANow(3, backgroundTiles, &CHARBLOCK[0], backgroundTilesLen / 2);
    DMANow(3, backgroundPal, PALETTE, backgroundPalLen / 2);
    DMANow(3, backgroundMap, &SCREENBLOCK[26], backgroundMapLen/2);

    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(screenBlock) | BG_8BPP | BG_SIZE_LARGE;

    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen/2);
    DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen/2);

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
    if (BUTTON_PRESSED(BUTTON_L)) {
        statePrev = GAME;
        goToInstructions();
    }
    if (ghostBanished) {
        goToWin();
    }
}

void goToManual() {
    
    REG_DISPCTL = MODE0 | BG1_ENABLE;
    REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(20) | BG_4BPP | BG_SIZE_SMALL;
    DMANow(3, manualBgTiles, &CHARBLOCK[0], manualBgTilesLen / 2);
    DMANow(3, manualBgPal, PALETTE, manualBgPalLen / 2);
    DMANow(3, manualBgMap, &SCREENBLOCK[20], 1024);
    
    waitForVBlank();
    hideSprites();
    DMANow(3, shadowOAM, OAM, sizeof(shadowOAM)/2);

    initCursor();
    state = MANUAL;
}

void manual() {
    updateCursor();

    if(BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }
}

void goToPause() {
    pauseSound();
    REG_DISPCTL = MODE0 | BG1_ENABLE;
    REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_4BPP | BG_SIZE_SMALL;
    DMANow(3, pauseBgTiles, &CHARBLOCK[0], pauseBgTilesLen / 2);
    DMANow(3, pauseBgPal, PALETTE, pauseBgPalLen / 2);
    DMANow(3, pauseBgMap, &SCREENBLOCK[31], 1024);
    
    waitForVBlank();
    hideSprites();
    DMANow(3, shadowOAM, OAM, sizeof(shadowOAM)/2);
    state = PAUSE;
}

void pause() {
    if(BUTTON_PRESSED(BUTTON_SELECT)) {
        unpauseSound();
        goToGame();
    }
    if(BUTTON_PRESSED(BUTTON_R)) {
        initStart();
        goToStart();
    }
}

void goToWin() {
    calculateRank();
    REG_DISPCTL = MODE0 | BG1_ENABLE | SPRITE_ENABLE;
    REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(15) | BG_4BPP | BG_SIZE_SMALL;
    DMANow(3, winBgTiles, &CHARBLOCK[0], winBgTilesLen / 2);
    DMANow(3, winBgPal, PALETTE, winBgPalLen / 2);
    DMANow(3, winBgMap, &SCREENBLOCK[15], 1024);
    
    waitForVBlank();
    hideSprites();
    DMANow(3, shadowOAM, OAM, sizeof(shadowOAM)/2);

    playSoundA(((signed char*) startmusic_data), startmusic_length, 1);

    state = WIN;
}

void win() {
    updateWin();
    DMANow(3, shadowOAM, OAM, sizeof(shadowOAM)/2);
    if (BUTTON_PRESSED(BUTTON_START)) {
        initStart();
        goToStart();
    }
}

void goToLose() {
    REG_DISPCTL = MODE0 | BG1_ENABLE;
    REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_4BPP | BG_SIZE_SMALL;
    DMANow(3, loseBgTiles, &CHARBLOCK[0], loseBgTilesLen / 2);
    DMANow(3, loseBgPal, PALETTE, loseBgPalLen / 2);
    DMANow(3, loseBgMap, &SCREENBLOCK[31], 1024);
    
    waitForVBlank();
    hideSprites();
    playSoundA(((signed char*) losesound_data), losesound_length, 0);
    DMANow(3, shadowOAM, OAM, sizeof(shadowOAM)/2);
    state = LOSE;
}

void lose() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        initStart();
        goToStart();
    }
}