/*
Argument 0: Room Variable (same for all rooms)
*/
// Math!
local.width = 9; // 7
local.edgewidth = 2;
local.halllength = 5;
local.middle = round((local.width-1)/2)+local.edgewidth;
local.dooroff = ceil(0.25*(local.width+1));
local.xtmp = 48+((local.halllength+local.width+(local.edgewidth*2)-1)*32);
local.ytmp = 48+((local.width+(local.edgewidth*2)-1)*32);
// Doors
    // Broken
        local.ytmp1 = 48+((local.middle-local.dooroff)*32);
    // Entrance / Exit
        local.ytmp2 = 48+(local.middle*32);
    // Broken
        local.ytmp3 = 48+((local.middle+local.dooroff)*32);
    // Office / Broken
        local.xtmp1 = 48+((local.halllength+local.middle-local.dooroff)*32);
    // Broken / Space
        local.xtmp2 = 48+((local.halllength+local.middle)*32);
    // Daycare / Broken
        local.xtmp3 = 48+((local.halllength+local.middle+local.dooroff)*32);
// Mark
    local.xtmp4 = 32*(1+local.halllength+(local.edgewidth*0.75));
    local.ytmp4 = 32*(1+local.edgewidth+(local.width*0.5));
// Fake Wall
    local.xtmp5 = 32*(1+local.halllength);
