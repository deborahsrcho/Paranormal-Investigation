# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 30 "main.c"
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
# 31 "main.c" 2
# 1 "print.h" 1
# 26 "print.h"
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3 4







# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3 4
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3 4
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 2 3 4
# 9 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 2 3 4
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4

# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 2 3 4
# 27 "print.h" 2
# 36 "print.h"

# 36 "print.h"
void mgba_printf_level(int level, const char* ptr, ...);
void mgba_printf(const char* string, ...);
void mgba_break(void);
uint8_t mgba_open(void);
void mgba_close(void);
# 32 "main.c" 2
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
# 33 "main.c" 2
# 1 "startBg.h" 1
# 22 "startBg.h"
extern const unsigned short startBgTiles[8000];


extern const unsigned short startBgMap[1024];


extern const unsigned short startBgPal[256];
# 34 "main.c" 2
# 1 "instructionsPg1.h" 1
# 22 "instructionsPg1.h"
extern const unsigned short instructionsPg1Tiles[6224];


extern const unsigned short instructionsPg1Map[1024];


extern const unsigned short instructionsPg1Pal[256];
# 35 "main.c" 2
# 1 "instructionsPg2.h" 1
# 22 "instructionsPg2.h"
extern const unsigned short instructionsPg2Tiles[6336];


extern const unsigned short instructionsPg2Map[1024];


extern const unsigned short instructionsPg2Pal[256];
# 36 "main.c" 2
# 1 "instructionsPg3.h" 1
# 22 "instructionsPg3.h"
extern const unsigned short instructionsPg3Tiles[6368];


extern const unsigned short instructionsPg3Map[1024];


extern const unsigned short instructionsPg3Pal[256];
# 37 "main.c" 2
# 1 "manualBg.h" 1
# 22 "manualBg.h"
extern const unsigned short manualBgTiles[6160];


extern const unsigned short manualBgMap[1024];


extern const unsigned short manualBgPal[256];
# 38 "main.c" 2
# 1 "pauseBg.h" 1
# 22 "pauseBg.h"
extern const unsigned short pauseBgTiles[7488];


extern const unsigned short pauseBgMap[1024];


extern const unsigned short pauseBgPal[256];
# 39 "main.c" 2
# 1 "winBg.h" 1
# 22 "winBg.h"
extern const unsigned short winBgTiles[6864];


extern const unsigned short winBgMap[1024];


extern const unsigned short winBgPal[256];
# 40 "main.c" 2
# 1 "loseBg.h" 1
# 22 "loseBg.h"
extern const unsigned short loseBgTiles[7664];


extern const unsigned short loseBgMap[1024];


extern const unsigned short loseBgPal[256];
# 41 "main.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 42 "main.c" 2
# 1 "background.h" 1
# 22 "background.h"
extern const unsigned short backgroundTiles[27264];


extern const unsigned short backgroundMap[6144];


extern const unsigned short backgroundPal[256];
# 43 "main.c" 2
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
# 44 "main.c" 2
# 1 "sound.h" 1
void setupSounds();
void playSoundA(const signed char* sound, int length, int loops);
void playSoundB(const signed char* sound, int length, int loops);

void setupInterrupts();
void interruptHandler();

void pauseSound();
void unpauseSound();
void stopSound();
# 49 "sound.h"
typedef struct{
    const signed char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vBlankCount;
} SOUND;

SOUND soundA;
SOUND soundB;
# 45 "main.c" 2
# 1 "losesound.h" 1


extern const unsigned int losesound_sampleRate;
extern const unsigned int losesound_length;
extern const signed char losesound_data[];
# 46 "main.c" 2
# 1 "startmusic.h" 1


extern const unsigned int startmusic_sampleRate;
extern const unsigned int startmusic_length;
extern const signed char startmusic_data[];
# 47 "main.c" 2
# 1 "instructions.h" 1
int page;

void initInstructions();
void updatePage();
# 48 "main.c" 2
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
# 49 "main.c" 2

