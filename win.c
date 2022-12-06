#include "win.h"
#include "gba.h"
#include "game.h"
#include "manual.h"

extern OBJ_ATTR shadowOAM[128];

void updateWin() {
    if (aniTimer % 20 == 0) {
        if (scoreCol < (SCREENWIDTH/2 - 64)) {
            scoreCol++;
        }
        if (scoreCol == (SCREENWIDTH/2 - 64) && scoreRow < (SCREENHEIGHT/2 - 4)) {
            scoreRow++;
        }
        if (scoreRow == (SCREENHEIGHT/2 - 4) && rankCol < (SCREENWIDTH/2 - 64)) {
            rankCol++;
        }
        if (rankCol == (SCREENWIDTH/2 - 64) && medalRow < (SCREENHEIGHT/2 + 8)) {
            medalRow++;
        }
    }
    shadowOAM[38].attr0 = ((SCREENHEIGHT/2 - 4 + 24) & ROWMASK) | ATTR0_4BPP | ATTR0_WIDE;
    shadowOAM[38].attr1 = ((rankCol) & COLMASK) | ATTR1_SMALL;
    shadowOAM[38].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(18, 15);
    shadowOAM[39].attr0 = ((medalRow) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[39].attr1 = ((SCREENWIDTH/2 - 32) & COLMASK) | ATTR1_MEDIUM;
    shadowOAM[39].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(8 + rank*4, 8);

    shadowOAM[54].attr0 = ((SCREENHEIGHT/2 - 4) & ROWMASK) | ATTR0_4BPP | ATTR0_WIDE;
    shadowOAM[54].attr1 = ((scoreCol) & COLMASK) | ATTR1_SMALL;
    shadowOAM[54].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(22, 13);
    shadowOAM[55].attr0 = ((scoreRow) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[55].attr1 = (((SCREENWIDTH/2 - 64) + 28) & COLMASK) | ATTR1_TINY;
    shadowOAM[55].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID((score / 1000), 16);
    shadowOAM[56].attr0 = ((scoreRow) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[56].attr1 = (((SCREENWIDTH/2 - 64) + 28 + 8) & COLMASK) | ATTR1_TINY;
    shadowOAM[56].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID((score % 1000) / 100, 16);
    shadowOAM[57].attr0 = ((scoreRow) & ROWMASK) | ATTR0_4BPP | ATTR0_WIDE;
    shadowOAM[57].attr1 = (((SCREENWIDTH/2 - 64) + 28 + 16) & COLMASK) | ATTR1_TINY;
    shadowOAM[57].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(12, 16);
    
    DMANow(3, shadowOAM, OAM, sizeof(shadowOAM)/2);
    aniTimer++;
}

void calculateRank() {
    rankCol = -32;
    medalRow = -32;
    scoreCol = -8;
    scoreRow = -8;
    aniTimer = 0;
    if (cursor.type == ghost.type) {
        score += 500;
        cursor.type++;
    }    
    if (score >= 1300) {
        rank = GOLD;
    } else if ( score >= 900) {
        rank = SILVER;
    } else {
        rank = BRONZE;
    }
}