
//{{BLOCK(startBg)

//======================================================================
//
//	startBg, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 500 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 16000 + 2048 = 18560
//
//	Time-stamp: 2022-12-04, 16:40:07
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_STARTBG_H
#define GRIT_STARTBG_H

#define startBgTilesLen 16000
extern const unsigned short startBgTiles[8000];

#define startBgMapLen 2048
extern const unsigned short startBgMap[1024];

#define startBgPalLen 512
extern const unsigned short startBgPal[256];

#endif // GRIT_STARTBG_H

//}}BLOCK(startBg)
