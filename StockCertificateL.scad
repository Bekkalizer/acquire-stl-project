
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

// Parameters
width = 7;
height = 15;
thickness = 0.7;
extrusion = 0.3;

label = "Stock";

frame_width = 0.3;

font_name = "DIN Condensed:style=Bold";
font_size = 4;

symbol_factor = 0.3;
symbol_bottom_width = 19.5 * symbol_factor;
symbol_bottom_height = 5 * symbol_factor;
symbol_step_height = 2 * symbol_factor;
symbol_step_width = 2 * symbol_factor;
symbol_number_of_steps = 4;

symbol_margin = (width-symbol_bottom_width)/2;

// Draw the certificate main and frame;
cube([height,width,thickness]);
cube([height,frame_width,thickness + extrusion]);
cube([frame_width,width,thickness + extrusion]);
translate([height - frame_width,0,0])
    cube([frame_width,width,thickness + extrusion]);
translate([0,width - frame_width,0])
    cube([height,frame_width,thickness + extrusion]);

translate ([symbol_margin,symbol_margin,thickness]) {
    cube([symbol_bottom_height, symbol_bottom_width, extrusion]);
    
    
    for( i = [0 : symbol_number_of_steps] ) {
        echo(symbol_bottom_width - symbol_step_width*2*i);
        
        translate([symbol_step_height*i + symbol_bottom_height,symbol_step_width*i,0]) {
            cube([symbol_step_height, 
                symbol_bottom_width - symbol_step_width*2*i, 
                extrusion]);
        }
    }
}

// Etched text on top
translate([(height + symbol_margin + symbol_bottom_height + symbol_step_height * symbol_number_of_steps)/2,width/2,thickness])
    linear_extrude(height = extrusion)
        text(label, size = font_size, font = font_name, halign = "center", valign = "center");

