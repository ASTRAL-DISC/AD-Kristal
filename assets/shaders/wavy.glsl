void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // isotropic scaling, ensuring entire texture fits into the view.
    float minRes = min (iResolution.x, iResolution.y);

    bool bShowHowItIsDone = (iMouse.z > 0.5);
    if (bShowHowItIsDone) {
	    // divide by 2, since we'll render 4 viewport for demonstration purposes.
    	minRes /= 2.; 
    }
    
    // do the scaling.
    // After this, you should consider fragCoord = 0..1, usually,
    // aside from overflow for wide-screen.
    fragCoord /= minRes;

    
    // the value for the sine has 2 inputs:
    // 1. the time, so that it animates.
    // 2. the y-row, so that ALL scanlines do not distort equally.
    float time = iTime*speed;
    float xAngle = time + fragCoord.y * ySineCycles;
    float yAngle = time + fragCoord.x * xSineCycles;
    
    bool bxHalf, byHalf;
    if (bShowHowItIsDone) {
        // split the screen up in 4 even sections for demonstration purposes.
        vec2 screenSize = vec2(iResolution / minRes);
        bxHalf = (fragCoord.x < screenSize.x / 2.);
        byHalf = (fragCoord.y > screenSize.y / 2.);

        // cancel the effect for demonstration purposes.
        if (bxHalf) { xAngle = 0.; }
        if (byHalf) { yAngle = 0.; }
    }
    
    vec2 distortOffset = 
        vec2(sin(xAngle), sin(yAngle)) * // amount of shearing
        vec2(xDistMag,yDistMag); // magnitude adjustment
    
    // shear the coordinates
    fragCoord += distortOffset;    
    
    // grab the color
    // variable texture for demonstration purposes.    
    bool bTexture0 = (bShowHowItIsDone && (bxHalf || byHalf));
    if (bTexture0) {
		fragColor = texture(iChannel0, fragCoord);
    } else {
        fragColor = texture(iChannel1, fragCoord);
    }
    
    // blue shift to look like water
    fragColor.rgb = vec3(0.0, 0.2, 0.9) + 
        fragColor.rgb * vec3(0.5, 0.6, 0.1);

}