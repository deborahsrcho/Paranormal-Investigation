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
}  THERMOMETER;
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
#define MAPWIDTH 512
#define MAPHEIGHT 576
#define OCCURRENCECOUNT 5
#define ITEMCOUNT 6
#define SANITYMAX 100

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
extern OCCURRENCE occurrences[OCCURRENCECOUNT];
extern OCCURRENCE items[ITEMCOUNT];
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