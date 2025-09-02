/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,"
    // Name
    global.rm_name_var = 'Hall 32'
    // Spawn
    global.spawn_len_var = 3;
    global.spawn_arr[0,0] = 112;
    global.spawn_arr[0,1] = 464;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 752;
    global.spawn_arr[1,1] = 464;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    global.spawn_arr[2,0] = 464;
    global.spawn_arr[2,1] = 240;
    global.spawn_arr[2,2] = 0;
    global.spawn_arr[2,3] = 270;
    // Mark
    global.mark_len_var = 6;
    global.mark_arr[0,0] = 273;
    global.mark_arr[0,1] = 462;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 397;
    global.mark_arr[1,1] = 323;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 564;
    global.mark_arr[2,1] = 464;
    global.mark_arr[2,2] = 0;
    global.mark_arr[3,0] = 697;
    global.mark_arr[3,1] = 465;
    global.mark_arr[3,2] = 0;
    global.mark_arr[4,0] = 361;
    global.mark_arr[4,1] = 466;
    global.mark_arr[4,2] = 0;
    global.mark_arr[5,0] = 450;
    global.mark_arr[5,1] = 270;
    global.mark_arr[5,2] = 0;
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
    // Doors
    local.entrance = instance_create(global.spawn_arr[0,0]-lengthdir_x(16,global.spawn_arr[0,3]),global.spawn_arr[0,1]-lengthdir_y(16,global.spawn_arr[0,3]),door_entrance_obj);
    local.entrance.z = global.spawn_arr[0,2];
    local.entrance.direction = global.spawn_arr[0,3]+180;
    for (local.i=1; local.i<global.spawn_len_var; local.i+=1;)
    {
        local.exitdoor = instance_create(global.spawn_arr[local.i,0]-lengthdir_x(16,global.spawn_arr[local.i,3]),global.spawn_arr[local.i,1]-lengthdir_y(16,global.spawn_arr[local.i,3]),door_obj);
        local.exitdoor.direction = global.spawn_arr[local.i,3]+180;
        local.exittrig = instance_create(global.spawn_arr[local.i,0]-lengthdir_x(8,global.spawn_arr[local.i,3]),global.spawn_arr[local.i,1]-lengthdir_y(8,global.spawn_arr[local.i,3]),door_trig_obj);
        local.exittrig.z = global.spawn_arr[local.i,2];
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
room_instance_add(argument0,0,0,color_control_02_obj);
// Floors
room_instance_add(argument0,112,464,floor_obj);
room_instance_add(argument0,144,464,floor_obj);
room_instance_add(argument0,176,464,floor_obj);
room_instance_add(argument0,208,464,floor_obj);
room_instance_add(argument0,240,464,floor_obj);
room_instance_add(argument0,272,464,floor_obj);
room_instance_add(argument0,304,464,floor_obj);
room_instance_add(argument0,336,464,floor_obj);
room_instance_add(argument0,368,464,floor_obj);
room_instance_add(argument0,400,464,floor_obj);
room_instance_add(argument0,432,464,floor_obj);
room_instance_add(argument0,464,464,floor_obj);
room_instance_add(argument0,496,464,floor_obj);
room_instance_add(argument0,400,432,floor_obj);
room_instance_add(argument0,400,400,floor_obj);
room_instance_add(argument0,400,368,floor_obj);
room_instance_add(argument0,400,336,floor_obj);
room_instance_add(argument0,528,464,floor_obj);
room_instance_add(argument0,560,464,floor_obj);
room_instance_add(argument0,592,464,floor_obj);
room_instance_add(argument0,624,464,floor_obj);
room_instance_add(argument0,656,464,floor_obj);
room_instance_add(argument0,400,304,floor_obj);
room_instance_add(argument0,400,272,floor_obj);
room_instance_add(argument0,432,272,floor_obj);
room_instance_add(argument0,464,272,floor_obj);
room_instance_add(argument0,464,240,floor_obj);
room_instance_add(argument0,688,464,floor_obj);
room_instance_add(argument0,720,464,floor_obj);
room_instance_add(argument0,752,464,floor_obj);
// Ceilings
room_instance_add(argument0,112,464,ceil_obj);
room_instance_add(argument0,144,464,ceil_obj);
room_instance_add(argument0,176,464,ceil_obj);
room_instance_add(argument0,208,464,ceil_obj);
room_instance_add(argument0,240,464,ceil_obj);
room_instance_add(argument0,272,464,ceil_obj);
room_instance_add(argument0,304,464,ceil_obj);
room_instance_add(argument0,336,464,ceil_obj);
room_instance_add(argument0,368,464,ceil_obj);
room_instance_add(argument0,400,464,ceil_obj);
room_instance_add(argument0,432,464,ceil_obj);
room_instance_add(argument0,464,464,ceil_obj);
room_instance_add(argument0,496,464,ceil_obj);
room_instance_add(argument0,400,432,ceil_obj);
room_instance_add(argument0,400,400,ceil_obj);
room_instance_add(argument0,400,368,ceil_obj);
room_instance_add(argument0,400,336,ceil_obj);
room_instance_add(argument0,528,464,ceil_obj);
room_instance_add(argument0,560,464,ceil_obj);
room_instance_add(argument0,592,464,ceil_obj);
room_instance_add(argument0,624,464,ceil_obj);
room_instance_add(argument0,656,464,ceil_obj);
room_instance_add(argument0,400,304,ceil_obj);
room_instance_add(argument0,400,272,ceil_obj);
room_instance_add(argument0,432,272,ceil_obj);
room_instance_add(argument0,464,272,ceil_obj);
room_instance_add(argument0,464,240,ceil_obj);
room_instance_add(argument0,688,464,ceil_obj);
room_instance_add(argument0,720,464,ceil_obj);
room_instance_add(argument0,752,464,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,112,448,wall_hor_obj);
room_instance_add(argument0,144,448,wall_hor_obj);
room_instance_add(argument0,144,480,wall_hor_obj);
room_instance_add(argument0,112,480,wall_hor_obj);
room_instance_add(argument0,176,448,wall_hor_obj);
room_instance_add(argument0,208,448,wall_hor_obj);
room_instance_add(argument0,208,480,wall_hor_obj);
room_instance_add(argument0,176,480,wall_hor_obj);
room_instance_add(argument0,240,448,wall_hor_obj);
room_instance_add(argument0,400,480,wall_hor_obj);
room_instance_add(argument0,368,448,wall_hor_obj);
room_instance_add(argument0,336,448,wall_hor_obj);
room_instance_add(argument0,304,448,wall_hor_obj);
room_instance_add(argument0,272,448,wall_hor_obj);
room_instance_add(argument0,368,480,wall_hor_obj);
room_instance_add(argument0,336,480,wall_hor_obj);
room_instance_add(argument0,304,480,wall_hor_obj);
room_instance_add(argument0,272,480,wall_hor_obj);
room_instance_add(argument0,240,480,wall_hor_obj);
room_instance_add(argument0,400,256,wall_hor_obj);
room_instance_add(argument0,432,256,wall_hor_obj);
room_instance_add(argument0,464,224,wall_hor_obj);
room_instance_add(argument0,464,288,wall_hor_obj);
room_instance_add(argument0,432,288,wall_hor_obj);
room_instance_add(argument0,432,448,wall_hor_obj);
room_instance_add(argument0,432,480,wall_hor_obj);
room_instance_add(argument0,464,448,wall_hor_obj);
room_instance_add(argument0,464,480,wall_hor_obj);
room_instance_add(argument0,496,448,wall_hor_obj);
room_instance_add(argument0,496,480,wall_hor_obj);
room_instance_add(argument0,528,448,wall_hor_obj);
room_instance_add(argument0,528,480,wall_hor_obj);
room_instance_add(argument0,560,448,wall_hor_obj);
room_instance_add(argument0,560,480,wall_hor_obj);
room_instance_add(argument0,592,480,wall_hor_obj);
room_instance_add(argument0,592,448,wall_hor_obj);
room_instance_add(argument0,624,448,wall_hor_obj);
room_instance_add(argument0,624,480,wall_hor_obj);
room_instance_add(argument0,656,448,wall_hor_obj);
room_instance_add(argument0,656,480,wall_hor_obj);
room_instance_add(argument0,688,448,wall_hor_obj);
room_instance_add(argument0,688,480,wall_hor_obj);
room_instance_add(argument0,720,448,wall_hor_obj);
room_instance_add(argument0,720,480,wall_hor_obj);
room_instance_add(argument0,752,448,wall_hor_obj);
room_instance_add(argument0,752,480,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,96,464,wall_vert_obj);
room_instance_add(argument0,384,272,wall_vert_obj);
room_instance_add(argument0,448,240,wall_vert_obj);
room_instance_add(argument0,480,240,wall_vert_obj);
room_instance_add(argument0,480,272,wall_vert_obj);
room_instance_add(argument0,416,304,wall_vert_obj);
room_instance_add(argument0,384,304,wall_vert_obj);
room_instance_add(argument0,384,336,wall_vert_obj);
room_instance_add(argument0,416,336,wall_vert_obj);
room_instance_add(argument0,416,432,wall_vert_obj);
room_instance_add(argument0,416,400,wall_vert_obj);
room_instance_add(argument0,416,368,wall_vert_obj);
room_instance_add(argument0,384,368,wall_vert_obj);
room_instance_add(argument0,384,400,wall_vert_obj);
room_instance_add(argument0,384,432,wall_vert_obj);
room_instance_add(argument0,768,464,wall_vert_obj);
// Torches


// Not yet
/*room_instance_add(argument0,640,480,random_scare_mark1);
room_instance_add(argument0,181,468,webs_obj);
room_instance_add(argument0,208,459,webs_obj);
room_instance_add(argument0,131,454,webs_obj);
room_instance_add(argument0,229,470,webs_obj);
room_instance_add(argument0,326,458,webs_obj);
room_instance_add(argument0,426,460,webs_obj);
room_instance_add(argument0,393,429,webs_obj);
room_instance_add(argument0,403,375,webs_obj);
room_instance_add(argument0,393,286,webs_obj);
room_instance_add(argument0,484,462,webs_obj);
room_instance_add(argument0,411,472,webs_obj);
room_instance_add(argument0,385,456,webs_obj);
room_instance_add(argument0,298,475,webs_obj);
room_instance_add(argument0,529,460,webs_obj);
room_instance_add(argument0,522,472,webs_obj);
room_instance_add(argument0,597,467,webs_obj);
room_instance_add(argument0,678,471,webs_obj);
room_instance_add(argument0,665,457,webs_obj);
room_instance_add(argument0,541,471,webs_obj);
room_instance_add(argument0,353,456,webs_obj);
room_instance_add(argument0,343,469,webs_obj);
room_instance_add(argument0,307,460,webs_obj);
room_instance_add(argument0,286,473,webs_obj);
room_instance_add(argument0,235,452,webs_obj);
room_instance_add(argument0,251,465,webs_obj);
room_instance_add(argument0,389,472,webs_obj);
room_instance_add(argument0,466,458,webs_obj);
room_instance_add(argument0,452,472,webs_obj);
room_instance_add(argument0,467,472,webs_obj);
room_instance_add(argument0,190,449,webs_obj);
room_instance_add(argument0,153,464,webs_obj);*/