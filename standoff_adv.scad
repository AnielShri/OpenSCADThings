


// variables all in mm
screwDiam = 3;
spacerHeight = 40;

vShell = 3; // vertical shell
hShell = 4; // horizontal shell

insetDiam = 7; // diameter of screw head
inset = 1;


// calculated vars
outerCube = [screwDiam + vShell + insetDiam*2,
			screwDiam + vShell + insetDiam*2,		
			spacerHeight];					
				
innerCube = [outerCube.x, 			
			outerCube.y, 			
			spacerHeight - hShell*2];	

// smooth cylinder		
$fn=60;	

// start code
translate([0, 0, (outerCube.y+vShell)/2])
{
	rotate([270, 00, 0])
	{
		difference()
		{

			translate([-outerCube.x, -outerCube.y + vShell, 0]/2)
			{
				cube(outerCube);
			}

			translate([-innerCube.x/2, -(innerCube.y + vShell)/2, hShell])
			{
				cube(innerCube);
			}

			cylinder(d = screwDiam + 0.5, h = spacerHeight);
			
			//insets
			cylinder(d = insetDiam, h = inset);
			
			translate([0, 0, hShell  - inset])
			{
				cylinder(d = insetDiam, h = inset);
			}
			
			translate([0, 0, outerCube.z - hShell])
			{
				cylinder(d = insetDiam, h = inset);
			}
			
			translate([0, 0, outerCube.z - inset])
			{
				cylinder(d = insetDiam, h = inset);
			}			

		}
	}
}
