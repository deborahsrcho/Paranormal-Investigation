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
# 3 "game.c" 2
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
# 4 "game.c" 2
# 1 "collisionmap.h" 1
# 21 "collisionmap.h"
extern const unsigned short collisionmapBitmap[147456];


extern const unsigned short collisionmapPal[256];
# 5 "game.c" 2
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
# 6 "game.c" 2
# 1 "gamemusic.h" 1


extern const unsigned int gamemusic_sampleRate;
extern const unsigned int gamemusic_length;
extern const signed char gamemusic_data[];
# 7 "game.c" 2
# 1 "ghostmusic.h" 1


extern const unsigned int ghostmusic_sampleRate;
extern const unsigned int ghostmusic_length;
extern const signed char ghostmusic_data[];
# 8 "game.c" 2
# 1 "gunsound.h" 1


extern const unsigned int gunsound_sampleRate;
extern const unsigned int gunsound_length;
extern const signed char gunsound_data[];
# 9 "game.c" 2
# 1 "camerasound.h" 1


extern const unsigned int camerasound_sampleRate;
extern const unsigned int camerasound_length;
extern const signed char camerasound_data[];
# 10 "game.c" 2
# 1 "staticsound.h" 1


extern const unsigned int staticsound_sampleRate;
extern const unsigned int staticsound_length;
extern const signed char staticsound_data[];
# 11 "game.c" 2
# 1 "spiritboxsound.h" 1


extern const unsigned int spiritboxsound_sampleRate;
extern const unsigned int spiritboxsound_length;
extern const signed char spiritboxsound_data[];
# 12 "game.c" 2
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
# 13 "game.c" 2
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 1 3
# 10 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 11 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 10 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/newlib.h" 1 3
# 11 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 1 3



# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 5 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 2 3
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3




# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 209 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4

# 209 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int size_t;
# 321 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int wchar_t;
# 17 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3

# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 1 3
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 143 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef int ptrdiff_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 1 3
# 24 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_types.h" 1 3






typedef __int64_t _off_t;


typedef __int64_t _fpos_t;


typedef __uint32_t __ino_t;


typedef __uint32_t __dev_t;
# 25 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/lock.h" 1 3






typedef int32_t _LOCK_T;

struct __lock_t {
 _LOCK_T lock;
 uint32_t thread_tag;
 uint32_t counter;
};

typedef struct __lock_t _LOCK_RECURSIVE_T;

extern void __libc_lock_init(_LOCK_T *lock);
extern void __libc_lock_init_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_close(_LOCK_T *lock);
extern void __libc_lock_close_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_acquire(_LOCK_T *lock);
extern void __libc_lock_acquire_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_release(_LOCK_T *lock);
extern void __libc_lock_release_recursive(_LOCK_RECURSIVE_T *lock);


extern int __libc_lock_try_acquire(_LOCK_T *lock);
extern int __libc_lock_try_acquire_recursive(_LOCK_RECURSIVE_T *lock);
# 26 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3


typedef long __blkcnt_t;



typedef long __blksize_t;



typedef __uint64_t __fsblkcnt_t;



typedef __uint32_t __fsfilcnt_t;
# 50 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef int __pid_t;







typedef unsigned short __uid_t;


typedef unsigned short __gid_t;



typedef __uint32_t __id_t;
# 88 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef __uint32_t __mode_t;





__extension__ typedef long long _off64_t;





typedef _off_t __off_t;


typedef _off64_t __loff_t;


typedef long __key_t;
# 129 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef unsigned int __size_t;
# 145 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef signed int _ssize_t;
# 156 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef _ssize_t __ssize_t;


# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 350 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int wint_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3



typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    unsigned char __wchb[4];
  } __value;
} _mbstate_t;



typedef _LOCK_RECURSIVE_T _flock_t;




typedef void *_iconv_t;






typedef unsigned long __clock_t;






typedef __int_least64_t __time_t;





typedef unsigned long __clockid_t;


typedef unsigned long __timer_t;


typedef __uint8_t __sa_family_t;



typedef __uint32_t __socklen_t;


typedef int __nl_item;
typedef unsigned short __nlink_t;
typedef long __suseconds_t;
typedef unsigned long __useconds_t;




typedef char * __va_list;
# 16 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3






typedef unsigned long __ULong;
# 38 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _reent;

struct __locale_t;






struct _Bigint
{
  struct _Bigint *_next;
  int _k, _maxwds, _sign, _wds;
  __ULong _x[1];
};


struct __tm
{
  int __tm_sec;
  int __tm_min;
  int __tm_hour;
  int __tm_mday;
  int __tm_mon;
  int __tm_year;
  int __tm_wday;
  int __tm_yday;
  int __tm_isdst;
};







struct _on_exit_args {
 void * _fnargs[32];
 void * _dso_handle[32];

 __ULong _fntypes;


 __ULong _is_cxa;
};
# 93 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _atexit {
 struct _atexit *_next;
 int _ind;

 void (*_fns[32])(void);
        struct _on_exit_args _on_exit_args;
};
# 117 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct __sbuf {
 unsigned char *_base;
 int _size;
};
# 181 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct __sFILE {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;






  void * _cookie;

  int (*_read) (struct _reent *, void *,
        char *, int);
  int (*_write) (struct _reent *, void *,
         const char *,
         int);
  _fpos_t (*_seek) (struct _reent *, void *, _fpos_t, int);
  int (*_close) (struct _reent *, void *);


  struct __sbuf _ub;
  unsigned char *_up;
  int _ur;


  unsigned char _ubuf[3];
  unsigned char _nbuf[1];


  struct __sbuf _lb;


  int _blksize;
  _off_t _offset;


  struct _reent *_data;



  _flock_t _lock;

  _mbstate_t _mbstate;
  int _flags2;
};
# 287 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
typedef struct __sFILE __FILE;



struct _glue
{
  struct _glue *_next;
  int _niobs;
  __FILE *_iobs;
};
# 319 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _rand48 {
  unsigned short _seed[3];
  unsigned short _mult[3];
  unsigned short _add;




};
# 610 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _reent
{
  int _errno;




  __FILE *_stdin, *_stdout, *_stderr;

  int _inc;
  char _emergency[25];


  int _unspecified_locale_info;
  struct __locale_t *_locale;

  int __sdidinit;

  void (*__cleanup) (struct _reent *);


  struct _Bigint *_result;
  int _result_k;
  struct _Bigint *_p5s;
  struct _Bigint **_freelist;


  int _cvtlen;
  char *_cvtbuf;

  union
    {
      struct
        {
          unsigned int _unused_rand;
          char * _strtok_last;
          char _asctime_buf[26];
          struct __tm _localtime_buf;
          int _gamma_signgam;
          __extension__ unsigned long long _rand_next;
          struct _rand48 _r48;
          _mbstate_t _mblen_state;
          _mbstate_t _mbtowc_state;
          _mbstate_t _wctomb_state;
          char _l64a_buf[8];
          char _signal_buf[24];
          int _getdate_err;
          _mbstate_t _mbrlen_state;
          _mbstate_t _mbrtowc_state;
          _mbstate_t _mbsrtowcs_state;
          _mbstate_t _wcrtomb_state;
          _mbstate_t _wcsrtombs_state;
   int _h_errno;
        } _reent;



      struct
        {

          unsigned char * _nextf[30];
          unsigned int _nmalloc[30];
        } _unused;
    } _new;



  struct _atexit *_atexit;
  struct _atexit _atexit0;



  void (**(_sig_func))(int);




  struct _glue __sglue;

  __FILE __sf[3];

  void *deviceData;
};
# 817 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
extern struct _reent *_impure_ptr ;
extern struct _reent *const _global_impure_ptr ;

void _reclaim_reent (struct _reent *);





  struct _reent * __getreent (void);
# 19 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 1 3
# 47 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 48 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 2 3
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/stdlib.h" 1 3
# 21 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 33 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3


typedef struct
{
  int quot;
  int rem;
} div_t;

typedef struct
{
  long quot;
  long rem;
} ldiv_t;


typedef struct
{
  long long int quot;
  long long int rem;
} lldiv_t;




typedef int (*__compar_fn_t) (const void *, const void *);







int __locale_mb_cur_max (void);



void abort (void) __attribute__ ((__noreturn__));
int abs (int);





int atexit (void (*__func)(void));
double atof (const char *__nptr);



