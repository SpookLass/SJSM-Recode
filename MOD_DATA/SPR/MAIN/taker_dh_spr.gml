/*
Argument 0: Sprite file path
Author: Spook Lass
*/
if !global.dh_var { return noone; }
local.spr = sprite_add(dh_directory_const+"\TEX\sprites\TK_SPR.png",20,false,false,0,0);
// Only include if sprite is centered
sprite_set_offset(local.spr,sprite_get_width(local.spr)*0.5,sprite_get_height(local.spr)*0.5);
return local.spr;