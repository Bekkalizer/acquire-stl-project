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
// 
// This file is part of the Acquire stl project.
// Copyright (C) 2025 Bekkalizer
//
// Acquire stl project is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published
// by the Free Software Foundation, either version 3 of the License,
// or (at your option) any later version.
//
// Acquire stl project is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program. If not, see <https://www.gnu.org/licenses/>.

use <CommonModules.scad>

// ============== Parameters ==============
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

