// modulo = [
//    ancho, alto, profundidad,
//    refuerzo, esqueleto, fondo, espesor,
//    color, [x,y,z], nombre
//]

// puerta = [moduloIndex, cant, espesor, 
//    color, [x,y,z]], nombre
//]

// cajon = [ moduloIndex, alto, color,
//    frenteDec, altoDec, anchoPlus,
//    colorDec, [x,y,z], nombre
//]

module tableroX(ancho=100, alto=100, 
                espesor=15, posicion, color, parte, agrupador = 0 ){ 
    if(is_num(ancho) && is_num(alto) && is_num(espesor)){
        
        if (posicion == "lateral"){  //-- lateral
            cube([ancho, espesor, alto]);       
        }else if(posicion == "fondo"){ //-- frente
            cube([espesor, ancho, alto]);
        }else if(posicion == "frente"){ //-- frente
            cube([espesor, ancho, alto]);
        }else if(posicion == "techo"){ //-- piso
            cube([alto, ancho, espesor]);
        }else if(posicion == "piso"){ //-- piso
            cube([alto, ancho, espesor]);
        }
 
    }else{ echo("No es numero!!!!!"); }
//    echo("tablero", posicion, 1, ancho," x ",alto,
//    espesor, color, parte);
    
    habilitado="true";
    conBanda=color; sinBanda=""; 
    conAluminio="aluminio";
    sinAluminio="";
    
  if (! (parte == "Pared" || 
    parte == "Pilar" || 
    parte == "Frizer" || 
    parte == "Cocina")
  ){
    if((espesor > 10) && 
        (posicion == "piso" 
        || posicion == "techo"
        || posicion == "fondo")){
       echo(alto," ",
        ancho," -- ",
        1,color, 
        str(parte,"_",agrupador,"_",posicion),
        habilitado,
        sinBanda,sinBanda,
        conBanda,sinBanda);
    }else if(espesor < 10 && 
        (posicion == "piso" 
        || posicion == "techo"
        || posicion == "fondo")){
       echo(alto," ",
        ancho," ",
        1,"Fondo 6", 
        str(parte,"_",agrupador,"_",posicion),
        habilitado,
        sinBanda,sinBanda,
        sinBanda,sinBanda); 
        }
    if(posicion == "lateral"){
        echo(alto," -- ",
        ancho," == ",
        1,color,
        str(parte,"_",agrupador,"_",posicion),
        habilitado,
        conBanda,sinBanda,
        conBanda,conBanda);
    }
    if(posicion == "frente" && 
        parte == "Cajón"){
        echo(alto," == ",
        ancho," == ",
        1,color,    
        str(parte,"_",agrupador,"_",posicion),
        habilitado,
        conAluminio,conAluminio,
        sinAluminio,conAluminio);
    }
    if(posicion == "frente" && 
        parte == "Puerta"){
        echo(alto," == ",
        ancho," == ",
        1,color,    
        str(parte,"_",agrupador,"_",posicion),
        habilitado,
        conAluminio,sinAluminio,
        conAluminio,conAluminio);
    }
  }
}

module armariodeModulo(armario){
    
    //echo(armario[8]);
//armario_00 = [moduloIndex, ancho, alto, profundidad,
//            espesor, color, divisiones, [x,y,z]];    
            
    espacio = armario[2]/(armario[6]-1);  t=0;
    translate(armario[7]) color(armario[5])
    union(){
    tableroX(ancho=armario[3],
            alto=armario[2],
            espesor=armario[4],
            posicion="lateral",
            color=armario[5],
            parte=armario[8]);
    translate ([0,armario[1]-(armario[4]),0])
    tableroX(ancho=armario[3],
            alto=armario[2],
            espesor=armario[4],
            posicion="lateral",
            color=armario[5],
            parte=armario[8]);
    for ( n = [0 : armario[6]-2] ){
        translate ([0,armario[4],t])
        tableroX(ancho=armario[1]-(armario[4]*2),
                alto=armario[3],
                espesor=armario[4],
                posicion="piso",
                color=armario[5],
                parte=armario[8]);
        t= n*espacio;
    }
    translate ([0,armario[4],armario[2]-armario[4]])
    tableroX(ancho=armario[1]-(armario[4]*2),
            alto=armario[3],
            espesor=armario[4],
            posicion="piso",
            color=armario[5],
            parte=armario[8]);
    }
}

