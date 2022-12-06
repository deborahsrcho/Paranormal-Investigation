# 1 "win.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "win.c"
# 1 "win.h" 1
extern int score;
int rank;
int rankCol;
int medalRow;
int scoreRow;
int scoreCol;
int aniTimer;

enum {GOLD, SILVER, BRONZE};

void calculateRank();
void updateWin();
# 2 "win.c" 2
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
# 3 "win.c" 2
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
# 4 "win.c" 2
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
# 5 "win.c" 2

extern OBJ_ATTR shadowOAM[128];

void updateWin() {
    if (aniTimer % 20 == 0) {
        if (scoreCol < (240/2 - 64)) {
            scoreCol++;
        }
        if (scoreCol == (240/2 - 64) && scoreRow < (160/2 - 4)) {
            scoreRow++;
        }
        if (scoreRow == (160/2 - 4) && rankCol < (240/2 - 64)) {
            rankCol++;
        }
        if (rankCol == (240/2 - 64) && medalRow < (160/2 + 8)) {
            medalRow++;
        }
    }
    shadowOAM[38].attr0 = ((160/2 - 4 + 24) & 0xFF) | (0 << 13) | (1 << 14);
    shadowOAM[38].attr1 = ((rankCol) & 0x1FF) | (1 << 14);
    shadowOAM[38].attr2 = ((0)<<12) | ((15)*32+(18));
    shadowOAM[39].attr0 = ((medalRow) & 0xFF) | (0 << 13) | (0 << 14);
    shadowOAM[39].attr1 = ((240/2 - 32) & 0x1FF) | (2 << 14);
    shadowOAM[39].attr2 = ((0)<<12) | ((8)*32+(8 + rank*4));

    shadowOAM[54].attr0 = ((160/2 - 4) & 0xFF) | (0 << 13) | (1 << 14);
    shadowOAM[54].attr1 = ((scoreCol) & 0x1FF) | (1 << 14);
    shadowOAM[54].attr2 = ((0)<<12) | ((13)*32+(22));
    shadowOAM[55].attr0 = ((scoreRow) & 0xFF) | (0 << 13) | (0 << 14);
    shadowOAM[55].attr1 = (((240/2 - 64) + 28) & 0x1FF) | (0 << 14);
    shadowOAM[55].attr2 = ((0)<<12) | ((16)*32+((score / 1000)));
    shadowOAM[56].attr0 = ((scoreRow) & 0xFF) | (0 << 13) | (0 << 14);
    shadowOAM[56].attr1 = (((240/2 - 64) + 28 + 8) & 0x1FF) | (0 << 14);
    shadowOAM[56].attr2 = ((0)<<12) | ((16)*32+((score % 1000) / 100));
    shadowOAM[57].attr0 = ((scoreRow) & 0xFF) | (0 << 13) | (1 << 14);
    shadowOAM[57].attr1 = (((240/2 - 64) + 28 + 16) & 0x1FF) | (0 << 14);
    shadowOAM[57].attr2 = ((0)<<12) | ((16)*32+(12));

    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), sizeof(shadowOAM)/2);
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
