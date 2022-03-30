//GreyscaleTopHat by G. Landini at bham. ac. uk
//detects light spots on a dark background
//the complementary operation is "Well"
//Modified to work on hyperstacks by C. Labno 
//University of Chicago

setBatchMode(false);
a = getNumber("Spot radius:", 1);

t=getTitle();
getDimensions(w, h, channels, slices, frames);

 for (n=1; n<=nSlices; n++) {
          setSlice(n);
          
i=getInfo("slice.label");

run("Duplicate...", "title=TopHat");
run("Duplicate...", "title=Open");


// for round particles
run("Minimum...", "radius="+a);
run("Maximum...", "radius="+a);

// for non-round particles this may give better results
// run("GreyscaleErode ", "iterations="+a+" white");
// run("GreyscaleDilate ", "iterations="+a+" white");

run("Image Calculator...", "image1=TopHat operation=Subtract image2=Open");
selectWindow("Open");
run("Close");
selectWindow("TopHat");
rename(i);
selectWindow(t);
 }
 
run("Images to Stack");
rename(t+"_TopHat");
run("Stack to Hyperstack...", "order=xyczt(default) channels=1 slices=slices frames=frames display=Color");
