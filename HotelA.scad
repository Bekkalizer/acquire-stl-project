
//    $$$$$$\   $$$$$$\   $$$$$$\  $$\   $$\ $$$$$$\ $$$$$$$\  $$$$$$$$\ 
//    $$  __$$\ $$  __$$\ $$  __$$\ $$ |  $$ |\_$$  _|$$  __$$\ $$  _____|
//    $$ /  $$ |$$ /  \__|$$ /  $$ |$$ |  $$ |  $$ |  $$ |  $$ |$$ |      
//    $$$$$$$$ |$$ |      $$ |  $$ |$$ |  $$ |  $$ |  $$$$$$$  |$$$$$\    
//    $$  __$$ |$$ |      $$ |  $$ |$$ |  $$ |  $$ |  $$  __$$< $$  __|   
//    $$ |  $$ |$$ |  $$\ $$ $$\$$ |$$ |  $$ |  $$ |  $$ |  $$ |$$ |      
//    $$ |  $$ |\$$$$$$  |\$$$$$$ / \$$$$$$  |$$$$$$\ $$ |  $$ |$$$$$$$$\ 
//    \__|  \__| \______/  \___$$$\  \______/ \______|\__|  \__|\________|
//                            \___|                                      
//      
//       Print and play - OpenScad project - by Bekkalizer and ChatGPT

use <CommonModules.scad>

//Parameters
star_height = 1;
star_radius = 9;
star_inner_radius = 4;

bottom_width = 19.5;
bottom_height = 20;

module star(p=5, r1=4, r2=10) {
  s = [for(i=[0:p*2-1]) 
    [
      (i % 2 == 0 ? r1 : r2)*cos(180*i/p),
      (i % 2 == 0 ? r1 : r2)*sin(180*i/p)
    ]
  ];
  polygon(s);
}

union () {
    cube_with_extruded_bottom([bottom_width, bottom_width, bottom_height]);

    translate([bottom_width/2,bottom_width/2,bottom_height])
        linear_extrude(star_height)
            star(p = 5, r1 = star_inner_radius, r2 = star_radius);
}

