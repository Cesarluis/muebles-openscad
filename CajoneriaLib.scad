module tableroX(ancho=100, alto=100, 
                espesor=15, posicion, color, parte){ 
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
    echo("tablero", posicion, 1, ancho," x ",alto,
    espesor, color, parte);
 
}

module paredes2(){
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

module armario(Ar_ancho, Ar_alto, Ar_profundo, espesor, div=10,espacio=240, color){
    echo("Aramario");
    espacio = Ar_alto/(div-1);  t=0;
    tableroX(ancho=Ar_profundo,alto=Ar_alto,espesor=espesor,posicion="lateral",color=color,parte="armario");
    translate ([0,Ar_ancho-(espesor*2),0])
    tableroX(ancho=Ar_profundo,alto=Ar_alto,espesor=espesor,posicion="lateral",color=color,parte="armario");
    for ( n = [0 : div-2] ){
        translate ([0,espesor,t])
        tableroX(ancho=Ar_ancho-(espesor*2)-espesor,alto=Ar_profundo,espesor=espesor,posicion="piso",color=color,parte="armario");
        t= n*espacio;
    }
    translate ([0,espesor,Ar_alto-espesor])
        tableroX(ancho=Ar_ancho-(espesor*2)-espesor,alto=Ar_profundo,espesor=espesor,posicion="piso",color=color,parte="armario");
}

module socalo(Ar_ancho, Ar_alto, Ar_profundo, espesor, div, espacio, color){
    echo("Socalo");
    rotate([0,270,-90])
    armario(Ar_ancho, Ar_alto, Ar_profundo, espesor, div, espacio, color=color);
}

module modularX(anchoMod, altoMod, profundoMod, espesor, refuerzo, esqueleto, fondo, color){

    altoRefuerzo=50;
    anchoFondo=anchoMod-(espesor*2);
    altoFondo = 100;
    PLat_1=[0,0,0];
    PLat_2=[0,anchoMod-espesor,0];
    PFondo=[0,espesor,espesor];
    PFrente=[profundoMod-espesor,espesor,altoMod-altoRefuerzo-espesor];
    PPiso=[0,espesor,0];
    PTech=[0,espesor,altoMod-espesor];
    
    union(){
        //--Lateral 1
        translate(PLat_1)
        tableroX(ancho=profundoMod,alto=altoMod,espesor=espesor,posicion="lateral", color=color,parte="Modular");        
        //--Lateral 2
        translate(PLat_2)
        tableroX(ancho=profundoMod,alto=altoMod,espesor=espesor,posicion="lateral", color=color,parte="Modular");
        //--Frente
        if(refuerzo=="Si"){
            translate(PFrente)
            tableroX(ancho=anchoFondo,alto=altoRefuerzo,espesor=espesor,posicion="frente", color=color,parte="Modular");
        }
        if(esqueleto=="No"){
            //--Fondo
            translate(PFondo) 
            tableroX(ancho=anchoFondo,alto=150,espesor=espesor,posicion="fondo", color=color,parte="Modular");
            translate(PFondo) 
            translate([0,0,altoMod-150-30])
            tableroX(ancho=anchoFondo,alto=150,espesor=espesor,posicion="fondo", color=color,parte="Modular");
            //-- Piso 
            translate(PPiso)
            tableroX(ancho=anchoFondo,alto=profundoMod,espesor=espesor,posicion="piso", color=color,parte="Modular");
            //-- techo
            translate(PTech)
            tableroX(ancho=anchoFondo,alto=profundoMod,espesor=espesor,posicion="techo", color=color,parte="Modular");
        }else{
        //--Fondo
            translate(PFondo) 
            tableroX(ancho=anchoFondo,alto=150,espesor=espesor,posicion="fondo", color=color,parte="Modular");
            translate(PFondo) 
            translate([0,0,altoMod-150-30]) 
            tableroX(ancho=anchoFondo,alto=150,espesor=espesor,posicion="fondo", color=color,parte="Modular");
            //-- Piso
            translate(PPiso)
            tableroX(ancho=anchoFondo,alto=profundoMod,espesor=espesor,posicion="piso", color=color,parte="Modular");
            //-- techo
            translate(PTech) 
            tableroX(ancho=anchoFondo,alto=150,espesor=espesor,posicion="techo", color=color,parte="Modular");
            translate(PTech) 
            translate([profundoMod-150,0,0]) 
            tableroX(ancho=anchoFondo,alto=150,espesor=espesor,posicion="techo", color=color,parte="Modular");
        }
        //En caso de requerir un fondo en el mueble
        if(fondo == "Si"){
            translate(PFondo) translate([15,0,0]) 
            tableroX(ancho=anchoFondo,alto=altoMod-espesor*2,espesor=6,posicion="fondo", color=color,parte="Modular");    
        }
    }
}

module cajonX(anchoCajon, altoCajon, profundoCajon, espesor, color="green",frente="No",altoFrente,anchoPlus=47,colorFrente= "red"){
    anchoFondo=anchoCajon-(espesor*2);
//    //union(){
        //--Lateral 1
        translate([0,0,0]) color(color)
        tableroX(ancho=profundoCajon,alto=altoCajon,espesor=espesor,posicion="lateral", color=color,parte="Cajón");
        //--Lateral 2
        translate([0,anchoCajon-espesor,0]) color(color)
        tableroX(ancho=profundoCajon,alto=altoCajon,espesor=espesor,posicion="lateral", color=color,parte="Cajón");
              //--Fondo 
        translate([0,espesor,0]) color(color)
        tableroX(ancho=anchoCajon-espesor*2,alto=altoCajon,espesor=espesor,posicion="fondo", color=color,parte="Cajón");
        //--Frente
        translate([profundoCajon-espesor,espesor,0]) color(color)
        tableroX(ancho=anchoCajon-espesor*2,alto=altoCajon,espesor=espesor,posicion="frente", color=color,parte="Cajón");
        //-- Piso 
        translate([espesor,espesor,0]) color(color)
        tableroX(ancho=anchoFondo,alto=profundoCajon-2*espesor,espesor=espesor,posicion="piso", color=color,parte="Cajón");     
    if(frente == "Si"){
      // Frente decorativo
      translate([profundoCajon,-(anchoPlus/2),0])
        color(colorFrente)
      tableroX(ancho=anchoCajon+anchoPlus,alto=altoFrente,espesor=espesor,posicion="frente", color=colorFrente,parte="Cajón");
    }
}

module modulosdeCocina(Modulos, Pos_Modulos, espesor){
                            
