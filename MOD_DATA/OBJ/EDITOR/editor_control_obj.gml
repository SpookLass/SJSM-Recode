// Builtin Variables
object_set_depth(argument0,-100);
object_set_mask(argument0,noone);
object_set_parent(argument0,noone);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create
object_event_add
(argument0,ev_create,0,"
    // Variables
    snap_var = 16;
    w_var = room_width;
    h_var = room_height;
    name_var = 'Hall 1';
    file_name_var = 'hall_01_rm';
    fog_var = 'fog_01_obj'
    color_var = 'color_control_02_obj'
    select_var = noone;
    // Objects
    type_len_var = 7;
    // Floors
    type_arr[0,0] = floor_editor_obj;   // Object
    type_arr[0,1] = floor_editor_spr;   // Sprite
    type_arr[0,2] = 2;                  // Sub Type Amount
    type_arr[0,3] = 'Floor';            // Name
    type_arr[0,4] = 'floor_obj';        // Real object
    type_arr[0,5] = 'High Floor';
    type_arr[0,6] = 'floor_high_obj';
    // Ceilings
    type_arr[1,0] = ceil_editor_obj;
    type_arr[1,1] = ceil_editor_spr;
    type_arr[1,2] = 4;
    type_arr[1,3] = 'Ceiling';
    type_arr[1,4] = 'ceil_obj';
    type_arr[1,5] = 'High Ceiling';
    type_arr[1,6] = 'ceil_2high_obj';
    type_arr[1,7] = '3 High Ceiling';
    type_arr[1,8] = 'ceil_3high_obj';
    type_arr[1,9] = 'Low Ceiling';
    type_arr[1,10] = 'ceil_low_obj';
    // Vertical Walls
    type_arr[2,0] = wall_vert_editor_obj;
    type_arr[2,1] = wall_vert_editor_spr;
    type_arr[2,2] = 10;
    type_arr[2,3] = 'Vertical Wall';
    type_arr[2,4] = 'wall_vert_obj';
    type_arr[2,5] = 'High Vertical Wall';
    type_arr[2,6] = 'wall_2high_vert_obj';
    type_arr[2,7] = '3 High Vertical Wall';
    type_arr[2,8] = 'wall_3high_vert_obj';
    type_arr[2,9] = 'Big Vertical Wall';
    type_arr[2,10] = 'wall_big_vert_obj';
    type_arr[2,11] = 'Vertical Pit Wall';
    type_arr[2,12] = 'wall_pit_vert_obj';
    type_arr[2,13] = 'Vertical Two-Tone Wall';
    type_arr[2,14] = 'wall_tt_vert_obj';
    type_arr[2,15] = 'Vertical Floating Wall';
    type_arr[2,16] = 'wall_float_vert_obj';
    type_arr[2,17] = 'Vertical Floating Pit Wall';
    type_arr[2,18] = 'wall_pit_float_vert_obj';
    type_arr[2,19] = 'Vertical Doorway';
    type_arr[2,20] = 'wall_doorway_vert_obj';
    type_arr[2,21] = 'Big Vertical Doorway';
    type_arr[2,22] = 'wall_doorway_big_vert_obj';
    // Horizontal Walls
    type_arr[3,0] = wall_hor_editor_obj;
    type_arr[3,1] = wall_hor_editor_spr;
    type_arr[3,2] = 10;
    type_arr[3,3] = 'Horizontal Wall';
    type_arr[3,4] = 'wall_hor_obj';
    type_arr[3,5] = 'High Horizontal Wall';
    type_arr[3,6] = 'wall_2high_hor_obj';
    type_arr[3,7] = '3 High Horizontal Wall';
    type_arr[3,8] = 'wall_3high_hor_obj';
    type_arr[3,9] = 'Big Horizontal Wall';
    type_arr[3,10] = 'wall_big_hor_obj';
    type_arr[3,11] = 'Horizontal Pit Wall';
    type_arr[3,12] = 'wall_pit_hor_obj';
    type_arr[3,13] = 'Vertical Two-Tone Wall';
    type_arr[3,14] = 'wall_tt_vert_obj';
    type_arr[3,15] = 'Horizontal Floating Wall';
    type_arr[3,16] = 'wall_float_hor_obj';
    type_arr[3,17] = 'Horizontal Floating Pit Wall';
    type_arr[3,18] = 'wall_pit_float_hor_obj';
    type_arr[3,19] = 'Horizontal Doorway';
    type_arr[3,20] = 'wall_doorway_hor_obj';
    type_arr[3,21] = 'Big Horizontal Doorway';
    type_arr[3,22] = 'wall_doorway_big_hor_obj';
    // Props
    type_arr[4,0] = prop_editor_obj;
    type_arr[4,1] = prop_editor_spr;
    type_arr[4,2] = 48;
        // Main
    type_arr[4,3] = 'East Door';
    type_arr[4,4] = 'door_east_obj';
    type_arr[4,5] = 'North Door';
    type_arr[4,6] = 'door_north_obj';
    type_arr[4,7] = 'West Door';
    type_arr[4,8] = 'door_west_obj';
    type_arr[4,9] = 'South Door';
    type_arr[4,10] = 'door_south_obj';
    type_arr[4,11] = 'East Torch';
    type_arr[4,12] = 'torch_east_obj';
    type_arr[4,13] = 'North Torch';
    type_arr[4,14] = 'torch_north_obj';
    type_arr[4,15] = 'West Torch';
    type_arr[4,16] = 'torch_west_obj';
    type_arr[4,17] = 'South Torch';
    type_arr[4,18] = 'torch_south_obj';
        // Halls / General
    type_arr[4,19] = 'Wooden Table';
    type_arr[4,20] = 'table_obj';
    type_arr[4,21] = 'Random Wooden Table';
    type_arr[4,22] = 'table_rand_obj';
    type_arr[4,23] = 'Chair';
    type_arr[4,24] = 'chair_obj';
    type_arr[4,25] = 'East Chair';
    type_arr[4,26] = 'chair_east_obj';
    type_arr[4,27] = 'Random Chair';
    type_arr[4,28] = 'chair_rand_obj';
    type_arr[4,29] = 'Vertical Metal Railing';
    type_arr[4,30] = 'rail_metal_hor_obj';
    type_arr[4,31] = 'Horizontal Metal Railing';
    type_arr[4,32] = 'rail_metal_hor_obj';
    type_arr[4,33] = 'Rug';
    type_arr[4,34] = 'rug_obj';
    type_arr[4,35] = 'Random Rug';
    type_arr[4,36] = 'rug_rand_obj';
    type_arr[4,37] = 'Webs';
    type_arr[4,38] = 'web_obj';
    type_arr[4,39] = 'Random Webs';
    type_arr[4,40] = 'web_rand_obj';
        // Jails
    type_arr[4,41] = 'Vertical Bars';
    type_arr[4,42] = 'bar_vert_obj';
    type_arr[4,43] = 'Bones';
    type_arr[4,44] = 'bone_obj';
    type_arr[4,45] = 'Random Bones';
    type_arr[4,46] = 'bone_rand_obj';
    type_arr[4,47] = 'Metal Table';
    type_arr[4,48] = 'table_metal_obj';
        // Engine
    type_arr[4,49] = 'Metal Pole';
    type_arr[4,50] = 'pole_metal_obj';
    type_arr[4,51] = 'Engine';
    type_arr[4,52] = 'engine_obj';
    type_arr[4,53] = 'Random Engine';
    type_arr[4,54] = 'engine_rand_obj';
    type_arr[4,55] = 'Random Horizontal Wire';
    type_arr[4,56] = 'wire_hor_rand_obj';
    type_arr[4,57] = 'Runner';
    type_arr[4,58] = 'runner_obj';
        // Dungeon
    type_arr[4,59] = 'Random Horizontal Chain';
    type_arr[4,60] = 'chain_hor_rand_obj';
        // Storage
    type_arr[4,61] = 'Crate';
    type_arr[4,62] = 'crate_obj';
    type_arr[4,63] = 'Random Crate';
    type_arr[4,64] = 'crate_rand_obj';
    type_arr[4,65] = 'Wooden Pole';
    type_arr[4,66] = 'pole_wood_obj';
        // Hotel
    type_arr[4,67] = 'Horizontal Doorframe';
    type_arr[4,68] = 'doorframe_01_hor_obj';
    type_arr[4,69] = 'Horizontal Doorframe Wall';
    type_arr[4,70] = 'doorframe_02_hor_obj';
    type_arr[4,71] = 'Vertical Doorframe';
    type_arr[4,72] = 'doorframe_01_vert_obj';
    type_arr[4,73] = 'Vertical Doorframe Wall';
    type_arr[4,74] = 'doorframe_02_vert_obj';
        // Fish
    type_arr[4,75] = 'Tank';
    type_arr[4,76] = 'tank_obj';
    type_arr[4,77] = 'Random Tank';
    type_arr[4,78] = 'tank_rand_obj';
        // Brain
    type_arr[4,79] = 'Brain';
    type_arr[4,80] = 'brain_obj';
    type_arr[4,81] = 'Brain Tank';
    type_arr[4,82] = 'brain_tank_obj';
    type_arr[4,83] = 'Blood';
    type_arr[4,84] = 'blood_obj';
    type_arr[4,85] = 'Random Blood';
    type_arr[4,86] = 'blood_rand_obj';
    type_arr[4,87] = 'Big Computer';
    type_arr[4,88] = 'pc_big_obj';
    type_arr[4,89] = 'Small Computer';
    type_arr[4,90] = 'pc_small_obj';
        // Recode
    type_arr[4,91] = 'East Gold Torch';
    type_arr[4,92] = 'torch_gold_east_obj';
    type_arr[4,93] = 'North Gold Torch';
    type_arr[4,94] = 'torch_gold_north_obj';
    type_arr[4,95] = 'West Gold Torch';
    type_arr[4,96] = 'torch_gold_west_obj';
    type_arr[4,97] = 'South Gold Torch';
    type_arr[4,98] = 'torch_gold_south_obj';
    // Spawns
    type_arr[5,0] = spawn_editor_obj;   // Spawns and marks are special
    type_arr[5,1] = spawn_editor_spr;   // They're stored as an array in the create event rather than as objects
    type_arr[5,2] = -1;
    type_arr[5,3] = 'Spawn';
    type_arr[5,4] = '';
    // Marks
    type_arr[6,0] = mark_editor_obj;
    type_arr[6,1] = mark_editor_spr;
    type_arr[6,2] = -1;
    type_arr[6,3] = 'Mark';
    type_arr[6,4] = '';
");
// Step event
object_event_add
(argument0,ev_step,ev_step_normal,"
    if keyboard_check_pressed(vk_backspace)
    {
        if mode_var != 2 { mode_var = 2; }
        else { mode_var = 0;}
    }
    if keyboard_check_pressed(vk_enter)
    {
        if mode_var != 1 { mode_var = 1; }
        else { mode_var = 0; }
    }
    if keyboard_check_pressed(vk_shift)
    { hold_var = !hold_var; }
    if keyboard_check(vk_control)
    {
        if mouse_wheel_up()
        { sub_type_var -= 1; }
        if mouse_wheel_down()
        { sub_type_var += 1; }
    }
    else
    {
        if mouse_wheel_up()
        { type_var -= 1; }
        if mouse_wheel_down()
        { type_var += 1; }
        
    }
    type_var = type_var mod type_len_var;
    if type_var < 0 { type_var += type_len_var; }
    if type_arr[type_var,2] <= 0
    { sub_type_var = max(0,sub_type_var); }
    else
    {
        sub_type_var = sub_type_var mod type_arr[type_var,2];
        if sub_type_var < 0 { sub_type_var += type_arr[type_var,2]; }
    }
    mouse_x_snap_var = round(mouse_x/snap_var)*snap_var;
    mouse_y_snap_var = round(mouse_y/snap_var)*snap_var;
    if mouse_check_button_pressed(mb_right)
    {
        local.collision = collision_point(mouse_x,mouse_y,type_arr[type_var,0],true,true);
        if local.collision
        {
            local.question = show_menu('Back|Set Width|Set Height|Set Z|Set Direction',0);
            switch local.question
            {
                case 1: { local.collision.w_var = get_integer('Set Width',local.collision.w_var); break; }
                case 2: { local.collision.h_var = get_integer('Set Height',local.collision.h_var); break; }
                case 3: { local.collision.z = get_integer('Set Z',local.collision.z); break; }
                case 4: { local.collision.direction = get_integer('Set Direction',local.collision.direction) mod 360; local.collision.image_angle = local.collision.direction; break; }
            }
        }
        else
        {
            local.question = show_menu('Back|Set Room Width|Set Room Height|Set Room Name|Set Room File|Set Fog Object|Set Color Object|Set Snap|Export!',0);
            switch local.question
            {
                case 1: { w_var = get_integer('Set Room Width',w_var); break; }
                case 2: { h_var = get_integer('Set Room Height',h_var); break; }
                case 3: { name_var = get_string('Set Room Name',name_var); break; }
                case 4: { file_name_var = get_string('Set Room File',file_name_var); break; }
                case 5: { fog_var = get_string('Set Fog Object',fog_var); break; }
                case 6: { color_var = get_string('Set Color Object',color_var); break; }
                case 7: { snap_var = max(1,get_integer('Set Snap',snap_var)); break; }
                case 8: { editor_export_scr(); }
            }
        }

    }
    if mode_var == 1
    {
        if mouse_check_button_pressed(mb_left)
        {
            select_var = collision_point(mouse_x,mouse_y,type_arr[type_var,0],true,true);
        }
        if instance_exists(select_var)
        {
            with select_var
            {
                x = other.mouse_x_snap_var;
                y = other.mouse_y_snap_var;
            }
        }
    }
    if mouse_check_button_released(mb_left) || (hold_var && mouse_check_button(mb_left))
    {
        
        switch mode_var
        {
            case 0:
            {
                if !collision_point(mouse_x_snap_var,mouse_y_snap_var,type_arr[type_var,0],true,true)
                {
                    local.thing = instance_create(mouse_x_snap_var,mouse_y_snap_var,type_arr[type_var,0]);
                    local.thing.type_var = type_var;
                    local.thing.sub_type_var = sub_type_var;
                }
                break;
            }
            case 1:
            {
                if instance_exists(select_var)
                {
                    if !collision_point(mouse_x_snap_var,mouse_y_snap_var,select_var.object_index,true,true)
                    { select_var = noone; }
                }
                break;
            }
            case 2:
            {
                local.collision = collision_point(mouse_x,mouse_y,all,true,true);
                if local.collision
                {
                    with local.collision
                    {
                        instance_destroy();
                    }
                }
                break;
            }
        }
    }
");
// Draw event
object_event_add
(argument0,ev_draw,0,"
    draw_set_color(c_white);
    if type_arr[type_var,2] <= 0 { draw_text(0,0,type_arr[type_var,3]+' '+string(sub_type_var+1)); }
    else { draw_text(0,0,type_arr[type_var,(sub_type_var*2)+3]); }
    switch mode_var
    {
        case 0: 
        {
            draw_sprite_ext(type_arr[type_var,1],0,mouse_x_snap_var,mouse_y_snap_var,1,1,0,image_blend,0.5);
            local.str = 'Normal';
            break;
        }
        case 1: { local.str = 'Select'; break; }
        case 2: { local.str = 'Erase'; break; }
    }
    if hold_var { local.str += ' Hold';}
    draw_text(0,48,local.str);
");