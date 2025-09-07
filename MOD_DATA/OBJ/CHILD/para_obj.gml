// Builtin Variables
object_set_depth(argument0,0);
object_set_mask(argument0,noone);
object_set_parent(argument0,echidna_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
/* Parasite / Specimen 10
state_var
    0: Closed
    1: Open
    2: Leech
state_spd_var, state_spr_var, state_spr_spd_var, state_dmg_var, state_dmg_alarm_var, state_w_var, state_h_var, state_acc_var:
    All arrays based on the current state, set when changing forms
state_dist_var: Distance to change states, arrayed variable
state_chance_var: Chance to change states, arrayed variable
state_alarm_var: How often to check state, arrayed variable
state_rm_var: Whether state should persist between rooms
state_atk_var: Whether state should persist when attacking
state_close_var: Whether state should return to close when the player is further
state_check_var: Whether to check states every frame. HD only
state_delay_var: How long to delay after hitting the player in leech form
state_dur_var: If greater than 0, the duration will be set when turning into leech form, Recode only
do_warn_var: Whether to use a warning hallucination
warn_var: Whether the warning has been sent
warn_dist_var: Distance to warn at
*/
// Create Event Begin
object_event_add
(argument0,ev_other,ev_user7,"
    type_var = 1;
    dur_var = irandom_range(10,20);
    hurt_dur_var = 1;
    hurt_alarm_var = 1;
    delay_calc_var = true;
    do_warn_var = false;
    warn_var = false;
    warn_dist_var = 320/3;
    // State
    state_var = 0;
    state_rm_var = false;
    state_atk_var = true;
    state_close_var = true;
    state_check_var = false;
    state_delay_var = 0;
    state_dur_var = 0;
    // Closed
    state_spd_var[0] = 1/3;
    state_spr_var[0] = sprite_add(vanilla_directory_const+'\TEX\sprites\MS8_01_spr.png',6,false,false,0,0);
    state_spr_spd_var[0] = 1/12;
    state_dmg_var[0] = 40;
    state_dmg_alarm_var[0] = 120;
    state_w_var[0] = 5.5;
    state_h_var[0] = 22;
    state_dist_var[0] = 128;
    state_chance_var[0] = 6;
    state_alarm_var[0] = 12;
    state_acc_var[2] = false;
    // Open
    state_spd_var[1] = 1/3;
    state_spr_var[1] = sprite_add(vanilla_directory_const+'\TEX\sprites\MS8_02_spr.png',6,false,false,0,0);
    state_spr_spd_var[1] = 1/12;
    state_dmg_var[1] = 40;
    state_dmg_alarm_var[1] = 120;
    state_w_var[1] = 17.8;
    state_h_var[1] = 22;
    state_dist_var[1] = 56;
    state_chance_var[1] = 6;
    state_alarm_var[1] = 12;
    state_acc_var[2] = false;
    // Leech
    state_spd_var[2] = 7/3;
    state_spr_var[2] = sprite_add(vanilla_directory_const+'\TEX\sprites\MS8_03_spr.png',7,false,false,0,0);
    state_spr_spd_var[2] = 1/3;
    state_dmg_var[2] = 15;
    state_dmg_alarm_var[2] = 120;
    state_w_var[2] = 7.5;
    state_h_var[2] = 10;
    state_dist_var[2] = 240;
    state_chance_var[2] = 2;
    state_alarm_var[2] = 60;
    state_acc_var[2] = false;
    // Effect
    spr_eff_var = sprite_add(main_directory_const+'\SPR\MON\para_eff_spr.png',19,false,false,0,0);
    eff_min_var = 30;
    eff_max_var = 60;
    state_eff_min_var = 30;
    state_eff_max_var = 60;
    // Type
    switch global.para_type_var
    {
        case 0: // Mod
        {
            delay_calc_var = false;
            delay_var = 60;
            state_spd_var[0] = 0.8;
            state_chance_var[0] = 1;
            state_spr_spd_var[0] = 1/6;
            state_spd_var[1] = 0.5;
            state_chance_var[1] = 1;
            state_spd_var[2] = 1.8;
            state_chance_var[2] = 1;
            state_acc_var[2] = true;
            state_dmg_alarm_var[2] = 60;
            state_rm_var = true;
            state_dur_var = 8;
            state_eff_min_var = 6;
            state_eff_max_var = 6;
            acc_var = 0.1;
            frick_var = acc_var;
            break;
        }
        case 2: // HD
        {
            dur_var = irandom_range(10,15);
            do_warn_var = true;
            delay_calc_var = false;
            delay_min_var = 90;
            delay_max_var = 180;
            state_delay_var = 72;
            state_rm_var = true;
            state_atk_var = false;
            state_dmg_alarm_var[0] = 180;
            state_spd_var[0] = 4/9;
            state_dmg_var[2] = 45;
            state_chance_var[0] = 1;
            state_acc_var[0] = true;
            state_dmg_alarm_var[1] = 180;
            state_spd_var[1] = 8/15;
            state_dmg_var[2] = 45;
            state_dist_var[1] = 64;
            state_chance_var[1] = 1;
            state_acc_var[1] = true;
            state_dmg_alarm_var[2] = 180;
            state_spd_var[2] = 16/9;
            state_dmg_var[2] = 45;
            state_dist_var[2] = 160;
            state_chance_var[2] = 1;
            state_acc_var[2] = true;
            state_close_var = false;
            state_check_var = true;
            state_eff_min_var = 6;
            state_eff_max_var = 6;
            // Rough estimate based on old man
            acc_var = 8/135;
            frick_var = acc_var;
            break;
        }
    }
    // Delay calculation
    if delay_calc_var
    { delay_var = max(0,32-(32/state_spd_var[0])); }
    // Alarms
    alarm_len_var = 8;
    alarm_arr[6,2] = '';
    alarm_arr[7,2] = '';
    // Inherit
    event_inherited();
    // Defaults
    spd_base_var = state_spd_var[0];
    spr_var = state_spr_var[0]
    spr_spd_var = state_spr_spd_var[0];
    dmg_var = state_dmg_var[0];
    dmg_alarm_var = state_dmg_alarm_var[0];
    w_var = state_w_var[0];
    h_var = state_h_var[0];
    do_acc_var = state_acc_var[0];
");
// Destroy Event
object_event_add
(argument0,ev_destroy,0,"
    event_inherited();
    sprite_delete(spr_eff_var);
    sprite_delete(state_spr_var[0]);
    sprite_delete(state_spr_var[1]);
    sprite_delete(state_spr_var[2]);
");
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,"
    if state_var < 2 || !state_rm_var
    {
        state_var = 0;
        event_perform(ev_other,ev_user15); 
    }
    else if delay_calc_var // Delay calculation
    {
        delay_min_var = max(0,32-(32/(spd_base_var*spd_mult_var)));
        delay_max_var = delay_min_var;
    }
    warn_var = false;
    // Inherit
    event_inherited();
");
// Delay
object_event_add
(argument0,ev_alarm,0,"
    if !state_check_var && state_var < 2
    {
        set_alarm_scr(6,state_alarm_var[!state_var]);
        set_alarm_scr(7,state_alarm_var[2]);
    }
    // Inherit
    event_inherited();
");
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,"
    if on_var
    {
        if state_check_var && state_var < 2
        {
            event_perform(ev_alarm,6);
            event_perform(ev_alarm,7);
        }
        if do_warn_var && !warn_var && target_dist_var >= warn_dist_var
        {
            warn_var = true;
            with instance_create(0,0,spr_flash_eff_obj)
            {
                spr_var = other.spr_eff_var;
                spr_id_var = irandom(sprite_get_number(spr_var)-1);
                spr_spd_var = 1;
                rand_rate_var = 15;
                set_alarm_scr(0,irandom_range(other.eff_min_var,other.eff_max_var));
                // Set camera to player
                cam_id_var = other.attack_target_var.cam_id_var;
            }
        }
    }
    event_inherited();
");
// Check State 1
object_event_add
(argument0,ev_alarm,6,"
    if state_close_var { local.maxstate = 2; }
    else { local.maxstate = 1; }
    if state_var < local.maxstate
    {
        if !enter_var
        {
            local.check = !state_var;
            if local.check { local.bool = (target_dist_var <= state_dist_var[local.check]); }
            else { local.bool = (target_dist_var >= state_dist_var[local.check]); }
            if local.bool && frac_chance_scr(1,state_chance_var[local.check])
            {
                state_var = local.check;
                with instance_create(0,0,spr_flash_eff_obj)
                {
                    spr_var = other.spr_eff_var;
                    spr_id_var = irandom(sprite_get_number(spr_var)-1);
                    spr_spd_var = 1;
                    rand_rate_var = 15;
                    set_alarm_scr(0,irandom_range(other.state_eff_min_var,other.state_eff_max_var));
                    // Set camera to player
                    cam_id_var = other.attack_target_var.cam_id_var;
                }
                event_perform(ev_other,ev_user15);
            }
        }
        if !state_check_var
        { set_alarm_scr(6,state_alarm_var[local.check]); }
    }
");
// Check State 2
object_event_add
(argument0,ev_alarm,7,"
    if state_var < 2
    {
        // Technically doesn't check for if they entered in OG, but I'm lazy
        if !enter_var
        {
            local.target_dist = target_dist_var;
            with (echidna_obj) { if target_dist_var < local.target_dist && target_dist_var > 0 { local.target_dist = target_dist_var; }}
            if local.target_dist >= state_dist_var[2] && frac_chance_scr(1,state_chance_var[2])
            {
                state_var = 2;
                with instance_create(0,0,spr_flash_eff_obj)
                {
                    spr_var = other.spr_eff_var;
                    spr_id_var = irandom(sprite_get_number(spr_var)-1);
                    spr_spd_var = 1;
                    rand_rate_var = 15;
                    set_alarm_scr(0,irandom_range(other.state_eff_min_var,other.state_eff_max_var));
                    // Set camera to player
                    cam_id_var = other.attack_target_var.cam_id_var;
                }
                event_perform(ev_other,ev_user15);
                if state_dur_var > 0 && dur_var > state_dur_var
                {
                    dur_var = state_dur_var;
                    dur_start_var = dur_var;
                }
                exit;
            }
        }
        if !state_check_var
        { set_alarm_scr(7,state_alarm_var[2]); }
    }
");
// Attack Success
object_event_add
(argument0,ev_other,ev_user3,"
    event_inherited();
    with instance_create(0,0,spr_flash_eff_obj)
    {
        spr_var = other.spr_eff_var;
        spr_id_var = irandom(sprite_get_number(spr_var)-1);
        spr_spd_var = 1;
        rand_rate_var = 15;
        set_alarm_scr(0,min(dmg_alarm_var/2,irandom_range(other.eff_min_var,other.eff_max_var)));
        // Set camera to player
        cam_id_var = other.attack_target_var.cam_id_var;
    }
    if state_var >= 2 && !state_atk_var
    {
        state_var = 0;
        event_perform(ev_other,ev_user15);
        if state_delay_var > 0
        {
            set_motion_scr(0,true,yaw_var,false);
            move_var = false;
            anim_var = false;
            attack_var = false;
            set_alarm_scr(1,state_delay_var);
            set_alarm_scr(2,state_delay_var);
            set_alarm_scr(4,state_delay_var);
        }
    }
");
// Hurt
object_event_add
(argument0,ev_other,ev_user4,"
    if state_var < 2
    {
        event_inherited();
        state_var = 2;
        event_perform(ev_other,ev_user15);
    }
");
// Change state
object_event_add
(argument0,ev_other,ev_user15,"
    spd_base_var = state_spd_var[state_var];
    spr_var = state_spr_var[state_var]
    spr_spd_var = state_spr_spd_var[state_var];
    dmg_var = state_dmg_var[state_var];
    dmg_alarm_var = state_dmg_alarm_var[state_var];
    w_var = state_w_var[state_var];
    h_var = state_h_var[state_var];
    do_acc_var = state_acc_var[state_var];
    set_alarm_scr(3,state_delay_var[state_var]);
    spr_id_var = 0;
    tex_var = sprite_get_texture(spr_var,0);
    hurt_var = true;
");