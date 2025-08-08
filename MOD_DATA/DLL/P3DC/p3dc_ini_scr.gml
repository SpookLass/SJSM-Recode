local.p3dc_dll = main_directory_const+"\DLL\P3DC\p3dc.dll";

//**Model Creation
global.p3dc_bdm = external_define(local.p3dc_dll,"bdm",dll_cdecl,ty_real,0);
global.p3dc_edm = external_define(local.p3dc_dll,"edm",dll_cdecl,ty_real,0);
global.p3dc_apm = external_define(local.p3dc_dll,"apm",dll_cdecl,ty_real,4,ty_string,ty_real,ty_real,ty_real);
global.p3dc_stm = external_define(local.p3dc_dll,"stm",dll_cdecl,ty_real,1,ty_real);
global.p3dc_brm = external_define(local.p3dc_dll,"brm",dll_cdecl,ty_real,1,ty_real);
global.p3dc_erm = external_define(local.p3dc_dll,"erm",dll_cdecl,ty_real,0);
global.p3dc_bs3 = external_define(local.p3dc_dll,"bs3",dll_cdecl,ty_real,6,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.p3dc_mat = external_define(local.p3dc_dll,"mat_exported",dll_cdecl,ty_real,9,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.p3dc_apw = external_define(local.p3dc_dll,"apw",dll_cdecl,ty_real,6,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.p3dc_apf = external_define(local.p3dc_dll,"apf",dll_cdecl,ty_real,6,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.p3dc_apb = external_define(local.p3dc_dll,"apb",dll_cdecl,ty_real,6,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.p3dc_apc = external_define(local.p3dc_dll,"apc",dll_cdecl,ty_real,8,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.p3dc_apo = external_define(local.p3dc_dll,"apo",dll_cdecl,ty_real,8,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);

//Overwrite
global.p3dc_obd = external_define(local.p3dc_dll,"obd",dll_cdecl,ty_real,2,ty_real,ty_real);
global.p3dc_oed = external_define(local.p3dc_dll,"oed",dll_cdecl,ty_real,0);
global.p3dc_opt = external_define(local.p3dc_dll,"opt",dll_cdecl,ty_real,9,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.p3dc_opw = external_define(local.p3dc_dll,"opw",dll_cdecl,ty_real,6,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.p3dc_opf = external_define(local.p3dc_dll,"opf",dll_cdecl,ty_real,6,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.p3dc_opb = external_define(local.p3dc_dll,"opb",dll_cdecl,ty_real,6,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.p3dc_opc = external_define(local.p3dc_dll,"opc",dll_cdecl,ty_real,8,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.p3dc_opo = external_define(local.p3dc_dll,"opo",dll_cdecl,ty_real,8,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);

//**Return Values
global.p3dc_gmn = external_define(local.p3dc_dll,"gmn",dll_cdecl,ty_real,0);
global.p3dc_gmt = external_define(local.p3dc_dll,"gmt",dll_cdecl,ty_real,1,ty_real);
global.p3dc_gms = external_define(local.p3dc_dll,"gms",dll_cdecl,ty_real,2,ty_real,ty_real);
global.p3dc_gtr = external_define(local.p3dc_dll,"gtr",dll_cdecl,ty_real,1,ty_real);
global.p3dc_gtm = external_define(local.p3dc_dll,"gtm",dll_cdecl,ty_real,0);

//**Collision Detection
global.p3dc_mcs = external_define(local.p3dc_dll,"mcs",dll_cdecl,ty_real,8,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.p3dc_mcr = external_define(local.p3dc_dll,"mcr",dll_cdecl,ty_real,11,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.p3dc_mc3 = external_define(local.p3dc_dll,"mc3",dll_cdecl,ty_real,4,ty_real,ty_real,ty_real,ty_real);
global.p3dc_mrs = external_define(local.p3dc_dll,"mrs",dll_cdecl,ty_real,10,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.p3dc_mrf = external_define(local.p3dc_dll,"mrf",dll_cdecl,ty_real,7,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.p3dc_mr3 = external_define(local.p3dc_dll,"mr3",dll_cdecl,ty_real,6,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.p3dc_mrr = external_define(local.p3dc_dll,"mrr",dll_cdecl,ty_real,10,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.p3dc_smr = external_define(local.p3dc_dll,"smr",dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);