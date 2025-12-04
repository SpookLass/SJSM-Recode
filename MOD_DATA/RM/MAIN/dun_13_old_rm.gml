/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
    global.rm_name_var = ini_read_string('ROOM','dun','ROOM_dun')+' 13 +ini_read_string('ROOM','old','ROOM_old')
    ini_close();
    // Spawn
    global.spawn_len_var = 5;
    global.spawn_arr[0,0] = 224;
    global.spawn_arr[0,1] = 256;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 320;
    global.spawn_arr[1,1] = 96;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 270;
    global.spawn_arr[2,0] = 448;
    global.spawn_arr[2,1] = 96;
    global.spawn_arr[2,2] = 0;
    global.spawn_arr[2,3] = 270;
    global.spawn_arr[3,0] = 320;
    global.spawn_arr[3,1] = 416;
    global.spawn_arr[3,2] = 0;
    global.spawn_arr[3,3] = 90;
    global.spawn_arr[4,0] = 448;
    global.spawn_arr[4,1] = 416;
    global.spawn_arr[4,2] = 0;
    global.spawn_arr[4,3] = 90;
    // Mark
    global.mark_len_var = 0;
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
    // Doors
    local.entrance = instance_create(global.spawn_arr[0,0]-lengthdir_x(16,global.spawn_arr[0,3]),global.spawn_arr[0,1]-lengthdir_y(16,global.spawn_arr[0,3]),door_entrance_obj);
    local.entrance.z = global.spawn_arr[0,2];
    local.entrance.direction = global.spawn_arr[0,3]+180;
    // Exit
    global.unlock_var = irandom_range(1,global.spawn_len_var-1);
    for (local.i=1; local.i<global.spawn_len_var; local.i+=1;)
    {
        local.exitdoor = instance_create(global.spawn_arr[local.i,0]-lengthdir_x(16,global.spawn_arr[local.i,3]),global.spawn_arr[local.i,1]-lengthdir_y(16,global.spawn_arr[local.i,3]),door_obj);
        local.exitdoor.direction = global.spawn_arr[local.i,3]+180;
        local.exittrig = instance_create(global.spawn_arr[local.i,0]-lengthdir_x(8,global.spawn_arr[local.i,3]),global.spawn_arr[local.i,1]-lengthdir_y(8,global.spawn_arr[local.i,3]),door_trig_obj);
        local.exittrig.z = global.spawn_arr[local.i,2];
        if local.i != global.unlock_var
        {
            local.exittrig.lock_var = true;
            // Bars
            switch local.i
            {
                case 1: { local.xtmp = 336; local.ytmp = 128; break; }
                case 2: { local.xtmp = 432; local.ytmp = 128; break; }
                case 3: { local.xtmp = 336; local.ytmp = 384; break; }
                case 4: { local.xtmp = 432; local.ytmp = 384; break; }
            }
            instance_create(local.xtmp,local.ytmp,bar_vert_obj);
        }
        global.spawn_arr[local.i,4] = local.exittrig;
    }
