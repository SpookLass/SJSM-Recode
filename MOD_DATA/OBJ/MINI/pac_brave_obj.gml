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
    eye_base_spr_var = par_var.brave_spr_var;
    eye_brave_spr_var = par_var.brave_scare_spr_var;
    eye_spr_var = eye_base_spr_var;
    image_blend = scare_color_var;
    brave_var = false;
    brave_dist_var = 8; // 4
');
// Step event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if state_var != 2 && brave_var
    {
        eye_spr_var = eye_base_spr_var;
        brave_var = false;
    }
    event_inherited();
');
// Target event
object_event_add
(argument0,ev_other,ev_user0,'
    target_run_var = false;
    event_inherited();
');
// Chase target event
object_event_add
(argument0,ev_other,ev_user1,'
    event_inherited();
    if target_var != noone
    {
        local.braveprev = brave_var;
        brave_var = (target_dist_var <= brave_dist_var);
        if local.braveprev != brave_var
        {
            local.bool = (dir_var != target_var.dir_var)
            if brave_var == local.bool { dir_var = mod_scr(dir_var+2,4); }
            if brave_var { eye_spr_var = eye_brave_spr_var; }
            else { eye_spr_var = eye_base_spr_var; }
        }
        if !brave_var { target_run_var = true; }
    }
');