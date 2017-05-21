// This is a batch generator for Windows, allowing automatic file generation, these files being stl, obj, png, dxf or echo (the last one for specifications, BOM, lists, etc.)
//Author : Pierre ROUZEAU, License: GPL2 or above
//It shall be called from a  windows batch, conventionally named '_batch_create.bat'
 //You can generate as many batches as you want by modifying the batch selector below
 
if (batchnum==1) batch(part_set); // directory is default (STL)
else if (batchnum==2) batch(dxf_set,"DXF");  
else if (batchnum==3) batch(text_set,"TEXTS");    
else if (batchnum==4) batch(images_set,"PNG"); 
else if (batchnum==5) batch(part_set, "DATA1", dataset="ds1");   "

//batch () 1rst Parameter is a vector of vectors (see below), 2nd is directory, third is project prefix, 4rth is scad file, 5th is dataset - remember that in openscad you can define parameters in any order if you designate them by name e.g. 'batch (part1set,dataset="ds1");'.

//== What shall be in each called '.scad' file =========
//Part names shall not have whitespace or file forbidden characters in them. File extension is compulsory
//The first number is the 'part' number. Name is optional for stl files only 
// The part sets below are just examples
part_set = [
  [1,"switch_arm.stl"],[2,"central_frame.stl"],[3,"swing_cover.stl"],[4,"motor_frame.stl"], [0,"ensemble.png"]
];
dxf_set =  [
  [21,"panel1.dxf"],[2,"panel2.dxf"],[3,"panel3.stl"]
];
text_set = [
  [31,"specification.echo"],[32,"BOM.echo"]
];
images_set = [
  [1,"switch_arm.png"],[2,"central_frame.png"],[3,"swing_cover.png"]
];

part=0; // this will be recorded with parameter set, so this shall be removed manually from each called set.

//you shall have a part selector like 
if (part==1) create_part1();
else if (part==2) create_part2(); 
else if (part==3) create_part3();   
else if (part==21) projection() create_panel1();   
else if (part==22) projection() create_panel2();     
else if (part==23) projection() create_panel3(); 
else if (part==31) text_specification();  // use 'echo' 
else if (part==32) text_BOM(); // use 'echo'    
else ensemble(); // it is useful to display ensemble if there is no part defined 

//You shall note that there is a bug (as for May 2017) if you use customizer, a parameter explicitely defined (with -D option) cannot supersede the value defined in a customizer set. So for this routine to work with customizer set, you shall remove the 'part' value in each recorded dataset in the '.json' project file, each time you record a set. 

//You can create texts with 'echo()' module. Note that having the echo command text in the files is unavoidable, so you may want to create a unique long string for your text, using newlines for separation. See the output of this generator !

module ensemble () {  }
module create_part1 () {  }
module create_part2 () {  }
//......

//== end of example of what shall be in your Scad ======

//-- parameters to adjust for your project -------------
OpenSCAD_dir = "c:\"/Program Files/OpenSCAD/openscad.exe\"";
thisScad = "my_project.scad"; // file name including extension '.scad'
thisProject = "My_Project"; //File name prefix, no space, only valid file characters - can be empty
thisDataset = "";
//thisDataset = "dataset"; // if using a customizer dataset - A json file can contain multiple datasets
//-- End of adjustable parameters ---------------------

thisJSON = str(_join([for (i=[0:len(thisScad)-5]) thisScad[i]],
     len(thisScad)-5,""),"json");

module batch(set, directory="STL", prefix=thisProject, scadfile = thisScad, dataset = thisDataset) {
  bt1 = str("\nstart /w ",OpenSCAD_dir," -o ",(directory)?str(directory,"/"):"",prefix,"_",(dataset)?str(dataset,"_"):"");
  function line (val) = 
    str(bt1,(val[0]<10)?"0":"",val[0],"_",(val[1])?val[1]:".stl",
    (dataset)? str(" --enable=customizer -p ",thisJSON," -P ",dataset," "):"", 
    " -D part=",val[0]," ",  
  (val[2])?val[2]:scadfile,"\necho: "); 
  
   for (i=[0:len(set)-1])
     echo (line(set[i]));
   echo("\ncmd\necho: "); // to maintain command window open (to have a look on messages)
}
// function extracted from relativity/string library by davidson16807
function _join(strings, idx, sep) = 
	idx==0 ? strings[idx]:
  str(_join(strings, idx-1, sep), sep, strings[idx]);
