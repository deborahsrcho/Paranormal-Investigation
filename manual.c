#include "game.h"
#include "gba.h"
#include "manual.h"

CURSOR cursor;
void initCursor() {
    cursor.col = 0;
    cursor.row = 0;
    cursor.type = DEMON;
}

void drawManual() {
    DMANow(3, shadowOAM, OAM, sizeof(shadowOAM)/2);
}

void updateCursor() {
   if (BUTTON_PRESSED(BUTTON_LEFT)) {
        cursor.type--;
    }
    if (BUTTON_PRESSED(BUTTON_RIGHT)) {
        cursor.type++;
    }
    if (cursor.type > 5) {
        cursor.type = 0;
    }
    if (cursor.type < 0) {
        cursor.type = 5;
    }

    if (cursor.type == DEMON) {
        cursor.col = 1;
        cursor.row = 2;
    }
    if (cursor.type == JINN) {
        cursor.col = 1;
        cursor.row = 8;
    }
    if (cursor.type == ONI) {
        cursor.col = 1;
        cursor.row = 14;
    }
    if (cursor.type == POLTERGEIST) {
        cursor.col = 17;
        cursor.row = 2;
    }
    if (cursor.type == BANSHEE) {
        cursor.col = 17;
        cursor.row = 8;
    }
    if (cursor.type == WRAITH) {
        cursor.col = 17;
        cursor.row = 14;
    }

    shadowOAM[17].attr0 = ((cursor.row*8) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[17].attr1 = ((cursor.col*8) & COLMASK) | ATTR1_TINY;
    shadowOAM[17].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(6, 8);
}