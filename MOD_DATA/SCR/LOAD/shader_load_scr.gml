// Draw
draw_clear_alpha(c_black,0);
draw_text_transformed(view_wview[view_current]/2,view_hview[view_current]*0.9,"Loading shaders...",1,1,0);
screen_refresh();
// Initialize
shader_ini_scr();
// Normal (for resetting)
globalvar normal_ps;
normal_ps = shader_ps_create_scr
('
      ps.1.4
      texld r0, t0      // Load texture associated with stage 0, at coordinates t0
      mul   r0, r0,v0   // Multiply texture by vertex values
');
// Grayscale
globalvar grayscale_ps;
grayscale_ps = shader_ps_create_scr
('
      ps.1.4
      def     c0,     0.3, 0.6, 0.1, 1 // Luma weights; red and blue are perceived less brightly
      def     c1,     0,   0,   0,   0 // First component controls saturation
      texld   r0,     t0
      mul     r0,     r0,v0      // Blend first
      dp3_sat r1.rgb, r0,c0      // Get luma
      lrp     r0.rgb, c1.r,r0,r1 // Lerp between luma and colour according to c1.r
');
// Draw
draw_clear_alpha(c_black,0);
draw_text_transformed(view_wview[view_current]/2,view_hview[view_current]*0.9,"Loaded shaders!",1,1,0);
screen_refresh();