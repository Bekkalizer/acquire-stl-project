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
//       Print and play - OpenScad project - by Bekkalizer - GPLv3
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
$fn = 30;

scale_factor = 3/4;

tent_radius = 9.75 * scale_factor;           // ~3.25
tent_wall_height = 5 * scale_factor;         // ~1.67
tent_height = 15 * scale_factor;             // 5

union() {
    cylinder(h = tent_wall_height, r = tent_radius);
    translate([0, 0, tent_wall_height])
        cylinder(h = tent_height - tent_wall_height, r1 = tent_radius, r2 = 0);
}
