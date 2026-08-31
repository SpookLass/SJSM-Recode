// Builtin Variables
object_set_depth(argument0,0);
object_set_mask(argument0,noone);
object_set_parent(argument0,enemy_par_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Start
    // Loading specimen specific settings
object_event_add
(argument0,ev_create,1,'');
// Create Normal Event
    // Default settings
object_event_add
(argument0,ev_create,2,'
    event_inherited();
    // Variables
    if !variable_local_exists("icon_spr_var") { icon_spr_var = noone; }
    if !variable_local_exists("icon_spr_id_var") { icon_spr_id_var = 0; }
    if !variable_local_exists("dur_var") { dur_var = -1; }
    if !variable_local_exists("boss_var") { boss_var = false; }
    if !variable_local_exists("intro_var") { intro_var = false; }
    if !variable_local_exists("dupe_var") { dupe_var = 0; }
    if !variable_local_exists("hide_var") { hide_var = false; }
    if !variable_local_exists("blacklist_var") { blacklist_var = noone; }
    if !variable_local_exists("whitelist_var") { whitelist_var = noone; }
    if boss_var { global.boss_var = object_index; }
    // Name stuff
    if !variable_local_exists("name_font_var") { name_font_var = main_font; }
    if !variable_local_exists("name_color_var") { name_color_var = c_yellow; }
    if !variable_local_exists("name_xscale_var") { name_xscale_var = 0.5; }
    if !variable_local_exists("name_yscale_var") { name_yscale_var = 0.5; }
    if !variable_local_exists("name_angle_var") { name_angle_var = 0; }
    if !variable_local_exists("name_shadow_var") { name_shadow_var = true; }
    if name_shadow_var
    {
        if !variable_local_exists("name_shadow_num_var") { name_shadow_num_var = 1; }
        if !variable_local_exists("name_shadow_color_var") { name_shadow_color_var = make_color_rgb(30,0,50); }
        if !variable_local_exists("name_shadow_xdist_var") { name_shadow_xdist_var = -2; }
        if !variable_local_exists("name_shadow_ydist_var") { name_shadow_ydist_var = 2; }
    }
    // Duration checking
    local.dur = dur_var;
    if global.locale_rm_var > global.rm_count_var { dur_var = min(dur_var,global.locale_rm_var-global.rm_count_var); }
    local.nextele = ele_next_scr(global.rm_count_var);
    if local.nextele != noone { dur_var = min(dur_var,local.nextele-global.rm_count_var); }
    dur_deficit_var = local.dur-dur_var;
    dur_start_var = dur_var;
    // Theme
    if !variable_local_exists("mus_prio_var") || (global.rand_theme_var && frac_chance_scr(1,2)) { mus_prio_var = -1; }
    if mus_prio_var > amb_mus_prio_const
    {
        fmod_snd_set_group_scr(mus_snd_var,snd_group_mus_const);
        with mus_control_obj { event_user(0); }
    }
');
// Room End Event
object_event_add
(argument0,ev_other,ev_room_end,'
    if dur_var > 0
    {
        dur_var -= 1;
        if dur_var <= 0
        {
            instance_destroy();
            exit;
        }
        switch dur_var
        {
            case 1: { icon_spr_id_var = 2; break; }
            case dur_start_var: { icon_spr_id_var = 0; break; }
            default: { icon_spr_id_var = 1; break; }
        }
    }
    hurt_var = false;
    event_inherited();
');
// Destroy
object_event_add
(argument0,ev_destroy,0,'
    event_inherited();
    global.mon_fail_var = 0;
    if boss_var { global.boss_var = noone; }
    if mus_prio_var > amb_mus_prio_const
    {
        mus_prio_var = -1;
        with mus_control_obj { event_user(0); }
    }
');