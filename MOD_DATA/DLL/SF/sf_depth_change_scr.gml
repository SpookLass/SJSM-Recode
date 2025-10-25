// depth_change(id) - Temporarily changes the current depth buffer to that of another surface.
//                    See the documentation for more information.
// Argument 1 (id) - The ID of the surface whose depth buffer should be changed to.
//                   Pass in -1 to switch to the screen's depth buffer.

return external_call(global.__SFIX_ChangeDepthBuffer, argument0);