/*
Argument 0: Sprite file path
*/
local.spr = sprite_add(argument0,2,false,false,0,115);
// Only include if sprite is centered
sprite_set_offset(local.spr,(sprite_get_width(local.spr)/2)-15,sprite_get_height(local.spr)+56);
return local.spr;