module socalo(Socalo){
    rotate([0,270,-90])
    armariodeModulo(Socalo);
}

// modulo = [
//    ancho, alto, profundidad,
//    refuerzo, esqueleto, fondo, espesor,
//    color, [x,y,z], nombre
//]

module modularX(anchoMod, altoMod, profundoMod, 
    refuerzo, esqueleto, fondo, espesor, color,
    agrupador){

    altoRefuerzoFrente=50;
    altoRefuerzo = 150;
    anchoFondo=anchoMod-(espesor*2);
    PLat_1=[0,0,0];
    PLat_2=[0,anchoMod-espesor,0];
    PFondo=[0,espesor,espesor];
    PFrente=[profundoMod-espesor,
        espesor,
        altoMod-altoRefuerzoFrente-espesor];
    PPiso=[0,espesor,0];
    PTech=[0,espesor,altoMod-espesor];
    
    union(){
        //--Lateral 1
        translate(PLat_1)
        tableroX(ancho=profundoMod,
            alto=altoMod,
            espesor=espesor,
            posicion="lateral", 
            color=color,
            parte="Modular",
            agrupador=agrupador);        
        //--Lateral 2
        translate(PLat_2)
        tableroX(ancho=profundoMod,
            alto=altoMod,
            espesor=espesor,
            posicion="lateral", 
            color=color,
            parte="Modular",
            agrupador=agrupador);
        //--Frente
        if(refuerzo=="Si"){
            translate(PFrente)
            tableroX(ancho=anchoFondo,
                alto=altoRefuerzoFrente,
                espesor=espesor,
                posicion="frente", 
                color=color,
                parte="Modular",
                agrupador=agrupador);
        }
        //refuerzoF = "No"; refuerzoTP = "No";
//        if(profundoMod > (altoRefuerzo*2)){
//            refuerzoTP = "Si";}
//        if(altoMod > (altoRefuerzo*2)){
//            refuerzoF = "Si";}
        if(esqueleto=="No"){
            //--Fondo
            //if(refuerzoTP == "Si"){
            translate(PFondo) 
            tableroX(ancho=anchoFondo,
                alto=altoRefuerzo,
                espesor=espesor,
                posicion="fondo", 
                color=color,
                parte="Modular",
                agrupador=agrupador);
            translate(PFondo) 
            translate([0,0,altoMod-altoRefuerzo-espesor*2])
            tableroX(ancho=anchoFondo,
                alto=altoRefuerzo,
                espesor=espesor,
                posicion="fondo", 
                color=color,
                parte="Modular",
                agrupador=agrupador);
            //}
            //-- Piso 
            translate(PPiso)
            tableroX(ancho=anchoFondo,
                alto=profundoMod,
                espesor=espesor,
                posicion="piso", 
                color=color,
                parte="Modular",
                agrupador=agrupador);
            //-- techo
            translate(PTech)
            tableroX(ancho=anchoFondo,
                alto=profundoMod,
                espesor=espesor,
                posicion="techo", 
                color=color,
                parte="Modular",
                agrupador=agrupador);
        }
        if(esqueleto == "Si"){ 
        //--Fondo
//            if(refuerzoF == "Si"){
            translate(PFondo) 
            tableroX(ancho=anchoFondo,
                alto=altoRefuerzo,
                espesor=espesor,
                posicion="fondo", 
                color=color,
                parte="Modular",
                agrupador=agrupador);
            translate(PFondo) 
            translate([0,0,altoMod-altoRefuerzo-espesor*2]) 
            tableroX(ancho=anchoFondo,
                alto=altoRefuerzo,
                espesor=espesor,
                posicion="fondo", 
                color=color,
                parte="Modular",
                agrupador=agrupador);
//            }
            //-- Piso
            translate(PPiso)
            tableroX(ancho=anchoFondo,
                alto=altoRefuerzo,
                espesor=espesor,
                posicion="piso", 
                color=color,
                parte="Modular",
                agrupador=agrupador);
                
                translate(PPiso) 
            translate([profundoMod-altoRefuerzo,0,0]) 
            tableroX(ancho=anchoFondo,
                alto=altoRefuerzo,
                espesor=espesor,
                posicion="techo", 
                color=color,
                parte="Modular",
                agrupador=agrupador);
                
            //-- techo
            translate(PTech) 
            tableroX(ancho=anchoFondo,
                alto=altoRefuerzo,
                espesor=espesor,
                posicion="techo", 
                color=color,
                parte="Modular",
                agrupador=agrupador);
            translate(PTech) 
            translate([profundoMod-altoRefuerzo,0,0]) 
            tableroX(ancho=anchoFondo,
                alto=altoRefuerzo,
                espesor=espesor,
                posicion="techo", 
                color=color,
                parte="Modular",
                agrupador=agrupador);
        }
        //En caso de requerir un fondo en el mueble
        if(fondo == "Si"){
            translate(PFondo) 
            translate([espesor-5,0,
                        espesor-5]) 
            tableroX(
              ancho=anchoMod-(espesor+5),
              alto=altoMod-(espesor+5),
                espesor=6,
                posicion="fondo", 
                color=color,
                parte="Modular",
                agrupador=agrupador);    
        }
    }
}

