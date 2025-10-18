/*
Argument 0: Texture to load (-1 for default)
*/
if argument0 < 0 { global.tex_var = irandom(global.tex_len_var-1); }
else { global.tex_var = median(0,global.tex_len_var-1,argument0); }
background_replace(floor_bg,global.tex_arr[global.tex_var,0],false,false);
background_replace(wall_bg,global.tex_arr[global.tex_var,1],false,false);
background_replace(ceil_bg,global.tex_arr[global.tex_var,2],false,false);
sprite_replace(light_floor_spr,global.tex_arr[global.tex_var,3],2,false,false,0,0);
sprite_replace(light_wall_spr,global.tex_arr[global.tex_var,4],2,false,false,0,0);