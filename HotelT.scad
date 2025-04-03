
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

// Parameters
bottom_width = 19.5;
bottom_height = 5;
wall_width = 1.5;
wall_height = 4;
segments = 3;
segment_height = 2;

module castle_top() {
    cube([wall_width,bottom_width,wall_height]);
    segment_width = bottom_width / (segments * 2 +1);
    translate([0,0,wall_height]) {
        for( i = [0 : segments] ) {
            translate([0,i * segment_width * 2, 0]) {
                cube([wall_width, segment_width, segment_height]);
                echo([wall_width, segment_width, segment_height]);
            }
        }
    }
}

union () {
    cube_with_extruded_bottom([bottom_width, bottom_width, bottom_height]);

    // Draw the castle-like roof
    translate([0,0,bottom_height]) {
        castle_top();
    }
    
    translate([bottom_width - wall_width,0,bottom_height]) {
        castle_top();
    }
    
    rotate([0,0,90]) {
        translate([0,-bottom_width,bottom_height]) {
            castle_top();
        }
        translate([bottom_width-wall_width,-bottom_width,bottom_height]) {
            castle_top();
        }
    }
}

