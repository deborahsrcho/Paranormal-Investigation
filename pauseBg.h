
//{{BLOCK(pauseBg)

//======================================================================
//
//	pauseBg, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 468 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 14976 + 2048 = 17536
//
//	Time-stamp: 2022-12-05, 01:32:43
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_PAUSEBG_H
#define GRIT_PAUSEBG_H

#define pauseBgTilesLen 14976
extern const unsigned short pauseBgTiles[7488];

#define pauseBgMapLen 2048
extern const unsigned short pauseBgMap[1024];

#define pauseBgPalLen 512
extern const unsigned short pauseBgPal[256];

#endif // GRIT_PAUSEBG_H

//}}BLOCK(pauseBg)
