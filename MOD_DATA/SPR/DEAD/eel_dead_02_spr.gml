/*
Argument 0: Sprite file path
*/
local.spr = sprite_add(argument0,1,false,true,0,0);
// Only include if sprite is centered
sprite_set_offset(local.spr,sprite_get_width(local.spr)/2,100); // 233
return local.spr;