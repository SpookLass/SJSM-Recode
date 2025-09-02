// Builtin Variables
object_set_depth(argument0,100);
object_set_mask(argument0,noone);
object_set_parent(argument0,noone);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Step event
object_event_add
(argument0,ev_step,ev_step_normal,"
    // Delta Time
    // Goes by frames rather than seconds (at 60 fps)
    global.delta_time_var = (current_time-global.last_time_var)*global.game_spd_var*milli_frame_rate_const; 
    global.last_time_var = current_time;
    // Get inputs
    // I know this looks bad, but keyboard_check_pressed doesn't persist between rooms
    global.forward_input_prev_var = global.forward_input_var;
    global.backward_input_prev_var = global.backward_input_var;
    global.strafe_left_input_prev_var = global.strafe_left_input_var;
    global.strafe_right_input_prev_var = global.strafe_right_input_var;
    global.sprint_input_prev_var = global.sprint_input_var;
    global.jump_input_prev_var = global.jump_input_var;
    global.crouch_input_prev_var = global.crouch_input_var;
    global.interact_input_prev_var = global.interact_input_var;
    if !global.controller_var
    {
        if keyboard_check_pressed(global.forward_key_var) { global.forward_input_var = true; }
        if keyboard_check_released(global.forward_key_var) { global.forward_input_var = false; }
        
        if keyboard_check_pressed(global.backward_key_var) { global.backward_input_var = true; }
        if keyboard_check_released(global.backward_key_var) { global.backward_input_var = false; }
        
        if keyboard_check_pressed(global.strafe_left_key_var) { global.strafe_left_input_var = true; }
        if keyboard_check_released(global.strafe_left_key_var) { global.strafe_left_input_var = false; }
        
        if keyboard_check_pressed(global.strafe_right_key_var) { global.strafe_right_input_var = true; }
        if keyboard_check_released(global.strafe_right_key_var) { global.strafe_right_input_var = false; }

        if keyboard_check_pressed(global.sprint_key_var) { global.sprint_input_var = true; }
        if keyboard_check_released(global.sprint_key_var) { global.sprint_input_var = false; }

        if keyboard_check_pressed(global.jump_key_var) { global.jump_input_var = true; }
        if keyboard_check_released(global.jump_key_var) { global.jump_input_var = false; }

        if keyboard_check_pressed(global.crouch_key_var) { global.crouch_input_var = true; }
        if keyboard_check_released(global.crouch_key_var) { global.crouch_input_var = false; }

        if keyboard_check_pressed(global.interact_key_var) { global.interact_input_var = true; }
        if keyboard_check_released(global.interact_key_var) { global.interact_input_var = false; }
    }
    global.forward_input_press_var = global.forward_input_var-global.forward_input_prev_var;
    global.backward_input_press_var = global.backward_input_var-global.backward_input_prev_var;
    global.strafe_left_input_press_var = global.strafe_left_input_var-global.strafe_left_input_prev_var;
    global.strafe_right_input_press_var = global.strafe_right_input_var-global.strafe_right_input_prev_var;
    global.sprint_input_press_var = global.sprint_input_var-global.sprint_right_input_prev_var;
    global.jump_input_press_var = global.jump_input_var-global.jump_input_prev_var;
    global.crouch_input_press_var = global.crouch_input_var-global.crouch_input_prev_var;
    global.interact_input_press_var = global.interact_input_var-global.interact_input_prev_var;
    
    // Free da mouse
    if keyboard_check_pressed(vk_tab) || keyboard_check_pressed(vk_escape)
    {
        global.mouse_free_var = !global.mouse_free_var;
        action_set_cursor(-1,global.mouse_free_var);
        if !global.mouse_free_var { display_mouse_set(display_get_width()/2,display_get_height()/2); }
    }
    // Framerate
    global.draw_time_var += global.delta_time_var;
    if global.fps_var < global.tps_var && !global.vsync_var
    {
        local.rate = fps/global.fps_var;
        frame_var += 1;
        if frame_var >= local.rate
        {
            screen_redraw();
            if local.rate { frame_var = frame_var mod local.rate; }
            else {frame_var = 0; }
        }
    }
    // Debug commands
    if keyboard_check_pressed(ord('2'))
    {
        local.question = show_menu('Back|Restart Room|Next Room|Previous Room|Go To Room|Create Instance|Set Tex Set|Set Count|Set LV|Set Room|Toggle Invincibility|Toggle Noclip|Toggle Flight|Hide Debug|Hide Hud|Toggle X-ray',0);
        switch(local.question)
        {
            case 1: { room_restart(); break; }
            case 2:
            {
                if room_exists(room+1)
                { room_goto(room+1); }
                break;
            }
            case 3:
            {
                if room != 1 && room_exists(room-1)
                { room_goto(room-1); }
                break;
            }
            case 4:
            {
                local.rm = get_string('Go To Room','');
                if local.rm != ''
                {
                    execute_string
                    ('
                        if room_exists('+local.rm+') && '+local.rm+' != 0
                        { room_goto('+local.rm+'); }
                    ');
                }
                break;
            }
            case 5:
            {
                local.instance = get_string('Create Instance','');
                if local.instance != ''
                {
                    execute_string
                    ('
                        if object_exists('+local.instance+') && '+local.instance+' != 0 
                        { instance_create(0,0,'+local.instance+'); }
                    ');
                }
                break;
            }
            case 6:
            {
                global.tex_set = get_integer('Tex set',global.tex_set);
                local.str = string(global.tex_set);
                if string_length(local.str) == 1 { local.str = '0'+local.str; }
                if file_exists(vanilla_directory_const+'\TEX\FLOOR_'+local.str+'.png')
                {
                    background_replace(floor_bg,vanilla_directory_const+'\TEX\FLOOR_'+local.str+'.png',false,false);
                    background_replace(wall_bg,vanilla_directory_const+'\TEX\WALL_'+local.str+'.png',false,false);
                    background_replace(ceil_bg,vanilla_directory_const+'\TEX\ROOF_'+local.str+'.png',false,false);
                    sprite_replace(light_floor_spr,vanilla_directory_const+'\TEX\FLOOR_'+local.str+'L0.png',2,false,false,0,0);
                    sprite_replace(light_wall_spr,vanilla_directory_const+'\TEX\WALL_'+local.str+'L0.png',2,false,false,0,0);
                }
                break;
            }
            case 7: { global.count_var = get_integer('Set Count', global.count_var); break; }
            case 8: { global.violence_var = get_integer('Set LOVE', global.violence_var); break; }
            case 9: { global.rm_count_var = get_integer('Set Room Count', global.rm_count_var); break; }
            case 10: { global.invincible = !global.invincible; break; }
            case 11: { player_obj.do_coll_var = !player_obj.do_coll_var; break; }
            case 12: { player_obj.grav_var = !player_obj.grav_var; break; }
            case 13: { global.hide_debug = !global.hide_debug; break; }
            case 14: { global.hide_hud = !global.hide_hud; break; }
            case 15: { global.xray = !global.xray; break; }
        }
        global.last_time_var = current_time;
        display_mouse_set(display_get_width()/2,display_get_height()/2);
    }
");
// Draw
object_event_add
(argument0,ev_draw,0,"
    // Reset Drawing
    draw_set_color(c_white);
    draw_set_alpha(1);
    d3d_set_lighting(false);
    d3d_set_culling(false);
    if global.draw_3d_var
    { d3d_set_hidden(true); }
    else { d3d_set_hidden(false); }
    // Caption
    /*
    if global.draw_time_var > 0 { local.framerate = round(60/global.draw_time_var); }
    else { local.framerate = 'What'; }
    local.fps_str = ' | FPS: '+string(local.framerate);
    */
    room_caption = 'Spookys Jump Scare Mansion - Project Recode | TPS: '+string(fps)+' | Room: '+string(global.rm_count_var)+' ('+global.rm_name_var+')';
    global.draw_time_var = 0;
")
// Room Start
object_event_add
(argument0,ev_other,ev_room_start,"
    // FPS
    room_speed = global.tps_var;
    local.autodraw = global.fps_var >= global.tps_var || global.vsync_var;
    set_automatic_draw(local.autodraw);
    // Create Collisions
    rm_to_coll_scr();
");
// Game end
object_event_add
(argument0,ev_other,ev_game_end,"
    p3dc_free_scr();
")