int atoi (const char *__nptr);
int _atoi_r (struct _reent *, const char *__nptr);
long atol (const char *__nptr);
long _atol_r (struct _reent *, const char *__nptr);
void * bsearch (const void *__key,
         const void *__base,
         size_t __nmemb,
         size_t __size,
         __compar_fn_t _compar);
void *calloc(size_t, size_t) __attribute__((__malloc__)) __attribute__((__warn_unused_result__))
      __attribute__((__alloc_size__(1, 2))) ;
div_t div (int __numer, int __denom);
void exit (int __status) __attribute__ ((__noreturn__));
void free (void *) ;
char * getenv (const char *__string);
char * _getenv_r (struct _reent *, const char *__string);
char * _findenv (const char *, int *);
char * _findenv_r (struct _reent *, const char *, int *);




long labs (long);
ldiv_t ldiv (long __numer, long __denom);
void *malloc(size_t) __attribute__((__malloc__)) __attribute__((__warn_unused_result__)) __attribute__((__alloc_size__(1))) ;
int mblen (const char *, size_t);
int _mblen_r (struct _reent *, const char *, size_t, _mbstate_t *);
int mbtowc (wchar_t *restrict, const char *restrict, size_t);
int _mbtowc_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
int wctomb (char *, wchar_t);
int _wctomb_r (struct _reent *, char *, wchar_t, _mbstate_t *);
size_t mbstowcs (wchar_t *restrict, const char *restrict, size_t);
size_t _mbstowcs_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
size_t wcstombs (char *restrict, const wchar_t *restrict, size_t);
size_t _wcstombs_r (struct _reent *, char *restrict, const wchar_t *restrict, size_t, _mbstate_t *);
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
char * _mkdtemp_r (struct _reent *, char *);
int _mkostemp_r (struct _reent *, char *, int);
int _mkostemps_r (struct _reent *, char *, int, int);
int _mkstemp_r (struct _reent *, char *);
int _mkstemps_r (struct _reent *, char *, int);
char * _mktemp_r (struct _reent *, char *) __attribute__ ((__deprecated__("the use of `mktemp' is dangerous; use `mkstemp' instead")));
void qsort (void *__base, size_t __nmemb, size_t __size, __compar_fn_t _compar);
int rand (void);
void *realloc(void *, size_t) __attribute__((__warn_unused_result__)) __attribute__((__alloc_size__(2))) ;
# 156 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
void srand (unsigned __seed);
double strtod (const char *restrict __n, char **restrict __end_PTR);
double _strtod_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR);

float strtof (const char *restrict __n, char **restrict __end_PTR);







long strtol (const char *restrict __n, char **restrict __end_PTR, int __base);
long _strtol_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long strtoul (const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long _strtoul_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);
# 188 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
int system (const char *__string);
# 199 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
void _Exit (int __status) __attribute__ ((__noreturn__));




int _putenv_r (struct _reent *, char *__string);
void * _reallocf_r (struct _reent *, void *, size_t);



int _setenv_r (struct _reent *, const char *__string, const char *__value, int __overwrite);
# 221 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
char * __itoa (int, char *, int);
char * __utoa (unsigned, char *, int);
# 260 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
long long atoll (const char *__nptr);

long long _atoll_r (struct _reent *, const char *__nptr);

long long llabs (long long);
lldiv_t lldiv (long long __numer, long long __denom);
long long strtoll (const char *restrict __n, char **restrict __end_PTR, int __base);

long long _strtoll_r (struct _reent *, const char *restrict __n, char **restrict __end_PTR, int __base);

unsigned long long strtoull (const char *restrict __n, char **restrict __end_PTR, int __base);

unsigned long long _strtoull_r (struct _reent *, const char *restrict __n, char **restrict __end_PTR, int __base);
# 281 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
int _unsetenv_r (struct _reent *, const char *__string);







char * _dtoa_r (struct _reent *, double, int, int, int *, int*, char**);

void * _malloc_r (struct _reent *, size_t) ;
void * _calloc_r (struct _reent *, size_t, size_t) ;
void _free_r (struct _reent *, void *) ;
void * _realloc_r (struct _reent *, void *, size_t) ;
void _mstats_r (struct _reent *, char *);

int _system_r (struct _reent *, const char *);

void __eprintf (const char *, const char *, unsigned int, const char *);
# 319 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
extern long double _strtold_r (struct _reent *, const char *restrict, char **restrict);

extern long double strtold (const char *restrict, char **restrict);
# 336 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3

# 14 "game.c" 2



# 16 "game.c"
OBJ_ATTR shadowOAM[128];
OCCURRENCE occurrences[5];
OCCURRENCE items[6];
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
CAMERA camera;

unsigned char* collisionMap = (unsigned char*) collisionmapBitmap;


void initGame() {
    cursor.type = DEMON;
    ghostBanished = 0;
    seconds = 0;
    sanity = 0;
    sanityTimer = 0;
    hOff = 0;
    vOff = 0;
    score = 0;
    occurrencesCaught = 0;
    itemsCollected = 0;
    screenBlock = 26;
    setupInterrupts();
    initPlayer();
    initGhost();
    initghostSpot();
    initEquipment();
    initOccurrences();
    initItems();
    playSoundA(((signed char*) gamemusic_data), gamemusic_length, 1);
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
    updateCamera();
    updateItems();
    hideText();
    (*(volatile unsigned short *)0x04000010) = hOff;
    (*(volatile unsigned short *)0x04000012) = vOff;
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), sizeof(shadowOAM)/2);
}


void drawGame() {
    drawPlayer();
    drawWeapon();
    drawGhost();
    drawEMFReader();
    drawCamera();
    drawEquipment();
    drawSanity();
    drawOccurrences();
    drawItems();
    waitForVBlank();
}


void interruptHandler() {
    *(unsigned short*)0x4000208 = 0;
    if (*(volatile unsigned short*)0x4000202 & 1<<5) {
        seconds++;

        if (!ghost.active) {
            sanityTimer++;
        }

        if (thermometer.active && seconds % 3 == 0) {
            thermometer.randvar = rand() % 2;
        }
        if (thermometer.active && seconds % 10 == 0) {
            ghostbook.randvar = rand() % 3;
            videocam.randvar = rand() % 3;
            spiritbox.randvar = rand() % 3;
        }
    }

    if (*(volatile unsigned short*)0x4000202 & 1 << 0) {
        if (soundA.isPlaying) {
            soundA.vBlankCount = soundA.vBlankCount + 1;
            if (soundA.vBlankCount > soundA.duration) {
                if (soundA.loops) {
                    playSoundA(soundA.data, soundA.length, soundA.loops);
                } else {
                    soundA.isPlaying = 0;
                    dma[1].cnt = 0;
                    *(volatile unsigned short*)0x4000102 = (0<<7);
                }
            }
        }

        if (soundB.isPlaying) {
            soundB.vBlankCount = soundB.vBlankCount + 1;
            if (soundB.vBlankCount > soundB.duration) {
                if (soundB.loops) {
                    playSoundB(soundB.data, soundB.length, soundB.loops);
                } else {
                    soundB.isPlaying = 0;
                    dma[2].cnt = 0;
                    *(volatile unsigned short*)0x4000106 = (0<<7);
                }
            }
        }

        *(volatile unsigned short*)0x4000202 = 1 << 0;
    }

    *(volatile unsigned short*)0x4000202 = *(volatile unsigned short*)0x4000202;
    *(unsigned short*)0x4000208 = 1;
}
void enableTimerInterrupts() {
  *(unsigned short*)0x4000200 |= 1 << 0 | 1<<5;
  *(unsigned short*)0x4000004 |= 1 << 3;

  *(volatile unsigned short*)0x400010A = 0;
  *(volatile unsigned short*)0x4000108 = 0;
  *(volatile unsigned short*)0x400010A = 2 | (1<<7) | (1<<6);
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
    player.numFrames = 3;
    player.aniState = SPRITEFRONT;
    player.idle = 1;
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
    camera.row = player.row;
    camera.col = player.col;
    camera.height = player.height + 8;
    camera.width = player.width + 16;
    camera.active = 0;
    camera.timer = 0;
    camera.state = player.aniState;
    camera.equipped = 0;

    EMFReader.row = 0;
    EMFReader.col = 0;
    EMFReader.width = 16;
    EMFReader.height = 16;
    EMFReader.state = 0;
    EMFReader.equipped = 1;

    thermometer.row = ghostspot.row;
    thermometer.col = ghostspot.col + 8;
    thermometer.width = 8;
    thermometer.height = 8;
    thermometer.active = 0;
    thermometer.state = 0;
    thermometer.randvar = 0;
    thermometer.temperature = rand() % 5 + 13;
    thermometer.checking = 0;

    ghostbook.row = thermometer.row;
    ghostbook.col = thermometer.col + 16;
    ghostbook.width = 8;
    ghostbook.height = 8;
    ghostbook.active = 0;
    ghostbook.state = 0;
    ghostbook.randvar = 0;
    ghostbook.clue = 0;
    ghostbook.checking = 0;

    videocam.row = ghostbook.row;
    videocam.col = ghostbook.col + 16;
    videocam.width = 8;
    videocam.height = 8;
    videocam.active = 0;
    videocam.state = 0;
    videocam.randvar = 0;
    videocam.clue = 0;
    videocam.checking = 0;

    spiritbox.row = thermometer.row + 16;
    spiritbox.col = thermometer.col;
    spiritbox.width = 8;
    spiritbox.height = 8;
    spiritbox.active = 0;
    spiritbox.state = 0;
    spiritbox.randvar = 0;
    spiritbox.clue = 0;
    spiritbox.checking = 0;

    uvlight.row = videocam.row + 16;
    uvlight.col = videocam.col;
    uvlight.width = 8;
    uvlight.height = 8;
    uvlight.active = 0;
    uvlight.state = 0;
    uvlight.randvar = 0;
    uvlight.clue = 0;
    uvlight.checking = 0;
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
    ghost.numFrames = 3;
    ghost.aniState = SPRITEFRONT;
    ghost.active = 0;
    ghost.alert = 0;
    ghost.type = rand() % 6;
    ghost.caught = 0;
    ghost.colPrev = ghost.col;
    ghost.rowPrev = ghost.row;
    ghost.distance = 0;
}

