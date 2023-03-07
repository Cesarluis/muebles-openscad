 //use <test.scad>
module tableroX(ancho, alto, espesor, posicion){
      if (posicion == "lateral"){  //-- lateral
        cube([ancho, espesor, alto]);
    }else if(posicion == "fondo"){ //-- frente
        cube([espesor, ancho, alto]);
    }else if(posicion == "techo"){ //-- piso
        cube([alto, ancho, espesor]);
    }
    echo("tablero", posicion, 1, ancho," x ",alto);
}

module paredes2(){
//    translate([-100,0,0]) color("blue")
//        cube([100,3140,2810]);    
//    difference(){     
        translate([0,-100,0]) color("red")
            cube([2970,100,2810]);  
        translate([800,-150,885]) color("green")
            cube([1380,200,1590]);  
//    }
     translate([2970,0,0]) color("red")
        cube([100,3140,2810]);    
    //difference(){     
        translate([0,3140,0]) color("red")
            cube([2970,100,2810]);  
        translate([0,3100,0]) color("green")
            cube([900,200,2100]);  
    //}
}

module armario(ancho, alto, profundo, espesor, div=10,espacio=240){
  translate ([0,0,100])
    cube([espesor,profundo,alto]);
  echo("armarioA","lateral", 1, profundo,"x",alto);
  translate ([ancho+espesor,0,100])
    cube([espesor,profundo,alto]);
  echo("armarioB","laterial", 1, profundo,"x",alto);
  
  for ( n = [0 : div] ){
    translate ([15,0,t+100]) color("white")
       cube([ancho,profundo,espesor]);
    t= n*espacio;
    echo("armarioDiv","techo", 1, ancho,"x",profundo);
  }
}

module socalo(ancho, alto, profundo, espesor, div=10, espacio){
  armario(ancho=ancho, alto=alto, profundo=profundo, espesor=espesor, div=div, espacio=espacio);
}

module modularX(anchoMod, altoMod, profundoMod, espesor, refuerzo="Si"){
    anchoFondo=anchoMod-(espesor*2);
    altoFondo = 100;
    echo("X Modular", "Fondo", profundoMod, "Alto", altoMod, "Ancho", anchoMod);
    //-- Laterales
    //echo("piezas", 2, profundoMod,"x",altoMod);
    //-- Refuerzos
    //echo("piezas", 6, anchoFondo,"x",altoFondo);  
    union(){
        //--Lateral 1
        translate([0,0,0])
            tableroX(ancho=profundoMod,alto=altoMod,espesor=espesor,posicion="lateral");
        //--Lateral 2UTU
        translate([0,anchoMod-espesor,0])
            tableroX(ancho=profundoMod,alto=altoMod,espesor=espesor,posicion="lateral");
        //--Fondo 1
        translate([0,espesor,0])
            tableroX(ancho=anchoFondo,alto=altoMod-15,espesor=espesor,posicion="fondo");
    if(refuerzo=="Si"){   
      translate([profundoMod-15,espesor,altoMod-70])
            tableroX(ancho=anchoFondo,alto=70,espesor=espesor,posicion="fondo");
    }
      //-- Piso 1
        translate([0,espesor,0])
            tableroX(ancho=anchoFondo,alto=profundoMod,espesor=espesor,posicion="techo");
        //-- techo1
        translate([0,espesor,altoMod-espesor])
            tableroX(ancho=anchoFondo,alto=profundoMod,espesor=espesor,posicion="techo");
    }
}

module cajonX(anchoCajon, altoCajon, profundoCajon, espesor){
    anchoFondo=anchoCajon-(espesor*2);
    //echo("Cajon", "Fondo", profundoCajon, "Alto", altoCajon, "Ancho", anchoCajon);
    //-- Laterales
    echo("X Cajon lateral", 2, profundoCajon,"x",altoCajon);
    //-- Fondo y frente
    echo("X Cajon fondo-frente", 2, anchoCajon-espesor*2,"x",altoCajon); 
    //-- Base
    echo("X Cajon base", 1, anchoCajon-espesor*2,"x",profundoCajon-espesor*2); 
  // -- frente decorativo
    echo("X Cajon frente-Deco", 1, anchoCajon+35+5,"x",altoCajon+54+20); 
//    //union(){
        //--Lateral 1
        translate([0,0,0]) color("red")
            tableroX(ancho=profundoCajon,alto=altoCajon,espesor=espesor,posicion="lateral");
        //--Lateral 2
        translate([0,anchoCajon-espesor,0]) color("green")
            tableroX(ancho=profundoCajon,alto=altoCajon,espesor=espesor,posicion="lateral");
        //--Fondo 
        translate([0,espesor,0])
           tableroX(ancho=anchoCajon-espesor*2,alto=altoCajon,espesor=espesor,posicion="fondo");
        //--Frente
        translate([profundoCajon-espesor,espesor,0])
            tableroX(ancho=anchoCajon-espesor*2,alto=altoCajon,espesor=espesor,posicion="fondo");
        //-- Piso 
        translate([espesor,espesor,0]) color("blue")
            tableroX(ancho=anchoFondo,alto=profundoCajon-2*espesor,espesor=espesor,posicion="techo");      
      // Frente decorativo
         translate([profundoCajon-espesor+15,espesor-35,0])
        tableroX(ancho=anchoCajon+35+5,alto=altoCajon+54+20,espesor=espesor,posicion="fondo");
 //   }

}

