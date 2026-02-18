// Draw
draw_load_scr("Loading shaders...");
// Initialize
shader_ini_scr();
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
// Grayscale (Unbiased)
globalvar grayscale_unbias_ps;
grayscale_unbias_ps = shader_ps_create_scr
('
      ps.1.4
      def     c0,     0.33,0.33,0.33,1 // Luma weights; red and blue are perceived less brightly
      def     c1,     0,   0,   0,   0 // First component controls saturation
      texld   r0,     t0
      mul     r0,     r0,v0      // Blend first
      dp3_sat r1.rgb, r0,c0      // Get luma
      lrp     r0.rgb, c1.r,r0,r1 // Lerp between luma and colour according to c1.r
');
// Orthographic
globalvar orthographic_ps;
orthographic_ps = shader_ps_create_scr
('
      ps.1.4
      def     c0,     0,   0.5, 0.5, 1 // Luma weights; red and blue are perceived less brightly
      def     c1,     0,   0,   0,   0 // First component controls saturation
      texld   r0,     t0
      mul     r0,     r0,v0      // Blend first
      dp3_sat r1.rgb, r0,c0      // Get luma
      lrp     r0.rgb, c1.r,r0,r1 // Lerp between luma and colour according to c1.r
');
// Tint
globalvar tint_ps;
tint_ps = shader_ps_create_scr
('
      ps.1.4
      def     c0,     0.3, 0.6, 0.1, 1
      def     c1,     1,   0,   0,   1
      texld   r0,     t0
      dp3_sat r0.rgb, r0,c0
      mul     r0,     r0,c1
      mul     r0,     r0,v0
');
// Draw
draw_load_scr("Loaded shaders!");