void initghostSpot() {

    if (!cheat) {
        ghostspot.location = rand() % 5;
    } else {
        ghostspot.location = 0;
    }
    if (ghostspot.location == 0) {
        ghostspot.col = 32;
        ghostspot.row = 80;
    } else if (ghostspot.location == 1) {
        ghostspot.col = 160;
        ghostspot.row = 304;
    } else if (ghostspot.location == 2) {
        ghostspot.col = 288;
        ghostspot.row = 256;
    } else if (ghostspot.location == 3) {
        ghostspot.col = 32;
        ghostspot.row = 448;
    } else {
        ghostspot.col = 336;
        ghostspot.row = 464;
    }

    ghostspot.width = 48;
    ghostspot.height = 48;
}


void initItems() {
    for (int i = 0; i < 6; i++) {
        items[i].width = 8;
        items[i].height = 8;
        items[i].caught = 0;
    }
    if (!cheat) {
        items[0].col = 80;
        items[0].row = 120;
        items[1].col = 224;
        items[1].row = 320;
        items[2].col = 272;
        items[2].row = 448;
        items[3].col = 432;
        items[3].row = 528;
        items[4].col = 96;
        items[4].row = 288;
        items[5].col = 480;
        items[5].row = 160;
    } else {
        items[0].col = player.col - 16;
        items[0].row = player.row + player.height;
        items[1].col = player.col - 8;
        items[1].row = player.row + player.height;
        items[2].col = player.col;
        items[2].row = player.row + player.height;
        items[3].col = player.col + 8;
        items[3].row = player.row + player.height;
        items[4].col = player.col + 16;
        items[4].row = player.row + player.height;
        items[5].col = player.col + 24;
        items[5].row = player.row + player.height;
    }
}


void updateItems() {

    for (int i = 0; i < 6; i++) {
        if (!items[i].caught
        && collision(items[i].col, items[i].row, items[i].width, items[i].height, player.col, player.row, player.width, player.height)) {
            shadowOAM[48].attr0 = ((150) & 0xFF) | (0 << 13) | (0 << 14);
            shadowOAM[48].attr1 = ((240/2 - 12 - 1) & 0x1FF) | (0 << 14);
            shadowOAM[48].attr2 = ((0)<<12) | ((15)*32+(0));
            shadowOAM[49].attr0 = ((150) & 0xFF) | (0 << 13) | (1 << 14);
            shadowOAM[49].attr1 = ((240/2 - 12 + 8) & 0x1FF) | (1 << 14);
            shadowOAM[49].attr2 = ((0)<<12) | ((14)*32+(26));
            if ((!(~(oldButtons) & ((1<<0))) && (~buttons & ((1<<0))))) {
                items[i].caught = 1;
                itemsCollected++;
                shadowOAM[48].attr0 = (2 << 8);
                shadowOAM[49].attr0 = (2 << 8);
            }
        }
    }

    if(collision(448, 32, 24, 32, player.col, player.row, player.width, player.height)) {
        if (itemsCollected == 6) {
            shadowOAM[52].attr0 = ((150) & 0xFF) | (0 << 13) | (0 << 14);
            shadowOAM[52].attr1 = ((240/2 - 12 - 1) & 0x1FF) | (0 << 14);
            shadowOAM[52].attr2 = ((0)<<12) | ((15)*32+(0));
            shadowOAM[53].attr0 = ((150) & 0xFF) | (0 << 13) | (1 << 14);
            shadowOAM[53].attr1 = ((240/2 - 12 + 8) & 0x1FF) | (0 << 14);
            shadowOAM[53].attr2 = ((0)<<12) | ((16)*32+(16));
            if ((!(~(oldButtons) & ((1<<0))) && (~buttons & ((1<<0))))) {
                ghostBanished = 1;
            }
        }
    } else {
        shadowOAM[52].attr0 = (2 << 8);
        shadowOAM[53].attr0 = (2 << 8);
    }

    shadowOAM[42].attr0 = ((150) & 0xFF) | (0 << 13) | (1 << 14);
    shadowOAM[42].attr1 = ((10) & 0x1FF) | (1 << 14);
    shadowOAM[42].attr2 = ((0)<<12) | ((15)*32+(24));
    shadowOAM[17].attr0 = ((150) & 0xFF) | (0 << 13) | (0 << 14);
    shadowOAM[17].attr1 = ((36) & 0x1FF) | (0 << 14);
    shadowOAM[17].attr2 = ((0)<<12) | ((16)*32+(itemsCollected));
}


void drawItems() {
    for (int i = 0; i < 6; i++) {
        if (!items[i].caught && items[i].row + items[i].height - 1 > vOff + ((screenBlock - 26)/2 * 256)
        && items[i].row < 160 + vOff + ((screenBlock - 26)/2 * 256)) {
            shadowOAM[90 + i].attr0 = ((items[i].row - vOff) & 0xFF) | (0 << 13) | (0 << 14);
            shadowOAM[90 + i].attr1 = ((items[i].col - hOff) & 0x1FF) | (0 << 14);
            shadowOAM[90 + i].attr2 = ((0)<<12) | ((12)*32+(i + 6));
        } else {
            shadowOAM[90 + i].attr0 = (2 << 8);
        }
    }
}


void initOccurrences() {
    for (int i = 0; i < 5; i++) {
        occurrences[i].width = 16;
        occurrences[i].height = 16;
        occurrences[i].caught = 0;
    }
    if (!cheat) {
        occurrences[0].col = 350;
        occurrences[0].row = 130;
        occurrences[1].col = 480;
        occurrences[1].row = 288;
        occurrences[2].col = 140;
        occurrences[2].row = 450;
        occurrences[3].col = 20;
        occurrences[3].row = 500;
        occurrences[4].col = 480;
        occurrences[4].row = 360;
    } else {
        occurrences[0].col = player.col;
        occurrences[0].row = player.row + 24;
        occurrences[1].col = player.col;
        occurrences[1].row = player.row + 48;
        occurrences[2].col = player.col;
        occurrences[2].row = player.row + 72;
        occurrences[3].col = player.col;
        occurrences[3].row = player.row + 96;
        occurrences[4].col = player.col;
        occurrences[4].row = player.row + 120;
    }

}


