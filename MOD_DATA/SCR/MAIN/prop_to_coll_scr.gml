/*
Argument 0: Type
Argument 1: Model path
Non-model only
Argument 2: Width
Argument 3: Length
Argument 4: Height
Cylinder Only
Argument 5: Closed
Argument 6: Steps
Plane only
Argument 7: Radius
Auto converts props into collisions, only run when creating the object during bootup
*/
local.collmod = p3dc_begin_mdl_scr();
switch argument0
{
    case 0:
    {
        if file_exists(string(argument1))
        { p3dc_add_mdl_scr(argument1,x,y,z); }
        break;
    }
    case 1:
    {
        local.width = argument2/2;
        p3dc_add_block_scr
        (
            -argument7,
            -local.width-argument7,
            argument4,
            argument7,
            local.width+argument7,
            0
        );
        break;
    }
    case 7:
    case 2:
    {
        local.width = argument2/2;
        local.length = argument3/2;
        p3dc_add_block_scr
        (
            -local.width,
            -local.length,
            argument4,
            local.width,
            local.length,
            0
        );
        break;
    }
    case 3:
    {
        local.width = argument2/2;
        local.length = argument3/2;
        p3dc_add_cylinder_scr
        (
            -local.width,
            -local.length,
            argument4,
            local.width,
            local.length,
            0,
            argument5,
            argument6
        );
        break;
    }
    case 4:
    {
        local.width = argument2/2;
        local.length = argument3/2;
        p3dc_add_floor_scr
        (
            -local.width,
            -local.length,
            0,
            local.width,
            local.length,
            0
        );
        break;
    }
    case 5:
    {
        local.width = argument2/2;
        p3dc_add_cylinder_scr
        (
            -local.width,
            -local.width,
            argument4,
            local.width,
            local.width,
            0,
            true,
            argument6
        );
        break;
    }
    case 6:
    {
        local.width = argument2/2;
        p3dc_add_wall_scr
        (
            0,
            -local.width,
            argument4,
            0,
            local.width,
            0
        );
        break;
    }
    case 8:
    case 9:
    {
        p3dc_add_block_scr
        (
            -argument7,
            -argument7,
            argument4,
            argument7,
            argument7+argument2,
            0
        );
        break;
    }
}
p3dc_end_mdl_scr();
return local.collmod;