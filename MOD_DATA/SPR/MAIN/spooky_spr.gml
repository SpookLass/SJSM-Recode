/*
Argument 0: Sprite file path
*/
local.spr = sprite_add(vanilla_directory_const+"\TEX\sprites\spooky_spr.png",9,false,false,0,0);
// Only include if sprite is centered
sprite_set_offset(local.spr,sprite_get_width(local.spr)/2,108);
return local.spr;