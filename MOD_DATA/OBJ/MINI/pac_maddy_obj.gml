// Builtin Variables
object_set_depth(argument0,0);
object_set_mask(argument0,noone);
object_set_parent(argument0,pac_control_obj.pac_ghost_obj_var);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    eye_base_spr_var = par_var.maddy_spr_var;
    eye_angry_spr_var = par_var.maddy_angry_spr_var;
    eye_spr_var = eye_base_spr_var;
    image_blend = make_color_rgb(255,255,101);
    angry_per_var = 0.25;
    angry_var = false;
');
// Step event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if par_var.map_pellet_var[par_var.map_var] > 0
    { 
        local.bool = ((par_var.pellet_var/par_var.map_pellet_var[par_var.map_var]) <= angry_per_var);
        if local.bool != angry_var
        {
            angry_var = local.bool;
            if angry_var { eye_spr_var = eye_angry_spr_var; }
            else { eye_spr_var = eye_base_spr_var; }
        }
    }
    event_inherited();
');
// Chase target event
object_event_add
(argument0,ev_other,ev_user1,'
    event_inherited();
    if target_var == noone { exit; }
    local.per = 0;
    if par_var.map_pellet_var[par_var.map_var] > 0
    { local.per = 1-(par_var.pellet_var/par_var.map_pellet_var[par_var.map_var]); }
    if local.per > 0
    {
        for (local.i=1; local.i<=round(target_dist_var*local.per); local.i+=1;)
        {
            local.xtmp = mod_scr(target_var.x+lengthdir_x(local.i,target_var.dir_var*90),ds_grid_width(par_var.map_grid_var));
            local.ytmp = mod_scr(target_var.y+lengthdir_y(local.i,target_var.dir_var*90),ds_grid_height(par_var.map_grid_var));
            local.coll = ds_grid_get(par_var.map_grid_var,local.xtmp,local.ytmp);
            if local.coll == 1 || local.coll == 2 { break; }
            target_x_var = local.xtmp;
            target_y_var = local.ytmp;
        }
    }
');
// Scatter target event
object_event_add
(argument0,ev_other,ev_user2,'
    local.bool = false;
    if par_var.map_pellet_var[par_var.map_var] > 0
    { local.bool = ((par_var.pellet_var/par_var.map_pellet_var[par_var.map_var]) <= angry_per_var) }
    if local.bool { event_user(1); }
    else { event_inherited(); }
');