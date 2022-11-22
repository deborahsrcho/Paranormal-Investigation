
//{{BLOCK(manualBg)

//======================================================================
//
//	manualBg, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 240 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 7680 + 2048 = 10240
//
//	Time-stamp: 2022-11-20, 02:14:00
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_MANUALBG_H
#define GRIT_MANUALBG_H

#define manualBgTilesLen 7680
extern const unsigned short manualBgTiles[3840];

#define manualBgMapLen 2048
extern const unsigned short manualBgMap[1024];

#define manualBgPalLen 512
extern const unsigned short manualBgPal[256];

#endif // GRIT_MANUALBG_H

//}}BLOCK(manualBg)
