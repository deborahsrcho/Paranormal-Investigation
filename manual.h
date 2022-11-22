typedef struct {
    int row;
    int col;
    int type;
} CURSOR;

extern CURSOR cursor;
extern OBJ_ATTR shadowOAM[128];

void initCursor();
void drawManual();
void updateCursor();