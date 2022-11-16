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
    int equipped;
} PLAYER;
typedef struct {
    int row;
    int col;
    int width;
    int height;
    int state;
    int active;
    int equipped;
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
    int route;
    int path;
    int type;
} ENEMY;
typedef struct {
    int row;
    int col;
    int width;
    int height;
    int state;
    int equipped;
} EMF;
typedef struct {
    int row;
    int col;
    int width;
    int height;
    int active;
    int state;
    int randvar;
    int clue;
} EQUIPMENT;
typedef struct {
    int row;
    int col;
    int width;
    int height;
    int active;
    int state;
    int randvar;
    int temperature;
} THERMOMETER;
typedef struct {
    int row;
    int col;
    int width;
    int height;
} GHOSTSPOT;

enum { SPRITEFRONT, SPRITEBACK, SPRITERIGHT, SPRITELEFT};
enum { DEMON, JINN, ONI, POLTERGEIST, BANSHEE, WRAITH };
extern void goToLose();
extern void goToWin();



extern PLAYER player;
extern WEAPON weapon;
extern ENEMY ghost;
extern GHOSTSPOT ghostspot;
extern EMF EMFReader;
extern THERMOMETER thermometer;
extern EQUIPMENT ghostbook;
extern EQUIPMENT videocam;
extern EQUIPMENT spiritbox;
extern EQUIPMENT uvlight;
extern GHOSTSPOT ghostspot;
int path;
int vOff;
int hOff;
int sanityTimer;
int sanity;
int seconds;
int buttonTimer;

int ones;
int tens;

void initGame();
void updateGame();
void animate();
void updatePlayer();
void initPlayer();
void initGhost();
void updateGhost();
void chase();
void updateWeapon();
void updateSanity();
void drawSanity();
void drawGame();
void drawPlayer();
void drawWeapon();
void drawGhost();
void initEquipment();
void initghostSpot();
void updateEMFReader();
void drawEMFReader();
void drawEquipment();
void interruptHandler();
void enableTimerInterrupts();
void setupInterrupts();
void updateThermometer();
void updateUVLight();
void updateGhostbook();
void updateVideoCam();
void updateSpiritBox();
# 2 "game.c" 2
# 1 "gba.h" 1





typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;





int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
int collisionCheck(unsigned char *collisionMap, int mapWidth, int col, int row);
# 42 "gba.h"
extern volatile unsigned short *videoBuffer;
# 67 "gba.h"
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
# 119 "gba.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;
# 148 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 159 "gba.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 199 "gba.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);





typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 256 "gba.h"
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
# 312 "gba.h"
typedef void (*ihp)(void);
# 3 "game.c" 2
# 1 "collisionmap.h" 1
# 21 "collisionmap.h"
extern const unsigned short collisionmapBitmap[65536];


extern const unsigned short collisionmapPal[256];
# 4 "game.c" 2


OBJ_ATTR shadowOAM[128];
PLAYER player;
WEAPON weapon;
ENEMY ghost;
EMF EMFReader;
THERMOMETER thermometer;
EQUIPMENT ghostbook;
EQUIPMENT videocam;
EQUIPMENT spiritbox;
EQUIPMENT uvlight;
GHOSTSPOT ghostspot;

unsigned char* collisionMap = (unsigned char*) collisionmapBitmap;

void initGame() {
    seconds = 0;
    sanity = 0;
    sanityTimer = 0;
    buttonTimer = 0;
    hOff = 0;
    vOff = 0;
    setupInterrupts();
    initPlayer();
    initGhost();
    initghostSpot();
    initEquipment();
}

void updateGame() {
    updatePlayer();
    updateSanity();
    updateGhost();
    updateWeapon();
    updateEMFReader();
    updateThermometer();
    updateUVLight();
    updateGhostbook();
    updateVideoCam();
    updateSpiritBox();
    (*(volatile unsigned short *)0x04000010) = hOff;
    (*(volatile unsigned short *)0x04000012) = vOff;
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), sizeof(shadowOAM)/2);
}

void drawGame() {
    drawPlayer();
    drawWeapon();
    drawGhost();
    drawEMFReader();
    drawEquipment();
    drawSanity();
}

