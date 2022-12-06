
//{{BLOCK(background)

//======================================================================
//
//	background, 512x768@8, 
//	+ palette 256 entries, not compressed
//	+ 852 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x96 
//	Total size: 512 + 54528 + 12288 = 67328
//
//	Time-stamp: 2022-12-05, 18:48:51
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BACKGROUND_H
#define GRIT_BACKGROUND_H

#define backgroundTilesLen 54528
extern const unsigned short backgroundTiles[27264];

#define backgroundMapLen 12288
extern const unsigned short backgroundMap[6144];

#define backgroundPalLen 512
extern const unsigned short backgroundPal[256];

#endif // GRIT_BACKGROUND_H

//}}BLOCK(background)
