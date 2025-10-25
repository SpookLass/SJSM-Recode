/*
Argument 0: Sprite file path
*/
local.spr = sprite_add(argument0,19,false,false,0,0);
// Only include if sprite is centered
// sprite_set_offset(local.spr,sprite_get_width(local.spr)/2,sprite_get_height(local.spr)/2);
return local.spr;