void interruptHandler() {
  *(unsigned short*)0x4000208 = 0;
  if (*(volatile unsigned short*)0x4000202 & 1<<3) {
    sanityTimer++;
  }
  if (*(volatile unsigned short*)0x4000202 & 1<<4) {
    seconds++;
    if (seconds % 5 == 0) {
        thermometer.randvar = rand() % 3;
        ghostbook.randvar = rand() % 5;
        videocam.randvar = rand() % 5;
        spiritbox.randvar = rand() % 5;
    }
  }
  *(volatile unsigned short*)0x4000202 = *(volatile unsigned short*)0x4000202;
  *(unsigned short*)0x4000208 = 1;
}
void enableTimerInterrupts() {
  *(unsigned short*)0x4000200 = 1<<3 | 1<<4;

  *(volatile unsigned short*)0x4000102 = 0;
  *(volatile unsigned short*)0x4000100 = 0;
  *(volatile unsigned short*)0x4000102 = 2 | (1<<7) | (1<<6);

  *(volatile unsigned short*)0x4000106 = 0;
  *(volatile unsigned short*)0x4000104 = 0;
  *(volatile unsigned short*)0x4000106 = 2 | (1<<7) | (1<<6);
}

void setupInterrupts() {
  *(unsigned short*)0x4000208 = 0;
  *((ihp*)0x03007FFC) = interruptHandler;
  enableTimerInterrupts();
  *(unsigned short*)0x4000208 = 1;
}


void initPlayer() {
    player.width = 16;
    player.height = 16;
    player.cdel = 1;
    player.rdel = 1;
    player.col = 240/2 - player.width/2 + hOff;
    player.row = 160/2 - player.height/2 + vOff;
    player.aniCounter = 0;
    player.curFrame = 0;
    player.numFrames = 2;
    player.aniState = SPRITEFRONT;
    player.hidden = 0;
    player.equipped = 0;

    weapon.col = player.col + 1;
    weapon.row = player.row;
    weapon.width = 16;
    weapon.height = 8;
    weapon.active = 0;
    weapon.state = SPRITEFRONT;
    weapon.timer = 0;
    weapon.equipped = 0;
}

void initEquipment() {
    EMFReader.row = 0;
    EMFReader.col = 0;
    EMFReader.width = 16;
    EMFReader.height = 16;
    EMFReader.state = 0;
    EMFReader.equipped = 0;

    thermometer.row = ghostspot.row;
    thermometer.col = ghostspot.col + 8;
    thermometer.width = 8;
    thermometer.height = 8;
    thermometer.active = 0;
    thermometer.state = 0;
    thermometer.randvar = 0;
    thermometer.temperature = 18;

    ghostbook.row = thermometer.row;
    ghostbook.col = thermometer.col + 16;
    ghostbook.width = 8;
    ghostbook.height = 8;
    ghostbook.active = 0;
    ghostbook.state = 0;
    ghostbook.randvar = 0;
    ghostbook.clue = 0;

    videocam.row = ghostbook.row;
    videocam.col = ghostbook.col + 16;
    videocam.width = 8;
    videocam.height = 8;
    videocam.active = 0;
    videocam.state = 0;
    videocam.randvar = 0;
    videocam.clue = 0;

    spiritbox.row = thermometer.row + 16;
    spiritbox.col = thermometer.col;
    spiritbox.width = 8;
    spiritbox.height = 8;
    spiritbox.active = 0;
    spiritbox.state = 0;
    spiritbox.randvar = 0;
    spiritbox.clue = 0;

    uvlight.row = videocam.row + 16;
    uvlight.col = videocam.col;
    uvlight.width = 8;
    uvlight.height = 8;
    uvlight.active = 0;
    uvlight.state = 0;
    uvlight.randvar = 0;
    uvlight.clue = 0;
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
    ghost.route = 1;
    ghost.type = JINN;
}

void initghostSpot() {
    ghostspot.col = 0;
    ghostspot.row = 140;
    ghostspot.width = 64;
    ghostspot.height = 64;
}