armario(ancho=630,alto=2415,profundo=300,espesor=15);
translate ([2280,0,0])
armario(ancho=630,alto=2415,profundo=300,espesor=15);
// Modular Bajo
translate ([1475,0,100]) rotate([0,0,90])
modularX(anchoMod=805, altoMod=350, profundoMod=600, espesor=15);
translate ([1475-13-15,50,100+15]) rotate([0,0,90]) color("green")
cajonX(anchoCajon=779-30, altoCajon=250, profundoCajon=550, espesor=15);
translate ([2280,0,100]) rotate([0,0,90])
modularX(anchoMod=805, altoMod=350, profundoMod=600, espesor=15);
translate ([2280-13-15,50,100+15]) rotate([0,0,90]) color("green")
cajonX(anchoCajon=779-30, altoCajon=250, profundoCajon=550, espesor=15);

translate ([2280-15,0,450]) rotate([0,0,90]) color("red")
tableroX(ancho=1580, alto=600, espesor=15, posicion="techo");

//translate ([2280-15,0,2500]) rotate([0,0,90]) color("red")
//tableroX(ancho=1580, alto=600, espesor=15, posicion="techo");

//translate ([2280,0,500]) rotate([0,0,90]) color("red")
//tableroX(ancho=600, alto=2015, espesor=15, posicion="lateral");

translate ([685,0,450]) rotate([0,0,90]) color("red")
tableroX(ancho=600, alto=450, espesor=15, posicion="lateral");

//modular alto
translate ([745,0,2515]) rotate([0,0,90])
modularX(anchoMod=735, altoMod=250, profundoMod=300, espesor=15,refuerzo="No");
translate ([745-2,300,2515]) rotate([0,0,90]) color("green")
tableroX(ancho=735-4, alto=250-2, espesor=15, posicion="fondo");

translate ([1480,0,2515]) rotate([0,0,90])
modularX(anchoMod=735, altoMod=250, profundoMod=300, espesor=15,refuerzo="No");
translate ([1480-2,300,2515]) rotate([0,0,90]) color("green")
tableroX(ancho=735-4, alto=250-2, espesor=15, posicion="fondo");
translate ([2215,0,2515]) rotate([0,0,90])
modularX(anchoMod=735, altoMod=250, profundoMod=300, espesor=15,refuerzo="No");
translate ([2215-2,300,2515]) rotate([0,0,90]) color("green")
tableroX(ancho=735-4, alto=250-2, espesor=15, posicion="fondo");

translate ([2950,0,2515]) rotate([0,0,90])
modularX(anchoMod=735, altoMod=250, profundoMod=300, espesor=15,refuerzo="No");
translate ([2950-2,300,2515]) rotate([0,0,90]) color("green")
tableroX(ancho=735-4, alto=250-2, espesor=15, posicion="fondo");

rotate([0,0,90])
translate ([1920,-2960,0])
armario(ancho=700,alto=2655,profundo=300,espesor=15,div=11);
rotate([0,0,90])
translate ([1210,-2960,0])
armario(ancho=700,alto=2655,profundo=300,espesor=15,div=11);
rotate([0,0,90])
translate ([500,-2960,0])
armario(ancho=700,alto=2655,profundo=300,espesor=15,div=11);

translate ([1000,2800,0])
armario(ancho=685,alto=2655,profundo=300,espesor=15, div=11);
translate ([1715,2800,0])
armario(ancho=495,alto=2655,profundo=300,espesor=15,div=11);
translate ([2240,2800,0])
armario(ancho=685,alto=2655,profundo=300,espesor=15,div=11);

translate ([-100,0,0]) rotate([90,0,90]) color("blue")
socalo(ancho=250, alto=2940, profundo=100, espesor=15, div=7, espacio=400);
translate ([2690,2720,0]) rotate([90,0,0]) color("blue")
socalo(ancho=250, alto=2080, profundo=100, espesor=15, div=5, espacio=400);
translate ([920,2850,0]) rotate([90,0,90]) color("blue")
socalo(ancho=250, alto=1900, profundo=100, espesor=15, div=4, espacio=400);
paredes2();