void drawOccurrences() {
    for (int i = 0; i < 5; i++) {
        if (occurrences[i].row + occurrences[i].height - 1 > vOff + ((screenBlock - 26)/2 * 256)
        && occurrences[i].row < 160 + vOff + ((screenBlock - 26)/2 * 256)) {
            shadowOAM[118 + i].attr0 = ((occurrences[i].row - vOff) & 0xFF) | (0 << 13) | (0 << 14);
            shadowOAM[118 + i].attr1 = ((occurrences[i].col - hOff) & 0x1FF) | (1 << 14);
            shadowOAM[118 + i].attr2 = ((0)<<12) | ((17)*32+(i*2));
        } else {
            shadowOAM[118 + i].attr0 = (2 << 8);
        }
    }
}


void updatePlayer() {

    if (!player.hidden && !thermometer.checking && !ghostbook.checking && !videocam.checking && !spiritbox.checking
    && !weapon.active) {
        if((~((*(volatile unsigned short *)0x04000130)) & ((1<<6))) && player.row > 1 && collisionCheck(collisionMap, 512, player.col, player.row - player.rdel)
            && collisionCheck(collisionMap, 512, player.col + player.width - 1, player.row - player.rdel)
            && collisionCheck(collisionMap, 512, player.col + player.width/2 - 1, player.row - player.rdel)) {
            player.aniState = SPRITEBACK;
            player.row -= player.rdel;
            player.idle = 0;
            if (player.row - ((screenBlock - 26) * 256)/2 - vOff <= 160/2 && vOff - 1 >= 0) {
                vOff--;
            }
        } else if((~((*(volatile unsigned short *)0x04000130)) & ((1<<7))) && player.row + player.height < 576 && collisionCheck(collisionMap, 512, player.col, player.row + player.height - 1 + player.rdel)
            && collisionCheck(collisionMap, 512, player.col + player.width - 1, player.row + player.height - 1 + player.rdel)
            && collisionCheck(collisionMap, 512, player.col + player.width/2 - 1, player.row + player.height - 1 + player.rdel)) {
            player.aniState = SPRITEFRONT;
            player.row += player.rdel;
            player.idle = 0;
            if (player.row - vOff >= 160/2 && (vOff + 1) < (576 - 160)
            && !(screenBlock == 28 && vOff >= (320 - 160))) {
                vOff++;
            }
        } else if((~((*(volatile unsigned short *)0x04000130)) & ((1<<5))) && player.col > 0 && collisionCheck(collisionMap, 512, player.col - player.cdel, player.row)
            && collisionCheck(collisionMap, 512, player.col - player.cdel, player.row + player.height - 1)) {
            player.aniState = SPRITELEFT;
            player.col -= player.cdel;
            player.idle = 0;
            if (player.col - hOff <= 240/2 && hOff - 1 >= 0) {
                hOff--;
            }
        } else if((~((*(volatile unsigned short *)0x04000130)) & ((1<<4))) && player.col + player.width < 512 && collisionCheck(collisionMap, 512, player.col + player.width - 1 + player.cdel, player.row)
            && collisionCheck(collisionMap, 512, player.col + player.width - 1 + player.cdel, player.row + player.height - 1)) {
            player.aniState = SPRITERIGHT;
            player.col += player.cdel;
            player.idle = 0;
            if (player.col - hOff >= 240/2 && (hOff + 1) < (512 - 240)) {
                hOff++;
            }
        } else {
            player.idle = 1;
        }
    }


    if (!ghost.alert && (collisionCheck(collisionMap, 512, player.col, player.row) == 2 || collisionCheck(collisionMap, 512, player.col + player.width-1, player.row) == 2
    || collisionCheck(collisionMap, 512, player.col, player.row + player.height-1) == 2 || collisionCheck(collisionMap, 512, player.col + player.width-1, player.row + player.height-1) == 2)) {
        if (player.hidden == 0) {
            shadowOAM[47].attr0 = ((150) & 0xFF) | (0 << 13) | (0 << 14);
            shadowOAM[47].attr1 = ((240/2 - 12 - 1) & 0x1FF) | (0 << 14);
            shadowOAM[47].attr2 = ((0)<<12) | ((15)*32+(0));
            shadowOAM[46].attr0 = ((150) & 0xFF) | (0 << 13) | (1 << 14);
            shadowOAM[46].attr1 = ((240/2 - 12 + 8) & 0x1FF) | (0 << 14);
            shadowOAM[46].attr2 = ((0)<<12) | ((15)*32+(16));
        } else {
            shadowOAM[46].attr0 = (2 << 8);
            shadowOAM[47].attr0 = (2 << 8);
        }
        if ((!(~(oldButtons) & ((1<<0))) && (~buttons & ((1<<0))))) {
            if (player.hidden == 0) {
                player.hidden = 1;
            } else {
                player.hidden = 0;
            }
        }
    } else {
        shadowOAM[46].attr0 = (2 << 8);
        shadowOAM[47].attr0 = (2 << 8);
    }


    if ((!(~(oldButtons) & ((1<<8))) && (~buttons & ((1<<8))))) {
        player.equipped++;
        if (player.equipped >= 3) {
            player.equipped = 0;
        }
        if (player.equipped == 1) {
            weapon.equipped = 0;
            camera.equipped = 0;
            EMFReader.equipped = 1;
        } else if (player.equipped == 2) {
            EMFReader.equipped = 0;
            weapon.equipped = 0;
            camera.equipped = 1;
            camera.timer = 30;
        } else if (player.equipped == 0) {
            EMFReader.equipped = 0;
            camera.equipped = 0;
            weapon.equipped = 1;
            weapon.timer = 30;
        }
    }


    if ((!(~(oldButtons) & ((1<<0))) && (~buttons & ((1<<0)))) && !ghost.active && EMFReader.state >= 3 && thermometer.active == 0) {
        thermometer.active = 1;
        thermometer.row = ghostspot.row;
        thermometer.col = ghostspot.col;
        ghostbook.active = 1;
        ghostbook.row = thermometer.row;
        ghostbook.col = thermometer.col + 24;
        videocam.active = 1;
        videocam.row = ghostbook.row;
        videocam.col = ghostbook.col + 24;
        spiritbox.active = 1;
        spiritbox.row = thermometer.row + 24;
        spiritbox.col = thermometer.col;
        uvlight.active = 1;
        uvlight.row = videocam.row + 24;
        uvlight.col = videocam.col;
    }


    if (vOff > 256 && screenBlock == 26) {
        screenBlock += 2;
        vOff -= 256;
        (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((screenBlock)<<8) | (1<<7) | (3<<14);
    }
    if (vOff <= 0 && screenBlock == 28) {
        screenBlock -= 2;
        vOff += 256;
        (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((screenBlock)<<8) | (1<<7) | (3<<14);
    }
    (*(volatile unsigned short *)0x04000012) = vOff;
}


void drawPlayer() {
    if (player.aniCounter % 10 == 0) {
        player.curFrame = (player.curFrame + 1) % player.numFrames;
    }

    if (player.hidden) {
        shadowOAM[7].attr0 = (2 << 8);
    } else {
        shadowOAM[7].attr0 = ((player.row - (vOff + ((screenBlock - 26)/2 * 256))) & 0xFF) | (0 << 13) | (0 << 14);
        shadowOAM[7].attr1 = ((player.col - hOff) & 0x1FF) | (1 << 14);
        if (player.idle) {
            shadowOAM[7].attr2 = ((0)<<12) | ((0)*32+(player.aniState*2));
            player.curFrame = 0;
            player.aniCounter = 0;
        } else {
            shadowOAM[7].attr2 = ((0)<<12) | ((player.curFrame*2)*32+(player.aniState*2));
            player.aniCounter++;
        }
    }

}


void updateEMFReader() {

    if (ghost.active) {
        if (ghost.type == JINN || ghost.type == ONI || ghost.type == WRAITH) {
                EMFReader.state = 4;
                ((unsigned short *)0x5000200)[2] = ((31) | (18) << 5 | (19) << 10);
            } else {
                EMFReader.state = 3;
                ((unsigned short *)0x5000200)[2] = ((31) | (23) << 5 | (18) << 10);
            }
    } else {
        if (collision(player.col, player.row, player.width, player.height, ghostspot.col, ghostspot.row, ghostspot.width, ghostspot.height)) {
            if (cheat && (ghost.type == JINN || ghost.type == ONI || ghost.type == WRAITH)) {
                EMFReader.state = 4;
                ((unsigned short *)0x5000200)[2] = ((31) | (18) << 5 | (19) << 10);
            } else {
                EMFReader.state = 3;
                ((unsigned short *)0x5000200)[2] = ((31) | (23) << 5 | (18) << 10);
            }
            if (!thermometer.active) {
                shadowOAM[58].attr0 = ((150) & 0xFF) | (0 << 13) | (0 << 14);
                shadowOAM[58].attr1 = ((240/2 - 4) & 0x1FF) | (0 << 14);
                shadowOAM[58].attr2 = ((0)<<12) | ((15)*32+(0));
            } else {
                shadowOAM[58].attr0 = (2 << 8);
            }
        } else if (collision(player.col, player.row, player.width, player.height, ghostspot.col - 48, ghostspot.row - 48, ghostspot.width + 96, ghostspot.height + 96)) {
            shadowOAM[58].attr0 = (2 << 8);
            EMFReader.state = 2;
            ((unsigned short *)0x5000200)[2] = ((31) | (31) << 5 | (18) << 10);
        } else if (collision(player.col, player.row, player.width, player.height, ghostspot.col - 96, ghostspot.row - 96, ghostspot.width + 192, ghostspot.height + 192)) {
            EMFReader.state = 1;
            ((unsigned short *)0x5000200)[2] = ((22) | (31) << 5 | (18) << 10);
        } else {
            EMFReader.state = 0;
            ((unsigned short *)0x5000200)[2] = ((18) | (29) << 5 | (31) << 10);
        }
    }
}


void drawEMFReader() {
    if (EMFReader.equipped) {
        shadowOAM[3].attr0 = ((10) & 0xFF) | (0 << 13) | (0 << 14);
        shadowOAM[3].attr1 = ((10) & 0x1FF) | (1 << 14);
        shadowOAM[3].attr2 = ((0)<<12) | ((13)*32+(0));
        shadowOAM[34].attr0 = ((10) & 0xFF) | (0 << 13) | (0 << 14);
        shadowOAM[34].attr1 = ((10) & 0x1FF) | (1 << 14);
        shadowOAM[34].attr2 = ((0)<<12) | ((13)*32+(20));
        shadowOAM[44].attr0 = ((28) & 0xFF) | (0 << 13) | (1 << 14);
        shadowOAM[44].attr1 = ((10) & 0x1FF) | (0 << 14);
        shadowOAM[44].attr2 = ((0)<<12) | ((15)*32+(22));
        shadowOAM[45].attr0 = ((28) & 0xFF) | (0 << 13) | (0 << 14);
        shadowOAM[45].attr1 = ((26) & 0x1FF) | (0 << 14);
        shadowOAM[45].attr2 = ((0)<<12) | ((16)*32+(EMFReader.state + 1));
    } else {
        shadowOAM[45].attr0 = (2 << 8);
        shadowOAM[44].attr0 = (2 << 8);
    }

}


void drawEquipment() {
    if (thermometer.active) {
        if (ghostspot.row + 48 > vOff + ((screenBlock - 26)/2 * 256) && ghostspot.row < 160 + vOff + ((screenBlock - 26)/2 * 256)) {
            shadowOAM[104].attr0 = ((thermometer.row - vOff) & 0xFF) | (0 << 13) | (0 << 14);
            shadowOAM[104].attr1 = ((thermometer.col - hOff) & 0x1FF) | (0 << 14);
            shadowOAM[104].attr2 = ((0)<<12) | ((12)*32+(0));

            shadowOAM[105].attr0 = ((ghostbook.row - vOff) & 0xFF) | (0 << 13) | (0 << 14);
            shadowOAM[105].attr1 = ((ghostbook.col - hOff) & 0x1FF) | (0 << 14);
            shadowOAM[105].attr2 = ((0)<<12) | ((12)*32+(1));

            shadowOAM[106].attr0 = ((videocam.row - vOff) & 0xFF) | (0 << 13) | (0 << 14);
            shadowOAM[106].attr1 = ((videocam.col - hOff) & 0x1FF) | (0 << 14);
            shadowOAM[106].attr2 = ((0)<<12) | ((12)*32+(2));

            shadowOAM[107].attr0 = ((spiritbox.row - vOff) & 0xFF) | (0 << 13) | (0 << 14);
            shadowOAM[107].attr1 = ((spiritbox.col - hOff) & 0x1FF) | (0 << 14);
            shadowOAM[107].attr2 = ((0)<<12) | ((12)*32+(3));

            shadowOAM[108].attr0 = ((uvlight.row - vOff) & 0xFF) | (0 << 13) | (0 << 14);
            shadowOAM[108].attr1 = ((uvlight.col - hOff) & 0x1FF) | (0 << 14);
            shadowOAM[108].attr2 = ((0)<<12) | ((12)*32+(4));
            if (uvlight.clue == 1) {
                shadowOAM[112].attr0 = ((uvlight.row + 10 - vOff) & 0xFF) | (0 << 13) | (0 << 14);
                shadowOAM[112].attr1 = ((uvlight.col + 10 - hOff) & 0x1FF) | (0 << 14);
                shadowOAM[112].attr2 = ((0)<<12) | ((12)*32+(5));
            }
        } else {
            shadowOAM[104].attr0 = (2 << 8);
            shadowOAM[105].attr0 = (2 << 8);
            shadowOAM[106].attr0 = (2 << 8);
            shadowOAM[107].attr0 = (2 << 8);
            shadowOAM[108].attr0 = (2 << 8);
            shadowOAM[112].attr0 = (2 << 8);
        }
    }
}


void updateWeapon() {

    if (weapon.equipped) {
        if ((!(~(oldButtons) & ((1<<1))) && (~buttons & ((1<<1)))) && weapon.timer > 20){
            playSoundB(((signed char*) gunsound_data), gunsound_length, 0);
            weapon.state = player.aniState;
            weapon.timer = 0;
        }
        if (weapon.timer < 20) {
            weapon.state = player.aniState;
            weapon.active = 1;
        } else {
            weapon.active = 0;
        }


        if (weapon.state == SPRITEFRONT) {
            weapon.col = player.col;
            weapon.row = player.row + 16;
            weapon.width = 16;
            weapon.height = 24;
        } else if (weapon.state == SPRITEBACK) {
            weapon.col = player.col;
            weapon.row = player.row - 15;
            weapon.width = 16;
            weapon.height = 24;
        } else if (weapon.state == SPRITERIGHT) {
            weapon.col = player.col + 14;
            weapon.row = player.row;
            weapon.width = 24;
            weapon.height = 16;
        } else if (weapon.state == SPRITELEFT) {
            weapon.col = player.col - 15;
            weapon.row = player.row;
            weapon.width = 24;
            weapon.height = 16;
        }


        if (ghost.active && weapon.active
        && collision(weapon.col, weapon.row, weapon.width, weapon.height, ghost.col, ghost.row, ghost.width, ghost.height)) {
            ghost.active = 0;
            score += 300;
            playSoundA(((signed char*) gamemusic_data), gamemusic_length, 1);
        }

        weapon.timer++;
    }
}


void drawWeapon() {
    if(weapon.active && weapon.timer < 10) {
        shadowOAM[1].attr0 = ((weapon.row - vOff) & 0xFF) | (0 << 13) | (0 << 14);
        shadowOAM[1].attr1 = ((weapon.col - hOff) & 0x1FF) | (1 << 14);
        shadowOAM[1].attr2 = ((0)<<12) | ((0)*32+(8 + weapon.state*2));
        shadowOAM[34].attr0 = ((10) & 0xFF) | (0 << 13) | (0 << 14);
        shadowOAM[34].attr1 = ((10) & 0x1FF) | (1 << 14);
        shadowOAM[34].attr2 = ((0)<<12) | ((13)*32+(6));
    } else {
        shadowOAM[1].attr0 = (2 << 8);
    }
    if (weapon.equipped) {
        shadowOAM[3].attr2 = ((0)<<12) | ((13)*32+(2));
    }
}


void updateCamera() {

    if (camera.equipped) {
        if ((!(~(oldButtons) & ((1<<1))) && (~buttons & ((1<<1)))) && camera.timer > 10){
            playSoundB(((signed char*) camerasound_data), camerasound_length, 0);
            camera.state = player.aniState;
            camera.timer = 0;
        }
        if (camera.timer < 10) {
            camera.state = player.aniState;
            camera.active = 1;
        } else {
            camera.active = 0;
            camera.state = 4;
        }


        if (camera.state == SPRITEFRONT) {
            camera.width = 48;
            camera.height = 32;
            camera.col = player.col - 16;
            camera.row = player.row + player.height;
        } else if (camera.state == SPRITEBACK) {
            camera.width = 48;
            camera.height = 32;
            camera.col = player.col - 16;
            camera.row = player.row - camera.height;
        } else if (camera.state == SPRITERIGHT) {
            camera.width = 32;
            camera.height = 48;
            camera.col = player.col + player.width;
            camera.row = player.row - 16;
        } else if (camera.state == SPRITELEFT) {
            camera.col = player.col - camera.width;
            camera.row = player.row - 16;
            camera.width = 32;
            camera.height = 48;
        }


        for (int i = 0; i < 5; i++) {
            if (camera.active && (occurrences[i].caught == 0)
            && collision(camera.col, camera.row, camera.width, camera.height, occurrences[i].col, occurrences[i].row, occurrences[i].width, occurrences[i].height)) {
                occurrences[i].caught = 1;
                occurrencesCaught++;
                sanity += 10;
                score += 100;
            }
        }

        if (camera.active && ghost.active && !ghost.caught
        && collision(camera.col, camera.row, camera.width, camera.height, ghost.col, ghost.row, ghost.width, ghost.height)) {
            ghost.caught = 1;
            score += 100;
            occurrencesCaught++;
        }

        camera.timer++;
    }
}


void drawCamera() {
    if (camera.equipped) {
        shadowOAM[3].attr0 = ((10) & 0xFF) | (0 << 13) | (0 << 14);
        shadowOAM[3].attr1 = ((10) & 0x1FF) | (1 << 14);
        shadowOAM[3].attr2 = ((0)<<12) | ((13)*32+(4));
        shadowOAM[34].attr0 = ((10) & 0xFF) | (0 << 13) | (0 << 14);
        shadowOAM[34].attr1 = ((10) & 0x1FF) | (1 << 14);
        shadowOAM[34].attr2 = ((0)<<12) | ((13)*32+(6));

        shadowOAM[36].attr0 = ((15) & 0xFF) | (0 << 13) | (0 << 14);
        shadowOAM[36].attr1 = ((30) & 0x1FF) | (0 << 14);
        shadowOAM[36].attr2 = ((0)<<12) | ((16)*32+(occurrencesCaught));

        shadowOAM[43].attr0 = ((15) & 0xFF) | (0 << 13) | (0 << 14);
        shadowOAM[43].attr1 = ((28) & 0x1FF) | (0 << 14);
        shadowOAM[43].attr2 = ((0)<<12) | ((16)*32+(11));
    } else {
        shadowOAM[43].attr0 = (2 << 8);
        shadowOAM[36].attr0 = (2 << 8);
    }
}


void updateGhost() {

    if (ghost.active) {
        if (!ghost.alert) {
            ghostMovement();
        } else {
            chase();
        }


        if (!player.hidden && collision(player.col - 32, player.row - 32, player.width*5, player.height*5, ghost.col, ghost.row, ghost.width, ghost.height)) {
            ghost.alert = 1;
        }
    }

}


void drawGhost() {
    if (ghost.aniCounter % 10 == 0) {
        ghost.curFrame = (ghost.curFrame + 1) % ghost.numFrames;
    }
    if (ghost.active) {
        if (ghost.row + ghost.height - 1 > vOff + ((screenBlock - 26)/2 * 256) && ghost.row < 160 + vOff + ((screenBlock - 26)/2 * 256)) {
            shadowOAM[2].attr0 = ((ghost.row - vOff) & 0xFF) | (0 << 13) | (0 << 14) | (1 << 10);
            shadowOAM[2].attr1 = ((ghost.col - hOff) & 0x1FF) | (1 << 14);
            shadowOAM[2].attr2 = ((0)<<12) | ((6 + ghost.curFrame*2)*32+(ghost.aniState*2));
        } else {
            shadowOAM[2].attr0 = (2 << 8);
        }
        ghost.aniCounter++;
    } else if (!ghost.active) {
        shadowOAM[2].attr0 = (2 << 8);
    }

    *(u16*)(0x04000050) = 1 << 4 | 1 << 8;
    *(u16*)(0x04000052) = 1 << 4 | 1 << 11;
}


void ghostMovement() {
    if (ghost.aniState == SPRITERIGHT) {
        if (ghost.colPrev + ghost.width + ghost.distance > 512 - 48) {
            ghost.distance = 512 - 48 - ghost.colPrev - ghost.width;
            if (ghost.distance < 100) {
                ghost.aniState = SPRITELEFT;
                return;
            }
        }
        if (ghost.col < ghost.colPrev + ghost.distance) {
            ghost.col += ghost.cdel;
        } else {
            ghost.colPrev = ghost.col;
            ghost.rowPrev = ghost.row;
            ghost.aniState = rand() % 4;
            ghost.distance = rand() % 400 + 200;
        }
    } else if (ghost.aniState == SPRITELEFT) {
        if (ghost.colPrev - ghost.distance < 48) {
            ghost.distance = ghost.colPrev - 48;
            if (ghost.distance < 100) {
                ghost.aniState = SPRITERIGHT;
                return;
            }
        }
        if (ghost.col > ghost.colPrev - ghost.distance) {
            ghost.col -= ghost.cdel;
        } else {
            ghost.colPrev = ghost.col;
            ghost.rowPrev = ghost.row;
            ghost.aniState = rand() % 4;
            ghost.distance = rand() % 400;
        }
    } else if (ghost.aniState == SPRITEFRONT) {
        if (ghost.rowPrev + ghost.height + ghost.distance > 576 - 48) {
            ghost.distance = 576 - 48 - ghost.rowPrev - ghost.height;
            if (ghost.distance < 100) {
                ghost.aniState = SPRITEBACK;
                return;
            }
        }
        if (ghost.row < ghost.rowPrev + ghost.distance) {
            ghost.row += ghost.rdel;
        } else {
            ghost.colPrev = ghost.col;
            ghost.rowPrev = ghost.row;
            ghost.aniState = rand() % 4;
            ghost.distance = rand() % 400;
        }
    } else if (ghost.aniState == SPRITEBACK) {
        if (ghost.rowPrev - ghost.distance < 48) {
            ghost.distance = ghost.rowPrev - 48;
            if (ghost.distance < 100) {
                ghost.aniState = SPRITEFRONT;
                return;
            }
        }
        if (ghost.row > ghost.rowPrev - ghost.distance) {
            ghost.row -= ghost.rdel;
        } else {
            ghost.colPrev = ghost.col;
            ghost.rowPrev = ghost.row;
            ghost.aniState = rand() % 4;
            ghost.distance = rand() % 400;
        }
    }

}


void chase() {
    if (ghost.row > player.row) {
        ghost.aniState = SPRITEBACK;
        ghost.row -= ghost.rdel;
    } else if (ghost.row < player.row) {
        ghost.aniState = SPRITEFRONT;
        ghost.row += ghost.rdel;
    }
    if (ghost.col > player.col) {
        ghost.aniState = SPRITELEFT;
        ghost.col -= ghost.cdel;
    } else if (ghost.col < player.col) {
        ghost.aniState = SPRITERIGHT;
        ghost.col += ghost.cdel;
    }
    if (collision(player.col, player.row, player.width, player.height, ghost.col, ghost.row, ghost.width, ghost.height)) {
        goToLose();
    }
}


void updateSanity() {

    if (sanity >= 100 && sanityTimer > 3) {
        ghost.alert = 0;
        ghost.active = 1;
        ghost.col = rand() % 512;
        ghost.row = rand() % 576;
        ghost.colPrev = ghost.col;
        ghost.rowPrev = ghost.row;
        ghost.aniState = rand() % 4;
        ghost.distance = rand() % 400;
        playSoundA(((signed char*) ghostmusic_data), ghostmusic_length, 1);
    }
    if (!ghost.active && sanityTimer % 1 == 0 && sanityTimer > 0 && sanity < 100) {
        sanity += 1;
        sanityTimer = 0;
    }
    if (ghost.active) {
        sanityTimer = 0;
        sanity = 0;
    }
}


void drawSanity() {
    if (ghost.active || (sanity >= 100 && sanityTimer <= 3)) {
        shadowOAM[11].attr0 = ((8) & 0xFF) | (0 << 13) | (1 << 14);
        shadowOAM[11].attr1 = ((240 - 16 - 10) & 0x1FF) | (2 << 14);
        shadowOAM[11].attr2 = ((0)<<12) | ((13)*32+(12));
        shadowOAM[10].attr0 = (2 << 8);
        shadowOAM[9].attr0 = (2 << 8);

        shadowOAM[35].attr0 = ((8) & 0xFF) | (0 << 13) | (1 << 14);
        shadowOAM[35].attr1 = ((240/2 - 16) & 0x1FF) | (2 << 14);
        shadowOAM[35].attr2 = ((0)<<12) | ((13)*32+(16));
    } else {
        shadowOAM[11].attr0 = ((8) & 0xFF) | (0 << 13) | (1 << 14);
        shadowOAM[11].attr1 = ((240 - 16 - 10) & 0x1FF) | (2 << 14);
        shadowOAM[11].attr2 = ((0)<<12) | ((13)*32+(8));

        shadowOAM[10].attr0 = ((12) & 0xFF) | (0 << 13) | (0 << 14);
        shadowOAM[10].attr1 = ((240 - 16 - 10) & 0x1FF) | (0 << 14);
        shadowOAM[10].attr2 = ((0)<<12) | ((16)*32+((sanity % 100)/10));

        shadowOAM[9].attr0 = ((12) & 0xFF) | (0 << 13) | (0 << 14);
        shadowOAM[9].attr1 = ((240 - 16 - 10 + 8) & 0x1FF) | (0 << 14);
        shadowOAM[9].attr2 = ((0)<<12) | ((16)*32+(((sanity % 100) % 10)));

        shadowOAM[35].attr0 = (2 << 8);
    }
}


void updateThermometer() {
    if (cheat && (ghost.type == DEMON) | (ghost.type == ONI) | (ghost.type == WRAITH)) {
        thermometer.temperature = 0;
    }

    if (thermometer.randvar == 1) {
        if (thermometer.temperature > 0 && ((ghost.type == DEMON) | (ghost.type == ONI) | (ghost.type == WRAITH))) {
            thermometer.temperature -= 3;
        } else if (thermometer.temperature > 5) {
            thermometer.temperature -= 3;
        }
        thermometer.randvar = 4;
    }

    if (thermometer.active) {
        if (collision(player.col, player.row, player.width, player.height, thermometer.col, thermometer.row, thermometer.width, thermometer.height)) {
            if ((!(~(oldButtons) & ((1<<0))) && (~buttons & ((1<<0))))) {
                if (thermometer.checking == 0) {
                    thermometer.checking = 1;
                } else {
                    thermometer.checking = 0;
                }
            }
            shadowOAM[50].attr0 = ((150) & 0xFF) | (0 << 13) | (0 << 14);
            shadowOAM[50].attr1 = ((240/2 - 12 - 1) & 0x1FF) | (0 << 14);
            shadowOAM[50].attr2 = ((0)<<12) | ((15)*32+(0));
            shadowOAM[51].attr0 = ((150) & 0xFF) | (0 << 13) | (1 << 14);
            shadowOAM[51].attr1 = ((240/2 - 12 + 8) & 0x1FF) | (1 << 14);
            shadowOAM[51].attr2 = ((0)<<12) | ((14)*32+(22));
        }
        if (thermometer.checking == 1
        && collision(player.col, player.row, player.width, player.height, thermometer.col, thermometer.row, thermometer.width, thermometer.height)) {
            player.idle = 1;
            shadowOAM[50].attr0 = (2 << 8);
            shadowOAM[51].attr0 = (2 << 8);
            shadowOAM[16].attr0 = ((120) & 0xFF) | (0 << 13) | (1 << 14);
            shadowOAM[16].attr1 = ((88) & 0x1FF) | (3 << 14);
            shadowOAM[16].attr2 = ((0)<<12) | ((4)*32+(24));
            if (thermometer.temperature < 0) {
                shadowOAM[15].attr0 = ((137) & 0xFF) | (0 << 13) | (0 << 14);
                shadowOAM[15].attr1 = ((100) & 0x1FF) | (0 << 14);
                shadowOAM[15].attr2 = ((0)<<12) | ((16)*32+(10));
            } else {
                shadowOAM[15].attr0 = (2 << 8);
            }
            shadowOAM[14].attr0 = ((137) & 0xFF) | (0 << 13) | (0 << 14);
            shadowOAM[14].attr1 = ((108) & 0x1FF) | (0 << 14);
            shadowOAM[14].attr2 = ((0)<<12) | ((16)*32+(abs((thermometer.temperature % 100)/10)));
            shadowOAM[13].attr0 = ((137) & 0xFF) | (0 << 13) | (0 << 14);
            shadowOAM[13].attr1 = ((118) & 0x1FF) | (0 << 14);
            shadowOAM[13].attr2 = ((0)<<12) | ((16)*32+(abs((thermometer.temperature % 100) % 10)));
        } else {
            shadowOAM[13].attr0 = (2 << 8);
            shadowOAM[14].attr0 = (2 << 8);
            shadowOAM[15].attr0 = (2 << 8);
            shadowOAM[16].attr0 = (2 << 8);
        }
    }
}


void updateUVLight() {
    if (uvlight.active) {
        if ((ghost.type == DEMON) | (ghost.type == JINN) | (ghost.type == POLTERGEIST)) {
            uvlight.clue = 1;
        }
    }
}


void updateGhostbook() {
    if (cheat && (ghost.type == DEMON) | (ghost.type == BANSHEE)| (ghost.type == POLTERGEIST)) {
        ghostbook.clue = 1;
    }

    if (ghostbook.randvar == 1) {
        if ((ghost.type == DEMON) | (ghost.type == BANSHEE)| (ghost.type == POLTERGEIST)) {
            ghostbook.clue = 1;
        }
    }

    if (ghostbook.active) {
        if (collision(player.col, player.row, player.width, player.height, ghostbook.col, ghostbook.row, ghostbook.width, ghostbook.height)) {
            if ((!(~(oldButtons) & ((1<<0))) && (~buttons & ((1<<0))))) {
                if (ghostbook.checking == 0) {
                    ghostbook.checking = 1;
                } else {
                    ghostbook.checking = 0;
                }
            }
            shadowOAM[50].attr0 = ((150) & 0xFF) | (0 << 13) | (0 << 14);
            shadowOAM[50].attr1 = ((240/2 - 12 - 1) & 0x1FF) | (0 << 14);
            shadowOAM[50].attr2 = ((0)<<12) | ((15)*32+(0));
            shadowOAM[51].attr0 = ((150) & 0xFF) | (0 << 13) | (1 << 14);
            shadowOAM[51].attr1 = ((240/2 - 12 + 8) & 0x1FF) | (1 << 14);
            shadowOAM[51].attr2 = ((0)<<12) | ((14)*32+(22));
        }
        if (ghostbook.checking
        && collision(player.col, player.row, player.width, player.height, ghostbook.col, ghostbook.row, ghostbook.width, ghostbook.height)) {
            player.idle = 1;
            shadowOAM[50].attr0 = (2 << 8);
            shadowOAM[51].attr0 = (2 << 8);
            shadowOAM[6].attr0 = ((80) & 0xFF) | (0 << 13) | (0 << 14);
            shadowOAM[6].attr1 = ((80) & 0x1FF) | (3 << 14);
            shadowOAM[6].attr2 = ((0)<<12) | ((0)*32+(16));
            if (ghostbook.clue == 1) {
                shadowOAM[0].attr0 = ((90) & 0xFF) | (0 << 13) | (2 << 14);
                shadowOAM[0].attr1 = ((90) & 0x1FF) | (2 << 14);
                shadowOAM[0].attr2 = ((0)<<12) | ((0)*32+(24));
                shadowOAM[5].attr0 = ((90) & 0xFF) | (0 << 13) | (2 << 14);
                shadowOAM[5].attr1 = ((122) & 0x1FF) | (2 << 14);
                shadowOAM[5].attr2 = ((0)<<12) | ((0)*32+(26));
            } else {
                shadowOAM[0].attr0 = (2 << 8);
                shadowOAM[5].attr0 = (2 << 8);
            }
        } else {
            shadowOAM[0].attr0 = (2 << 8);
            shadowOAM[5].attr0 = (2 << 8);
            shadowOAM[6].attr0 = (2 << 8);
        }
    }

}


void updateVideoCam() {
    if (cheat && (ghost.type == POLTERGEIST) | (ghost.type == BANSHEE) | (ghost.type == WRAITH)) {
        videocam.clue = 1;
    }

    if (videocam.randvar == 1) {
        if ((ghost.type == POLTERGEIST) | (ghost.type == BANSHEE) | (ghost.type == WRAITH)) {
            videocam.clue = 1;
        }
    }

    if (videocam.active) {
        if (collision(player.col, player.row, player.width, player.height, videocam.col, videocam.row, videocam.width, videocam.height)) {
            if ((!(~(oldButtons) & ((1<<0))) && (~buttons & ((1<<0)))) ) {
                if (videocam.checking == 0) {
                videocam.checking = 1;
                orbRow = rand() % 100 + 30;
                orbCol = rand() % 200 + 20;
            } else {
                videocam.checking = 0;
            }
            }
            shadowOAM[50].attr0 = ((150) & 0xFF) | (0 << 13) | (0 << 14);
            shadowOAM[50].attr1 = ((240/2 - 12 - 1) & 0x1FF) | (0 << 14);
            shadowOAM[50].attr2 = ((0)<<12) | ((15)*32+(0));
            shadowOAM[51].attr0 = ((150) & 0xFF) | (0 << 13) | (1 << 14);
            shadowOAM[51].attr1 = ((240/2 - 12 + 8) & 0x1FF) | (1 << 14);
            shadowOAM[51].attr2 = ((0)<<12) | ((14)*32+(22));
        }
        if (videocam.checking == 1
        && collision(player.col, player.row, player.width, player.height, videocam.col, videocam.row, videocam.width, videocam.height)) {
            player.idle = 1;
            shadowOAM[50].attr0 = (2 << 8);
            shadowOAM[51].attr0 = (2 << 8);
            shadowOAM[26].attr0 = ((0) & 0xFF) | (0 << 13) | (0 << 14);
            shadowOAM[26].attr1 = ((0) & 0x1FF) | (1 << 14);
            shadowOAM[26].attr2 = ((0)<<12) | ((2)*32+(8));
            shadowOAM[27].attr0 = ((0) & 0xFF) | (0 << 13) | (0 << 14);
            shadowOAM[27].attr1 = ((224) & 0x1FF) | (1 << 14);
            shadowOAM[27].attr2 = ((0)<<12) | ((2)*32+(10));
            shadowOAM[28].attr0 = ((144) & 0xFF) | (0 << 13) | (0 << 14);
            shadowOAM[28].attr1 = ((0) & 0x1FF) | (1 << 14);
            shadowOAM[28].attr2 = ((0)<<12) | ((2)*32+(12));
            shadowOAM[29].attr0 = ((144) & 0xFF) | (0 << 13) | (0 << 14);
            shadowOAM[29].attr1 = ((224) & 0x1FF) | (1 << 14);
            shadowOAM[29].attr2 = ((0)<<12) | ((2)*32+(14));
            shadowOAM[30].attr0 = ((8) & 0xFF) | (0 << 13) | (1 << 14);
            shadowOAM[30].attr1 = ((116) & 0x1FF) | (0 << 14);
            shadowOAM[30].attr2 = ((0)<<12) | ((4)*32+(8));
            if (videocam.clue == 1) {

                if (orbTimer % 10 == 0) {
                    if (orbRow > 100) {
                        orbRow--;
                    } else {
                        orbRow++;
                    }
                }
                orbTimer++;
                shadowOAM[31].attr0 = ((orbRow) & 0xFF) | (0 << 13) | (0 << 14);
                shadowOAM[31].attr1 = ((orbCol) & 0x1FF) | (0 << 14);
                shadowOAM[31].attr2 = ((0)<<12) | ((12)*32+(12));
            } else {
                shadowOAM[31].attr0 = (2 << 8);
            }
        } else {
            shadowOAM[26].attr0 = (2 << 8);
            shadowOAM[27].attr0 = (2 << 8);
            shadowOAM[28].attr0 = (2 << 8);
            shadowOAM[29].attr0 = (2 << 8);
            shadowOAM[30].attr0 = (2 << 8);
            shadowOAM[31].attr0 = (2 << 8);
        }
    }
}


void updateSpiritBox() {
    if (cheat && (ghost.type == JINN) | (ghost.type == BANSHEE) | (ghost.type == ONI)) {
        spiritbox.clue = 1;
    }

    if (spiritbox.randvar == 1) {
        if ((ghost.type == JINN) | (ghost.type == BANSHEE) | (ghost.type == ONI)) {
            spiritbox.clue = 1;
        }
    }

    if (spiritbox.active) {
        if (collision(player.col, player.row, player.width, player.height, spiritbox.col, spiritbox.row, spiritbox.width, spiritbox.height)) {
            if ((!(~(oldButtons) & ((1<<0))) && (~buttons & ((1<<0))))) {
                if (spiritbox.checking == 0) {
                    spiritbox.checking = 1;
                } else {
                    spiritbox.checking = 0;
                }
                if (spiritbox.clue == 1) {
                    playSoundB(((signed char*) spiritboxsound_data), spiritboxsound_length, 1);
                } else {
                    playSoundB(((signed char*) staticsound_data), staticsound_length, 1);
                }
            }
            shadowOAM[50].attr0 = ((150) & 0xFF) | (0 << 13) | (0 << 14);
            shadowOAM[50].attr1 = ((240/2 - 12 - 1) & 0x1FF) | (0 << 14);
            shadowOAM[50].attr2 = ((0)<<12) | ((15)*32+(0));
            shadowOAM[51].attr0 = ((150) & 0xFF) | (0 << 13) | (1 << 14);
            shadowOAM[51].attr1 = ((240/2 - 12 + 8) & 0x1FF) | (1 << 14);
            shadowOAM[51].attr2 = ((0)<<12) | ((14)*32+(22));
        }
        if (spiritbox.checking
        && collision(player.col, player.row, player.width, player.height, spiritbox.col, spiritbox.row, spiritbox.width, spiritbox.height)) {
            *(volatile unsigned short*)0x4000102 = (0<<7);
            if (spiritbox.clue == 1) {
                if (soundB.data == ((signed char*) staticsound_data)) {
                    playSoundB(((signed char*) spiritboxsound_data), spiritboxsound_length, 1);
                }
            }
            player.idle = 1;
            shadowOAM[50].attr0 = (2 << 8);
            shadowOAM[51].attr0 = (2 << 8);
        } else {
            *(volatile unsigned short*)0x4000102 = (1<<7);
            if (soundB.data == ((signed char*) spiritboxsound_data) || soundB.data == ((signed char*) staticsound_data)) {
                *(volatile unsigned short*)0x4000106 = (0<<7);
            }
        }
    }

}


void hideText() {
    if (!(collision(player.col, player.row, player.width, player.height, spiritbox.col, spiritbox.row, spiritbox.width, spiritbox.height)
    || collision(player.col, player.row, player.width, player.height, videocam.col, videocam.row, videocam.width, videocam.height)
    || collision(player.col, player.row, player.width, player.height, ghostbook.col, ghostbook.row, ghostbook.width, ghostbook.height)
    || collision(player.col, player.row, player.width, player.height, thermometer.col, thermometer.row, thermometer.width, thermometer.height))) {
        shadowOAM[50].attr0 = (2 << 8);
        shadowOAM[51].attr0 = (2 << 8);
    }
    for (int i = 0; i < 6; i++) {
        if (!(collision(items[0].col, items[0].row, items[0].width, items[0].height, player.col, player.row, player.width, player.height)
        || collision(items[1].col, items[1].row, items[1].width, items[1].height, player.col, player.row, player.width, player.height)
        || collision(items[2].col, items[2].row, items[2].width, items[2].height, player.col, player.row, player.width, player.height)
        || collision(items[3].col, items[3].row, items[3].width, items[3].height, player.col, player.row, player.width, player.height)
        || collision(items[4].col, items[4].row, items[4].width, items[4].height, player.col, player.row, player.width, player.height)
        || collision(items[5].col, items[5].row, items[5].width, items[5].height, player.col, player.row, player.width, player.height))
        ) {
            shadowOAM[48].attr0 = (2 << 8);
            shadowOAM[49].attr0 = (2 << 8);
        }
    }
}
