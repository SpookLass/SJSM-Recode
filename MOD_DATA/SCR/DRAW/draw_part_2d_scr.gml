/*
Argument 0: Particle system
Argument 1: Original width
Argument 2: Original height
*/
if view_wview[view_current] < view_hview[view_current]
{
    local.height = argument2;
    local.width = view_wview[view_current]*local.height/view_hview[view_current];
}
else
{
    local.width = argument1;
    local.height = view_hview[view_current]*local.width/view_wview[view_current];
}
d3d_set_fog(false,c_black,0,0);
d3d_set_projection_ortho(0,0,local.width,local.height,0);
d3d_set_hidden(false);
part_system_drawit(argument0);
d3d_set_hidden(true);