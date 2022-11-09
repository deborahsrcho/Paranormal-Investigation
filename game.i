# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "game.h" 1
typedef struct {
    int row;
    int col;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int curFrame;
    int numFrames;
    int hidden;
} PLAYER;
typedef struct {
    int row;
    int col;
    int width;
    int height;
    int state;
    int active;
    int timer;
} WEAPON;
typedef struct {
    int row;
    int col;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int active;
    int curFrame;
    int numFrames;
    int alert;
    int path;
} ENEMY;

enum { SPRITEFRONT, SPRITEBACK, SPRITERIGHT, SPRITELEFT};
extern void goToLose();
extern void goToWin();

extern PLAYER player;
extern WEAPON weapon;
extern ENEMY ghost;
int timer;
int path;

void initGame();
void updateGame();
void animate();
void updatePlayer();
void initPlayer();
void initGhost();
void updateGhost();
void chase();
void updateWeapon();
# 2 "game.c" 2
# 1 "gba.h" 1





typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;





int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 41 "gba.h"
extern volatile unsigned short *videoBuffer;
# 66 "gba.h"
void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);
void waitForVBlank();





void flipPage();
void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);
# 118 "gba.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;
# 147 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 158 "gba.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 198 "gba.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);





typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 255 "gba.h"
void hideSprites();






typedef struct {
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
} ANISPRITE;
# 311 "gba.h"
typedef void (*ihp)(void);
# 3 "game.c" 2

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
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), sizeof(shadowOAM)/2);
}


void initPlayer() {
    player.width = 16;
    player.height = 16;
    player.cdel = 1;
    player.rdel = 1;
    player.col = 240/2 - player.width/2;
    player.row = 160/2 - player.height/2;
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

    if (!player.hidden && timer % 50 == 0) {
        if((~((*(volatile unsigned short *)0x04000130)) & ((1<<6))) && player.row > 1) {
            player.aniState = SPRITEBACK;
            player.row -= player.rdel;
        } else if((~((*(volatile unsigned short *)0x04000130)) & ((1<<7))) && player.row + player.height < 160) {
            player.aniState = SPRITEFRONT;
            player.row += player.rdel;
        } else if((~((*(volatile unsigned short *)0x04000130)) & ((1<<5))) && player.col > 0) {
            player.aniState = SPRITELEFT;
            player.col -= player.cdel;
        } else if((~((*(volatile unsigned short *)0x04000130)) & ((1<<4))) && player.col + player.width < 240) {
            player.aniState = SPRITERIGHT;
            player.col += player.cdel;
        }
    }

    if (!ghost.alert && collision(player.col, player.row, player.width, player.height, 0, 120, 16, 16) && (~((*(volatile unsigned short *)0x04000130)) & ((1<<1)))) {
        shadowOAM[0].attr0 = (player.row & 0xFF) | (0 << 13) | (0 << 14);
        shadowOAM[0].attr1 = (player.col & 0x1FF) | (1 << 14);
        shadowOAM[0].attr2 = ((0)<<12) | ((0)*32+(9));
        player.hidden = 1;
    } else {
        shadowOAM[0].attr0 = (player.row & 0xFF) | (0 << 13) | (0 << 14);
        shadowOAM[0].attr1 = (player.col & 0x1FF) | (1 << 14);
        shadowOAM[0].attr2 = ((0)<<12) | ((0)*32+(player.aniState*2));
        player.hidden = 0;
    }

}

void updateWeapon() {

    if (!collision(player.col, player.row, player.width, player.height, 0, 120, 16, 16) && (!(~(oldButtons) & ((1<<1))) && (~buttons & ((1<<1))))){

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


    shadowOAM[1].attr0 = (weapon.row & 0xFF) | (0 << 13) | (0 << 14);
    shadowOAM[1].attr1 = (weapon.col & 0x1FF) | (2 << 14);
    shadowOAM[1].attr2 = ((0)<<12) | ((2)*32+(weapon.state*4));

    weapon.timer++;
}

void updateGhost() {
    if (!ghost.active && (!(~(oldButtons) & ((1<<8))) && (~buttons & ((1<<8))))) {
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
        shadowOAM[2].attr0 = (ghost.row & 0xFF) | (0 << 13) | (0 << 14);
        shadowOAM[2].attr1 = (ghost.col & 0x1FF) | (1 << 14);
        shadowOAM[2].attr2 = ((0)<<12) | ((6)*32+(ghost.aniState*2));
    } else if (!ghost.active) {
        shadowOAM[2].attr0 = (ghost.row & 0xFF) | (0 << 13) | (0 << 14);
        shadowOAM[2].attr1 = (ghost.col & 0x1FF) | (1 << 14);
        shadowOAM[2].attr2 = ((0)<<12) | ((6)*32+(9));
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
