#include "colors.inc"  
#include "textures"
#include "woods.inc"
   
camera{
    location <0,0,-60>
    //location <60,0,-60>
    //location <80,0,20>
    //location <80,0,20>
    //location <0,200,90>
    //location <0,0,150>
    //look_at <0,0,20>
    look_at <0,0,0>
}   
   
light_source{
    <0,100,-100>
    //<-50,50,100>
    //<100,0,20>
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
    Cerca - frente 
    */  
    #for(C,-21,20,8.6) 
        difference{
        
            box {
                <C,1,-5.5>,<C+7.6,4,-7>
                pigment {White}
                finish { ambient .4 } 
            }  
            
            box{
                <C-1,1,-4.5>,<C+8.6,1.25,-8>
                pigment {White}
                finish { ambient .4 }             
            
            }
            
            box{
                <C-1,1.5,-4.5>,<C+8.6,1.75,-8>
                pigment {White}
                finish { ambient .4 }             
            
            }
            box{
                <C-1,3.5,-4.5>,<C+8.6,3.75,-8>
                pigment {White}
                finish { ambient .4 }             
            
            }
        
        }
        box{
           <C+3.5,1,-5.5><C+4.4,4.5,-7>
           pigment {White}
           finish { ambient .4 } 
        }
        box{
           <C+0.5,1,-5.5><C+1.4,4.5,-7>
           pigment {White}
           finish { ambient .4 } 
        }
        box{
           <C+6.5,1,-5.5><C+7.4,4.5,-7>
           pigment {White}
           finish { ambient .4 } 
        }
        prism{
            4,
            5.5,
            4,
            <C+3.5,-7>,<C+4.4,-7>,<C+3.95,-5.5>,<C+3.5,-7>
            pigment{White}
            finish { ambient .4 }
            rotate<-90,0,0>
            translate<-3,11.5,-1.5>
        }
        prism{
            4,
            5.5,
            4,
            <C+0.5,-7>,<C+1.4,-7>,<C+0.95,-5.5>,<C+0.5,-7>
            pigment{White}
            finish { ambient .4 }
            rotate<-90,0,0>
            translate<3,11.5,-1.5>
        }
        prism{
            4,
            5.5,
            4,
            <C+6.5,-7>,<C+7.4,-7>,<C+6.95,-5.5>,<C+6.5,-7>
            pigment{White}
            finish { ambient .4 }
            rotate<-90,0,0>
            translate<0,11.5,-1.5>
        }
     #end
     
    
     
}