");
// Room settings
room_set_width(argument0,1280);
room_set_height(argument0,720);
room_set_background_color(argument0,c_black,true);
room_set_view_enabled(argument0,true);
for (local.i=0; local.i<8; local.i+=1;)
{ room_set_view(argument0,local.i,false,0,0,1280,720,0,0,1280,720,32,32,-1,-1,noone); }
room_set_view(argument0,0,true,0,0,1280,720,0,0,1280,720,32,32,-1,-1,noone);
// Effects
room_instance_add(argument0,0,0,fog_01_obj);
room_instance_add(argument0,0,0,color_control_bright_obj);
room_instance_add(argument0,0,0,rand_mon_spawn_obj);
room_instance_add(argument0,0,0,amb_control_obj);
// Floors
room_instance_add(argument0,224,256,floor_obj);
room_instance_add(argument0,256,256,floor_obj);
room_instance_add(argument0,288,256,floor_obj);
room_instance_add(argument0,320,256,floor_obj);
room_instance_add(argument0,352,256,floor_obj);
room_instance_add(argument0,224,224,floor_obj);
room_instance_add(argument0,224,288,floor_obj);
room_instance_add(argument0,256,224,floor_obj);
room_instance_add(argument0,288,224,floor_obj);
room_instance_add(argument0,320,224,floor_obj);
room_instance_add(argument0,352,224,floor_obj);
room_instance_add(argument0,352,288,floor_obj);
room_instance_add(argument0,320,288,floor_obj);
room_instance_add(argument0,288,288,floor_obj);
room_instance_add(argument0,256,288,floor_obj);
room_instance_add(argument0,384,288,floor_obj);
room_instance_add(argument0,384,256,floor_obj);
room_instance_add(argument0,384,224,floor_obj);
room_instance_add(argument0,416,224,floor_obj);
room_instance_add(argument0,416,256,floor_obj);
room_instance_add(argument0,416,288,floor_obj);
room_instance_add(argument0,448,288,floor_obj);
room_instance_add(argument0,448,256,floor_obj);
room_instance_add(argument0,448,224,floor_obj);
room_instance_add(argument0,480,224,floor_obj);
room_instance_add(argument0,480,256,floor_obj);
room_instance_add(argument0,480,288,floor_obj);
room_instance_add(argument0,384,384,floor_obj);
room_instance_add(argument0,384,352,floor_obj);
room_instance_add(argument0,384,320,floor_obj);
room_instance_add(argument0,352,384,floor_obj);
room_instance_add(argument0,320,384,floor_obj);
room_instance_add(argument0,320,416,floor_obj);
room_instance_add(argument0,416,384,floor_obj);
room_instance_add(argument0,448,384,floor_obj);
room_instance_add(argument0,448,416,floor_obj);
room_instance_add(argument0,384,192,floor_obj);
room_instance_add(argument0,384,160,floor_obj);
room_instance_add(argument0,384,128,floor_obj);
room_instance_add(argument0,352,128,floor_obj);
room_instance_add(argument0,320,128,floor_obj);
room_instance_add(argument0,320,96,floor_obj);
room_instance_add(argument0,416,128,floor_obj);
room_instance_add(argument0,448,128,floor_obj);
room_instance_add(argument0,448,96,floor_obj);
// Ceilings
room_instance_add(argument0,224,256,ceil_2high_obj);
room_instance_add(argument0,256,256,ceil_2high_obj);
room_instance_add(argument0,288,256,ceil_2high_obj);
room_instance_add(argument0,320,256,ceil_2high_obj);
room_instance_add(argument0,352,256,ceil_2high_obj);
room_instance_add(argument0,224,224,ceil_2high_obj);
room_instance_add(argument0,224,288,ceil_2high_obj);
room_instance_add(argument0,256,224,ceil_2high_obj);
room_instance_add(argument0,288,224,ceil_2high_obj);
room_instance_add(argument0,320,224,ceil_2high_obj);
room_instance_add(argument0,352,224,ceil_2high_obj);
room_instance_add(argument0,352,288,ceil_2high_obj);
room_instance_add(argument0,320,288,ceil_2high_obj);
room_instance_add(argument0,288,288,ceil_2high_obj);
room_instance_add(argument0,256,288,ceil_2high_obj);
room_instance_add(argument0,384,288,ceil_2high_obj);
room_instance_add(argument0,384,256,ceil_2high_obj);
room_instance_add(argument0,384,224,ceil_2high_obj);
room_instance_add(argument0,416,224,ceil_2high_obj);
room_instance_add(argument0,416,256,ceil_2high_obj);
room_instance_add(argument0,416,288,ceil_2high_obj);
room_instance_add(argument0,448,288,ceil_2high_obj);
room_instance_add(argument0,448,256,ceil_2high_obj);
room_instance_add(argument0,448,224,ceil_2high_obj);
room_instance_add(argument0,480,224,ceil_2high_obj);
room_instance_add(argument0,480,256,ceil_2high_obj);
room_instance_add(argument0,480,288,ceil_2high_obj);

