
$fn=100; 
hp = 4;

EURORACK_H = 128.5;
EURORACK_W = 5.08;
THICKNESS = 2; // thickness

w = hp * EURORACK_W;


module main(){
    cube([w, EURORACK_H, THICKNESS]);
    translate([11, 1.4,-0.4]) cube([w-11, 3.2, 0.4]);
    translate([11, EURORACK_H-4.6,-0.4]) cube([w-11, 3.2, 0.4]);
    
    // rib
    rib_height = 6;
    rib_margin = 13;
    rib_thickness = 4;

    translate([2, rib_margin,-rib_height]) cube([rib_thickness, EURORACK_H-rib_margin*2, rib_height]);
    // --
}


module logo(x, y, z){
    // label
    translate([x, y, z]) {
        rotate([0, 0, 90]) {
            linear_extrude(height=4) {
                text("benjiaomodular",
                     font="Liberation Sans",
                     size=6);
            }
        }
    }
}

module blank_panel(){
    difference() {
        main();
        
        union(){
            // mounting holes
            translate([7.5, 3, 0]) cylinder(r=1.6, h=10, center=true);
            translate([7.5, EURORACK_H-3, 0]) cylinder(r=1.6, h=10, center=true);
            logo(13, 16, 1.4);
            
        }
    }
}
translate([w, 0, 2]) rotate([0, 180, 0]) blank_panel();
