/*
Argument 0: Texture to load (-1 for default)
*/
if argument0 < 0
{
    switch global.tex_rand_var
    {
        case 0: { global.tex_var = mod_scr(ele_prog_scr(global.rm_count_var),tex_len_arr[global.mode_var]); break; }
        case 1: { global.tex_var = irandom(tex_len_arr[global.mode_var]-1); break; }
        case 2:
        {
            if ds_list_size(tex_list) <= 0
            {
                for (local.i=0; local.i<tex_len_arr[global.mode_var]; local.i+=1;)
                { ds_list_add(tex_list,local.i); }
                ds_list_shuffle(tex_list);
            }
            global.tex_var = ds_list_find_value(tex_list,0);
            ds_list_delete(tex_list,0);
            break;
        }
    }
    if global.tex_rand_var {  }
    else {  }
}
else { global.tex_var = median(0,tex_len_arr[global.mode_var]-1,argument0); }
background_delete(floor_bg);
background_delete(wall_bg);
background_delete(ceil_bg);
floor_bg = bg_add_scr(tex_floor_arr[global.mode_var,global.tex_var],false,false);
wall_bg = bg_add_scr(tex_wall_arr[global.mode_var,global.tex_var],false,false);
ceil_bg = bg_add_scr(tex_ceil_arr[global.mode_var,global.tex_var],false,false);
floor_bg_tex = background_get_texture(floor_bg);
wall_bg_tex = background_get_texture(wall_bg);
ceil_bg_tex = background_get_texture(ceil_bg);
sprite_delete(light_floor_spr);
sprite_delete(light_wall_spr);
light_floor_spr = spr_add_scr(tex_light_floor_arr[global.mode_var,global.tex_var],2,false,false,0,0);
light_wall_spr = spr_add_scr(tex_light_wall_arr[global.mode_var,global.tex_var],2,false,false,0,0);
light_wall_obj_spr = light_wall_spr;
light_floor_obj_spr = light_floor_spr;