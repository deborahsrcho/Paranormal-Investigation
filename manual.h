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