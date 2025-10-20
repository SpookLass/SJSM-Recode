/*
Argument 0: Texture to load (-1 for default)
*/
if argument0 < 0
{
    if global.mode_var == 0 // Story Mode
    {
        switch floor(global.rm_count_var/50)
        {
            case 0: { global.tex_var = 0; break; } // 0-49
            case 1: { global.tex_var = 1; break; } // 50-99
            case 2: { global.tex_var = 2; break; } // 100-149
            case 3: { global.tex_var = 3; break; } // 150-199
            case 4: case 5: { global.tex_var = 4; break; } // 200-299
            case 6: case 7: { global.tex_var = 5; break; } // 300-399
            case 8: case 9: case 10: case 11: { global.tex_var = 6; break; } // 400-599
            case 12: case 13: { global.tex_var = 7; break; } // 600-699
            case 14: case 15: { global.tex_var = 8; break; } // 700-799
            case 16: case 17: { global.tex_var = 9; break; } // 800-899
            case 18: case 19: // 900-999
            {
                if global.rm_count_var >= 995 { global.tex_var = 2; }
                else { global.tex_var = 10; }
                break;
            }
            default: { mod_scr(floor(global.rm_count_var/100)+1,global.tex_len_var); break; } // 0- & 1000+
        }
    }
    else { global.tex_var = irandom(global.tex_len_var-1); }
}
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