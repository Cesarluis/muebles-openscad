use <cajoneriaLibV1.scad>
/////////////////////////////////////
espesor = 15; riel = 13;
socalo = 100;
espacioFrizer = 900;
// modulo(i) = [
//    ancho, alto, profundidad,
//    refuerzo, esqueleto, fondo, espesor,
//    color, [x,y+sum(modulo(i..i-1)[ancho]),z], nombre
//]

mod_00 = [600,1000,450,"No","No","Si",espesor,"white",
         [0,0,socalo], "Modulo 00"];
mod_01 = [460,750,450,"No","Si","No",espesor,"white",
         [0,mod_00[0],socalo], "Modulo 01"];
mod_02 = [460,750,450,"No","Si","No",espesor,"white",
         [0,mod_00[0]+mod_01[0],socalo], "Modulo 02"];
mod_03 = [600,1000,450,"No","No","Si",espesor,"white",
         [0,mod_00[0]+mod_01[0]+mod_02[0],socalo], "Modulo 03"];
mod_04 = [530,1000,450,"No","Si","No",espesor,"white",
         [0,mod_00[0]+mod_01[0]+mod_02[0]+mod_03[0],socalo], "Modulo 04"];


mod_90 = [895,875,560,"No","Si","No",espesor,"yellow",
         [0,0,socalo],"Modulo 90"];
mod_91 = [275,875,560,"No","Si","No",espesor,"yellow",
         [0,mod_90[0],socalo], "Modulo 91"];

// modulo alto
mod_80 = [900,675,350,"No","No","Si",espesor,"yellow",
         [0,0,0],"Modulo 90"];
mod_81 = [900,675,350,"No","No","Si",espesor,"yellow",
         [0,0,mod_80[1]], "Modulo 91"];
 


ModulosX = [mod_00, mod_01, mod_02, mod_03,
    ];
  
ModulosW =[
            mod_90, mod_91,
    ];
    
ModulosZ =[
         mod_80, mod_81
    ];    
    
// puerta = [moduloIndex, ancho, alto, cant, espesor, 
//    color, [x,y,z]], nombre
//]

puerta_00 = [0,mod_00[0]-10,mod_00[1]-10,1,espesor,"yellow",
            [mod_00[8][0]+mod_02[2],
                mod_00[8][1]+5,
                mod_00[8][2]], 
            "puerta 1"];
puerta_01 = [3,mod_03[0]-10,mod_03[1]-10,1,espesor,"yellow",
            [mod_03[8][0]+mod_03[2],
                mod_03[8][1]+5,
                mod_03[8][2]], 
            "puerta 2"];

puerta_10 = [0,mod_80[0]/2-5,mod_80[1]-10,1,espesor,"yellow",
            [mod_80[8][0]+mod_80[2],
                mod_80[8][1]+5,
                mod_80[8][2]], 
            "puerta 1"];
            
puerta_11 = [0,mod_80[0]/2-5,mod_80[1]-10,1,espesor,"yellow",
            [mod_80[8][0]+mod_80[2],
                mod_80[8][1]+5+mod_80[0]/2,
                mod_80[8][2]], 
            "puerta 1"];
            
puerta_12 = [1,mod_81[0]-10,mod_81[1]/2-5,1,espesor,"yellow",
            [mod_81[8][0]+mod_81[2],
                mod_81[8][1]+5,
                mod_81[8][2]], 
            "puerta 2"];
puerta_13 = [1,mod_81[0]-10,mod_81[1]/2-5,1,espesor,"yellow",
            [mod_81[8][0]+mod_81[2],
                mod_81[8][1]+5,
                mod_81[8][2]+mod_81[1]/2], 
            "puerta 2"];


PuertasX = [
        puerta_00, puerta_01
    ];
PuertasZ =[
        puerta_10, puerta_11,
        puerta_12, puerta_13
];


armario_00 = [2, mod_01[0]+mod_02[0], 
            250, mod_00[2],
            espesor, "yellow", (1+1),
            [0,mod_00[0],850],
            "Armario 1"];