module modulosdeCocina(Modulos){
                            
    // Ensamblado de modulos
    if (len(Modulos) > 0){
        for(i=[0:(len(Modulos)-1)]){
//            echo(str("Modular ",i), 
//            str("Ancho ", Modulos[i][0]),    
//            str("Alto ", Modulos[i][1]),
//            str("Profundidad ", Modulos[i][2]),  
//            str("Nombre ", Modulos[i][9]));
            
            translate(Modulos[i][8]) 
            rotate([0,0,0])
            color(Modulos[i][7])        
            modularX(anchoMod=Modulos[i][0], 
                altoMod=Modulos[i][1], 
                profundoMod=Modulos[i][2], 
                refuerzo=Modulos[i][3],    
                esqueleto=Modulos[i][4],
                fondo=Modulos[i][5],
                espesor=Modulos[i][6],
                color=Modulos[i][7],
                agrupador=i
            );
        }
    }
}

module puertasdeModulo(Puertas){
    // Ensamblado de puertas  
    if (len(Puertas) > 0){   
        for(i=[0:len(Puertas)-1]){
            translate(Puertas[i][6]) 
            color(Puertas[i][5])
            tableroX(ancho=Puertas[i][1],
                alto=Puertas[i][2],
                espesor=Puertas[i][4],
                posicion="frente",
                color=Puertas[i][5],
                parte="Puerta",
                agrupador=i);
        }
    }
}

module cajonX(anchoCajon, altoCajon,
            profundoCajon, espesor, 
            color="green",frente="No",
            altoFrente, anchoPlus,
            colorFrente= "red", agrupador){

            anchoFondo=anchoCajon-(espesor*2);
        
//    //union(){
        //--Lateral 1
        translate([0,0,0]) color(color)
        tableroX(ancho=profundoCajon,
            alto=altoCajon,
            espesor=espesor,
            posicion="lateral", 
            color=color,
            parte="Cajón",
            agrupador=agrupador);
        //--Lateral 2
        translate([0,anchoCajon-espesor,0]) color(color)
        tableroX(ancho=profundoCajon,
            alto=altoCajon,
            espesor=espesor,
            posicion="lateral", 
            color=color,
            parte="Cajón",
            agrupador=agrupador);
              //--Fondo 
        translate([0,espesor,0]) color(color)
        tableroX(ancho=anchoCajon-espesor*2,
            alto=altoCajon,
            espesor=espesor,
            posicion="fondo", 
            color=color,
            parte="Cajón",
            agrupador=agrupador);
        //--Frente
        translate([profundoCajon-espesor,espesor,0]) color(color)
        tableroX(ancho=anchoCajon-espesor*2,
            alto=altoCajon,
            espesor=espesor,
            posicion="fondo", 
            color=color,
            parte="Cajón",
            agrupador=agrupador);
        //-- Piso 
        translate([espesor,espesor,0]) color(color)
        tableroX(
            ancho=anchoCajon-(espesor+5),
            alto=profundoCajon-(espesor+5),
            espesor=6,
            posicion="piso", 
            color=color,
            parte="Cajón",
            agrupador=agrupador);     
    if(frente == "Si"){
      // Frente decorativo
      translate([profundoCajon,(anchoCajon-anchoPlus)/2,-espesor])
        color(colorFrente)
      tableroX(ancho=anchoPlus,
            alto=altoFrente,
            espesor=espesor,
            posicion="frente", 
            color=colorFrente,
            parte="Cajón",
            agrupador=agrupador);
    }
}

