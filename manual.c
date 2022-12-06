#include "game.h"
#include "gba.h"
#include "manual.h"

CURSOR cursor;

void initCursor() {
    cursor.col = 3;
    cursor.row = 4;
    checkTile = SCREENBLOCK[20].tilemap[OFFSET(cursor.col, cursor.row, 32)];
    emptyTile = SCREENBLOCK[20].tilemap[OFFSET(3, 9, 32)];
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
        cursor.col = 3;
        cursor.row = 4;
        SCREENBLOCK[20].tilemap[OFFSET(cursor.col, cursor.row, 32)] = checkTile;
    } else {
        SCREENBLOCK[20].tilemap[OFFSET(3, 4, 32)] = emptyTile;
    }
    if (cursor.type == JINN) {
        cursor.col = 3;
        cursor.row = 9;
        SCREENBLOCK[20].tilemap[OFFSET(cursor.col, cursor.row, 32)] = checkTile;
    } else {
        SCREENBLOCK[20].tilemap[OFFSET(3, 9, 32)] = emptyTile;
    }
    if (cursor.type == ONI) {
        cursor.col = 3;
        cursor.row = 14;
        SCREENBLOCK[20].tilemap[OFFSET(cursor.col, cursor.row, 32)] = checkTile;
    } else {
        SCREENBLOCK[20].tilemap[OFFSET(3, 14, 32)] = emptyTile;
    }
    if (cursor.type == POLTERGEIST) {
        cursor.col = 16;
        cursor.row = 4;
        SCREENBLOCK[20].tilemap[OFFSET(cursor.col, cursor.row, 32)] = checkTile;
    } else {
        SCREENBLOCK[20].tilemap[OFFSET(16, 4, 32)] = emptyTile;
    }
    if (cursor.type == BANSHEE) {
        cursor.col = 16;
        cursor.row = 9;
        SCREENBLOCK[20].tilemap[OFFSET(cursor.col, cursor.row, 32)] = checkTile;
    } else {
        SCREENBLOCK[20].tilemap[OFFSET(16, 9, 32)] = emptyTile;
    }
    if (cursor.type == WRAITH) {
        cursor.col = 16;
        cursor.row = 14;
        SCREENBLOCK[20].tilemap[OFFSET(cursor.col, cursor.row, 32)] = checkTile;
    } else {
        SCREENBLOCK[20].tilemap[OFFSET(16, 14, 32)] = emptyTile;
    }

}