unsigned short buttons;
unsigned short oldButtons;

void goToStart();
void goToInstructions();
void goToGame();
void goToManual();
void goToPause();
void goToLose();
void goToWin();
void start();
void instructions();
void manual();
void game();
void pause();
void lose();
void win();
void initStart();
void initialize();

enum {START, INSTRUCTIONS, GAME, MANUAL, PAUSE, WIN, LOSE};
int state;
int statePrev;
int seed;
int screenBlock;
int cheat;
extern OBJ_ATTR shadowOAM[128];

int main() {
    initialize();
    while (1) {
        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);
        switch(state) {
            case START:
                start();
                break;
            case INSTRUCTIONS:
                instructions();
                break;
            case GAME:
                game();
                break;
            case MANUAL:
                manual();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
        }
    }
}

void initialize() {
    cheat = 0;

    (*(volatile unsigned short *)0x4000000) = 4 | (1<<10) | (1<<4);

    oldButtons = buttons;
    buttons = (*(volatile unsigned short *)0x04000130);

    screenBlock = 26;
    hideSprites();
    initStart();
    goToStart();

    setupSounds();
}

void initStart() {
    stopSound();
    playSoundA(((signed char*) startmusic_data), startmusic_length, 1);
}

void goToStart() {
    (*(volatile unsigned short *)0x4000000) = 0 | (1<<9);
    (*(volatile unsigned short*)0x400000A) = ((0)<<2) | ((31)<<8) | (0<<7) | (0<<14);
    DMANow(3, startBgTiles, &((charblock *)0x6000000)[0], 16000 / 2);
    DMANow(3, startBgPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, startBgMap, &((screenblock *)0x6000000)[31], 1024);

    waitForVBlank();
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), sizeof(shadowOAM)/2);

    screenBlock = 26;

    state = START;
}

void start() {
    seed++;
    if ((!(~(oldButtons) & ((1<<3))) && (~buttons & ((1<<3))))) {
        srand(seed);
        goToGame();
        initGame();
    }
    if ((!(~(oldButtons) & ((1<<2))) && (~buttons & ((1<<2))))) {
        statePrev = START;
        goToInstructions();
    }
    if ((!(~(oldButtons) & ((1<<9))) && (~buttons & ((1<<9))))) {
        if (cheat == 0) {
            cheat = 1;
        } else {
            cheat = 0;
        }
    }
}

void goToInstructions() {
    initInstructions();
    (*(volatile unsigned short *)0x4000000) = 0 | (1<<9);
    (*(volatile unsigned short*)0x400000A) = ((0)<<2) | ((31)<<8) | (0<<7) | (0<<14);
    DMANow(3, instructionsPg1Tiles, &((charblock *)0x6000000)[0], 12448 / 2);
    DMANow(3, instructionsPg1Pal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, instructionsPg1Map, &((screenblock *)0x6000000)[31], 1024);

    waitForVBlank();
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), sizeof(shadowOAM)/2);

    state = INSTRUCTIONS;
}

void instructions() {
    updatePage();
    if (statePrev == GAME) {
        if ((!(~(oldButtons) & ((1<<9))) && (~buttons & ((1<<9))))) {
            goToGame();
        }
    }
    if (statePrev == START) {
        if ((!(~(oldButtons) & ((1<<2))) && (~buttons & ((1<<2))))) {
            goToStart();
        }
    }
}

void goToGame() {
    (*(volatile unsigned short *)0x4000000) = 0 | (1<<8) | (1<<12);
    DMANow(3, backgroundTiles, &((charblock *)0x6000000)[0], 54528 / 2);
    DMANow(3, backgroundPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, backgroundMap, &((screenblock *)0x6000000)[26], 12288/2);

    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((screenBlock)<<8) | (1<<7) | (3<<14);

    DMANow(3, spritesheetTiles, &((charblock *)0x6000000)[4], 32768/2);
    DMANow(3, spritesheetPal, ((unsigned short *)0x5000200), 512/2);

    waitForVBlank();
    state = GAME;
}

