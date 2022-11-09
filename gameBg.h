
//{{BLOCK(gameBg)

//======================================================================
//
//	gameBg, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 5 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 160 + 2048 = 2720
//
//	Time-stamp: 2022-11-08, 16:59:39
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMEBG_H
#define GRIT_GAMEBG_H

#define gameBgTilesLen 160
extern const unsigned short gameBgTiles[80];

#define gameBgMapLen 2048
extern const unsigned short gameBgMap[1024];

#define gameBgPalLen 512
extern const unsigned short gameBgPal[256];

#endif // GRIT_GAMEBG_H

//}}BLOCK(gameBg)
