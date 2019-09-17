#ifdef GL_ES
#define LOWP lowp
precision mediump float;
#else
#define LOWP
#endif

varying LOWP vec4 v_color;
varying vec2 v_size;
varying vec2 v_position_relative;
varying float v_generic_radius;
varying float v_generic_intensity;

void main()
{
    vec2 light_direction = v_position_relative / (v_size / 12.0);
    float distance = length(light_direction);
    float attenuation = 1.0 / (0.4 + (3.0 * distance) + (20.0 * distance * distance * (1.0 / v_generic_intensity)));
    gl_FragColor = vec4(v_color.rgb, attenuation);
}