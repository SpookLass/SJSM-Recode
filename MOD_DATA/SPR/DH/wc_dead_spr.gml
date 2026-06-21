/*
Argument 0: Sprite file path
*/
local.spr = sprite_add(dh_directory_const+"\TEX\sprites\WD_SPR7.png",11,false,false,0,0);
// Only include if sprite is centered
sprite_set_offset(local.spr,sprite_get_width(local.spr),sprite_get_height(local.spr));
return local.spr;