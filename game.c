#include "game.h"
#include "gba.h"

OBJ_ATTR shadowOAM[128];
PLAYER player;
WEAPON weapon;
ENEMY ghost;

void initGame() {
    initPlayer();
    initGhost();
    timer = 0;
}

void updateGame() {
    updatePlayer();
    updateGhost();
    updateWeapon();
    timer++;
    DMANow(3, shadowOAM, OAM, sizeof(shadowOAM)/2);
}


void initPlayer() {
    player.width = 16;
    player.height = 16;
    player.cdel = 1;
    player.rdel = 1;
    player.col = SCREENWIDTH/2 - player.width/2;
    player.row = SCREENHEIGHT/2 - player.height/2;
    player.aniCounter = 0;
    player.curFrame = 0;
    player.numFrames = 2;
    player.aniState = SPRITEFRONT;
    player.hidden = 0;

    weapon.col = player.col + 1;
    weapon.row = player.row;
    weapon.width = 16;
    weapon.height = 8;
    weapon.active = 0;
    weapon.state = SPRITEFRONT;
    weapon.timer = 0;
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
}

void updatePlayer() {
    // Button Input and Player Movement
    if (!player.hidden && timer % 50 == 0) {
        if(BUTTON_HELD(BUTTON_UP) && player.row > 1) {
            player.aniState = SPRITEBACK;
            player.row -= player.rdel;
        } else if(BUTTON_HELD(BUTTON_DOWN) && player.row + player.height < 160) {
            player.aniState = SPRITEFRONT;
            player.row += player.rdel;
        } else if(BUTTON_HELD(BUTTON_LEFT)  && player.col > 0) {
            player.aniState = SPRITELEFT;
            player.col -= player.cdel;
        } else if(BUTTON_HELD(BUTTON_RIGHT) && player.col + player.width < 240) {
            player.aniState = SPRITERIGHT;
            player.col += player.cdel;
        }
    }

    if (!ghost.alert && collision(player.col, player.row, player.width, player.height, 0, 120, 16, 16) && BUTTON_PRESSED(BUTTON_B)) {
        if (player.hidden == 0) {
            player.hidden = 1;
        } else {
            player.hidden = 0;
        }
    } 
    if (player.hidden) {
        shadowOAM[0].attr0 = (player.row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[0].attr1 = (player.col & COLMASK) | ATTR1_SMALL;
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(9, 0);
    } else {
        shadowOAM[0].attr0 = (player.row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[0].attr1 = (player.col & COLMASK) | ATTR1_SMALL;
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(player.aniState*2, 0);
        player.hidden = 0;
    }
    
}

void updateWeapon() {
    // Button Input 
    if (!collision(player.col, player.row, player.width, player.height, 0, 120, 16, 16) && BUTTON_PRESSED(BUTTON_B)){
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
    
    // Weapon Sprite
    shadowOAM[1].attr0 = (weapon.row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[1].attr1 = (weapon.col & COLMASK) | ATTR1_MEDIUM;
    shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(weapon.state*4, 2);

    weapon.timer++;
}

void updateGhost() {
    if (!ghost.active && BUTTON_PRESSED(BUTTON_R)) {
        ghost.col = 0;
        ghost.row = 0;
        ghost.path = 0;
        ghost.alert = 0;
        ghost.active = 1;
    }
    if (ghost.active && timer % 100 == 0) {
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
            }
        }
        } else {
            chase();
        }
        if (!player.hidden && collision(player.col - 16, player.row - 16, player.width*3, player.height*3, ghost.col, ghost.row, ghost.width, ghost.height)) {
            ghost.alert = 1;
        }
        shadowOAM[2].attr0 = (ghost.row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[2].attr1 = (ghost.col & COLMASK) | ATTR1_SMALL;
        shadowOAM[2].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(ghost.aniState*2, 6);
    } else if (!ghost.active) {
        shadowOAM[2].attr0 = (ghost.row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[2].attr1 = (ghost.col & COLMASK) | ATTR1_SMALL;
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

