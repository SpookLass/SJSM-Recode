// Builtin Variables
object_set_depth(argument0,-100);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Draw Event
object_event_add
(argument0,ev_create,0,"
    // Collision
    coll_var[0] = global.trig_coll[0];
    coll_var[1] = global.trig_coll[1];
    coll_var[2] = global.trig_coll[2];
    // Text
    do_txt_var = true;
    txt_var = 'Open';
    txt_lock_var = 'Locked.';
    // Function
    rm_count_var = 1;
    delay_var = 20;
    switch irandom(226)
    {
        case 0: { rm_var = hall_01_rm; break; }
        case 1: { rm_var = hall_02_a_rm; break; }
        case 2: { rm_var = hall_02_a_gold_rm; break; }
        case 3: { rm_var = hall_02_b_rm; break; }
        case 4: { rm_var = hall_03_rm; break; }
        case 5: { rm_var = hall_04_rm; break; }
        case 6: { rm_var = hall_05_a_rm; break; }
        case 7: { rm_var = hall_05_b_rm; break; }
        case 8: { rm_var = hall_05_c_rm; break; }
        case 9: { rm_var = hall_06_a_rm; break; }
        case 10: { rm_var = hall_06_b_rm; break; }
        case 11: { rm_var = hall_07_a_rm; break; }
        case 12: { rm_var = hall_07_b_rm; break; }
        case 13: { rm_var = hall_08_rm; break; }
        case 14: { rm_var = hall_09_a_rm; break; }
        case 15: { rm_var = hall_09_b_rm; break; }
        case 16: { rm_var = hall_10_a_rm; break; }
        case 17: { rm_var = hall_10_b_rm; break; }
        case 18: { rm_var = hall_10_a_gold_rm; break; }
        case 19: { rm_var = hall_11_a_rm; break; }
        case 20: { rm_var = hall_11_b_rm; break; }
        case 21: { rm_var = hall_12_a_rm; break; }
        case 22: { rm_var = hall_12_b_rm; break; }
        case 23: { rm_var = hall_13_rm; break; }
        case 24: { rm_var = hall_13_ungold_rm; break; }
        case 25: { rm_var = hall_13_old_rm; break; }
        case 26: { rm_var = hall_13_story_rm; break; }
        case 27: { rm_var = hall_13_story_old_rm; break; }
        case 28: { rm_var = hall_13_story_ungold_rm; break; }
        case 29: { rm_var = hall_14_a_rm; break; }
        case 30: { rm_var = hall_14_b_rm; break; }
        case 31: { rm_var = hall_15_a_rm; break; }
        case 32: { rm_var = hall_15_b_rm; break; }
        case 33: { rm_var = hall_16_a_rm; break; }
        case 34: { rm_var = hall_16_a_old_rm; break; }
        case 35: { rm_var = hall_16_a_lass_rm; break; }
        case 36: { rm_var = hall_16_b_rm; break; }
        case 37: { rm_var = hall_17_a_rm; break; }
        case 38: { rm_var = hall_17_b_rm; break; }
        case 39: { rm_var = hall_19_rm; break; }
        case 40: { rm_var = hall_20_rm; break; }
        case 41: { rm_var = hall_21_a_rm; break; }
        case 42: { rm_var = hall_21_b_rm; break; }
        case 43: { rm_var = hall_22_rm; break; }
        case 44: { rm_var = hall_23_rm; break; }
        case 45: { rm_var = hall_23_gold_rm; break; }
        case 46: { rm_var = hall_24_rm; break; }
        case 47: { rm_var = hall_26_rm; break; }
        case 48: { rm_var = hall_27_rm; break; }
        case 49: { rm_var = hall_30_rm; break; }
        case 50: { rm_var = hall_31_rm; break; }
        case 51: { rm_var = hall_31_gold_rm; break; }
        case 52: { rm_var = hall_32_rm; break; }
        case 53: { rm_var = hall_33_rm; break; }
        case 54: { rm_var = hall_34_rm; break; }
        case 55: { rm_var = w_hall_01_rm; break; }
        case 56: { rm_var = w_hall_02_rm; break; }
        case 57: { rm_var = w_hall_03_rm; break; }
        case 58: { rm_var = w_hall_04_rm; break; }
        case 59: { rm_var = w_hall_05_rm; break; }
        case 60: { rm_var = w_hall_06_rm; break; }
        case 61: { rm_var = w_hall_07_rm; break; }
        case 62: { rm_var = w_hall_08_rm; break; }
        case 63: { rm_var = w_hall_09_rm; break; }
        case 64: { rm_var = w_hall_09_old_rm; break; }
        case 65: { rm_var = w_hall_09_lass_rm; break; }
        case 66: { rm_var = w_hall_10_rm; break; }
        case 67: { rm_var = w_hall_11_a_rm; break; }
        case 68: { rm_var = w_hall_11_b_rm; break; }
        case 69: { rm_var = w_hall_11_b_old_rm; break; }
        case 70: { rm_var = w_hall_12_rm; break; }
        case 71: { rm_var = w_hall_13_rm; break; }
        case 72: { rm_var = w_hall_14_rm; break; }
        case 73: { rm_var = w_hall_15_rm; break; }
        case 74: { rm_var = long_hall_01_rm; break; }
        case 75: { rm_var = long_hall_02_rm; break; }
        case 76: { rm_var = long_hall_03_rm; break; }
        case 77: { rm_var = long_hall_04_rm; break; }
        case 78: { rm_var = long_hall_05_rm; break; }
        case 79: { rm_var = long_hall_05_ungold_rm; break; }
        case 80: { rm_var = long_hall_05_old_rm; break; }
        case 81: { rm_var = long_hall_07_rm; break; }
        case 82: { rm_var = long_hall_08_rm; break; }
        case 83: { rm_var = long_hall_09_rm; break; }
        case 84: { rm_var = long_hall_10_rm; break; }
        case 85: { rm_var = long_hall_11_rm; break; }
        case 86: { rm_var = long_hall_12_rm; break; }
        case 87: { rm_var = engine_01_rm; break; }
        case 88: { rm_var = engine_02_rm; break; }
        case 89: { rm_var = engine_03_rm; break; }
        case 90: { rm_var = engine_03_old_rm; break; }
        case 91: { rm_var = engine_04_rm; break; }
        case 92: { rm_var = engine_04_old_rm; break; }
        case 93: { rm_var = engine_05_rm; break; }
        case 94: { rm_var = engine_06_rm; break; }
        case 95: { rm_var = engine_07_rm; break; }
        case 96: { rm_var = engine_08_rm; break; }
        case 97: { rm_var = engine_09_rm; break; }
        case 98: { rm_var = engine_10_rm; break; }
        case 99: { rm_var = engine_10_old_rm; break; }
        case 100: { rm_var = engine_11_rm; break; }
        case 101: { rm_var = engine_12_rm; break; }
        case 102: { rm_var = engine_13_rm; break; }
        case 103: { rm_var = engine_14_rm; break; }
        case 104: { rm_var = engine_15_rm; break; }
        case 105: { rm_var = engine_16_rm; break; }
        case 106: { rm_var = jail_01_rm; break; }
        case 107: { rm_var = jail_02_rm; break; }
        case 108: { rm_var = jail_03_rm; break; }
        case 109: { rm_var = jail_04_rm; break; }
        case 110: { rm_var = jail_05_rm; break; }
        case 111: { rm_var = jail_06_a_rm; break; }
        case 112: { rm_var = jail_06_b_rm; break; }
        case 113: { rm_var = jail_07_a_rm; break; }
        case 114: { rm_var = jail_07_b_rm; break; }
        case 115: { rm_var = jail_07_c_rm; break; }
        case 116: { rm_var = jail_08_rm; break; }
        case 117: { rm_var = jail_09_rm; break; }
        case 118: { rm_var = jail_10_a_rm; break; }
        case 119: { rm_var = jail_10_b_rm; break; }
        case 120: { rm_var = jail_11_rm; break; }
        case 121: { rm_var = jail_12_rm; break; }
        case 122: { rm_var = jail_13_rm; break; }
        case 123: { rm_var = jail_14_rm; break; }
        case 124: { rm_var = jail_15_rm; break; }
        case 125: { rm_var = jail_15_gold_rm; break; }
        case 126: { rm_var = jail_16_rm; break; }
        case 127: { rm_var = big_01_rm; break; }
        case 128: { rm_var = big_02_rm; break; }
        case 129: { rm_var = big_03_rm; break; }
        case 130: { rm_var = big_04_rm; break; }
        case 131: { rm_var = big_05_rm; break; }
        case 132: { rm_var = big_06_rm; break; }
        case 133: { rm_var = big_07_rm; break; }
        case 134: { rm_var = big_08_rm; break; }
        case 135: { rm_var = sm_01_rm; break; }
        case 136: { rm_var = sm_02_rm; break; }
        case 137: { rm_var = sm_03_rm; break; }
        case 138: { rm_var = sm_04_rm; break; }
        case 139: { rm_var = sm_05_rm; break; }
        case 140: { rm_var = sm_06_rm; break; }
        case 141: { rm_var = sm_07_rm; break; }
        case 142: { rm_var = sm_08_rm; break; }
        case 143: { rm_var = purp_01_rm; break; }
        case 144: { rm_var = purp_02_rm; break; }
        case 145: { rm_var = purp_03_rm; break; }
        case 146: { rm_var = purp_04_rm; break; }
        case 147: { rm_var = purp_05_rm; break; }
        case 148: { rm_var = purp_06_rm; break; }
        case 149: { rm_var = sm_15_rm; break; }
        case 150: { rm_var = sm_16_rm; break; }
        case 151: { rm_var = sm_17_rm; break; }
        case 152: { rm_var = sm_18_rm; break; }
        case 153: { rm_var = sm_19_rm; break; }
        case 154: { rm_var = sm_20_rm; break; }
        case 155: { rm_var = med_01_rm; break; }
        case 156: { rm_var = med_02_rm; break; }
        case 157: { rm_var = med_03_rm; break; }
        case 158: { rm_var = med_04_rm; break; }
        case 159: { rm_var = med_05_rm; break; }
        case 160: { rm_var = med_06_rm; break; }
        case 161: { rm_var = med_07_rm; break; }
        case 162: { rm_var = med_08_rm; break; }
        case 163: { rm_var = med_09_rm; break; }
        case 164: { rm_var = med_10_rm; break; }
        case 165: { rm_var = med_11_rm; break; }
        case 166: { rm_var = thin_hall_01_rm; break; }
        case 167: { rm_var = thin_hall_02_rm; break; }
        case 168: { rm_var = thin_hall_03_rm; break; }
        case 169: { rm_var = thin_hall_04_rm; break; }
        case 170: { rm_var = thin_hall_05_rm; break; }
        case 171: { rm_var = thin_hall_06_rm; break; }
        case 172: { rm_var = thin_hall_07_rm; break; }
        case 173: { rm_var = thin_hall_08_rm; break; }
        case 174: { rm_var = thin_hall_09_rm; break; }
        case 175: { rm_var = thin_hall_10_rm; break; }
        case 176: { rm_var = thin_hall_11_rm; break; }
        case 177: { rm_var = thin_hall_12_rm; break; }
        case 178: { rm_var = thin_hall_13_rm; break; }
        case 179: { rm_var = thin_hall_14_rm; break; }
        case 180: { rm_var = thin_hall_15_rm; break; }
        case 181: { rm_var = thin_hall_16_rm; break; }
        case 182: { rm_var = fish_01_rm; break; }
        case 183: { rm_var = fish_02_rm; break; }
        case 184: { rm_var = fish_03_rm; break; }
        case 185: { rm_var = fish_04_rm; break; }
        case 186: { rm_var = fish_05_rm; break; }
        case 187: { rm_var = fish_06_rm; break; }
        case 188: { rm_var = fish_07_rm; break; }
        case 189: { rm_var = fish_08_rm; break; }
        case 190: { rm_var = fish_09_rm; break; }
        case 191: { rm_var = fish_10_rm; break; }
        case 192: { rm_var = fish_11_rm; break; }
        case 193: { rm_var = fish_12_rm; break; }
        case 194: { rm_var = fish_13_old_rm; break; }
        case 195: { rm_var = fish_13_rm; break; }
        case 196: { rm_var = fish_14_rm; break; }
        case 197: { rm_var = fish_15_old_rm; break; }
        case 198: { rm_var = fish_15_rm; break; }
        case 199: { rm_var = fish_16_rm; break; }
        case 200: { rm_var = med_s_01_rm; break; }
        case 201: { rm_var = med_s_02_rm; break; }
        case 202: { rm_var = med_s_03_rm; break; }
        case 203: { rm_var = med_s_04_rm; break; }
        case 204: { rm_var = med_s_05_rm; break; }
        case 205: { rm_var = med_s_06_rm; break; }
        case 206: { rm_var = med_s_07_a_rm; break; }
        case 207: { rm_var = med_s_07_b_rm; break; }
        case 208: { rm_var = med_s_08_rm; break; }
        case 209: { rm_var = med_s_09_rm; break; }
        case 210: { rm_var = med_s_10_rm; break; }
        case 211: { rm_var = med_s_11_rm; break; }
        case 212: { rm_var = med_s_12_rm; break; }
        case 213: { rm_var = tt_hall_01_rm; break; }
        case 214: { rm_var = tt_hall_02_rm; break; }
        case 215: { rm_var = tt_hall_03_rm; break; }
        case 216: { rm_var = tt_hall_04_rm; break; }
        case 217: { rm_var = tt_hall_05_rm; break; }
        case 218: { rm_var = tt_hall_06_rm; break; }
        case 219: { rm_var = tt_hall_07_rm; break; }
        case 220: { rm_var = tt_hall_08_rm; break; }
        case 221: { rm_var = tt_hall_09_rm; break; }
        case 222: { rm_var = tt_hall_10_rm; break; }
        case 223: { rm_var = tt_hall_11_rm; break; }
        case 224: { rm_var = tt_hall_12_rm; break; }
        case 225: { rm_var = test_01_rm; break; }
        case 226: { rm_var = test_02_rm; break; }
    }
    // Alarm
    alarm_len_var = 1;
    alarm_arr[0,2] = '';
");
// Alarm 0 Event
object_event_add
(argument0,ev_alarm,0,"
    if room_exists(rm_var) && rm_var != 0 { room_goto(rm_var); }
    else { show_error('Room '+string(rm_var)+' does not exist!',false); room_goto(hall_01_rm); }
    global.rm_count_var += rm_count_var;
")
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,"
    visible = false;
    local.door = id;
    local.indoor = true;
    local.active = false;
    with player_obj
    {
        local.player = id;
        // p3dc_check_scr(coll_var[0],x,y,z,other.coll_var[0],other.x,other.y,other.z)
        if box_coll_scr(x,y,z,coll_var[2],coll_var[1],other.x,other.y,other.z,other.coll_var[2],other.coll_var[1])
        {
            other.visible = other.do_txt_var;
            other.cam_id_var = cam_id_var
            if global.interact_input_press_var == 1 && !in_door_var
            {
                if !other.lock_var
                {
                    on_var = false;
                    in_door_var = true;
                    local.active = true;
                    with instance_create(0,0,fade_eff_obj)
                    {
                        image_blend = c_black; 
                        set_alarm_scr(0,local.door.delay_var); 
                        invert_var = true;
                        stay_var = true;
                        cam_id_var = local.player.cam_id_var;
                    }
                    caster_play(choose(door_01_snd,door_02_snd,door_03_snd,door_04_snd),global.vol_var,1);
                }
                else if !instance_exists(txt_obj)
                {
                    local.txt = instance_create(0,0,txt_obj);
                    local.txt.txt_var = other.txt_lock_var;
                }
            }
        }
        if !in_door_var 
        { local.indoor = false; }
    }
    if local.active && local.indoor { set_alarm_scr(0,delay_var); }
");
// Draw Event
object_event_add
(argument0,ev_draw,0,"
    if view_current == cam_id_var 
    {
        if lock_var { local.txt = txt_lock_var; }
        else {local.txt = txt_var; }

        d3d_set_projection_ortho(0,0,1280,720,0);
        d3d_set_hidden(false);

        draw_set_halign(fa_center);
        draw_set_valign(fa_bottom);

        draw_set_color(make_color_rgb(30,0,50));
        draw_text_transformed(638,650,local.txt,1,1,0);
        draw_text_transformed(636,652,local.txt,1,1,0);

        draw_set_color(c_white);
        draw_text_transformed(640,648,local.txt,1,1,0);

        draw_set_halign(fa_left);
        draw_set_valign(fa_top);

        d3d_set_hidden(true);
    }
");