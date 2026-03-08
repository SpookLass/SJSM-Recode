/*
Argument 0: Sprite file path
Author: The Rut
*/
local.spr = sprite_add(argument0,1,false,true,0,0);
// Only include if sprite is centered
sprite_set_offset(local.spr,sprite_get_width(local.spr)/2,sprite_get_height(local.spr)-233);
return local.spr;