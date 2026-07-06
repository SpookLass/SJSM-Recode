/*
Argument 0: Sprite file path
*/
local.spr = sprite_add(dh_directory_const+"\TEX\sprites\HK_SPR4.png",9,false,false,0,0);
// Only include if sprite is centered
sprite_set_offset(local.spr,sprite_get_width(local.spr)*0.5,sprite_get_height(local.spr)*0.5);
return local.spr;