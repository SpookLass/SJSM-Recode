/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,"
    // Spawn
    global.spawn_len_var = 4;
    global.spawn_arr[0,0] = 176;
    global.spawn_arr[0,1] = 192;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 176;
    global.spawn_arr[1,1] = 288;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 90;
    global.spawn_arr[2,0] = 272;
    global.spawn_arr[2,1] = 288;
    global.spawn_arr[2,2] = 0;
    global.spawn_arr[2,3] = 90;
    global.spawn_arr[3,0] = 368;
    global.spawn_arr[3,1] = 288;
    global.spawn_arr[3,2] = 0;
    global.spawn_arr[3,3] = 90;
    // Mark
    global.mark_len_var = 4;
    global.mark_arr[0,0] = 224;
    global.mark_arr[0,1] = 192;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 304;
    global.mark_arr[1,1] = 192;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 400;
    global.mark_arr[2,1] = 240;
    global.mark_arr[2,2] = 0;
    global.mark_arr[3,0] = 224;
    global.mark_arr[3,1] = 256;
    global.mark_arr[3,2] = 0;
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
    // Doors
    local.entrance = instance_create(global.spawn_arr[0,0]-lengthdir_x(16,global.spawn_arr[0,3]),global.spawn_arr[0,1]-lengthdir_y(16,global.spawn_arr[0,3]),door_entrance_obj);
    local.entrance.z = global.spawn_arr[0,2];
    local.entrance.direction = global.spawn_arr[0,3]+180;
    // Exit
    local.unlock = irandom_range(1,global.spawn_len_var-1);
    for (local.i=1; local.i<global.spawn_len_var; local.i+=1;)
    {
        local.exitdoor = instance_create(global.spawn_arr[local.i,0]-lengthdir_x(16,global.spawn_arr[local.i,3]),global.spawn_arr[local.i,1]-lengthdir_y(16,global.spawn_arr[local.i,3]),door_obj);
        local.exitdoor.direction = global.spawn_arr[local.i,3]+180;
        local.exittrig = instance_create(global.spawn_arr[local.i,0]-lengthdir_x(8,global.spawn_arr[local.i,3]),global.spawn_arr[local.i,1]-lengthdir_y(8,global.spawn_arr[local.i,3]),door_trig_obj);
        local.exittrig.z = global.spawn_arr[local.i,2];
        if local.i != local.unlock { local.exittrig.lock_var = true; }
        global.spawn_arr[local.i,4] = local.exittrig;
    }
    // Torches
    local.torch = instance_create(176,240,torch_gold_north_obj);
    local.torch.door_var = global.spawn_arr[1,4];
    local.torch = instance_create(272,240,torch_gold_north_obj);
    local.torch.door_var = global.spawn_arr[2,4];
    local.torch = instance_create(368,240,torch_gold_north_obj);
    local.torch.door_var = global.spawn_arr[3,4];
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
room_instance_add(argument0,0,0,maze_dark_fog_obj);
room_instance_add(argument0,0,0,maze_dark_color_obj);
// Floors
room_instance_add(argument0,176,192,floor_obj);
room_instance_add(argument0,208,192,floor_obj);
room_instance_add(argument0,240,192,floor_obj);
room_instance_add(argument0,272,192,floor_obj);
room_instance_add(argument0,304,192,floor_obj);
room_instance_add(argument0,336,192,floor_obj);
room_instance_add(argument0,368,192,floor_obj);
room_instance_add(argument0,368,256,floor_obj);
room_instance_add(argument0,336,256,floor_obj);
room_instance_add(argument0,304,256,floor_obj);
room_instance_add(argument0,272,256,floor_obj);
room_instance_add(argument0,240,256,floor_obj);
room_instance_add(argument0,208,256,floor_obj);
room_instance_add(argument0,176,256,floor_obj);
room_instance_add(argument0,176,288,floor_obj);
room_instance_add(argument0,272,288,floor_obj);
room_instance_add(argument0,368,288,floor_obj);
room_instance_add(argument0,400,192,floor_obj);
room_instance_add(argument0,400,224,floor_obj);
room_instance_add(argument0,400,256,floor_obj);
// Ceilings
room_instance_add(argument0,176,192,ceil_obj);
room_instance_add(argument0,208,192,ceil_obj);
room_instance_add(argument0,240,192,ceil_obj);
room_instance_add(argument0,272,192,ceil_obj);
room_instance_add(argument0,304,192,ceil_obj);
room_instance_add(argument0,336,192,ceil_obj);
room_instance_add(argument0,368,192,ceil_obj);
room_instance_add(argument0,368,256,ceil_obj);
room_instance_add(argument0,336,256,ceil_obj);
room_instance_add(argument0,304,256,ceil_obj);
room_instance_add(argument0,272,256,ceil_obj);
room_instance_add(argument0,240,256,ceil_obj);
room_instance_add(argument0,208,256,ceil_obj);
room_instance_add(argument0,176,256,ceil_obj);
room_instance_add(argument0,176,288,ceil_obj);
room_instance_add(argument0,272,288,ceil_obj);
room_instance_add(argument0,368,288,ceil_obj);
room_instance_add(argument0,400,192,ceil_obj);
room_instance_add(argument0,400,224,ceil_obj);
room_instance_add(argument0,400,256,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,176,176,wall_hor_obj);
room_instance_add(argument0,176,208,wall_hor_obj);
room_instance_add(argument0,208,208,wall_hor_obj);
room_instance_add(argument0,336,208,wall_hor_obj);
room_instance_add(argument0,304,208,wall_hor_obj);
room_instance_add(argument0,272,208,wall_hor_obj);
room_instance_add(argument0,240,208,wall_hor_obj);
room_instance_add(argument0,272,304,wall_hor_obj);
room_instance_add(argument0,368,304,wall_hor_obj);
room_instance_add(argument0,336,272,wall_hor_obj);
room_instance_add(argument0,304,272,wall_hor_obj);
room_instance_add(argument0,240,272,wall_hor_obj);
room_instance_add(argument0,208,272,wall_hor_obj);
room_instance_add(argument0,176,304,wall_hor_obj);
room_instance_add(argument0,176,240,wall_hor_obj);
room_instance_add(argument0,208,240,wall_hor_obj);
room_instance_add(argument0,240,240,wall_hor_obj);
room_instance_add(argument0,272,240,wall_hor_obj);
room_instance_add(argument0,304,240,wall_hor_obj);
room_instance_add(argument0,336,240,wall_hor_obj);
room_instance_add(argument0,368,208,wall_hor_obj);
room_instance_add(argument0,368,240,wall_hor_obj);
room_instance_add(argument0,208,176,wall_hor_obj);
room_instance_add(argument0,240,176,wall_hor_obj);
room_instance_add(argument0,272,176,wall_hor_obj);
room_instance_add(argument0,304,176,wall_hor_obj);
room_instance_add(argument0,336,176,wall_hor_obj);
room_instance_add(argument0,368,176,wall_hor_obj);
room_instance_add(argument0,400,176,wall_hor_obj);
room_instance_add(argument0,400,272,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,416,192,wall_vert_obj);
room_instance_add(argument0,416,224,wall_vert_obj);
room_instance_add(argument0,384,224,wall_vert_obj);
room_instance_add(argument0,416,256,wall_vert_obj);
room_instance_add(argument0,384,288,wall_vert_obj);
room_instance_add(argument0,352,288,wall_vert_obj);
room_instance_add(argument0,288,288,wall_vert_obj);
room_instance_add(argument0,256,288,wall_vert_obj);
room_instance_add(argument0,160,192,wall_vert_obj);
room_instance_add(argument0,160,256,wall_vert_obj);
room_instance_add(argument0,160,288,wall_vert_obj);
room_instance_add(argument0,192,288,wall_vert_obj);
// Not yet
/*room_instance_add(argument0,352,208,random_scare_mark1);
room_instance_add(argument0,250,397,webs_obj);
room_instance_add(argument0,206,263,webs_obj);
room_instance_add(argument0,275,181,webs_obj);
room_instance_add(argument0,342,266,webs_obj);*/