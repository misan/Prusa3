// modified by misan
// round corners and 16mm attachment

// PRUSA iteration3
// Compact extruder
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org


module corner() {
  difference() {
	cube([8,8,26]);
	translate([8,8,0]) cylinder(h=26,r=8);
	}
}

//%translate([-24,0,0]) corner();

module extruder_base(){
 // Main body
 translate([-1,-2,0-2]) cube([22,56,24+2]);
 // Extruder plate mount
 translate([-16,49,0-2]) cube([55,5+5,24+2]);
 // Carriage mount cylinders
 translate([11,25,0-2]){
  translate([-12,24,0]) cylinder(r=5, h=24+2);
  translate([12,24,0]) cylinder(r=5, h=24+2);
 }
}

module extruder_holes(){
 translate([11,25,0-2]){ // Translate to center of the main block
  // Main shaft opening
  translate([0,0,-1]) cylinder(r=8.5, h=26+2);
  // Lower motor mount hole
  translate([0,21,-1]) cylinder(r=2, h=22+2);
  // Upper motor mount hole
  translate([0,-21,-1]) cylinder(r=2, h=22+2);
  // Lower motor mount hole screw head
  translate([0,21,3]) cylinder(r=3.5, h=22+2);
  // Upper motor mount hole screw head
  translate([0,-21,3]) cylinder(r=3.5, h=22+2);
  // Carriage mount right screw head hole
  translate([-12,24,-3]) cylinder(r=3.5, h=23+2);
  // Carriage mount left screw head hole
  translate([12,24,-3]) cylinder(r=3.5, h=23+2);
  // Carriage mount right screw hole
  translate([-12,24,20.5]) cylinder(r=2, h=23+2);
  // Carriage mount left screw head hole
  translate([12,24,20.5]) cylinder(r=2, h=23+2);
  // Idler bearing cutout
  translate([11,0,-4.5+10]) cylinder(r=11, h=20+2);
 }
 // Filament path
 translate([1.5+11+3.5,65,11]) rotate([90,0,0]) cylinder(r=2, h=70);
// hot-end 16mm
 translate([1.5+11+3.5,65,11]) rotate([90,0,0]) cylinder(r=8.5, h=12.5);
 // Hole for drive gear check
 translate([1.5+11+3.5-30,25,11]) rotate([90,0,90]) cylinder(r=4, h=70, $fn=20);
 // Left extruder plate mounting hole
 translate([1.5+11+3.5+15,65,11]) rotate([90,0,0]) cylinder(r=2, h=70);
 // Right extruder plate mounting hole
 translate([1.5+11+3.5-25,65,11]) rotate([90,0,0]) cylinder(r=2, h=70);
  // Idler mounting holse
  translate([11,25,10]){
   // Nut traps
   translate([-30,15,-5]) rotate([0,90,0]) rotate([0,0,30]) cylinder(r=3.1, h=30, $fn=6);
   translate([-30,-15,-5]) rotate([0,90,0]) rotate([0,0,30]) cylinder(r=3.1, h=30, $fn=6);
   translate([-30,15,5]) rotate([0,90,0]) rotate([0,0,30]) cylinder(r=3.1, h=30, $fn=6);
   translate([-30,-15,5]) rotate([0,90,0]) rotate([0,0,30]) cylinder(r=3.1, h=30, $fn=6);
   // Screws
   translate([-30,15,-5]) rotate([0,90,0]) cylinder(r=2.2, h=70);
   translate([-30,-15,-5]) rotate([0,90,0]) cylinder(r=2.2, h=70);
   translate([-30,15,5]) rotate([0,90,0]) cylinder(r=2.2, h=70);
   translate([-30,-15,5]) rotate([0,90,0]) cylinder(r=2.2, h=70);
	}
}

module extruder_idler_base(){
 translate([0.25,5,0]) cube([19.5,40,8+3]);
}

module extruder_idler_holes(){
 translate([10,25,0]){
  // Main cutout
  cube([10,23,25], center= true);
  // Idler shaft
  translate([-12,0,4.1+2])rotate([0,90,0])cylinder(r=4.1, h=24);
  // Screw holes
  translate([5,15,-1])cylinder(r=2.2, h=24);
  translate([5,-15,-1])cylinder(r=2.2, h=24);
  translate([-5,15,-1])cylinder(r=2.2, h=24);
  translate([-5,-15,-1])cylinder(r=2.2, h=24);
 }
}


// Idler final part
module idler(){
 difference(){
  extruder_idler_base();
  extruder_idler_holes();
 }
}

 idler();

// Extruder final part
module extruder(){
 translate([-23,2,0])difference(){
  extruder_base();
  extruder_holes();
	// round corner up-right
	translate([-1,-2,-2]) corner();
	// round corner down-right
	translate([-1-15,-2+51,-2]) corner();
	// round corner down-left
	translate([-1+40,-2.1+51,-2]) rotate([0,0,90]) corner();
 }
}

translate([0,0,2]) extruder();