room_instance_add(argument0,384,384,ceil_obj);
room_instance_add(argument0,384,352,ceil_obj);
room_instance_add(argument0,384,320,ceil_obj);
room_instance_add(argument0,352,384,ceil_obj);
room_instance_add(argument0,320,384,ceil_obj);
room_instance_add(argument0,320,416,ceil_obj);
room_instance_add(argument0,416,384,ceil_obj);
room_instance_add(argument0,448,384,ceil_obj);
room_instance_add(argument0,448,416,ceil_obj);
room_instance_add(argument0,384,192,ceil_obj);
room_instance_add(argument0,384,160,ceil_obj);
room_instance_add(argument0,384,128,ceil_obj);
room_instance_add(argument0,352,128,ceil_obj);
room_instance_add(argument0,320,128,ceil_obj);
room_instance_add(argument0,320,96,ceil_obj);
room_instance_add(argument0,416,128,ceil_obj);
room_instance_add(argument0,448,128,ceil_obj);
room_instance_add(argument0,448,96,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,384,112,wall_hor_obj);
room_instance_add(argument0,352,112,wall_hor_obj);
room_instance_add(argument0,416,112,wall_hor_obj);
room_instance_add(argument0,416,144,wall_hor_obj);
room_instance_add(argument0,352,144,wall_hor_obj);
room_instance_add(argument0,320,144,wall_hor_obj);
room_instance_add(argument0,448,144,wall_hor_obj);
room_instance_add(argument0,352,368,wall_hor_obj);
room_instance_add(argument0,320,368,wall_hor_obj);
room_instance_add(argument0,352,400,wall_hor_obj);
room_instance_add(argument0,384,400,wall_hor_obj);
room_instance_add(argument0,416,400,wall_hor_obj);
room_instance_add(argument0,416,368,wall_hor_obj);
room_instance_add(argument0,448,368,wall_hor_obj);
room_instance_add(argument0,320,80,wall_hor_obj);
room_instance_add(argument0,448,80,wall_hor_obj);
room_instance_add(argument0,320,432,wall_hor_obj);
room_instance_add(argument0,448,432,wall_hor_obj);
room_instance_add(argument0,384,304,wall_doorway_hor_obj);
room_instance_add(argument0,384,208,wall_doorway_hor_obj);
room_instance_add(argument0,224,208,wall_2high_hor_obj);
room_instance_add(argument0,224,304,wall_2high_hor_obj);
room_instance_add(argument0,256,304,wall_2high_hor_obj);
room_instance_add(argument0,288,304,wall_2high_hor_obj);
room_instance_add(argument0,320,304,wall_2high_hor_obj);
room_instance_add(argument0,352,304,wall_2high_hor_obj);
room_instance_add(argument0,352,208,wall_2high_hor_obj);
room_instance_add(argument0,320,208,wall_2high_hor_obj);
room_instance_add(argument0,288,208,wall_2high_hor_obj);
room_instance_add(argument0,256,208,wall_2high_hor_obj);
room_instance_add(argument0,416,304,wall_2high_hor_obj);
room_instance_add(argument0,448,304,wall_2high_hor_obj);
room_instance_add(argument0,480,304,wall_2high_hor_obj);
room_instance_add(argument0,416,208,wall_2high_hor_obj);
room_instance_add(argument0,448,208,wall_2high_hor_obj);
room_instance_add(argument0,480,208,wall_2high_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,368,160,wall_vert_obj);
room_instance_add(argument0,368,192,wall_vert_obj);
room_instance_add(argument0,400,192,wall_vert_obj);
room_instance_add(argument0,400,160,wall_vert_obj);
room_instance_add(argument0,464,128,wall_vert_obj);
room_instance_add(argument0,304,128,wall_vert_obj);
room_instance_add(argument0,304,96,wall_vert_obj);
room_instance_add(argument0,336,96,wall_vert_obj);
room_instance_add(argument0,432,96,wall_vert_obj);
room_instance_add(argument0,464,96,wall_vert_obj);
room_instance_add(argument0,464,384,wall_vert_obj);
room_instance_add(argument0,464,416,wall_vert_obj);
room_instance_add(argument0,432,416,wall_vert_obj);
room_instance_add(argument0,304,384,wall_vert_obj);
room_instance_add(argument0,336,416,wall_vert_obj);
room_instance_add(argument0,304,416,wall_vert_obj);
room_instance_add(argument0,368,320,wall_vert_obj);
room_instance_add(argument0,368,352,wall_vert_obj);
room_instance_add(argument0,400,352,wall_vert_obj);
room_instance_add(argument0,400,320,wall_vert_obj);
room_instance_add(argument0,208,224,wall_2high_vert_obj);
room_instance_add(argument0,208,256,wall_2high_vert_obj);
room_instance_add(argument0,208,288,wall_2high_vert_obj);
room_instance_add(argument0,496,224,wall_2high_vert_obj);
room_instance_add(argument0,496,256,wall_2high_vert_obj);
room_instance_add(argument0,496,288,wall_2high_vert_obj);
// Torches
room_instance_add(argument0,256,208,torch_north_obj);
room_instance_add(argument0,320,208,torch_north_obj);
room_instance_add(argument0,256,304,torch_south_obj);
room_instance_add(argument0,320,304,torch_south_obj);
room_instance_add(argument0,448,208,torch_north_obj);
room_instance_add(argument0,448,304,torch_south_obj);
// Props
room_instance_add(argument0,480,251,bone_rand_obj);
room_instance_add(argument0,485,270,bone_rand_obj);
room_instance_add(argument0,288,208,chain_hor_rand_obj);
room_instance_add(argument0,288,304,chain_hor_rand_obj);