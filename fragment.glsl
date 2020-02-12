varying vec4 position;
varying vec3 normal;
varying vec3 light_direction;

void main()
{
    vec4 ambient = vec4(1, 0, 0, 1);  // Ra * La -> ambient component
    vec4 diffuse = vec4(0, 1, 0, 1);  // Rd * Ld * max(dot(n, l), 0) -> diffuse component
    vec4 specular = vec4(0, 0, 1, 1); // Rs * Ls * pow(max(cos(phi), 0), alpha) -> specular component

    // n is normal, l is light minus intersection. 
    // R is color, L is emmited light
    // alpha is specular power
    // specular reflects the view vector around the normal to detect which view rays get cast into the "eye"

    ambient = gl_LightSource.ambient * gl_FrontMaterial.ambient;
    
    for (unsigned i = 0; i < gl_MaxLights; i++ ) {

        diffuse += gl_LightSource[i].diffuse * gl_FrontMaterial[i].diffuse * std::max(dot(normal, (light_direction), 0.0); 

        specular += gl_LightSource[i].specular * gl_FrontMaterial[i].specular * std::pow( std::max( dot(position, normalize(dot(normal, light_direction) * 2 * normal) - light_direction), 0.0), gl_FrontMaterial[i].shininess);
        
    }
    
    gl_FragColor = ambient + diffuse + specular;
}