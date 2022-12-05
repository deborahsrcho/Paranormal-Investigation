
//{{BLOCK(pauseBg)

//======================================================================
//
//	pauseBg, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 472 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 15104 + 2048 = 17664
//
//	Time-stamp: 2022-12-04, 16:46:14
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_PAUSEBG_H
#define GRIT_PAUSEBG_H

#define pauseBgTilesLen 15104
extern const unsigned short pauseBgTiles[7552];

#define pauseBgMapLen 2048
extern const unsigned short pauseBgMap[1024];

#define pauseBgPalLen 512
extern const unsigned short pauseBgPal[256];

#endif // GRIT_PAUSEBG_H

//}}BLOCK(pauseBg)
