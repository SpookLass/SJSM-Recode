/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,"
    // Name
    global.rm_name_var = 'Hall 7 A'
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 144;
    global.spawn_arr[0,1] = 208;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 560;
    global.spawn_arr[1,1] = 208;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 208;
    global.mark_arr[0,1] = 208;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 272;
    global.mark_arr[1,1] = 208;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 304;
    global.mark_arr[2,1] = 208;
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
room_instance_add(argument0,144,208,floor_obj);
room_instance_add(argument0,176,208,floor_obj);
room_instance_add(argument0,208,208,floor_obj);
room_instance_add(argument0,240,208,floor_obj);
room_instance_add(argument0,272,208,floor_obj);
room_instance_add(argument0,304,208,floor_obj);
room_instance_add(argument0,336,208,floor_obj);
room_instance_add(argument0,560,208,floor_obj);
room_instance_add(argument0,144,176,floor_obj);
room_instance_add(argument0,176,176,floor_obj);
room_instance_add(argument0,208,176,floor_obj);
room_instance_add(argument0,240,176,floor_obj);
room_instance_add(argument0,272,176,floor_obj);
room_instance_add(argument0,304,176,floor_obj);
room_instance_add(argument0,336,176,floor_obj);
room_instance_add(argument0,560,176,floor_obj);
room_instance_add(argument0,560,240,floor_obj);
room_instance_add(argument0,336,240,floor_obj);
room_instance_add(argument0,304,240,floor_obj);
room_instance_add(argument0,272,240,floor_obj);
room_instance_add(argument0,240,240,floor_obj);
room_instance_add(argument0,208,240,floor_obj);
room_instance_add(argument0,176,240,floor_obj);
room_instance_add(argument0,144,240,floor_obj);
room_instance_add(argument0,368,176,floor_obj);
room_instance_add(argument0,496,176,floor_obj);
room_instance_add(argument0,464,176,floor_obj);
room_instance_add(argument0,432,176,floor_obj);
room_instance_add(argument0,400,176,floor_obj);
room_instance_add(argument0,368,208,floor_obj);
room_instance_add(argument0,400,208,floor_obj);
room_instance_add(argument0,432,208,floor_obj);
room_instance_add(argument0,464,208,floor_obj);
room_instance_add(argument0,496,208,floor_obj);
room_instance_add(argument0,496,240,floor_obj);
room_instance_add(argument0,464,240,floor_obj);
room_instance_add(argument0,432,240,floor_obj);
room_instance_add(argument0,400,240,floor_obj);
room_instance_add(argument0,368,240,floor_obj);
room_instance_add(argument0,528,176,floor_obj);
room_instance_add(argument0,528,208,floor_obj);
room_instance_add(argument0,528,240,floor_obj);
// Ceilings
room_instance_add(argument0,144,208,ceil_obj);
room_instance_add(argument0,176,208,ceil_obj);
room_instance_add(argument0,208,208,ceil_obj);
room_instance_add(argument0,240,208,ceil_obj);
room_instance_add(argument0,272,208,ceil_obj);
room_instance_add(argument0,304,208,ceil_obj);
room_instance_add(argument0,336,208,ceil_obj);
room_instance_add(argument0,560,208,ceil_obj);
room_instance_add(argument0,144,176,ceil_obj);
room_instance_add(argument0,176,176,ceil_obj);
room_instance_add(argument0,208,176,ceil_obj);
room_instance_add(argument0,240,176,ceil_obj);
room_instance_add(argument0,272,176,ceil_obj);
room_instance_add(argument0,304,176,ceil_obj);
room_instance_add(argument0,336,176,ceil_obj);
room_instance_add(argument0,560,176,ceil_obj);
room_instance_add(argument0,560,240,ceil_obj);
room_instance_add(argument0,336,240,ceil_obj);
room_instance_add(argument0,304,240,ceil_obj);
room_instance_add(argument0,272,240,ceil_obj);
room_instance_add(argument0,240,240,ceil_obj);
room_instance_add(argument0,208,240,ceil_obj);
room_instance_add(argument0,176,240,ceil_obj);
room_instance_add(argument0,144,240,ceil_obj);
room_instance_add(argument0,368,176,ceil_obj);
room_instance_add(argument0,496,176,ceil_obj);
room_instance_add(argument0,464,176,ceil_obj);
room_instance_add(argument0,432,176,ceil_obj);
room_instance_add(argument0,400,176,ceil_obj);
room_instance_add(argument0,368,208,ceil_obj);
room_instance_add(argument0,400,208,ceil_obj);
room_instance_add(argument0,432,208,ceil_obj);
room_instance_add(argument0,464,208,ceil_obj);
room_instance_add(argument0,496,208,ceil_obj);
room_instance_add(argument0,496,240,ceil_obj);
room_instance_add(argument0,464,240,ceil_obj);
room_instance_add(argument0,432,240,ceil_obj);
room_instance_add(argument0,400,240,ceil_obj);
room_instance_add(argument0,368,240,ceil_obj);
room_instance_add(argument0,528,176,ceil_obj);
room_instance_add(argument0,528,208,ceil_obj);
room_instance_add(argument0,528,240,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,144,256,wall_hor_obj);
room_instance_add(argument0,144,160,wall_hor_obj);
room_instance_add(argument0,560,160,wall_hor_obj);
room_instance_add(argument0,336,160,wall_hor_obj);
room_instance_add(argument0,304,160,wall_hor_obj);
room_instance_add(argument0,272,160,wall_hor_obj);
room_instance_add(argument0,240,160,wall_hor_obj);
room_instance_add(argument0,208,160,wall_hor_obj);
room_instance_add(argument0,176,160,wall_hor_obj);
room_instance_add(argument0,560,256,wall_hor_obj);
room_instance_add(argument0,336,256,wall_hor_obj);
room_instance_add(argument0,304,256,wall_hor_obj);
room_instance_add(argument0,272,256,wall_hor_obj);
room_instance_add(argument0,240,256,wall_hor_obj);
room_instance_add(argument0,208,256,wall_hor_obj);
room_instance_add(argument0,176,256,wall_hor_obj);
room_instance_add(argument0,368,160,wall_hor_obj);
room_instance_add(argument0,400,160,wall_hor_obj);
room_instance_add(argument0,432,160,wall_hor_obj);
room_instance_add(argument0,464,160,wall_hor_obj);
room_instance_add(argument0,496,160,wall_hor_obj);
room_instance_add(argument0,496,256,wall_hor_obj);
room_instance_add(argument0,464,256,wall_hor_obj);
room_instance_add(argument0,432,256,wall_hor_obj);
room_instance_add(argument0,400,256,wall_hor_obj);
room_instance_add(argument0,368,256,wall_hor_obj);
room_instance_add(argument0,528,160,wall_hor_obj);
room_instance_add(argument0,528,256,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,128,208,wall_vert_obj);
room_instance_add(argument0,576,208,wall_vert_obj);
room_instance_add(argument0,128,176,wall_vert_obj);
room_instance_add(argument0,128,240,wall_vert_obj);
room_instance_add(argument0,576,176,wall_vert_obj);
room_instance_add(argument0,576,240,wall_vert_obj);
// Props
room_instance_add(argument0,144,192,rail_metal_hor_obj);
room_instance_add(argument0,144,224,rail_metal_hor_obj);
room_instance_add(argument0,176,224,rail_metal_hor_obj);
room_instance_add(argument0,208,224,rail_metal_hor_obj);
room_instance_add(argument0,240,224,rail_metal_hor_obj);
room_instance_add(argument0,272,224,rail_metal_hor_obj);
room_instance_add(argument0,304,224,rail_metal_hor_obj);
room_instance_add(argument0,336,224,rail_metal_hor_obj);
room_instance_add(argument0,368,224,rail_metal_hor_obj);
room_instance_add(argument0,400,224,rail_metal_hor_obj);
room_instance_add(argument0,432,224,rail_metal_hor_obj);
room_instance_add(argument0,464,224,rail_metal_hor_obj);
room_instance_add(argument0,496,224,rail_metal_hor_obj);
room_instance_add(argument0,528,224,rail_metal_hor_obj);
room_instance_add(argument0,560,224,rail_metal_hor_obj);
room_instance_add(argument0,560,192,rail_metal_hor_obj);
room_instance_add(argument0,528,192,rail_metal_hor_obj);
room_instance_add(argument0,496,192,rail_metal_hor_obj);
room_instance_add(argument0,464,192,rail_metal_hor_obj);
room_instance_add(argument0,432,192,rail_metal_hor_obj);
room_instance_add(argument0,400,192,rail_metal_hor_obj);
room_instance_add(argument0,368,192,rail_metal_hor_obj);
room_instance_add(argument0,336,192,rail_metal_hor_obj);
room_instance_add(argument0,304,192,rail_metal_hor_obj);
room_instance_add(argument0,272,192,rail_metal_hor_obj);
room_instance_add(argument0,240,192,rail_metal_hor_obj);
room_instance_add(argument0,208,192,rail_metal_hor_obj);
room_instance_add(argument0,176,192,rail_metal_hor_obj);
room_instance_add(argument0,336,248,web_rand_obj);
room_instance_add(argument0,438,187,web_rand_obj);
room_instance_add(argument0,459,240,web_rand_obj);
// Not yet
/*room_instance_add(argument0,512,224,random_scare_mark1);*/