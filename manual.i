# 1 "manual.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "manual.c"
# 1 "game.h" 1
typedef struct {
    int row;
    int col;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int idle;
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
    int type;
    int caught;
    int distance;
    int rowPrev;
    int colPrev;
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
    int checking;
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
    int checking;
} THERMOMETER;
typedef struct {
    int row;
    int col;
    int width;
    int height;
    int active;
    int equipped;
    int state;
    int timer;
} CAMERA;
typedef struct {
    int location;
    int row;
    int col;
    int width;
    int height;
} GHOSTSPOT;
typedef struct {
    int row;
    int col;
    int height;
    int width;
    int caught;
} OCCURRENCE;

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
extern CAMERA camera;
extern OCCURRENCE occurrences[5];
extern OCCURRENCE items[6];
extern int screenBlock;
extern int cheat;
int path;
int vOff;
int hOff;
int sanityTimer;
int sanity;
int seconds;
int orbTimer;
int score;
int occurrencesCaught;
int itemsCollected;
int ghostBanished;
int orbCol;
int orbRow;

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

void initOccurrences();
void drawOccurrences();
void updateCamera();
void drawCamera();
void hideText();

void initItems();
void drawItems();
void updateItems();
void ghostMovement();
# 2 "manual.c" 2
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
# 258 "gba.h"
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
# 314 "gba.h"
typedef void (*ihp)(void);
# 3 "manual.c" 2
# 1 "manual.h" 1
typedef struct {
    int row;
    int col;
    int type;
} CURSOR;

extern CURSOR cursor;
int checkTile;
int emptyTile;

void initCursor();
void updateCursor();
# 4 "manual.c" 2

CURSOR cursor;

void initCursor() {
    cursor.col = 3;
    cursor.row = 4;
    checkTile = ((screenblock *)0x6000000)[20].tilemap[((cursor.row) * (32) + (cursor.col))];
    emptyTile = ((screenblock *)0x6000000)[20].tilemap[((9) * (32) + (3))];
}

void updateCursor() {
   if ((!(~(oldButtons) & ((1<<5))) && (~buttons & ((1<<5))))) {
        cursor.type--;
    }
    if ((!(~(oldButtons) & ((1<<4))) && (~buttons & ((1<<4))))) {
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
        ((screenblock *)0x6000000)[20].tilemap[((cursor.row) * (32) + (cursor.col))] = checkTile;
    } else {
        ((screenblock *)0x6000000)[20].tilemap[((4) * (32) + (3))] = emptyTile;
    }
    if (cursor.type == JINN) {
        cursor.col = 3;
        cursor.row = 9;
        ((screenblock *)0x6000000)[20].tilemap[((cursor.row) * (32) + (cursor.col))] = checkTile;
    } else {
        ((screenblock *)0x6000000)[20].tilemap[((9) * (32) + (3))] = emptyTile;
    }
    if (cursor.type == ONI) {
        cursor.col = 3;
        cursor.row = 14;
        ((screenblock *)0x6000000)[20].tilemap[((cursor.row) * (32) + (cursor.col))] = checkTile;
    } else {
        ((screenblock *)0x6000000)[20].tilemap[((14) * (32) + (3))] = emptyTile;
    }
    if (cursor.type == POLTERGEIST) {
        cursor.col = 16;
        cursor.row = 4;
        ((screenblock *)0x6000000)[20].tilemap[((cursor.row) * (32) + (cursor.col))] = checkTile;
    } else {
        ((screenblock *)0x6000000)[20].tilemap[((4) * (32) + (16))] = emptyTile;
    }
    if (cursor.type == BANSHEE) {
        cursor.col = 16;
        cursor.row = 9;
        ((screenblock *)0x6000000)[20].tilemap[((cursor.row) * (32) + (cursor.col))] = checkTile;
    } else {
        ((screenblock *)0x6000000)[20].tilemap[((9) * (32) + (16))] = emptyTile;
    }
    if (cursor.type == WRAITH) {
        cursor.col = 16;
        cursor.row = 14;
        ((screenblock *)0x6000000)[20].tilemap[((cursor.row) * (32) + (cursor.col))] = checkTile;
    } else {
        ((screenblock *)0x6000000)[20].tilemap[((14) * (32) + (16))] = emptyTile;
    }

}