socalo_00 = [0, 400, 2120, socalo,
            espesor, "yellow", (2+2),
            [0,0,0],
            "Socalo 1"];
socalo_01 = [0, 500, 1600, socalo,
            espesor, "yellow", (2+3),
            [0,0,0],
            "Socalo 1"];
socalo_02 = [0, 550, 1170, socalo,
            espesor, "yellow", (4+1),
            [0,0,0],
            "Socalo 1"];
socalo_03 = [0, 1600, 1800, socalo/2,
            espesor, "yellow", (2+3),
            [0,0,-500],
            "Socalo 3"];
socalo_04 = [0, 1000, 1750, socalo,
            espesor, "yellow", (2+2),
            [0,0,0],
            "Socalo 1"];
            

// cajon_00 = [moduloIndex, ancho, alto, profundidad,
//          espesor, color, frenteDec, anchoDec, altoDec, 
//          colorDec, [x,y,z]]


cajon_00 = [2, mod_02[0]-espesor*2-riel*2, 150, mod_02[2]-50,
          espesor, "white", "Si", mod_02[0]-espesor, 
          240,"yellow", 
          [mod_02[8][0]+50,
            mod_02[8][1]+espesor+riel,
            mod_02[8][2]+espesor]];
            
cajon_01 = [2, mod_02[0]-espesor*2-riel*2, 150, mod_02[2]-50,
          espesor, "white", "Si", mod_02[0]-espesor, 
          240,"yellow", 
          [mod_02[8][0]+50,
            mod_02[8][1]+espesor+riel,
            mod_02[8][2]+espesor+(240+2)*1]];
            
cajon_02 = [2, mod_02[0]-espesor*2-riel*2, 150, mod_02[2]-50,
          espesor, "white", "Si", mod_02[0]-espesor, 
          240,"yellow", 
          [mod_02[8][0]+50,
            mod_02[8][1]+espesor+riel,
            mod_02[8][2]+espesor+(240+2)*2]];


cajon_10 = [1, mod_01[0]-espesor*2-riel*2, 150, mod_01[2]-50,
          espesor, "white", "Si", mod_01[0]-espesor, 
          240,"yellow", 
          [mod_01[8][0]+50,
            mod_01[8][1]+espesor+riel,
            mod_01[8][2]+espesor]];
            
cajon_11 = [1, mod_01[0]-espesor*2-riel*2, 150, mod_01[2]-50,
          espesor, "white", "Si", mod_01[0]-espesor, 
          240,"yellow", 
          [mod_01[8][0]+50,
            mod_01[8][1]+espesor+riel,
            mod_01[8][2]+espesor+(240+2)*1]];
            
cajon_12 = [1, mod_01[0]-espesor*2-riel*2, 150, mod_01[2]-50,
          espesor, "white", "Si", mod_01[0]-espesor, 
          240,"yellow", 
          [mod_01[8][0]+50,
            mod_01[8][1]+espesor+riel,
            mod_01[8][2]+espesor+(240+2)*2]];
            
cajon_20 = [0, mod_90[0]/2-espesor*2-riel*2, 150, mod_90[2]-50,
          espesor, "white", "Si", mod_90[0]/2-espesor, 
          260,"yellow", 
          [mod_90[8][0]+50,
            mod_90[8][1]+espesor+riel,
            mod_90[8][2]+espesor]];

cajon_21 = [0, mod_90[0]/2-espesor*2-riel*2, 150, mod_90[2]-50,
          espesor, "white", "Si", mod_90[0]/2-espesor, 
          260,"yellow", 
          [mod_90[8][0]+50,
            mod_90[8][1]+espesor+riel+mod_90[0]/2,
            mod_90[8][2]+espesor]];

cajon_22 = [1, mod_91[0]-espesor*2-riel*2, 150, mod_91[2]-50,
          espesor, "white", "Si", mod_91[0]-espesor, 
          875  ,"yellow", 
          [mod_91[8][0]+50,
            mod_91[8][1]+espesor+riel,
            mod_91[8][2]+espesor]];

            
