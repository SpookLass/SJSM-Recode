// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Create event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    spr_var = map_spr;
    spr_id_var = irandom(sprite_get_number(map_spr)-1);
    path_spd_var = random_range(0.1,0.3);
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    path_speed = path_spd_var*global.delta_time_var;
');
// Path End
object_event_add
(argument0,ev_other,ev_end_of_path,'
    path_spd_var = random_range(0.1,0.3);
    local.path = par_var.path_var[irandom(par_var.path_len_var-1)];
    path_start(local.path,path_spd_var*global.delta_time_var,0,false);
');
// Draw event (only used for surface)
object_event_add
(argument0,ev_draw,0,'
    local.width = sprite_get_width(spr_var);
    local.height = sprite_get_height(spr_var);
    local.xtmp = mod_scr(x+local.width,256+(local.width*2))-local.width;
    local.ytmp = mod_scr(y+local.height,256+(local.height*2))-local.height;
    draw_sprite(spr_var,spr_id_var,local.xtmp,local.ytmp);
');