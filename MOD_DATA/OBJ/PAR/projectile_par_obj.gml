// Builtin Variables
object_set_depth(argument0,0);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_3d_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    // Variables
    // Damage
        if !variable_local_exists("dmg_var") { dmg_var = 30; }
        if !variable_local_exists("dmg_alarm_var") { dmg_alarm_var = 0; }
        if !variable_local_exists("dmg_min_var") { dmg_min_var = 0; }
        if !variable_local_exists("dmg_unbalance_var") { dmg_unbalance_var = false; }
        if !variable_local_exists("dmg_eff_var") { dmg_eff_var = true; }
        if !variable_local_exists("dmg_stam_var") { dmg_stam_var = 0; }
        if !variable_local_exists("dmg_rm_var") { dmg_rm_var = dead_rm; }
    // Attack
        if !variable_local_exists("atk_destroy_var") { atk_destroy_var = false; }
        if !variable_local_exists("blood_spr_var") { blood_spr_var = blood_spr; }
        if !variable_local_exists("atk_flash_var") { atk_flash_var = true; }
        if !variable_local_exists("atk_snd_var") { atk_snd_var = 0; }
        if !variable_local_exists("kill_var") { kill_var = true; }
    // Collision
        if !variable_local_exists("coll_destroy_var") { coll_destroy_var = true; }
        if !variable_local_exists("bounce_var") { bounce_var = 0; }
    // Draw
        if !variable_local_exists("w_var") { w_var = 10; }
        if !variable_local_exists("h_var") { h_var = 10; }
        if !variable_local_exists("color_var") { color_var = 2; }
        if !variable_local_exists("reflect_var") { reflect_var = true; }
    event_inherited();
    par_var = noone;
    atk_target_var = noone;
');
// Step Normal Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    if dmg_var > 0
    {
        local.dead = (dmg_min_var <= 0);
        local.success = false;
        local.possess = false;
        local.possesser = noone;
        if instance_exists(par_var)
        {
            local.possess = par_var.possess_var;
            if local.possess { local.possesser = global.player_arr[par_var.player_id_var]; }
        }
        with player_obj
        {
            if atk_player_scr
            (
                id,other.id, // Player & Monster
                other.dmg_var,other.dmg_alarm_var,other.dmg_min_var, // Damage
                true,other.coll_var[2], // Collisions
                !other.dmg_unbalance_var,other.dmg_eff_var, // Effects
                local.possess,local.possesser, // Possess
                other.dmg_stam_var // Stamina?
            )
            {
                other.atk_target_var = id;
                local.success = true;
            }
            if !dead_var { local.dead = false; }
        }
        if local.success
        {
            if local.dead && !global.debug_var && !possess_var
            { kill_scr(atk_target_var,object_index,dead_rm_var,kill_var); }
            else { event_user(2); }
        }
    }
');
// Event Step End
object_event_add
(argument0,ev_step,ev_step_end,'
    event_inherited();
    if did_coll_var { event_user(0); }
    if on_floor_var { event_user(1); }
');
// Collide Event
object_event_add
(argument0,ev_other,ev_user0,'
    if coll_destroy_var { instance_destroy(); }
    else if bounce_var > 0 { bounce_3d_scr(0,0,0,bounce_var); }
');
// On Floor Event
object_event_add
(argument0,ev_other,ev_user1,'
');
// Attack Success
object_event_add
(argument0,ev_other,ev_user2,'
    switch atk_snd_var
    {
        case 0: { fmod_snd_play_scr(claw_snd); break; } // Scratch!
        case 1: { fmod_snd_play_scr(choose(axe_hit_01_snd,axe_hit_02_snd)); break; } // Clank!
        case 2: { fmod_snd_play_scr(choose(axe_01_snd,axe_02_snd,axe_03_snd)); break; } // Ding!
        case 3: { fmod_snd_play_scr(atk_snd_var[1]); break; } // Custom
    }
    if blood_spr_var > 0
    {
        with instance_create(0,0,blood_eff_obj)
        {
            spr_var = other.blood_spr_var;
            spr_id_var = irandom(sprite_get_number(spr_var)-1);
            // Set camera to player
            cam_id_var = other.atk_target_var.cam_id_var;
        }
    }
    if atk_flash_var && !global.reduce_flash_var
    {
        with instance_create(0,0,flash_eff_obj)
        {
            image_blend = c_red; 
            set_alarm_scr(0,6);
            cam_id_var = other.atk_target_var.cam_id_var;
        }
    }
    if atk_destroy_var { instance_destroy(); }
');