// Load
room_set_code
(
    argument0,'
    // Name
    ini_open("lang_"+global.lang_var+".ini");
    global.rm_name_var = ini_read_string("ROOM","mad","ROOM_mad")+" 1";
    local.broke = ini_read_string("UI","broke","UI_broke");
    ini_close();
    // Spawns
    global.spawn_len_var = 10;
    global.spawn_arr[0,0] = 48;
    global.spawn_arr[0,1] = '+string(local.ytmp2)+';
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    // Office
    global.spawn_arr[1,0] = '+string(local.xtmp1)+'; 
    global.spawn_arr[1,1] = 48;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 270;
    // Daycare
    global.spawn_arr[2,0] = '+string(local.xtmp3)+';
    global.spawn_arr[2,1] = 48;
    global.spawn_arr[2,2] = 0;
    global.spawn_arr[2,3] = 270;
    // Space
    global.spawn_arr[3,0] = '+string(local.xtmp3)+';
    global.spawn_arr[3,1] = '+string(local.ytmp)+';
    global.spawn_arr[3,2] = 0;
    global.spawn_arr[3,3] = 90;
    // Exit
    global.spawn_arr[4,0] = '+string(local.xtmp)+';
    global.spawn_arr[4,1] = '+string(local.ytmp2)+';
    global.spawn_arr[4,2] = 0;
    global.spawn_arr[4,3] = 180;
    global.spawn_arr[5,0] = '+string(local.xtmp2)+';
    global.spawn_arr[5,1] = 48;
    global.spawn_arr[5,2] = 0;
    global.spawn_arr[5,3] = 270;
    global.spawn_arr[6,0] = '+string(local.xtmp1)+';
    global.spawn_arr[6,1] = '+string(local.ytmp)+';
    global.spawn_arr[6,2] = 0;
    global.spawn_arr[6,3] = 90;
    global.spawn_arr[7,0] = '+string(local.xtmp2)+';
    global.spawn_arr[7,1] = '+string(local.ytmp)+';
    global.spawn_arr[7,2] = 0;
    global.spawn_arr[7,3] = 90;
    global.spawn_arr[8,0] = '+string(local.xtmp)+';
    global.spawn_arr[8,1] = '+string(local.ytmp1)+';
    global.spawn_arr[8,2] = 0;
    global.spawn_arr[8,3] = 180;
    global.spawn_arr[9,0] = '+string(local.xtmp)+';
    global.spawn_arr[9,1] = '+string(local.ytmp3)+';
    global.spawn_arr[9,2] = 0;
    global.spawn_arr[9,3] = 180;
    // Mark Array
    global.mark_len_var = 1;
    global.mark_arr[0,0] = '+string(local.xtmp4)+';
    global.mark_arr[0,1] = '+string(local.ytmp4)+';
    global.mark_arr[0,2] = 0;
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
    // Doors
    spawn_create_scr(true,false,false,mad_door_obj,spawn_door_trig_obj);
    with spawn_arr[1,4] { rm_var = mad_02_rm; snd_len_var = 1; snd_arr[0] = door_m_02_snd; }
    with spawn_arr[2,4] { rm_var = mad_03_rm; snd_len_var = 1; snd_arr[0] = door_m_02_snd; }
    with spawn_arr[3,4] { rm_var = mad_04_rm; snd_len_var = 1; snd_arr[0] = door_m_02_snd; }
    with spawn_arr[4,4] { rm_var = mad_05_rm; snd_len_var = 1; snd_arr[0] = door_m_02_snd; }
    for (local.i=5; local.i<global.spawn_len_var; local.i+=1;)
    {
        with spawn_arr[local.i,4] { txt_lock_var = local.broke; lock_var = true; }
        with spawn_arr[local.i,5]
        {
            if instance_exists(load_par_obj)
            {
                store_tex_var = background_get_texture(load_par_obj.bg_arr_var[17,0]);
                tex_var = store_tex_var;
            }
        }
    }
    // Cat
    if instance_exists(load_par_obj)
    {
        if load_par_obj.cat_var
        {
            instance_create('+string(local.xtmp5)+','+string(local.ytmp2)+',mad_trim_doorframe_vert_obj);
            with instance_create(global.mark_arr[0,0],global.mark_arr[0,1],mad_cat_obj)
            {
                snd_id_var = 7;
                translate_id_var = "cat_02";
                event_user(1);
            }
        }
        else { instance_create('+string(local.xtmp5)+','+string(local.ytmp2)+',fake_wall_vert_obj); }
    }
');
// Room settings
room_set_width(argument0,(2+local.halllength+local.width+(local.edgewidth*2))*32);
room_set_height(argument0,(2+local.width+(local.edgewidth*2))*32);
room_set_background_color(argument0,c_black,true);
room_set_view_enabled(argument0,true);
for (local.i=0; local.i<8; local.i+=1;)
{ room_set_view(argument0,local.i,false,0,0,1280,720,0,0,1280,720,32,32,-1,-1,noone); }
room_set_view(argument0,0,true,0,0,1280,720,0,0,1280,720,32,32,-1,-1,noone);
// Effects
    room_instance_add(argument0,0,0,fog_big_obj);
// Blood
local.bloodxtmp = local.xtmp;
local.bloodytmp = local.ytmp2;
// Floors and ceilings
    local.ytmp = 48+(local.middle*32);
    for (local.i=0; local.i<local.halllength; local.i+=1;)
    {
        local.xtmp = 48+(local.i*32);
        room_instance_add(argument0,local.xtmp,local.ytmp,floor_obj);
        room_instance_add(argument0,local.xtmp,local.ytmp,ceil_obj);
    }
    for (local.i=0; local.i<local.edgewidth; local.i+=1;)
    {
        local.ytmp1 = 48+(local.i*32);
        local.ytmp2 = 48+((local.width+local.edgewidth+local.i)*32);
        for (local.j=0; local.j<local.width+(local.edgewidth*2); local.j+=1;)
        {
            local.xtmp = 48+((local.j+local.halllength)*32);
            room_instance_add(argument0,local.xtmp,local.ytmp1,spawn_floor_obj);
            room_instance_add(argument0,local.xtmp,local.ytmp1,spawn_ceil_2high_obj);
            room_instance_add(argument0,local.xtmp,local.ytmp2,spawn_floor_obj);
            room_instance_add(argument0,local.xtmp,local.ytmp2,spawn_ceil_2high_obj);
        }
    }
    for (local.i=0; local.i<local.edgewidth; local.i+=1;)
    {
        local.xtmp1 = 48+((local.i+local.halllength)*32);
        local.xtmp2 = 48+((local.width+local.edgewidth+local.halllength+local.i)*32);
        for (local.j=0; local.j<local.width; local.j+=1;)
        {
            local.ytmp = 48+((local.j+local.edgewidth)*32);
            room_instance_add(argument0,local.xtmp1,local.ytmp,spawn_floor_obj);
            room_instance_add(argument0,local.xtmp1,local.ytmp,spawn_ceil_2high_obj);
            room_instance_add(argument0,local.xtmp2,local.ytmp,spawn_ceil_2high_obj);
            local.dist = point_distance(local.xtmp2,local.ytmp,local.bloodxtmp,local.bloodytmp)+random_range(-32,32);
            local.blood = median(0,1,1-floor(local.dist/96));
            if local.blood
            { room_instance_add(argument0,local.xtmp2,local.ytmp,mad_blood_floor_obj); }
            else { room_instance_add(argument0,local.xtmp2,local.ytmp,spawn_floor_obj); }
        }
    }
// Walls
    // Horizontal
        local.ytmp = 32*(local.middle+1)
        for (local.i=0; local.i<local.halllength; local.i+=1;)
        {
            local.xtmp = 48+(local.i*32);
            room_instance_add(argument0,local.xtmp,local.ytmp,wall_hor_obj);
            room_instance_add(argument0,local.xtmp,local.ytmp+32,wall_hor_obj);
        }
        local.ytmp1 = 32;
        local.ytmp2 = 32*(1+local.width+(local.edgewidth*2));
        for (local.i=0; local.i<local.width+(local.edgewidth*2); local.i+=1;)
        {
            local.xtmp = 48+((local.i+local.halllength)*32);
            if local.i == local.middle || local.i == local.middle-local.dooroff || local.i == local.middle+local.dooroff
            {
                room_instance_add(argument0,local.xtmp,local.ytmp1,mad_trim_door_hor_obj);
                room_instance_add(argument0,local.xtmp,local.ytmp2,mad_trim_door_hor_obj);
            }
            else
            {
                room_instance_add(argument0,local.xtmp,local.ytmp1,mad_trim_down_hor_obj);
                room_instance_add(argument0,local.xtmp,local.ytmp2,mad_trim_down_hor_obj);
            }
            room_instance_add(argument0,local.xtmp,local.ytmp1,spawn_wall_high_hor_obj);
            room_instance_add(argument0,local.xtmp,local.ytmp1,mad_trim_up_high_hor_obj);
            room_instance_add(argument0,local.xtmp,local.ytmp2,spawn_wall_high_hor_obj);
            room_instance_add(argument0,local.xtmp,local.ytmp2,mad_trim_up_high_hor_obj);
        }
        local.ytmp1 = 32*(1+local.edgewidth);
        local.ytmp2 = 32*(1+local.width+local.edgewidth);
        for (local.i=0; local.i<local.width; local.i+=1;)
        {
            local.xtmp = 48+((local.i+local.halllength+local.edgewidth)*32);
            room_instance_add(argument0,local.xtmp,local.ytmp1,spawn_wall_pit_hor_obj);
            room_instance_add(argument0,local.xtmp,local.ytmp1,spawn_wall_2up_8high_hor_obj);
            room_instance_add(argument0,local.xtmp,local.ytmp1,rail_metal_hor_obj);
            room_instance_add(argument0,local.xtmp,local.ytmp2,spawn_wall_pit_hor_obj);
            room_instance_add(argument0,local.xtmp,local.ytmp2,spawn_wall_2up_8high_hor_obj);
            room_instance_add(argument0,local.xtmp,local.ytmp2,rail_metal_hor_obj);
        }
    // Vertical
        local.ytmp = 48+(local.middle*32);
        room_instance_add(argument0,32,local.ytmp,wall_vert_obj);
        local.xtmp1 = 32*(1+local.halllength);
        local.xtmp2 = 32*(1+local.halllength+local.width+(local.edgewidth*2));
        for (local.i=0; local.i<local.width+(local.edgewidth*2); local.i+=1;)
        {
            local.ytmp = 48+(local.i*32);
            if local.i == local.middle { room_instance_add(argument0,local.xtmp1,local.ytmp,spawn_wall_doorway_vert_obj); }
            else
            {
                room_instance_add(argument0,local.xtmp1,local.ytmp,spawn_wall_high_vert_obj);
                room_instance_add(argument0,local.xtmp1,local.ytmp,mad_trim_down_vert_obj);
            }
            room_instance_add(argument0,local.xtmp1,local.ytmp,mad_trim_up_high_vert_obj);
            local.dist = point_distance(local.xtmp2,local.ytmp,local.bloodxtmp,local.bloodytmp)+random_range(-32,32);
            local.blood = median(0,2,2-floor(local.dist/64));
            switch local.blood
            {
                case 2:
                {
                    if local.i == local.middle || local.i == local.middle-local.dooroff || local.i == local.middle+local.dooroff
                    { room_instance_add(argument0,local.xtmp2,local.ytmp,mad_blood_trim_02_door_vert_obj); }
                    else { room_instance_add(argument0,local.xtmp2,local.ytmp,mad_blood_trim_02_down_vert_obj); }
                    room_instance_add(argument0,local.xtmp2,local.ytmp,mad_blood_wall_02_high_vert_obj);
                    room_instance_add(argument0,local.xtmp2,local.ytmp,mad_blood_trim_02_up_high_vert_obj);
                    break;
                }
                case 1:
                {
                    if local.i == local.middle || local.i == local.middle-local.dooroff || local.i == local.middle+local.dooroff
                    { room_instance_add(argument0,local.xtmp2,local.ytmp,mad_blood_trim_01_door_vert_obj); }
                    else { room_instance_add(argument0,local.xtmp2,local.ytmp,mad_blood_trim_01_down_vert_obj); }
                    room_instance_add(argument0,local.xtmp2,local.ytmp,mad_blood_wall_01_high_vert_obj);
                    room_instance_add(argument0,local.xtmp2,local.ytmp,mad_blood_trim_01_up_high_vert_obj);
                    break;
                }
                default:
                {
                    if local.i == local.middle || local.i == local.middle-local.dooroff || local.i == local.middle+local.dooroff
                    { room_instance_add(argument0,local.xtmp2,local.ytmp,mad_trim_door_vert_obj); }
                    else { room_instance_add(argument0,local.xtmp2,local.ytmp,mad_trim_down_vert_obj); }
                    room_instance_add(argument0,local.xtmp2,local.ytmp,spawn_wall_high_vert_obj);
                    room_instance_add(argument0,local.xtmp2,local.ytmp,mad_trim_up_high_vert_obj);
                    break;
                }
            }
        }
        local.xtmp1 = 32*(1+local.halllength+local.edgewidth);
        local.xtmp2 = 32*(1+local.halllength+local.width+local.edgewidth);
        for (local.i=0; local.i<local.width; local.i+=1;)
        {
            local.ytmp = 48+((local.i+local.edgewidth)*32);
            room_instance_add(argument0,local.xtmp1,local.ytmp,spawn_wall_pit_vert_obj);
            room_instance_add(argument0,local.xtmp1,local.ytmp,spawn_wall_2up_8high_vert_obj);
            room_instance_add(argument0,local.xtmp1,local.ytmp,rail_metal_vert_obj);
            room_instance_add(argument0,local.xtmp2,local.ytmp,spawn_wall_pit_vert_obj);
            room_instance_add(argument0,local.xtmp2,local.ytmp,spawn_wall_2up_8high_vert_obj);
            room_instance_add(argument0,local.xtmp2,local.ytmp,rail_metal_vert_obj);
        }
// Props
    local.ytmp = 32*(1+local.edgewidth+(local.width*0.5));
    local.xtmp = local.ytmp+(local.halllength*32);
    room_instance_add(argument0,local.xtmp,local.ytmp,mad_clock_big_obj);
    local.ytmp = 48+(local.middle*32);
    local.xtmp = 32*local.halllength;
    room_instance_add(argument0,local.xtmp,local.ytmp,mad_line_obj);
    room_instance_add(argument0,local.xtmp,local.ytmp,mad_trig_obj);
    local.xtmp1 = 32*(1+local.halllength);
    local.ytmp1 = 32;
    local.xtmp2 = local.xtmp1+((local.width+(local.edgewidth*2))*32);
    local.ytmp2 = local.ytmp1+((local.width+(local.edgewidth*2))*32);
    room_instance_add(argument0,local.xtmp1,local.ytmp1,mad_trim_side_obj);
    room_instance_add(argument0,local.xtmp1,local.ytmp1,mad_trim_side_high_obj);
    room_instance_add(argument0,local.xtmp1,local.ytmp2,mad_trim_side_obj);
    room_instance_add(argument0,local.xtmp1,local.ytmp2,mad_trim_side_high_obj);
    room_instance_add(argument0,local.xtmp2,local.ytmp1,mad_trim_side_obj);
    room_instance_add(argument0,local.xtmp2,local.ytmp1,mad_trim_side_high_obj);
    room_instance_add(argument0,local.xtmp2,local.ytmp2,mad_trim_side_obj);
    room_instance_add(argument0,local.xtmp2,local.ytmp2,mad_trim_side_high_obj);
    local.xtmp1 += local.edgewidth*32; local.ytmp1 += local.edgewidth*32;
    local.xtmp2 -= local.edgewidth*32; local.ytmp2 -= local.edgewidth*32;
    room_instance_add(argument0,local.xtmp1,local.ytmp1,mad_trim_side_pit_obj);
    room_instance_add(argument0,local.xtmp1,local.ytmp2,mad_trim_side_pit_obj);
    room_instance_add(argument0,local.xtmp2,local.ytmp1,mad_trim_side_pit_obj);
    room_instance_add(argument0,local.xtmp2,local.ytmp2,mad_trim_side_pit_obj);