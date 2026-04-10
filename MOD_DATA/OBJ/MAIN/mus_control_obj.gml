// Builtin Variables
object_set_depth(argument0,99);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Create
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    dur_min_var = 8;
    dur_max_var = 15;
    dur_var = irandom_range(dur_min_var,dur_max_var);
    curr_prio_var = amb_mus_prio_const;
    snd_var = choose(amb_mus_01_snd,amb_mus_02_snd,amb_mus_03_snd,amb_mus_04_snd,amb_mus_05_snd,amb_mus_06_snd,amb_mus_07_snd,amb_mus_08_snd,amb_mus_09_snd,amb_mus_10_snd,amb_mus_11_snd);
    inst_var = fmod_snd_loop_scr(snd_var);
    override_var = false;
    on_var = true;
');
// Destroy
object_event_add
(argument0,ev_destroy,0,'
    fmod_inst_stop_scr(inst_var);
');
// Room Start
object_event_add // ev_create,0
(argument0,ev_other,ev_room_start,'
    event_inherited();
    if on_var { event_user(0); }
');
// Check music
object_event_add
(argument0,ev_other,ev_user0,'
    if on_var
    {
        curr_prio_var = amb_mus_prio_const;
        local.curr_id = 0;
        local.mus = snd_var;
        with mon_par_obj
        {
            if variable_local_exists("mus_prio_var")
            {
                if mus_prio_var > other.curr_prio_var
                || (mus_prio_var > amb_mus_prio_const && mus_prio_var == other.curr_prio_var && id > local.curr_id)
                {
                    local.curr_id = id;
                    other.curr_prio_var = mus_prio_var;
                    local.mus = mus_snd_var;
                }
            }
        }
        with mus_par_obj
        {
            // This can run before the create event for some reason
            if variable_local_exists("prio_var")
            {
                if prio_var > other.curr_prio_var
                || (prio_var > amb_mus_prio_const && prio_var == other.curr_prio_var && id > local.curr_id)
                {
                    local.curr_id = id;
                    other.curr_prio_var = prio_var;
                    local.mus = snd_var;
                }
            }
        }
        if curr_prio_var > amb_mus_prio_const
        {
            override_var = true;
            if local.mus != snd_var
            {
                snd_var = local.mus;
                fmod_inst_stop_scr(inst_var);
                if snd_var != -1
                { inst_var = fmod_snd_loop_scr(snd_var); }
            }
        }
        else
        {
            if dur_var > 0 { dur_var -= 1; }
            if (dur_var <= 0 && !irandom(4)) || override_var
            {
                override_var = false;
                local.mus = choose(amb_mus_01_snd,amb_mus_02_snd,amb_mus_03_snd,amb_mus_04_snd,amb_mus_05_snd,amb_mus_06_snd,amb_mus_07_snd,amb_mus_08_snd,amb_mus_09_snd,amb_mus_10_snd,amb_mus_11_snd);
                if local.mus != snd_var
                {
                    snd_var = local.mus;
                    fmod_inst_stop_scr(inst_var);
                    if snd_var != -1
                    { inst_var = fmod_snd_loop_scr(snd_var); }
                }
                dur_var = irandom_range(dur_min_var,dur_max_var);
            }
        }
    }
');