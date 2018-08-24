

// variables in mm
bottomStand = 100;
backSlant = 100;
frontSlant = 60;

inlayWidth = 15;
phoneBump = 5;

standDepth = 100;
sideWidth = 5;

backAngle = 30;	// less than 90
frontAngle = 160;	// larger than 90

// ____________________________________
//
// Calculated variables
// ____________________________________


// dimensions
bottomCube = [bottomStand, standDepth, sideWidth];
backCube = [sideWidth, standDepth, backSlant];
frontCube = [sideWidth, standDepth, frontSlant];

// angles
phoneAngle = frontAngle - 180;

// translations / offsets
backOffset = [0, 0, sideWidth];

frontOffset = [sin(backAngle)*(backSlant) + cos(backAngle)*sideWidth, 
		0, cos(backAngle)*(backSlant) + sin(backAngle)*sideWidth];
		
inlayOffset = [frontOffset.x + sin(frontAngle)*frontCube.z, 
		frontOffset.y, 
		frontOffset.z + cos(frontAngle)*frontCube.z];

// ______________________________________
//
// start drawing
// ______________________________________

$fn = 60;

// base
cube(bottomCube);

translate([0, 0, sideWidth/2])
{
	rotate([-90, 0, 0])
	{
		color("blue");
		
##		cylinder(d = sideWidth, h = standDepth);
	}
}

// backside 
translate(backOffset)
{
	rotate([0, backAngle, 0])
	{
		color("green")
		{
			cube(backCube);
		}
	}
}

// front
translate(frontOffset)
{
	rotate([0, frontAngle, 0])
	{
		color("red") 
		{
			cube(frontCube);
		}
	}
}

// inlay
translate(inlayOffset)
{
	rotate([0, phoneAngle, 0])
	{
		color("blue")
		{
			cube([inlayWidth, standDepth, sideWidth]);
		}
	}
}