CajonesX = [
    cajon_00, cajon_01, cajon_02,
    cajon_10, cajon_11, cajon_12,
];

CajonesY = [
    cajon_20, cajon_21, cajon_22
];

div_00 = [0,mod_00[0]-10,mod_00[2]-5,1,espesor,"white",
            [mod_00[8][0],
                mod_00[8][1]+5,
                mod_00[8][2]+450], 
            "division 1"];
div_01 = [3,mod_03[0]-10,mod_03[2]-5,1,espesor,"white",
            [mod_03[8][0],
                mod_03[8][1]+5,
                mod_03[8][2]+450], 
            "division 2"];
div_02 = [0,mod_80[0]-10,mod_80[2]-5,1,espesor,"yellow",
            [mod_00[8][0],
                mod_80[8][1]+5,
                mod_80[8][2]+mod_80[2]], 
            "division 1"];
div_03 = [1,mod_81[0]-10,mod_81[2]-5,1,espesor,"yellow",
            [mod_81[8][0],
                mod_81[8][1]+5,
                mod_81[8][2]+mod_81[2]], 
            "division 2"];


Divisiones = [
            div_00, div_01
];
Divisiones2 = [
            div_02, div_03
];


translate([0,300,0])
union(){
    modulosdeCocina(ModulosX);
    puertasdeModulo(PuertasX);
    armariodeModulo(armario_00);
    cajonesdeModulo(CajonesX);
    divHorizontal(Divisiones);
    socalo(socalo_00);
    translate([0,-10,1095])
    tableroX(2120+20,450+25,15, "techo", "yellow");
}
echo("Inicio Cocina");
translate([0,2600,0])
union(){
    modulosdeCocina(ModulosW);
    cajonesdeModulo(CajonesY);
    socalo(socalo_02);
    translate([15,mod_90[0]/2-15,115])
    tableroX(550, 260-15, 15, "lateral", "yellow");
    translate([15,mod_90[0]/2,115])
    tableroX(550, 260-15, 15, "lateral", "yellow");
}
echo("Fin Cocina");
translate([0,2600,1700])
union(){
    modulosdeCocina(ModulosZ);
    puertasdeModulo(PuertasZ);
    divHorizontal(Divisiones2);
}


//translate([0,250+950,0])
//socalo(socalo_01);

module paredes(){
    translate ([-100,0,0]) color("lightslategray")
    tableroX(ancho=2730,
            alto=2900,
            espesor=100,
            posicion="fondo",
            color="red",
            parte="Pared");
    
    translate ([200,2730- 350-520,425]) color("red")
    tableroX(ancho=350,
            alto=350,
            espesor=200,
            posicion="fondo",
            color="red",
            parte="Pared");
    
//    translate ([0,4100,0]) color("lightslategray")
//    tableroX(ancho=1000,
//            alto=2900,
//            espesor=100,
//            posicion="lateral",
//            color="red",
//            parte="Pared");
//    translate ([1000,4100-180,0]) color("lightslategray")
//    tableroX(ancho=320,
//            alto=2900,
//            espesor=320,
//            posicion="lateral",
//            color="red",
//            parte="Pilar");
//    translate ([0,-100,0]) color("white")
//    tableroX(ancho=2300,
//            alto=2900,
//            espesor=100,
//            posicion="lateral",
//            color="red",
//            parte="Pared");
//    translate ([1000,870,0]) color("lightslategray")
//    tableroX(ancho=380,
//            alto=2900,
//            espesor=280,
//            posicion="lateral",
//            color="red",
//            parte="Pilar");
//    translate ([0,3250-400,0]) color("gainsboro")
//    tableroX(ancho=800,
//            alto=1880,
//            espesor=700,
//            posicion="fondo",
//            color="green",
//            parte="Frizer");                
}

//paredes();