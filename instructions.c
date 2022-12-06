#include "instructions.h"
#include "game.h"
#include "gba.h"
#include "instructionsPg1.h"
#include "instructionsPg2.h"
#include "instructionsPg3.h"

void initInstructions() {
    page = 0;
}

void updatePage() {
    if (BUTTON_PRESSED(BUTTON_LEFT)) {
        page--;
    }
    if (BUTTON_PRESSED(BUTTON_RIGHT)) {
        page++;
    }
    if (page > 2) {
        page = 0;
    }
    if (page < 0) {
        page = 2;
    }

    if (page == 0) {
        DMANow(3, instructionsPg1Tiles, &CHARBLOCK[0], instructionsPg1TilesLen / 2);
        DMANow(3, instructionsPg1Pal, PALETTE, instructionsPg1PalLen / 2);
        DMANow(3, instructionsPg1Map, &SCREENBLOCK[31], 1024);
    } else if (page == 1) {
        DMANow(3, instructionsPg2Tiles, &CHARBLOCK[0], instructionsPg2TilesLen / 2);
        DMANow(3, instructionsPg2Pal, PALETTE, instructionsPg2PalLen / 2);
        DMANow(3, instructionsPg2Map, &SCREENBLOCK[31], 1024);
    } else {
        DMANow(3, instructionsPg3Tiles, &CHARBLOCK[0], instructionsPg3TilesLen / 2);
        DMANow(3, instructionsPg3Pal, PALETTE, instructionsPg3PalLen / 2);
        DMANow(3, instructionsPg3Map, &SCREENBLOCK[31], 1024);
    }
}