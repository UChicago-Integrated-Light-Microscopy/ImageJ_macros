//GreyscaleTopHat by G. Landini at bham. ac. uk
//detects light spots on a dark background
//the complementary operation is "Well"
//Modified to work on hyperstacks by C. Labno 
//University of Chicago

setBatchMode(true);
a = getNumber("Spot radius:", 1);

t=getTitle();

 for (n=1; n<=nSlices; n++) {
          setSlice(n);
          
i=getInfo("slice.label");

run("Duplicate...", "title=Open");


// for round particles
run("Minimum...", "radius="+a);
run("Maximum...", "radius="+a);

// for non-round particles this may give better results
// run("GreyscaleErode ", "iterations="+a+" white");
// run("GreyscaleDilate ", "iterations="+a+" white");

setBatchMode("show");
run("Image Calculator...", "image1=t operation=Subtract image2=Open");
selectWindow("Open");
run("Close");
selectWindow(t);
 }
 
rename(t+"_TopHat");

