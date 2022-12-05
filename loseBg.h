
//{{BLOCK(loseBg)

//======================================================================
//
//	loseBg, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 479 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 15328 + 2048 = 17888
//
//	Time-stamp: 2022-12-02, 22:09:53
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_LOSEBG_H
#define GRIT_LOSEBG_H

#define loseBgTilesLen 15328
extern const unsigned short loseBgTiles[7664];

#define loseBgMapLen 2048
extern const unsigned short loseBgMap[1024];

#define loseBgPalLen 512
extern const unsigned short loseBgPal[256];

#endif // GRIT_LOSEBG_H

//}}BLOCK(loseBg)
