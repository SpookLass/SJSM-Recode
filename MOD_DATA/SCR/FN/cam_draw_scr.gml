/*
Argument 0: Camera ID
*/
if view_current == argument0
{
    d3d_set_projection_ext
    (
        global.cam_x_var[argument0],
        global.cam_y_var[argument0],
        global.cam_z_var[argument0],
        global.cam_x_var[argument0]+global.cam_fx_var[argument0],
        global.cam_y_var[argument0]+global.cam_fy_var[argument0],
        global.cam_z_var[argument0]+global.cam_fz_var[argument0],
        global.cam_ux_var[argument0],
        global.cam_uy_var[argument0],
        global.cam_uz_var[argument0],
        global.cam_fov_var[argument0],
        view_wport[argument0]/view_hport[argument0],
        1,1280 // 800
    ); 
}