
//{{BLOCK(manualBg)

//======================================================================
//
//	manualBg, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 385 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 12320 + 2048 = 14880
//
//	Time-stamp: 2022-12-04, 21:45:14
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_MANUALBG_H
#define GRIT_MANUALBG_H

#define manualBgTilesLen 12320
extern const unsigned short manualBgTiles[6160];

#define manualBgMapLen 2048
extern const unsigned short manualBgMap[1024];

#define manualBgPalLen 512
extern const unsigned short manualBgPal[256];

#endif // GRIT_MANUALBG_H

//}}BLOCK(manualBg)
