/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,"
    // Spawn
    global.spawn_len_var = 2;    
    global.spawn_arr[0,0] = 144;
    global.spawn_arr[0,1] = 400;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 304;
    global.spawn_arr[1,1] = 496;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 176;
    global.mark_arr[0,1] = 400;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 224;
    global.mark_arr[1,1] = 496;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 192;
    global.mark_arr[2,1] = 496;
    global.mark_arr[2,2] = 0;
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
")
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
room_instance_add(argument0,144,400,floor_obj);
room_instance_add(argument0,176,400,floor_obj);
room_instance_add(argument0,208,400,floor_obj);
room_instance_add(argument0,208,368,floor_obj);
room_instance_add(argument0,176,368,floor_obj);
room_instance_add(argument0,144,368,floor_obj);
room_instance_add(argument0,144,432,floor_obj);
room_instance_add(argument0,176,432,floor_obj);
room_instance_add(argument0,208,432,floor_obj);
room_instance_add(argument0,176,464,floor_obj);
room_instance_add(argument0,208,464,floor_obj);
room_instance_add(argument0,144,464,floor_obj);
room_instance_add(argument0,144,496,floor_obj);
room_instance_add(argument0,176,496,floor_obj);
room_instance_add(argument0,208,496,floor_obj);
room_instance_add(argument0,208,528,floor_obj);
room_instance_add(argument0,176,528,floor_obj);
room_instance_add(argument0,144,528,floor_obj);
room_instance_add(argument0,240,464,floor_obj);
room_instance_add(argument0,240,496,floor_obj);
room_instance_add(argument0,272,496,floor_obj);
room_instance_add(argument0,272,464,floor_obj);
room_instance_add(argument0,304,464,floor_obj);
room_instance_add(argument0,304,496,floor_obj);
room_instance_add(argument0,304,528,floor_obj);
room_instance_add(argument0,272,528,floor_obj);
room_instance_add(argument0,240,528,floor_obj);
// Ceilings
room_instance_add(argument0,144,400,ceil_obj);
room_instance_add(argument0,176,400,ceil_obj);
room_instance_add(argument0,208,400,ceil_obj);
room_instance_add(argument0,208,368,ceil_obj);
room_instance_add(argument0,176,368,ceil_obj);
room_instance_add(argument0,144,368,ceil_obj);
room_instance_add(argument0,144,432,ceil_obj);
room_instance_add(argument0,176,432,ceil_obj);
room_instance_add(argument0,208,432,ceil_obj);
room_instance_add(argument0,176,464,ceil_obj);
room_instance_add(argument0,208,464,ceil_obj);
room_instance_add(argument0,144,464,ceil_obj);
room_instance_add(argument0,144,496,ceil_obj);
room_instance_add(argument0,176,496,ceil_obj);
room_instance_add(argument0,208,496,ceil_obj);
room_instance_add(argument0,208,528,ceil_obj);
room_instance_add(argument0,176,528,ceil_obj);
room_instance_add(argument0,144,528,ceil_obj);
room_instance_add(argument0,240,464,ceil_obj);
room_instance_add(argument0,240,496,ceil_obj);
room_instance_add(argument0,272,496,ceil_obj);
room_instance_add(argument0,272,464,ceil_obj);
room_instance_add(argument0,304,464,ceil_obj);
room_instance_add(argument0,304,496,ceil_obj);
room_instance_add(argument0,304,528,ceil_obj);
room_instance_add(argument0,272,528,ceil_obj);
room_instance_add(argument0,240,528,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,144,352,wall_hor_obj);
room_instance_add(argument0,176,352,wall_hor_obj);
room_instance_add(argument0,208,352,wall_hor_obj);
room_instance_add(argument0,240,448,wall_hor_obj);
room_instance_add(argument0,272,448,wall_hor_obj);
room_instance_add(argument0,304,448,wall_hor_obj);
room_instance_add(argument0,304,544,wall_hor_obj);
room_instance_add(argument0,272,544,wall_hor_obj);
room_instance_add(argument0,240,544,wall_hor_obj);
room_instance_add(argument0,208,544,wall_hor_obj);
room_instance_add(argument0,176,544,wall_hor_obj);
room_instance_add(argument0,144,544,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,224,368,wall_vert_obj);
room_instance_add(argument0,224,400,wall_vert_obj);
room_instance_add(argument0,224,432,wall_vert_obj);
room_instance_add(argument0,320,464,wall_vert_obj);
room_instance_add(argument0,320,496,wall_vert_obj);
room_instance_add(argument0,320,528,wall_vert_obj);
room_instance_add(argument0,128,368,wall_vert_obj);
room_instance_add(argument0,128,400,wall_vert_obj);
room_instance_add(argument0,128,432,wall_vert_obj);
room_instance_add(argument0,128,464,wall_vert_obj);
room_instance_add(argument0,128,496,wall_vert_obj);
room_instance_add(argument0,128,528,wall_vert_obj);
// Props
room_instance_add(argument0,304,528,chair_rand_obj);
room_instance_add(argument0,304,432,chair_rand_obj);
// Not yet
/*room_instance_add(argument0,256,512,random_scare_mark1);
room_instance_add(argument0,143,493,webs_obj);
room_instance_add(argument0,202,452,webs_obj);
room_instance_add(argument0,259,517,webs_obj);

room_instance_add(argument0,144,384,rail_1_horr);
room_instance_add(argument0,176,384,rail_1_horr);
room_instance_add(argument0,144,416,rail_1_horr);
room_instance_add(argument0,176,512,rail_1_horr);
room_instance_add(argument0,208,512,rail_1_horr);
room_instance_add(argument0,240,512,rail_1_horr);
room_instance_add(argument0,272,512,rail_1_horr);
room_instance_add(argument0,304,512,rail_1_horr);
room_instance_add(argument0,160,496,rail_1_vert);
room_instance_add(argument0,192,400,rail_1_vert);
room_instance_add(argument0,192,432,rail_1_vert);
room_instance_add(argument0,192,464,rail_1_vert);
room_instance_add(argument0,160,432,rail_1_vert);
room_instance_add(argument0,160,464,rail_1_vert);
room_instance_add(argument0,208,480,rail_1_horr);
room_instance_add(argument0,304,480,rail_1_horr);
room_instance_add(argument0,272,480,rail_1_horr);
room_instance_add(argument0,240,480,rail_1_horr);*/