    anchoM=0; altoM=1; profM=2; anchoRiel=13*2;
    // Ensamblado de modulos
    for(i=[0:(len(Modulos)-1)]){
        echo("Modular",i, "Profundidad", Modulos[i][profM], "Alto", Modulos[i][altoM], "Ancho", Modulos[i][anchoM], "Color", Modulos[i][6]);
        translate(Pos_Modulos[i]) rotate([0,0,0])
        color(Modulos[i][6])
        modularX(anchoMod=Modulos[i][anchoM], 
        altoMod=Modulos[i][altoM], 
        profundoMod=Modulos[i][profM], 
        espesor=espesor,
        refuerzo=Modulos[i][3],
        esqueleto=Modulos[i][4],
        fondo=Modulos[i][5], 
        color=Modulos[i][6]);   
    }
    
}
module divisionesdeModulos(Modulos, Pos_Modulos, 
                DivisionesH, espesor){
// Ensamblado de divisiones
    for(i=[0:len(DivisionesH)-1]){
//        echo("Divisiones",i, "Ancho", Modulos[DivisionesH[i][0]][0]-espesor*2, "Alto", Modulos[DivisionesH[i][0]][2], "color", DivisionesH[i][2]);
        translate (DivisionesH[i][1]) 
        rotate([0,0,0]) color(DivisionesH[i][2])
        tableroX(ancho=Modulos[DivisionesH[i][0]][0]-espesor*2,alto=Modulos[DivisionesH[i][0]][2],espesor=espesor,posicion="techo", color=Modulos[i][6],parte="División");
    }
}

module cajonesdeCocina(Modulos, Pos_Modulos, 
                Cajones, espesor){
// Ensamblado de cajones
    anchoM=0; altoM=1; profM=2; anchoRiel=13*2;
    for(i=[0:len(Cajones)-1]){
        echo("Cajón",i, 
        "Profundidad",Modulos[Cajones[i][0]][profM]-50, 
        "Alto",Cajones[i][2],
        "Ancho",Modulos[Cajones[i][0]][anchoM]-anchoRiel-30);
        
        translate (Cajones[i][1]) 
        rotate([0,0,0]) 
        
        cajonX(
        anchoCajon=Modulos[Cajones[i][0]][anchoM]-anchoRiel-30, 
        altoCajon=Cajones[i][2], 
        profundoCajon=Modulos[Cajones[i][0]][profM]-50, 
        espesor=espesor,
        color=Cajones[i][3],
        frente=Cajones[i][4],
        altoFrente=Cajones[i][5],
        anchoPlus=Cajones[i][6],
        colorFrente=Cajones[i][7]
        );
    }
}
module puertasdeCocina(Modulos, Pos_Modulos, 
                Puertas, espesor){
// Ensamblado de puertas
    for(i=[0:len(Puertas)-1]){
//        echo("Puertas",i, "Ancho", Puertas[i][0][0], "Alto",Puertas[i][0][1]);
        translate(Puertas[i][1]) 
        color(Puertas[i][0][2])
        tableroX(Puertas[i][0][0],Puertas[i][0][1],espesor,"frente",color=Puertas[i][0][2],parte="Puerta");
    }
}
