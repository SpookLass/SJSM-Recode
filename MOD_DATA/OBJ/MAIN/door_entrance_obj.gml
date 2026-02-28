// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    store_tex_var = door_entrance_bg_tex;
    event_inherited();
    mdl_var = door_mdl;
    mdl_path_var = door_mdl_path;
    open_var = false;
    flesh_var = 2;
');
// Break
object_event_add
(argument0,ev_other,ev_user0,'
    if !open_var
    {
        mdl_var = door_broke_mdl;
        mdl_path_var = door_broke_mdl_path;
        direction += 180;
        fmod_snd_3d_play_scr(break_snd,x,y,z);
        open_var = true;
        local.door = id;
        with player_obj
        {
            local.player = id;
            switch (global.shake_type_var)
            {
                case shake_classic_const:
                {
                    with instance_create(0,0,shake_eff_obj)
                    {
                        player_var = local.player;
                        mult_var = local.player.shake_pos_base_var;
                        type_var = 0; // Constant
                    }
                    break;
                }
                case shake_modern_const:
                {
                    local.mult = median(0,1,1-(point_distance_3d_scr(x,y,z,local.door.x,local.door.y,local.door.z)/600))
                    with instance_create(0,0,shake_eff_obj)
                    {
                        player_var = local.player;
                        mult_var = local.player.shake_angle_base_var*local.mult;
                        type_var = 1; // Fade out
                    }
                    break;
                }
            }
        }
    }
');