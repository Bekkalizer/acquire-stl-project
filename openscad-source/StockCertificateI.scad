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
crown_body_bottom_radius = 8;
crown_body_top_radius = 9;
crown_body_height = 3;
crown_sphere_radius = 3;

cage_width = 2;
cage_height = 1;


union () {
    //crown_body
    difference () {
        cylinder(crown_body_height, crown_body_bottom_radius, crown_body_top_radius);
        translate([cage_width/2, cage_width/2, crown_body_height-cage_height])
            cube([crown_body_top_radius,crown_body_top_radius,cage_height]);
        translate([-cage_width/2-crown_body_top_radius, cage_width/2, crown_body_height-cage_height])
            cube([crown_body_top_radius,crown_body_top_radius,cage_height]);
        translate([-cage_width/2-crown_body_top_radius, -cage_width/2-crown_body_top_radius, crown_body_height-cage_height])
            cube([crown_body_top_radius,crown_body_top_radius,cage_height]);
        translate([cage_width/2, -cage_width/2-crown_body_top_radius, crown_body_height-cage_height])
            cube([crown_body_top_radius,crown_body_top_radius,cage_height]);
    }
    
    translate([0,0,crown_body_height+crown_sphere_radius-cage_height])
        sphere(crown_sphere_radius);
}
