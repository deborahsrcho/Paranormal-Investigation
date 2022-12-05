
//{{BLOCK(map)

//======================================================================
//
//	map, 512x768@8, 
//	+ palette 256 entries, not compressed
//	+ 852 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x96 
//	Total size: 512 + 54528 + 12288 = 67328
//
//	Time-stamp: 2022-12-03, 18:59:14
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_MAP_H
#define GRIT_MAP_H

#define mapTilesLen 54528
extern const unsigned short mapTiles[27264];

#define mapMapLen 12288
extern const unsigned short mapMap[6144];

#define mapPalLen 512
extern const unsigned short mapPal[256];

#endif // GRIT_MAP_H

//}}BLOCK(map)
