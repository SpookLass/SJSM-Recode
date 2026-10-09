// Builtin Variables
object_set_depth(argument0,-4);
object_set_mask(argument0,noone);
object_set_parent(argument0,wall_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    par_var = '+string(argument2)+'
    broke_var = '+string(argument4)+'
    bg_var = '+string(argument2.bg_arr_var[argument3,0])+'
    store_tex_var = background_get_texture(bg_var);
    tex_h_var = background_get_width(bg_var)/background_get_height(bg_var);
    event_inherited();
    with instance_create(x,y,lab_tank_back_obj)
    {
        par_var = other.id;
        z += other.z;
        direction = other.direction;
    }
    switch broke_var
    {
        // Not Broken (Subject 5)
        case 2:
        {
            local.xtmp = x+lengthdir_x(-4,direction)+lengthdir_x(8,direction-90);
            local.ytmp = y+lengthdir_y(-4,direction)+lengthdir_y(8,direction-90);
            with instance_create(local.xtmp,local.ytmp,lab_subject_05_obj)
            {
                par_var = other.id;
                z_base_var += other.z;
                z = z_base_var;
                direction = other.direction;
            }
            break;
        }
        // Broken
        case 1:
        {
            if frac_chance_scr(1,2) 
            {
                local.xtmp = x+lengthdir_x(-4,direction)+lengthdir_x(8,direction+90);
                local.ytmp = y+lengthdir_y(-4,direction)+lengthdir_y(8,direction+90);
                with instance_create(local.xtmp,local.ytmp,par_var.lab_subject_obj)
                {
                    par_var = other.id;
                    z_base_var += other.z;
                    z = z_base_var;
                    direction = other.direction;
                }
            }
            break;
        }
        // Not Broken
        default:
        {
            local.xtmp = x+lengthdir_x(-4,direction);
            local.ytmp = y+lengthdir_y(-4,direction);
            if frac_chance_scr(1,2) { local.dir = direction+90; }
            else { local.dir = direction-90; }
            local.xtmp += lengthdir_x(8,local.dir);
            local.ytmp += lengthdir_y(8,local.dir);
            with instance_create(local.xtmp,local.ytmp,par_var.lab_subject_obj)
            {
                par_var = other.id;
                z_base_var += other.z;
                z = z_base_var;
                direction = other.direction;
            }
            break;
        }
    }
');
// Directions
if argument5
{
    local.obj = argument0;
    if string_pos("obj",argument1) >= 0
    {
        local.northname = string_replace(argument1,"obj","north_obj");
        local.eastname = string_replace(argument1,"obj","east_obj");
        local.southname = string_replace(argument1,"obj","south_obj");
        local.westname = string_replace(argument1,"obj","west_obj");
    }
    else
    {
        local.northname = argument1+"_north";
        local.eastname = argument1+"_east";
        local.southname = argument1+"_south";
        local.westname = argument1+"_west";
    }
    with argument2
    {
        obj_arr_var[obj_len_var,1] = spawn_north_obj_path;
        obj_arr_var[obj_len_var,2] = local.northname;
        obj_arr_var[obj_len_var,3] = 1;
        obj_arr_var[obj_len_var,4] = local.obj;
        obj_arr_var[obj_len_var+1,1] = spawn_vert_obj_path;
        obj_arr_var[obj_len_var+1,2] = local.eastname;
        obj_arr_var[obj_len_var+1,3] = 1;
        obj_arr_var[obj_len_var+1,4] = local.obj;
        obj_arr_var[obj_len_var+2,1] = spawn_hor_obj_path;
        obj_arr_var[obj_len_var+2,2] = local.southname;
        obj_arr_var[obj_len_var+2,3] = 1;
        obj_arr_var[obj_len_var+2,4] = local.obj;
        obj_arr_var[obj_len_var+3,1] = spawn_west_obj_path;
        obj_arr_var[obj_len_var+3,2] = local.westname;
        obj_arr_var[obj_len_var+3,3] = 1;
        obj_arr_var[obj_len_var+3,4] = local.obj;
        obj_len_var += 4;
    }
}