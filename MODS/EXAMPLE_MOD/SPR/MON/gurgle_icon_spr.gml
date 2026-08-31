/*
Argument 0: Sprite file path
Author: Spook Lass
*/
local.spr = sprite_add(argument0+".png",4,false,false,0,0);
// Only include if sprite is centered
sprite_set_offset(local.spr,0,sprite_get_height(local.spr)*0.5);
return local.spr;