#include "colors.inc"  
#include "textures"
   
camera{
    //location <0,0,-60>
    //location <80,0,40>
    location <-80,0,20>
    //location <0,200,90>
    //location <0,0,150>
    look_at <0,0,40>
}   
   
light_source{
    <-50,50,-100>
    //<-50,50,100>
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
    difference{
        box{
            <-15,-10,0>,<15,10,50> 
            finish { ambient .4 } 
            pigment {White}
        }
        box{
            <-14.9,-9.9,0.1>,<14.9,9.9,49.9> 
            finish { ambient .4 } 
            pigment {Black}
        }                        
        
        //buraco da janela - frente
        #for(B, -11.4, 5.8, 8.6)
            box{
                <B,1.2,0>,<B+5.6,6,-0.5>
                texture{ pigment{ color Black}
                   finish { ambient 0.9 phong 0.5}
                } // end of texture
            }
            sphere{ 0, 1 scale<2.8,1.75,0>
                translate <(B+(B+5.6))/2,6>
                pigment{ color Black transmit 0.5}
            }
        #end     
        #for(B, -11.4, 5.8, 8.6)
            box{
                <B,-9.8,0>,<B+5.6,-4,-0.5>
                texture{ pigment{ color Black}
                   finish { ambient 0.9 phong 0.5}
                } // end of texture
            }
            sphere{ 0, 1 scale<2.8,1.75,0>
                translate <(B+(B+5.6))/2,-4>
                pigment{ color Black transmit 0.5}
            }
        #end
        
        //buraco da janela - tras
        #for(B, -11.4, 5.8, 8.6)
            box{
                <B,1.2,49.5>,<B+5.6,6,50>
                texture{ pigment{ color Black}
                   finish { ambient 0.9 phong 0.5}
                } // end of texture
            }
            sphere{ 0, 1 scale<2.8,1.75,0>
                translate <(B+(B+5.6))/2,6>
                pigment{ color Black transmit 0.5}
            }
        #end     
        #for(B, -11.4, 5.8, 8.6)
            box{
                <B,-9.8,49.5>,<B+5.6,-4,50>
                texture{ pigment{ color Black}
                   finish { ambient 0.9 phong 0.5}
                } // end of texture
            }
            sphere{ 0, 1 scale<2.8,1.75,0>
                translate <(B+(B+5.6))/2,-4>
                pigment{ color Black transmit 0.5}
            }
        #end
        
        //buraco da janela - -x
        #for(B, 3.6, 50, 8.6)
            box{
                <-15,1.2,B>,<-15,6,B+5.6>
                texture{ pigment{ color Black}
                   finish { ambient 0.9 phong 0.5}
                } // end of texture
            } 
            sphere{ 0, 1 scale<0,1.75,2.8>
                translate <-15,6,(B+(B+5.6))/2>
                pigment{ color Black transmit 0.5}
            }
        #end     
        #for(B, 3.6, 50, 8.6)
            box{
                <-15,-9.8,B>,<-15,-4,B+5.6>
                texture{ pigment{ color Black}
                   finish { ambient 0.9 phong 0.5}
                } // end of texture
            }
            sphere{ 0, 1 scale<0,1.75,2.8>
                translate <-15,-4,(B+(B+5.6))/2>
                pigment{ color Black transmit 0.5}
            }
        #end
        
        
        
        
    }
    
    //vidros - frente
    #for(B, -11.4, 5.8, 8.6)
        difference{
            sphere{ 0, 1 scale<2.8,1.75,0>
                translate <(B+(B+5.6))/2,6>
                pigment{ color Black }
                texture{Glass3 }
            } 
            box{
                <B,1.2,10>,<B+5.6,6,-10.5>
                pigment{ color Black }
                
            }
        }
        box{
            <B,1.2,0>,<B+5.6,6,-0.5>
            texture{Glass3 }   
        }       
    #end
    #for(B, -11.4, 5.8, 8.6)
        difference{
            sphere{ 0, 1 scale<2.8,1.75,0>
                translate <(B+(B+5.6))/2,-4>
                pigment{ color Black }
                texture{Glass3 }
            }
            box{
                <B,-9.8,10>,<B+5.6,-4,-10.5>
                pigment{ color Black }
            }
        }
        box{
            <B,-9.8,0>,<B+5.6,-4,-0.5>
            texture{Glass3 }
        }
    #end
    
    //vidros - tras
    #for(B, -11.4, 5.8, 8.6)
        difference{
            sphere{ 0, 1 scale<2.8,1.75,0>
                translate <(B+(B+5.6))/2,6,51>
                pigment{ color Black }
                texture{Glass3 }
            } 
            box{
                <B,1.2,40>,<B+5.6,6,60>
                pigment{ color Black }
                
            }
        }
        box{
            <B,1.2,49.5>,<B+5.6,6,51>
            texture{Glass3 }   
        }       
    #end
    #for(B, -11.4, 5.8, 8.6)
        difference{
            sphere{ 0, 1 scale<2.8,1.75,0>
                translate <(B+(B+5.6))/2,-4,51>
                pigment{ color Black }
                texture{Glass3 }
            }
            box{
                <B,-9.8,40>,<B+5.6,-4,60>
                pigment{ color Black }
            }
        }
        box{
            <B,-9.8,49.5>,<B+5.6,-4,51>
            texture{Glass3 }
        }
    #end
    
    //vidros - -x
    #for(B, -11.4, 5.8, 8.6)
        difference{
            sphere{ 0, 1 scale<2.8,1.75,0>
                translate <(B+(B+5.6))/2,6,51>
                pigment{ color Black }
                texture{Glass3 }
            } 
            box{
                <B,1.2,40>,<B+5.6,6,60>
                pigment{ color Black }
                
            }
        }
        box{
            <B,1.2,49.5>,<B+5.6,6,51>
            texture{Glass3 }   
        }       
    #end
    #for(B, -11.4, 5.8, 8.6)
        difference{
            sphere{ 0, 1 scale<2.8,1.75,0>
                translate <(B+(B+5.6))/2,-4,51>
                pigment{ color Black }
                texture{Glass3 }
            }
            box{
                <B,-9.8,40>,<B+5.6,-4,60>
                pigment{ color Black }
            }
        }
        box{
            <B,-9.8,49.5>,<B+5.6,-4,51>
            texture{Glass3 }
        }
    #end

    
    /*
    Barras Vermelhas - frente
    */                   
    #for(I, -22, 21, 8.6)
    
           box{
                <I,-10,-5.5>,<I+1,10,-7>
                pigment {Red}
            }
    
    #end
    
         
                     
    /*
    Barras Vermelhas - trás
    */
    #for(I, -22, 21, 8.6)
    
           box{
                <I,-10,55.5>,<I+1,10,57>
                pigment {Red}
            }
    
    #end     
   
    /*
    Barras Vermelhas - lado -x
    */
    #for(I, 1.92, 46.52, 8.92)
    
           box{
                <-22,-10,I>,<-21,10,I+1.5>
                pigment {Red}
            }
    
    #end
    
    /*
    Barras Vermelhas - lado +x
    */
    #for(I, 1.92, 46.52, 8.92)
    
           box{
                <22,-10,I>,<21,10,I+1.5>
                pigment {Red}
            }
    
    #end
                   
    
    /*
    Telhado
    */
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
     #for(C,-21,20,8.6) 
        difference{
        
            box {
                <C,-10,-5.5>,<C+7.6,-7,-7>
                pigment {White}
                finish { ambient .4 } 
            }
            
            box{
                <C-1,-10,-4.5>,<C+8.6,-9.75,-8>
                pigment {White}
                finish { ambient .4 }             
            
            }
            
            box{
                <C-1,-9.5,-4.5>,<C+8.6,-9.25,-8>
                pigment {White}
                finish { ambient .4 }             
            
            }
            box{
                <C-1,-7.5,-4.5>,<C+8.6,-7.25,-8>
                pigment {White}
                finish { ambient .4 }             
            
            }
        
        }
        box{
           <C+3.5,-10,-5.5><C+4.4,-6.5,-7>
           pigment {White}
           finish { ambient .4 } 
        }
        box{
           <C+0.5,-10,-5.5><C+1.4,-6.5,-7>
           pigment {White}
           finish { ambient .4 } 
        }
        box{
           <C+6.5,-10,-5.5><C+7.4,-6.5,-7>
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
            translate<-3,0.5,-1.5>
        }
        prism{
            4,
            5.5,
            4,
            <C+0.5,-7>,<C+1.4,-7>,<C+0.95,-5.5>,<C+0.5,-7>
            pigment{White}
            finish { ambient .4 }
            rotate<-90,0,0>
            translate<3,0.5,-1.5>
        }
        prism{
            4,
            5.5,
            4,
            <C+6.5,-7>,<C+7.4,-7>,<C+6.95,-5.5>,<C+6.5,-7>
            pigment{White}
            finish { ambient .4 }
            rotate<-90,0,0>
            translate<0,0.5,-1.5>
        }
     #end
     
     
     /*
    Cerca - tras 
    */  
    #for(C,-21,20,8.6) 
        difference{
        
            box {
                <C,1,55.5>,<C+7.6,4,57>
                pigment{White}
                finish { ambient .4 } 
            }
            
            box{
                <C-1,1,54.5>,<C+8.6,1.25,58>
                pigment{White}
                finish { ambient .4 }             
            
            }
            
            box{
                <C-1,1.5,54.5>,<C+8.6,1.75,58>
                pigment{White}
                finish { ambient .4 }             
            
            }
            box{
                <C-1,3.5,54.5>,<C+8.6,3.75,58>
                pigment{White}
                finish { ambient .4 }             
            
            }
        
        }
        box{
           <C+3.5,1,55.5><C+4.4,4.5,57>
           pigment{White}
           finish { ambient .4 } 
        }
        box{
           <C+0.5,1,55.5><C+1.4,4.5,57>
           pigment{White}
           finish { ambient .4 } 
        }
        box{
           <C+6.5,1,55.5><C+7.4,4.5,57>
           pigment{White}
           finish { ambient .4 } 
        }
        prism{
            4,
            5.5,
            4,
            <C+3.5,57>,<C+4.4,57>,<C+3.95,55.5>,<C+3.5,57>
            pigment{White}
            finish { ambient .4 }
            rotate<90,0,0>
            translate<-3,61.5,51.5>
        }
        prism{
            4,
            5.5,
            4,
            <C+0.5,57>,<C+1.4,57>,<C+0.95,55.5>,<C+0.5,57>
            pigment{White}
            finish { ambient .4 }
            rotate<90,0,0>
            translate<6,61.5,51.5>
        }
        prism{
            4,
            5.5,
            4,
            <C+6.5,57>,<C+7.4,57>,<C+6.95,55.5>,<C+6.5,57>
            pigment{White}
            finish { ambient .4 }
            rotate<90,0,0>
            translate<-3,61.5,51.5>
        }
     #end
     #for(C,-21,20,8.6) 
        difference{
        
            box {
                <C,-10,55.5>,<C+7.6,-7,57>
                pigment{White}
                finish { ambient .4 } 
            }
            
            box{
                <C-1,-10,54.5>,<C+8.6,-9.75,58>
                pigment{White}
                finish { ambient .4 }             
            
            }
            
            box{
                <C-1,-9.5,54.5>,<C+8.6,-9.25,58>
                pigment{White}
                finish { ambient .4 }             
            
            }
            box{
                <C-1,-7.5,54.5>,<C+8.6,-7.25,58>
                pigment{White}
                finish { ambient .4 }             
            
            }
        
        }
        box{
           <C+3.5,-10,55.5><C+4.4,-6.5,57>
           pigment{White}
           finish { ambient .4 } 
        }
        box{
           <C+0.5,-10,55.5><C+1.4,-6.5,57>
           pigment{White}
           finish { ambient .4 } 
        }
        box{
           <C+6.5,-10,55.5><C+7.4,-6.5,57>
           pigment{White}
           finish { ambient .4 } 
        }
        prism{
            4,
            5.5,
            4,
            <C+3.5,57>,<C+4.4,57>,<C+3.95,55.5>,<C+3.5,57>
            pigment{White}
            finish { ambient .4 }
            rotate<90,0,0>
            translate<-3,50.5,51.5>
        }
        prism{
            4,
            5.5,
            4,
            <C+0.5,57>,<C+1.4,57>,<C+0.95,55.5>,<C+0.5,57>
            pigment{White}
            finish { ambient .4 }
            rotate<90,0,0>
            translate<6,50.5,51.5>
        }
        prism{
            4,
            5.5,
            4,
            <C+6.5,57>,<C+7.4,57>,<C+6.95,55.5>,<C+6.5,57>
            pigment{White}
            finish { ambient .4 }
            rotate<90,0,0>
            translate<-3,50.5,51.5>
        }
     #end
     
     /*
     Cerca - lado +x
     */ 
     
     #for(C,-6,54.44,8.92) 
        difference{
        
            box {
                <22,1,C>,<21.6,4,C+8>
                pigment{White}
                finish { ambient .4 } 
            }
            
            box{
                <23,1,C-1>,<20.6,1.25,C+9>
                pigment{White}
                finish { ambient .4 }             
            
            }
            
            box{
                <23,1.5,C-1>,<20.6,1.75,C+9>
                pigment{White}
                finish { ambient .4 }             
            
            } 
            
            box{
                <23,3.5,C-1>,<20.6,3.75,C+9>
                pigment{White}
                finish { ambient .4 }             
            
            }
        
        }
        box{
           <22,1,C+4.9><21.6,4.5,C+4>
           pigment{White}
           finish { ambient .4 } 
        }
        box{
           <22,1,C+1.9><21.6,4.5,C+1>
           pigment{White}
           finish { ambient .4 } 
        }
        box{
           <22,1,C+7.9><21.6,4.5,C+7>
           pigment{White}
           finish { ambient .4 } 
        }
        prism{
            5,
            5.5,
            4,
            <22,C+4.9>,<22,C+4>,<21.6,C+4.45>,<22,C+4.9>
            pigment{White}
            finish { ambient .4 }
            rotate<0,0,-90>
            translate<16.5,26.5,-0>
        }
        prism{
            5,
            5.5,
            4,
            <22,C+1.9>,<22,C+1>,<21.6,C+1.45>,<22,C+1.9>
            pigment{White}
            finish { ambient .4 }
            rotate<0,0,-90>
            translate<16.5,26.5,-0>
        }
        prism{
            5,
            5.5,
            4,
            <22,C+7.9>,<22,C+7>,<21.6,C+7.45>,<22,C+7.9>
            pigment{White}
            finish { ambient .4 }
            rotate<0,0,-90>
            translate<16.5,26.5,-0>
        }
     #end
     #for(C,-6,54.44,8.92) 
        difference{
        
            box {
                <22,-10,C>,<21.6,-7,C+8>
                pigment{White}
                finish { ambient .4 } 
            }
            
            box{
                <23,-10,C-1>,<20.6,-9.75,C+9>
                pigment{White}
                finish { ambient .4 }             
            
            }
            
            box{
                <23,-9.5,C-1>,<20.6,-9.25,C+9>
                pigment{White}
                finish { ambient .4 }             
            
            } 
            
            box{
                <23,-7.5,C-1>,<20.6,-7.25,C+9>
                pigment{White}
                finish { ambient .4 }             
            
            }
        
        }
        box{
           <22,-10,C+4.9><21.6,-6.5,C+4>
           pigment{White}
           finish { ambient .4 } 
        }
        box{
           <22,-10,C+1.9><21.6,-6.5,C+1>
           pigment{White}
           finish { ambient .4 } 
        }
        box{
           <22,-10,C+7.9><21.6,-6.5,C+7>
           pigment{White}
           finish { ambient .4 } 
        }
        prism{
            5,
            5.5,
            4,
            <22,C+4.9>,<22,C+4>,<21.6,C+4.45>,<22,C+4.9>
            pigment{White}
            finish { ambient .4 }
            rotate<0,0,-90>
            translate<16.5,15.5,-0>
        }
        prism{
            5,
            5.5,
            4,
            <22,C+1.9>,<22,C+1>,<21.6,C+1.45>,<22,C+1.9>
            pigment{White}
            finish { ambient .4 }
            rotate<0,0,-90>
            translate<16.5,15.5,-0>
        }
        prism{
            5,
            5.5,
            4,
            <22,C+7.9>,<22,C+7>,<21.6,C+7.45>,<22,C+7.9>
            pigment{White}
            finish { ambient .4 }
            rotate<0,0,-90>
            translate<16.5,15.5,-0>
        }
     #end
     
     /*
     Cerca - lado -x
     */ 
     
     #for(C,-6,54.44,8.92) 
        difference{
        
            box {
                <-22,1,C>,<-21.6,4,C+8>
                pigment{White}
                finish { ambient .4 } 
            }
            
            box{
                <-23,1,C-1>,<-20.6,1.25,C+9>
                pigment{White}
                finish { ambient .4 }             
            
            }
            
            box{
                <-23,1.5,C-1>,<-20.6,1.75,C+9>
                pigment{White}
                finish { ambient .4 }             
            
            } 
            
            box{
                <-23,3.5,C-1>,<-20.6,3.75,C+9>
                pigment{White}
                finish { ambient .4 }             
            
            }
        
        }
        box{
           <-22,1,C+4.9><-21.6,4.5,C+4>
           pigment{White}
           finish { ambient .4 } 
        }
        box{             
           <-22,1,C+1.9><-21.6,4.5,C+1>
           pigment{White}
           finish { ambient .4 } 
        }
        box{
           <-22,1,C+7.9><-21.6,4.5,C+7>
           pigment{White}
           finish { ambient .4 } 
        }
        prism{
            5,
            5.5,
            4,
            <-22,C+4.9>,<-22,C+4>,<-21.6,C+4.45>,<-22,C+4.9>
            pigment{White}
            finish { ambient .4 }
            rotate<0,0,90>
            translate<-16.5,26.5,0>
        }
        prism{
            5,
            5.5,
            4,
            <-22,C+1.9>,<-22,C+1>,<-21.6,C+1.45>,<-22,C+1.9>
            pigment{White}
            finish { ambient .4 }
            rotate<0,0,90>
            translate<-16.5,26.5,0>
        }
        prism{
            5,
            5.5,
            4,
            <-22,C+7.9>,<-22,C+7>,<-21.6,C+7.45>,<-22,C+7.9>
            pigment{White}
            finish { ambient .4 }
            rotate<0,0,90>
            translate<-16.5,26.5,0>
        }
     #end
     #for(C,-6,11.84,8.92) 
        difference{
        
            box {
                <-22,-10,C>,<-21.6,-7,C+8>
                pigment{White}
                finish { ambient .4 } 
            }
            
            box{
                <-23,-10,C-1>,<-20.6,-9.75,C+9>
                pigment{White}
                finish { ambient .4 }             
            
            }
            
            box{
                <-23,-9.5,C-1>,<-20.6,-9.25,C+9>
                pigment{White}
                finish { ambient .4 }             
            
            } 
            
            box{
                <-23,-7.5,C-1>,<-20.6,-7.25,C+9>
                pigment{White}
                finish { ambient .4 }             
            
            }
        
        }
        box{
           <-22,-10,C+4.9><-21.6,-6.5,C+4>
           pigment{White}
           finish { ambient .4 } 
        }
        box{             
           <-22,-10,C+1.9><-21.6,-6.5,C+1>
           pigment{White}
           finish { ambient .4 } 
        }
        box{
           <-22,-10,C+7.9><-21.6,-6.5,C+7>
           pigment{White}
           finish { ambient .4 } 
        }
        prism{
            5,
            5.5,
            4,
            <-22,C+4.9>,<-22,C+4>,<-21.6,C+4.45>,<-22,C+4.9>
            pigment{White}
            finish { ambient .4 }
            rotate<0,0,90>
            translate<-16.5,15.5,0>
        }
        prism{
            5,
            5.5,
            4,
            <-22,C+1.9>,<-22,C+1>,<-21.6,C+1.45>,<-22,C+1.9>
            pigment{White}
            finish { ambient .4 }
            rotate<0,0,90>
            translate<-16.5,15.5,0>
        }
        prism{
            5,
            5.5,
            4,
            <-22,C+7.9>,<-22,C+7>,<-21.6,C+7.45>,<-22,C+7.9>
            pigment{White}
            finish { ambient .4 }
            rotate<0,0,90>
            translate<-16.5,15.5,0>
        }
     #end
     #for(C,29.68,54.44,8.92) 
        difference{
        
            box {
                <-22,-10,C>,<-21.6,-7,C+8>
                pigment{White}
                finish { ambient .4 } 
            }
            
            box{
                <-23,-10,C-1>,<-20.6,-9.75,C+9>
                pigment{White}
                finish { ambient .4 }             
            
            }
            
            box{
                <-23,-9.5,C-1>,<-20.6,-9.25,C+9>
                pigment{White}
                finish { ambient .4 }             
            
            } 
            
            box{
                <-23,-7.5,C-1>,<-20.6,-7.25,C+9>
                pigment{White}
                finish { ambient .4 }             
            
            }
        
        }
        box{
           <-22,-10,C+4.9><-21.6,-6.5,C+4>
           pigment{White}
           finish { ambient .4 } 
        }
        box{             
           <-22,-10,C+1.9><-21.6,-6.5,C+1>
           pigment{White}
           finish { ambient .4 } 
        }
        box{
           <-22,-10,C+7.9><-21.6,-6.5,C+7>
           pigment{White}
           finish { ambient .4 } 
        }
        prism{
            5,
            5.5,
            4,
            <-22,C+4.9>,<-22,C+4>,<-21.6,C+4.45>,<-22,C+4.9>
            pigment{White}
            finish { ambient .4 }
            rotate<0,0,90>
            translate<-16.5,15.5,0>
        }
        prism{
            5,
            5.5,
            4,
            <-22,C+1.9>,<-22,C+1>,<-21.6,C+1.45>,<-22,C+1.9>
            pigment{White}
            finish { ambient .4 }
            rotate<0,0,90>
            translate<-16.5,15.5,0>
        }
        prism{
            5,
            5.5,
            4,
            <-22,C+7.9>,<-22,C+7>,<-21.6,C+7.45>,<-22,C+7.9>
            pigment{White}
            finish { ambient .4 }
            rotate<0,0,90>
            translate<-16.5,15.5,0>
        }
     #end
    
     
}






