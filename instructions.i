# 1 "instructions.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "instructions.c"
# 1 "instructions.h" 1
int page;

void initInstructions();
void updatePage();
# 2 "instructions.c" 2
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
# 3 "instructions.c" 2
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
# 4 "instructions.c" 2
# 1 "instructionsPg1.h" 1
# 22 "instructionsPg1.h"
extern const unsigned short instructionsPg1Tiles[6224];


extern const unsigned short instructionsPg1Map[1024];


extern const unsigned short instructionsPg1Pal[256];
# 5 "instructions.c" 2
# 1 "instructionsPg2.h" 1
# 22 "instructionsPg2.h"
extern const unsigned short instructionsPg2Tiles[6336];


extern const unsigned short instructionsPg2Map[1024];


extern const unsigned short instructionsPg2Pal[256];
# 6 "instructions.c" 2
# 1 "instructionsPg3.h" 1
# 22 "instructionsPg3.h"
extern const unsigned short instructionsPg3Tiles[6368];


extern const unsigned short instructionsPg3Map[1024];


extern const unsigned short instructionsPg3Pal[256];
# 7 "instructions.c" 2

void initInstructions() {
    page = 0;
}

void updatePage() {
    if ((!(~(oldButtons) & ((1<<5))) && (~buttons & ((1<<5))))) {
        page--;
    }
    if ((!(~(oldButtons) & ((1<<4))) && (~buttons & ((1<<4))))) {
        page++;
    }
    if (page > 2) {
        page = 0;
    }
    if (page < 0) {
        page = 2;
    }

    if (page == 0) {
        DMANow(3, instructionsPg1Tiles, &((charblock *)0x6000000)[0], 12448 / 2);
        DMANow(3, instructionsPg1Pal, ((unsigned short *)0x5000000), 512 / 2);
        DMANow(3, instructionsPg1Map, &((screenblock *)0x6000000)[31], 1024);
    } else if (page == 1) {
        DMANow(3, instructionsPg2Tiles, &((charblock *)0x6000000)[0], 12672 / 2);
        DMANow(3, instructionsPg2Pal, ((unsigned short *)0x5000000), 512 / 2);
        DMANow(3, instructionsPg2Map, &((screenblock *)0x6000000)[31], 1024);
    } else {
        DMANow(3, instructionsPg3Tiles, &((charblock *)0x6000000)[0], 12736 / 2);
        DMANow(3, instructionsPg3Pal, ((unsigned short *)0x5000000), 512 / 2);
        DMANow(3, instructionsPg3Map, &((screenblock *)0x6000000)[31], 1024);
    }
}
