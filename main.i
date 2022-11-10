# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 35 "main.c"
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
# 36 "main.c" 2
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
# 37 "main.c" 2
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
    int type;
} ENEMY;

enum { SPRITEFRONT, SPRITEBACK, SPRITERIGHT, SPRITELEFT};
enum { DEMON, JINN, ONI, POLTERGEIST, BANSHEE, WRAITH };
extern void goToLose();
extern void goToWin();



extern PLAYER player;
extern WEAPON weapon;
extern ENEMY ghost;
int timer;
int path;
int vOff;
int hOff;

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
void drawGame();
void drawPlayer();
void drawWeapon();
void drawGhost();
# 38 "main.c" 2
# 1 "startBg.h" 1
# 21 "startBg.h"
extern const unsigned short startBgBitmap[19200];


extern const unsigned short startBgPal[256];
# 39 "main.c" 2
# 1 "instructionsBg.h" 1
# 21 "instructionsBg.h"
extern const unsigned short instructionsBgBitmap[19200];


extern const unsigned short instructionsBgPal[256];
# 40 "main.c" 2
# 1 "manualBg.h" 1
# 21 "manualBg.h"
extern const unsigned short manualBgBitmap[19200];


extern const unsigned short manualBgPal[256];
# 41 "main.c" 2
# 1 "pauseBg.h" 1
# 21 "pauseBg.h"
extern const unsigned short pauseBgBitmap[19200];


extern const unsigned short pauseBgPal[256];
# 42 "main.c" 2
# 1 "winBg.h" 1
# 21 "winBg.h"
extern const unsigned short winBgBitmap[19200];


extern const unsigned short winBgPal[256];
# 43 "main.c" 2
# 1 "loseBg.h" 1
# 21 "loseBg.h"
extern const unsigned short loseBgBitmap[19200];


extern const unsigned short loseBgPal[256];
# 44 "main.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 45 "main.c" 2
# 1 "background.h" 1
# 22 "background.h"
extern const unsigned short backgroundTiles[32];


extern const unsigned short backgroundMap[2048];


extern const unsigned short backgroundPal[256];
# 46 "main.c" 2

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
void initialize();

enum {START, INSTRUCTIONS, GAME, MANUAL, PAUSE, WIN, LOSE};
int state;

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

    (*(volatile unsigned short *)0x4000000) = 4 | (1<<10) | (1<<4);

    oldButtons = buttons;
    buttons = (*(volatile unsigned short *)0x04000130);

    hideSprites();
    goToStart();
}

void goToStart() {
    (*(volatile unsigned short *)0x4000000) = 4 | (1<<10) | (1<<4);
    DMANow(3, startBgPal, ((unsigned short *)0x5000000), 512);
    drawFullscreenImage4(startBgBitmap);
    waitForVBlank();
    flipPage();

    state = START;
}

void start() {
    if ((!(~(oldButtons) & ((1<<3))) && (~buttons & ((1<<3))))) {
        goToGame();
        initGame();
    }
    if ((!(~(oldButtons) & ((1<<2))) && (~buttons & ((1<<2))))) {
        goToInstructions();
    }
}

void goToInstructions() {
    (*(volatile unsigned short *)0x4000000) = 4 | (1<<10) | (1<<4);
    DMANow(3, startBgPal, ((unsigned short *)0x5000000), 512);
    drawFullscreenImage4(instructionsBgBitmap);
    waitForVBlank();
    flipPage();
    hideSprites();
    state = INSTRUCTIONS;
}

void instructions() {
    if ((!(~(oldButtons) & ((1<<2))) && (~buttons & ((1<<2))))) {
        goToStart();
        waitForVBlank();
        flipPage();
    }
}

void goToGame() {
    (*(volatile unsigned short *)0x4000000) = 0 | (1<<8) | (1<<12);
    DMANow(3, backgroundTiles, &((charblock *)0x6000000)[0], 64 / 2);
    DMANow(3, backgroundPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, backgroundMap, &((screenblock *)0x6000000)[31], 1024*2);

    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((31)<<8) | (0<<7) | (1<<14);

    DMANow(3, spritesheetPal, ((unsigned short *)0x5000200), 512/2);
    DMANow(3, spritesheetTiles, &((charblock *)0x6000000)[4], 32768/2);

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
}

void goToManual() {
    waitForVBlank();
    flipPage();
    (*(volatile unsigned short *)0x4000000) = 4 | (1<<10) | (1<<4);
    DMANow(3, startBgPal, ((unsigned short *)0x5000000), 512);
    drawFullscreenImage4(manualBgBitmap);
    waitForVBlank();
    flipPage();
    hideSprites();
    state = MANUAL;
}

void manual() {
    if((!(~(oldButtons) & ((1<<3))) && (~buttons & ((1<<3))))) {
        goToGame();
    }

}

void goToPause() {
    waitForVBlank();
    flipPage();
    (*(volatile unsigned short *)0x4000000) = 4 | (1<<10) | (1<<4);
    DMANow(3, startBgPal, ((unsigned short *)0x5000000), 512);
    drawFullscreenImage4(pauseBgBitmap);
    waitForVBlank();
    flipPage();
    hideSprites();
    state = PAUSE;
}

void pause() {
    if((!(~(oldButtons) & ((1<<2))) && (~buttons & ((1<<2))))) {
        goToGame();
    }
    if((!(~(oldButtons) & ((1<<8))) && (~buttons & ((1<<8))))) {
        goToStart();
        waitForVBlank();
        flipPage();
    }
}

void goToWin() {
    waitForVBlank();
    flipPage();
    (*(volatile unsigned short *)0x4000000) = 4 | (1<<10) | (1<<4);
    DMANow(3, startBgPal, ((unsigned short *)0x5000000), 512);
    drawFullscreenImage4(winBgBitmap);
    waitForVBlank();
    flipPage();
    hideSprites();
    state = WIN;
}

void win() {
    if ((!(~(oldButtons) & ((1<<3))) && (~buttons & ((1<<3))))) {
        goToStart();
        waitForVBlank();
        flipPage();
    }
}

void goToLose() {
    waitForVBlank();
    flipPage();
    (*(volatile unsigned short *)0x4000000) = 4 | (1<<10) | (1<<4);
    DMANow(3, startBgPal, ((unsigned short *)0x5000000), 512);
    drawFullscreenImage4(loseBgBitmap);
    waitForVBlank();
    flipPage();
    hideSprites();
    state = LOSE;
}

void lose() {
    if ((!(~(oldButtons) & ((1<<3))) && (~buttons & ((1<<3))))) {
        goToStart();
        waitForVBlank();
        flipPage();
    }
}
