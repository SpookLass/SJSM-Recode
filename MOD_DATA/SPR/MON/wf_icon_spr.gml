/*
Argument 0: Sprite file path
Author: Spook Lass
*/
local.spr = sprite_add(argument0,1,false,false,0,0);
// Only include if sprite is centered
sprite_set_offset(local.spr,sprite_get_width(local.spr),0);
return local.spr;