void updatePlayer() {

    if (!player.hidden && buttonTimer % 50 == 0) {
        if((~((*(volatile unsigned short *)0x04000130)) & ((1<<6))) && player.row > 1) {
            player.aniState = SPRITEBACK;
            player.row -= player.rdel;
            if (player.row - vOff <= 160/2 && vOff - 1 >= 0) {
                vOff--;
            }
        } else if((~((*(volatile unsigned short *)0x04000130)) & ((1<<7))) && player.row + player.height < 256) {
            player.aniState = SPRITEFRONT;
            player.row += player.rdel;
            if (player.row - vOff >= 160/2 && (vOff + 1) < (256 - 160)) {
                vOff++;
            }
        } else if((~((*(volatile unsigned short *)0x04000130)) & ((1<<5))) && player.col > 0) {
            player.aniState = SPRITELEFT;
            player.col -= player.cdel;
            if (player.col - hOff <= 240/2 && hOff - 1 >= 0) {
                hOff--;
            }
        } else if((~((*(volatile unsigned short *)0x04000130)) & ((1<<4))) && player.col + player.width < 512) {
            player.aniState = SPRITERIGHT;
            player.col += player.cdel;
            if (player.col - hOff >= 240/2 && (hOff + 1) < (512 - 240)) {
                hOff++;
            }
        }
    }

    if (!ghost.alert && (!collisionCheck(collisionMap, 512, player.col, player.row) | !collisionCheck(collisionMap, 512, player.col + player.width-1, player.row)
    | !collisionCheck(collisionMap, 512, player.col, player.row + player.height-1) | !collisionCheck(collisionMap, 512, player.col + player.width-1, player.row + player.height-1))
    && (!(~(oldButtons) & ((1<<1))) && (~buttons & ((1<<1))))) {
        if (player.hidden == 0) {
            player.hidden = 1;
        } else {
            player.hidden = 0;
        }
    }

    if ((!(~(oldButtons) & ((1<<0))) && (~buttons & ((1<<0))))) {
        player.equipped++;
        if (player.equipped >= 3) {
            player.equipped = 0;
        }
        if (player.equipped == 1) {
            weapon.equipped = 0;
            EMFReader.equipped = 1;
        } else if (player.equipped == 2) {
            EMFReader.equipped = 0;
            weapon.equipped = 1;
            shadowOAM[3].attr0 = (2 << 8);
        } else if (player.equipped == 0) {
            EMFReader.equipped = 0;
            weapon.equipped = 0;
            shadowOAM[3].attr0 = (2 << 8);
        }
    }

    if ((!(~(oldButtons) & ((1<<1))) && (~buttons & ((1<<1)))) && !ghost.active && EMFReader.state >= 3 && thermometer.active == 0) {
        thermometer.active = 1;
        thermometer.row = player.row - 8;
        thermometer.col = player.col - 10;
        ghostbook.active = 1;
        ghostbook.row = thermometer.row;
        ghostbook.col = thermometer.col + 16;
        videocam.active = 1;
        videocam.row = ghostbook.row;
        videocam.col = ghostbook.col + 16;
        spiritbox.active = 1;
        spiritbox.row = thermometer.row + 16;
        spiritbox.col = thermometer.col;
        uvlight.active = 1;
        uvlight.row = videocam.row + 16;
        uvlight.col = videocam.col;
    }
    buttonTimer++;
}

void drawPlayer() {
    if (player.hidden) {
        shadowOAM[0].attr0 = ((player.row - vOff) & 0xFF) | (0 << 13) | (0 << 14);
        shadowOAM[0].attr1 = ((player.col - hOff) & 0x1FF) | (1 << 14);
        shadowOAM[0].attr2 = ((0)<<12) | ((0)*32+(9));
    } else {
        shadowOAM[0].attr0 = ((player.row - vOff) & 0xFF) | (0 << 13) | (0 << 14);
        shadowOAM[0].attr1 = ((player.col - hOff) & 0x1FF) | (1 << 14);
        shadowOAM[0].attr2 = ((0)<<12) | ((0)*32+(player.aniState*2));
        player.hidden = 0;
    }

}

void updateEMFReader() {
    if (ghost.active) {
        if (ghost.type == JINN || ghost.type == ONI || ghost.type == WRAITH) {
                EMFReader.state = 4;
            } else {
                EMFReader.state = 3;
            }
    } else {
        if (collision(player.col, player.row, player.width, player.height, ghostspot.col, ghostspot.row, ghostspot.width, ghostspot.height)) {
            EMFReader.state = 3;
        } else if (collision(player.col, player.row, player.width, player.height, ghostspot.col - 48, ghostspot.row - 48, ghostspot.width + 96, ghostspot.height + 96)) {
            EMFReader.state = 2;
        } else if (collision(player.col, player.row, player.width, player.height, ghostspot.col - 96, ghostspot.row - 96, ghostspot.width + 192, ghostspot.height + 192)) {
            EMFReader.state = 1;
        } else {
            EMFReader.state = 0;
        }
    }
}

