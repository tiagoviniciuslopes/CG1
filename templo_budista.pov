#include "colors.inc"  
#include "textures"
   
camera{
    location <0,0,-60>
    //location <50,0,0>
    //location <-50,0,0>
    //location <0,200,90>
    //location <0,0,150>
    look_at <0,0,0>
}   
   
light_source{
    <50,50,-100>
    White
}
sky_sphere{
    pigment{
        gradient y
        color_map{
            [0 color White]
            [1 color Blue]    
        }
        translate <0,-.5,0>
    }
}
#declare Roof_Texture= //-------------
// layered textures
texture{
  pigment{color rgb<.55,.09,.09>*1.3}
  normal {gradient z scallop_wave
                     scale<1,1,0.15>}
  finish { diffuse 0.9}
} // end of texture 1 ----------------   

// CSG union, add all of shapes 1...N
union {
    /*
    Piso entre andares
    */ 
    box{
        <22,1,0>, <-22,-1,-7>  
        pigment {White}
        finish { ambient .4 }
    }
    box{
        <15,1,0>, <22,-1,50>  
        pigment {White}
        finish { ambient .4 }
    }
    box{
        <-22,1,0>, <-15,-1,50>  
        pigment {White}
        finish { ambient .4 }
    }
    box{
        <22,1,50>, <-22,-1,57>  
        pigment {White}
        finish { ambient .4 }
    } 
    
    /*
    Paredes
    */
    box{
        <-15,-10,0>,<15,10,50> 
        finish { ambient .4 } 
        pigment {White}
    }
    
    
    /*
    Barras Vermelhas - frente
    */               
    box{
        <-22,-10,-5.5>,<-21,10,-7>
        pigment {Red}
    }
    box{
        <-13.2,-10,-5.5>,<-12.2,10,-7>
        pigment {Red}
    }
    box{
        <-4.4,-10,-5.5>,<-3.4,10,-7>
        pigment {Red}
    }
    box{
        <4.4,-10,-5.5>,<5.4,10,-7>
        pigment {Red}
    }
    box{
        <13.2,-10,-5.5>,<12.2,10,-7>
        pigment {Red}
    }
    box{
        <22,-10,-5.5>,<21,10,-7>
        pigment {Red}
    }
    
    /*
    Barras Vermelhas - trás
    */               
    box{
        <-22,-10,55.5>,<-21,10,57>
        pigment {Red}
    }
    box{
        <-13.2,-10,55.5>,<-12.2,10,57>
        pigment {Red}
    }
    box{
        <-4.4,-10,55.5>,<-3.4,10,57>
        pigment {Red}
    }
    box{
        <4.4,-10,55.5>,<5.4,10,57>
        pigment {Red}
    }
    box{
        <13.2,-10,55.5>,<12.2,10,57>
        pigment {Red}
    }
    box{
        <22,-10,55.5>,<21,10,57>
        pigment {Red}
    }
     
    /*
    Barras Vermelhas - lado -x
    */               
    box{
        <-22,-10,1.92>,<-21,10,3.42>
        pigment {Red}
    }
    box{
        <-22,-10,10.84>,<-21,10,12.34>
        pigment {Red}
    }
    box{
        <-22,-10,19.76>,<-21,10,21.26>
        pigment {Red}
    }
    box{
        <-22,-10,28.68>,<-21,10,30.18>
        pigment {Red}
    }
    box{
        <-22,-10,37.6>,<-21,10,39.1>
        pigment {Red}
    }
    box{
        <-22,-10,46.52>,<-21,10,48.02>
        pigment {Red}
    }
    
    /*
    Barras Vermelhas - lado +x
    */               
    box{
        <22,-10,1.92>,<21,10,3.42>
        pigment {Red}
    }
    box{
        <22,-10,10.84>,<21,10,12.34>
        pigment {Red}
    }
    box{
        <22,-10,19.76>,<21,10,21.26>
        pigment {Red}
    }
    box{
        <22,-10,28.68>,<21,10,30.18>
        pigment {Red}
    }
    box{
        <22,-10,37.6>,<21,10,39.1>
        pigment {Red}
    }
    box{
        <22,-10,46.52>,<21,10,48.02>
        pigment {Red}
    }  
    
    /*
    Telhado
    */
    /*prism {
        conic_sweep
        linear_spline
        10, // height 1
        20, // height 2
        6, // the number of points making up the shape...
        <-15,0>,<15,0>,<15,50>,<-15,50>, <-15,0>
        rotate <180, 0, 180>
        translate <0, 0, 0>
        //scale <0.08, -0.05, 1.8>  
        pigment { Brown}
    }  */
    
    prism {
        
        0, // height 1
        17, // height 2
        4, // the number of points making up the shape...
        <-22,0>,<22,0>,<0,15>,<-22,0>
        rotate <-90, 0, >
        translate <0, 9, 2>
        scale <0, 0, -4>      
        texture{ 
            Roof_Texture
            translate<-0.05,0,0>
        }
    }
    
    triangle {
        <-21,9.11,-8.3>,<21,9.11,-8.3>,<0,23.5,-8.3>
        pigment{White}
        finish { ambient .4 } 
    }
    
    triangle {
        <-21,9.11,60.3>,<21,9.11,60.3>,<0,23.5,60.3>
        pigment{White}
        finish { ambient .4 } 
    }
     
}