void game() {
    updateGame();
    drawGame();
    if((!(~(oldButtons) & ((1<<2))) && (~buttons & ((1<<2))))) {
        goToPause();
    }
    if((!(~(oldButtons) & ((1<<3))) && (~buttons & ((1<<3))))) {
        goToManual();
    }
    if ((!(~(oldButtons) & ((1<<9))) && (~buttons & ((1<<9))))) {
        statePrev = GAME;
        goToInstructions();
    }
    if (ghostBanished) {
        goToWin();
    }
}

void goToManual() {

    (*(volatile unsigned short *)0x4000000) = 0 | (1<<9);
    (*(volatile unsigned short*)0x400000A) = ((0)<<2) | ((20)<<8) | (0<<7) | (0<<14);
    DMANow(3, manualBgTiles, &((charblock *)0x6000000)[0], 12320 / 2);
    DMANow(3, manualBgPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, manualBgMap, &((screenblock *)0x6000000)[20], 1024);

    waitForVBlank();
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), sizeof(shadowOAM)/2);

    initCursor();
    state = MANUAL;
}

void manual() {
    updateCursor();

    if((!(~(oldButtons) & ((1<<3))) && (~buttons & ((1<<3))))) {
        goToGame();
    }
}

void goToPause() {
    pauseSound();
    (*(volatile unsigned short *)0x4000000) = 0 | (1<<9);
    (*(volatile unsigned short*)0x400000A) = ((0)<<2) | ((31)<<8) | (0<<7) | (0<<14);
    DMANow(3, pauseBgTiles, &((charblock *)0x6000000)[0], 14976 / 2);
    DMANow(3, pauseBgPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, pauseBgMap, &((screenblock *)0x6000000)[31], 1024);

    waitForVBlank();
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), sizeof(shadowOAM)/2);
    state = PAUSE;
}

void pause() {
    if((!(~(oldButtons) & ((1<<2))) && (~buttons & ((1<<2))))) {
        unpauseSound();
        goToGame();
    }
    if((!(~(oldButtons) & ((1<<8))) && (~buttons & ((1<<8))))) {
        initStart();
        goToStart();
    }
}

void goToWin() {
    stopSound();
    calculateRank();
    (*(volatile unsigned short *)0x4000000) = 0 | (1<<9) | (1<<12);
    (*(volatile unsigned short*)0x400000A) = ((0)<<2) | ((15)<<8) | (0<<7) | (0<<14);
    DMANow(3, winBgTiles, &((charblock *)0x6000000)[0], 13728 / 2);
    DMANow(3, winBgPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, winBgMap, &((screenblock *)0x6000000)[15], 1024);

    waitForVBlank();
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), sizeof(shadowOAM)/2);

    playSoundA(((signed char*) startmusic_data), startmusic_length, 1);

    state = WIN;
}

void win() {
    updateWin();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), sizeof(shadowOAM)/2);
    if ((!(~(oldButtons) & ((1<<3))) && (~buttons & ((1<<3))))) {
        initStart();
        goToStart();
    }
}

void goToLose() {
    stopSound();
    (*(volatile unsigned short *)0x4000000) = 0 | (1<<9);
    (*(volatile unsigned short*)0x400000A) = ((0)<<2) | ((31)<<8) | (0<<7) | (0<<14);
    DMANow(3, loseBgTiles, &((charblock *)0x6000000)[0], 15328 / 2);
    DMANow(3, loseBgPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, loseBgMap, &((screenblock *)0x6000000)[31], 1024);

    waitForVBlank();
    hideSprites();
    playSoundA(((signed char*) losesound_data), losesound_length, 0);
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), sizeof(shadowOAM)/2);
    state = LOSE;
}

void lose() {
    if ((!(~(oldButtons) & ((1<<3))) && (~buttons & ((1<<3))))) {
        initStart();
        goToStart();
    }
}