module cajonY(anchoCajon, altoCajon, profundoCajon, 
            espesor, color="green",frente="No",
            altoFrente, anchoPlus,colorFrente= "red"){

            anchoFondo=anchoCajon-(espesor*2);
        
        //--Fondo 
        translate([0,espesor,0]) color(color)
        tableroX(ancho=anchoCajon-espesor*2,
            alto=altoCajon,
            espesor=espesor,
            posicion="fondo", 
            color=color,
            parte="Cajón");
        //--Frente
        translate([profundoCajon-espesor,espesor,0]) color(color)
        tableroX(ancho=anchoCajon-espesor*2,
            alto=altoCajon,
            espesor=espesor,
            posicion="fondo", 
            color=color,
            parte="Cajón");
        //-- Piso 
        translate([espesor,espesor,0]) color(color)
        tableroX(
            ancho=anchoCajon-espesor*2,
            alto=profundoCajon-espesor*2,
            espesor=espesor,
            posicion="piso", 
            color=color,
            parte="Cajón");     
       // Techo
       translate([espesor,espesor,altoCajon-espesor]) color(color)
        tableroX(
            ancho=anchoCajon-espesor*2,
            alto=profundoCajon-espesor*2,
            espesor=espesor,
            posicion="piso", 
            color=color,
            parte="Cajón");     
            
    if(frente == "Si"){
      // Frente decorativo
      translate([profundoCajon,(anchoCajon-anchoPlus)/2,0])
        color(colorFrente)
      tableroX(ancho=anchoPlus,
            alto=altoFrente,
            espesor=espesor,
            posicion="frente", 
            color=colorFrente,
            parte="Cajón");
    }
}


// cajon_00 = [moduloIndex, ancho, alto, profundidad,
//          espesor, color, frenteDec, anchoDec, altoDec, 
//          colorDec, [x,y,z]]
module cajonesdeModulo(Cajones){
    
    // Ensamblado de cajones
    for(i=[0:len(Cajones)-1]){
//        echo(str("Cajón ",i), 
//        str("Ancho ",Cajones[i][1]),
//        str("Alto ",Cajones[i][2]),
//        str("Profundidad ",Cajones[i][3]));
        
        translate (Cajones[i][10])  
        cajonX(
            anchoCajon=Cajones[i][1], 
            altoCajon=Cajones[i][2], 
            profundoCajon=Cajones[i][3], 
            espesor=Cajones[i][4],
            color=Cajones[i][5],
            frente=Cajones[i][6],
            altoFrente=Cajones[i][8],
            anchoPlus=Cajones[i][7],
            colorFrente=Cajones[i][9],
            agrupador=i);
    }
}

module divHorizontal(Divisiones){
     
    for(i=[0:len(Divisiones)-1]){
        translate(Divisiones[i][6]) 
        color(Divisiones[i][5])
        tableroX(
          ancho=Divisiones[i][1],
            alto=Divisiones[i][2],
            espesor=Divisiones[i][4],
            posicion="piso",
            color=Divisiones[i][5],
            parte="Division");
    }   
}


module divisiones(Divisiones){     
    for(i=[0:len(Divisiones)-1]){
        translate(Divisiones[i][6]) 
        color(Divisiones[i][5])
        tableroX(
          ancho=Divisiones[i][1],
            alto=Divisiones[i][2],
            espesor=Divisiones[i][4],
            posicion=Divisiones[i][8],
            color=Divisiones[i][5],
            parte="Division");
    }   
}

/////////////////////////////////////
espesor = 15; riel = 13;
socalo = 100;
// modulo(i) = [
//    ancho, alto, profundidad,
//    refuerzo, esqueleto, fondo, espesor,
//    color, [x,y+sum(modulo(i..i-1)[ancho]),z], nombre
//]

