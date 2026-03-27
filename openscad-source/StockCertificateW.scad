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
//       Print and play - OpenScad project - by Bekkalizer and Claude
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

scale_factor = 1/3;

base_radius = 9;
base_height = 3;

dome_radius = 9.75 * scale_factor;                          // ~3.25
cylinder_height = (25 - 9.75 - 5) * scale_factor;          // ~3.42

union() {
    cylinder(h = base_height, r = base_radius);
    translate([0, 0, base_height])
        cylinder(h = cylinder_height, r = dome_radius);
    translate([0, 0, base_height + cylinder_height])
        sphere(dome_radius);
}
