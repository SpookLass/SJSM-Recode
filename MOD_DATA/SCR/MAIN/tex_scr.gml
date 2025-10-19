/*
Argument 0: Texture to load (-1 for default)
*/
if argument0 < 0 { global.tex_var = irandom(global.tex_len_var-1); }
else { global.tex_var = median(0,global.tex_len_var-1,argument0); }
background_delete(floor_bg);
background_delete(wall_bg);
background_delete(ceil_bg);
floor_bg = background_add(global.tex_arr[global.tex_var,0],false,false);
wall_bg = background_add(global.tex_arr[global.tex_var,1],false,false);
ceil_bg = background_add(global.tex_arr[global.tex_var,2],false,false);
floor_bg_tex = background_get_texture(floor_bg);
wall_bg_tex = background_get_texture(wall_bg);
ceil_bg_tex = background_get_texture(ceil_bg);
sprite_delete(light_floor_spr);
sprite_delete(light_wall_spr);
light_floor_spr = sprite_add(global.tex_arr[global.tex_var,3],2,false,false,0,0);
light_wall_spr = sprite_add(global.tex_arr[global.tex_var,4],2,false,false,0,0);
light_wall_obj_spr = light_wall_spr;
light_floor_obj_spr = light_floor_spr;