mod_00 = [600,800,550,"No","Si","Si",espesor,"red",
         [0,0,socalo], "Modulo 1"];
mod_01 = [600,800,550,"No","Si","No",espesor,"red",
         [0,mod_00[0],socalo], "Modulo 2"];
mod_02 = [600,800,550,"No","Si","No",espesor,"red",
         [0,mod_00[0]+mod_01[0],socalo], "Modulo 3"];
mod_03 = [600,800,550,"No","Si","No",espesor,"red",
         [0,mod_00[0]+mod_01[0]+mod_02[0],socalo], "Modulo 4"];

ModulosX = [mod_00, mod_01, mod_02, mod_03];

// puerta = [moduloIndex, ancho, alto, cant, espesor, 
//    color, [x,y,z]], nombre
//]

puerta_00 = [0,mod_00[0]-10,mod_00[1]-10,1,espesor,"green",
            [mod_00[8][0]+mod_00[2],
                mod_00[8][1]+5,
                mod_00[8][2]], 
            "puerta 1"];
puerta_01 = [1,mod_01[0]-10,mod_01[1]-10,1,espesor,"green",
            [mod_01[8][0]+mod_01[2],
                mod_01[8][1]+5,
                mod_01[8][2]], 
            "puerta 2"];
PuertasX = [
        puerta_00, puerta_01
    ];

div_00 = [0,mod_00[0]-10,mod_00[2]-5,1,espesor,"green",
            [mod_00[8][0],
                mod_00[8][1]+mod_00[0]/2,
                mod_00[8][2]+15], 
            "division 1",
            "lateral"];
div_01 = [1,mod_01[0]-10,mod_01[2]-5,1,espesor,"green",
            [mod_01[8][0],
                mod_01[8][1]+5,
                mod_01[8][2]+450], 
            "division 2",
            "piso"];
Divisiones = [
            div_00, div_01
];

//armario_00 = [moduloIndex, ancho, alto, profundidad,
//            espesor, color, divisiones, [x,y,z]];

armario_00 = [2, mod_02[0]-espesor*2, 500, mod_02[2]-espesor-6,
            espesor, "white", (1+2),
            [mod_02[8][0]+espesor*2,
                mod_02[8][1]+espesor,
                mod_02[8][2]+150],
            "Armario 1"];

socalo_00 = [0, 500, 2400, socalo,
            espesor, "white", (4+2),
            [0,0,0],
            "Socalo 1"];

// cajon_00 = [moduloIndex, ancho, alto, profundidad,
//          espesor, color, frenteDec, anchoDec, altoDec, 
//          colorDec, [x,y,z]]


cajon_00 = [3, mod_03[0]-espesor*2-riel*2, 200, mod_03[2]-50,
          espesor, "blue", "Si", mod_03[0]-espesor*2, 
          250,"green", 
          [mod_03[8][0]+50,
            mod_03[8][1]+espesor+riel,
            mod_03[8][2]+espesor]];
cajon_01 = [3, mod_03[0]-espesor*2-riel*2, 200, mod_03[2]-50,
          espesor, "blue", "Si", mod_03[0]-espesor*2, 
          250,"green", 
          [mod_03[8][0]+50,
            mod_03[8][1]+espesor+riel,
            mod_03[8][2]+espesor+250+2]];

CajonesX = [
    cajon_00, cajon_01
];

//CajonY = [anchoCajon=400, altoCajon=800, 
//            profundoCajon=500, 
//            espesor=15, color="green",
//            frente="Si",
//            altoFrente=815, anchoPlus=520,
//            colorFrente= "red"];

CajonY_01 = [400, 800, 
            500, 
            15, "green",
            "Si",
            815, 520,
            "red"];
modulosdeCocina(ModulosX);

//puertasdeModulo(PuertasX);
divisiones(Divisiones); 
armariodeModulo(armario_00);

socalo(socalo_00);

cajonesdeModulo(CajonesX);

//translate([15,15,0])
//cylinder(h=1100, d=30, $fn=40);

translate([800,800,0])


cajonY(CajonY_01[0],CajonY_01[1],CajonY_01[2],
        CajonY_01[3],CajonY_01[4],CajonY_01[5],
        CajonY_01[6],CajonY_01[7],CajonY_01[8]
        );