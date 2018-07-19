


// variables all in mm
screwDiam = 3;
spacerHeight = 40;
wall = 3;

// calculated vars
outerCube = [screwDiam + wall*2 + wall*2, 	
			screwDiam + wall*2 + wall*2, 		
			spacerHeight];					
				
innerCube = [outerCube.x, 			
			outerCube.y, 			
			spacerHeight - wall*2];		

// smooth cylinder		
$fn=60;	

// start code
translate([0, 0, (outerCube.y+wall)/2])
{
	rotate([270, 00, 0])
	{
		difference()
		{

			translate([-outerCube.x, -outerCube.y + wall]/2)
			{
				cube(outerCube);
			}

			translate([-innerCube.x/2, -innerCube.y/2 - wall/2, wall])
			{
				cube(innerCube);
			}

			cylinder(d = screwDiam + 0.5, h = spacerHeight);

		}
	}
}