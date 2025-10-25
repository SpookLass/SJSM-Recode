// Get the path to the DLL file
local.dll = main_directory_const+"\DLL\SF\surface_fix.dll";

// Define functions
global.__SFIX_FixSurfaces               = external_define(local.dll, "FixSurfaces", dll_cdecl, ty_real, 0);
global.__SFIX_ClearDepthBuffer          = external_define(local.dll, "ClearDepthBuffer", dll_cdecl, ty_real, 0);
global.__SFIX_GetCurrentSurface         = external_define(local.dll, "GetCurrentSurface", dll_cdecl, ty_real, 0);
global.__SFIX_SurfaceToString           = external_define(local.dll, "SurfaceToString", dll_cdecl, ty_string, 2, ty_real, ty_real);
global.__SFIX_SurfaceFromString         = external_define(local.dll, "SurfaceFromString", dll_cdecl, ty_real, 2, ty_real, ty_string);
global.__SFIX_WriteSurfaceToBinaryFile  = external_define(local.dll, "WriteSurfaceToBinaryFile", dll_cdecl, ty_real, 2, ty_real, ty_real);
global.__SFIX_ReadSurfaceFromBinaryFile = external_define(local.dll, "ReadSurfaceFromBinaryFile", dll_cdecl, ty_real, 2, ty_real, ty_real);
global.__SFIX_ChangeDepthBuffer         = external_define(local.dll, "ChangeDepthBuffer", dll_cdecl, ty_real, 1, ty_real);
global.__SFIX_EnableDepthWriting        = external_define(local.dll, "EnableDepthWriting", dll_cdecl, ty_real, 1, ty_real);

// Define constants
globalvar df_binary, df_text;
df_binary = 0;
df_text = 1;

// Call the initialization function
external_call(global.__SFIX_FixSurfaces);