void drawEMFReader() {
    if (EMFReader.equipped) {
        shadowOAM[3].attr0 = ((10) & 0xFF) | (0 << 13) | (0 << 14);
        shadowOAM[3].attr1 = ((10) & 0x1FF) | (1 << 14);
        shadowOAM[3].attr2 = ((0)<<12) | ((8)*32+(EMFReader.state*2));
    }
}

void drawEquipment() {
    if (thermometer.active) {
        shadowOAM[4].attr0 = ((thermometer.row - vOff) & 0xFF) | (0 << 13) | (0 << 14);
        shadowOAM[4].attr1 = ((thermometer.col - hOff) & 0x1FF) | (0 << 14);
        shadowOAM[4].attr2 = ((0)<<12) | ((10)*32+(0));

        shadowOAM[5].attr0 = ((ghostbook.row - vOff) & 0xFF) | (0 << 13) | (0 << 14);
        shadowOAM[5].attr1 = ((ghostbook.col - hOff) & 0x1FF) | (0 << 14);
        shadowOAM[5].attr2 = ((0)<<12) | ((10)*32+(1));

        shadowOAM[6].attr0 = ((videocam.row - vOff) & 0xFF) | (0 << 13) | (0 << 14);
        shadowOAM[6].attr1 = ((videocam.col - hOff) & 0x1FF) | (0 << 14);
        shadowOAM[6].attr2 = ((0)<<12) | ((10)*32+(2));

        shadowOAM[7].attr0 = ((spiritbox.row - vOff) & 0xFF) | (0 << 13) | (0 << 14);
        shadowOAM[7].attr1 = ((spiritbox.col - hOff) & 0x1FF) | (0 << 14);
        shadowOAM[7].attr2 = ((0)<<12) | ((10)*32+(3));

        shadowOAM[8].attr0 = ((uvlight.row - vOff) & 0xFF) | (0 << 13) | (0 << 14);
        shadowOAM[8].attr1 = ((uvlight.col - hOff) & 0x1FF) | (0 << 14);
        shadowOAM[8].attr2 = ((0)<<12) | ((10)*32+(4));
    }
}
void updateWeapon() {

    if (weapon.equipped) {
        if ((!(~(oldButtons) & ((1<<1))) && (~buttons & ((1<<1))))){

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


        weapon.timer++;
    }
}
void drawWeapon() {
    if(weapon.equipped) {
        shadowOAM[1].attr0 = ((weapon.row - vOff) & 0xFF) | (0 << 13) | (0 << 14);
        shadowOAM[1].attr1 = ((weapon.col - hOff) & 0x1FF) | (2 << 14);
        shadowOAM[1].attr2 = ((0)<<12) | ((2)*32+(weapon.state*4));
        shadowOAM[3].attr2 = ((0)<<12) | ((8)*32+(10));
    }
}

void updateGhost() {
    if (!ghost.active && (!(~(oldButtons) & ((1<<8))) && (~buttons & ((1<<8))))) {
        ghost.col = 0;
        ghost.row = 0;
        ghost.path = 0;
        ghost.alert = 0;
        ghost.active = 1;
    }
    if (ghost.active && buttonTimer % 100 == 0) {
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
                    ghost.path = 0;
                }
        }
        } else {
            chase();
        }
        if (!player.hidden && collision(player.col - 16, player.row - 16, player.width*3, player.height*3, ghost.col, ghost.row, ghost.width, ghost.height)) {
            ghost.alert = 1;
        }
    }

}
void drawGhost() {
    if (ghost.active && buttonTimer % 100 == 0) {
        shadowOAM[2].attr0 = ((ghost.row - vOff) & 0xFF) | (0 << 13) | (0 << 14);
        shadowOAM[2].attr1 = ((ghost.col - hOff) & 0x1FF) | (1 << 14);
        shadowOAM[2].attr2 = ((0)<<12) | ((6)*32+(ghost.aniState*2));
    } else if (!ghost.active) {
        shadowOAM[2].attr0 = ((ghost.row - vOff) & 0xFF) | (0 << 13) | (0 << 14);
        shadowOAM[2].attr1 = ((ghost.col - hOff) & 0x1FF) | (1 << 14);
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

void updateSanity() {
    if (sanity >= 10 && sanityTimer < 3) {
        ghost.col = 0;
        ghost.row = 0;
        ghost.path = 0;
        ghost.alert = 0;
    } else if (sanity >= 10 && sanityTimer > 3) {
        ghost.active = 1;
    }
    if (!ghost.active && sanityTimer % 10 == 0 && sanityTimer > 0) {
        sanity++;
        sanityTimer = 0;
    }
    if (ghost.active) {
        *(volatile unsigned short*)0x4000102 = 0;
        sanityTimer = 0;
        sanity = 0;
    } else {
        *(volatile unsigned short*)0x4000102 = 2 | (1<<7) | (1<<6);
    }
}

void drawSanity() {

    tens = (sanity % 100)/10;
    ones = ((sanity % 100) % 10);
    shadowOAM[11].attr0 = ((10) & 0xFF) | (0 << 13) | (0 << 14);
    shadowOAM[11].attr1 = ((240 - 16 - 10) & 0x1FF) | (1 << 14);
    shadowOAM[11].attr2 = ((0)<<12) | ((8)*32+(8));

    shadowOAM[10].attr0 = ((12) & 0xFF) | (0 << 13) | (0 << 14);
    shadowOAM[10].attr1 = ((240 - 16 - 10) & 0x1FF) | (0 << 14);
    shadowOAM[10].attr2 = ((0)<<12) | ((11)*32+(tens));

    shadowOAM[9].attr0 = ((12) & 0xFF) | (0 << 13) | (0 << 14);
    shadowOAM[9].attr1 = ((240 - 16 - 10 + 8) & 0x1FF) | (0 << 14);
    shadowOAM[9].attr2 = ((0)<<12) | ((11)*32+(ones));
}

void updateThermometer() {
    if (thermometer.randvar == 3) {
        if (thermometer.temperature > 0 && ((ghost.type == DEMON) | (ghost.type == ONI) | (ghost.type == WRAITH))) {
            thermometer.temperature -= 3;
        } else if (thermometer.temperature > 5) {
            thermometer.temperature -= 3;
        }
    }

    if (player.equipped == 0 && (!(~(oldButtons) & ((1<<1))) && (~buttons & ((1<<1))))
    && collision(player.col, player.row, player.width, player.height, thermometer.col, thermometer.row, thermometer.width, thermometer.height)) {

    }
}

void updateUVLight() {
    if (uvlight.active) {
        if (ghost.type == DEMON | ghost.type == JINN | ghost.type == POLTERGEIST) {
            uvlight.clue = 1;
            shadowOAM[12].attr0 = ((uvlight.row + 10 - vOff) & 0xFF) | (0 << 13) | (0 << 14);
            shadowOAM[12].attr1 = ((uvlight.col + 10 - hOff) & 0x1FF) | (0 << 14);
            shadowOAM[12].attr2 = ((0)<<12) | ((10)*32+(5));
        }
    }
}

void updateGhostbook() {
    if (ghostbook.randvar == 3) {
        if (ghost.type == DEMON | ghost.type == BANSHEE | ghost.type == POLTERGEIST) {
            ghostbook.clue = 1;
        }
    }

    if (player.equipped == 0 && (!(~(oldButtons) & ((1<<1))) && (~buttons & ((1<<1))))
    && collision(player.col, player.row, player.width, player.height, ghostbook.col, ghostbook.row, ghostbook.width, ghostbook.height)) {

    }
}

void updateVideoCam() {
    if (videocam.randvar == 3) {
        if (ghost.type == ONI | ghost.type == BANSHEE | ghost.type == WRAITH) {
            videocam.clue = 1;
        }
    }
    if (player.equipped == 0 && (!(~(oldButtons) & ((1<<1))) && (~buttons & ((1<<1))))
    && collision(player.col, player.row, player.width, player.height, videocam.col, videocam.row, videocam.width, videocam.height)) {

    }
}

void updateSpiritBox() {
    if (spiritbox.randvar == 3) {
        if (ghost.type == JINN | ghost.type == BANSHEE | ghost.type == POLTERGEIST) {
            spiritbox.clue = 1;
        }
    }
    if (player.equipped == 0 && (!(~(oldButtons) & ((1<<1))) && (~buttons & ((1<<1))))
    && collision(player.col, player.row, player.width, player.height, spiritbox.col, spiritbox.row, spiritbox.width, spiritbox.height)) {

    }
}
