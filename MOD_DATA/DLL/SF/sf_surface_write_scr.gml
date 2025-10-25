// surface_write(id, format) - Converts a surface into a string and returns it.
//                             See the documentation for more information.
// Argument 1 (id) - The ID of the surface.
// Argument 2 (format) - The data format; either df_binary or df_text.

return external_call(global.__SFIX_SurfaceToString, argument0, argument1);