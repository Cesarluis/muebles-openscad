use <cajoneriaLibV1.scad>

module paredes(){
    translate ([-100,0,0]) color("lightslategray")
    tableroX(ancho=4100,
            alto=2900,
            espesor=100,
            posicion="fondo",
            color="red",
            parte="Pared");
    translate ([0,4100,0]) color("lightslategray")
    tableroX(ancho=1000,
            alto=2900,
            espesor=100,
            posicion="lateral",
            color="red",
            parte="Pared");
//    translate ([1000,4100-180,0]) color("lightslategray")
//    tableroX(ancho=320,
//            alto=2900,
//            espesor=320,
//            posicion="lateral",
//            color="red",
//            parte="Pilar");
    translate ([0,-100,0]) color("white")
    tableroX(ancho=2300,
            alto=2900,
            espesor=100,
            posicion="lateral",
            color="red",
            parte="Pared");
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
module muromeson(){
    tableroX(ancho=550,
            alto=900,
            espesor=144,
            posicion="lateral",
            color="red",
            parte="Pared");
    }
module encimerameson(ancho){
    tableroX(ancho=ancho,
            alto=600,
            espesor=50,
            posicion="techo",
            color="red",
            parte="Pared");
    }

espesor = 15; riel = 13;
socalo = 100;
espacioFrizer = 900;
// modulo(i) = [
//    ancho, alto, profundidad,
//    refuerzo, esqueleto, fondo, espesor,
//    color, [x,y+sum(modulo(i..i-1)[ancho]),z], nombre
//]

mod_00 = [760,730,550,"No","Si","No",espesor,"ghostwhite",
         [0,0,socalo], "Modulo 00"];
mod_01 = [790,730,550,"No","Si","No",espesor,"ghostwhite",
         [0,mod_00[0]+140,socalo], "Modulo 01"];


mod_02 = [310,730,550,"No","Si","No",espesor,"ghostwhite",
         [0,0,socalo], "Modulo 02"];
mod_03 = [460,730,550,"No","Si","No",espesor,"ghostwhite",
         [0,mod_02[0]+312+700,socalo], "Modulo 03"];
mod_04 = [460,730,550,"No","Si","No",espesor,"ghostwhite",
         [0,mod_02[0]+mod_03[0]+312+700,socalo], "Modulo 04"];

/////Modulos Altos
altura_mod = 1100;

mod_05 = [540,660,400,"No","No","Si",espesor,"ghostwhite",
         [0,0,altura_mod], "Modulo 00"];
mod_06 = [540,660,400,"No","No","Si",espesor,"ghostwhite",
         [0,mod_05[0],altura_mod], "Modulo 01"];
mod_07 = [600,560,400,"No","No","Si",espesor,"ghostwhite",
         [0,mod_05[0]+mod_06[0],altura_mod+100], "Modulo 00"];
mod_08 = [600,660,400,"No","No","Si",espesor,"ghostwhite",
         [0,mod_05[0]+mod_06[0]+mod_07[0],altura_mod], "Modulo 01"];

mod_09 = [600,660,400,"No","No","Si",espesor,"ghostwhite",
         [0,mod_05[0]+mod_06[0]+mod_07[0]+mod_08[0],altura_mod], "Modulo 01"];


mod_10 = [550,660,350,"No","No","Si",espesor,"ghostwhite",
         [0,0,altura_mod], "Modulo 00"];
mod_11 = [550,660,350,"No","No","Si",espesor,"ghostwhite",
         [0,mod_05[0],altura_mod], "Modulo 01"];
mod_12 = [600,660,350,"No","No","Si",espesor,"ghostwhite",
         [0,mod_05[0]+mod_06[0],altura_mod], "Modulo 00"];



ModulosLavaPlatos = [mod_00, mod_01];
ModulosCocina = [mod_02, mod_03, mod_04];
ModulosAltos = [mod_05, mod_06, mod_07,
                mod_08, mod_09 
];
ModulosAltos2= [mod_10, mod_11, //mod_12,
];


esp_riel = espesor*2+riel*2;
// cajon_00 = [moduloIndex, ancho, alto, profundidad,
//          espesor, color, frenteDec, anchoDec, altoDec, 
//          colorDec, [x,y,z]]

cajon_00 = [0, mod_00[0]-esp_riel, 180, mod_00[2]-50,
          espesor, "red", "Si", mod_00[0]-espesor*2, 
          230,"green", 
          [mod_00[8][0]+50,
            mod_00[8][1]+espesor+riel,
            mod_00[8][2]+espesor]];
            
cajon_01 = [0, mod_00[0]-esp_riel, 180, mod_00[2]-50,
          espesor, "red", "Si", mod_00[0]-espesor*2, 
          230,"green", 
          [mod_00[8][0]+50,
            mod_00[8][1]+espesor+riel,
            mod_00[8][2]+espesor+230+2]];

cajon_02 = [0, mod_00[0]-esp_riel, 180, mod_00[2]-50,
          espesor, "red", "Si", mod_00[0]-espesor*2, 
          230,"green", 
          [mod_00[8][0]+50,
            mod_00[8][1]+espesor+riel,
            mod_00[8][2]+espesor+230*2+2*2]];

cajon_03 = [1, mod_01[0]-esp_riel, 280, mod_01[2]-150,
          espesor, "red", "Si", mod_01[0]-espesor*2, 
          390,"green", 
          [mod_01[8][0]+150,
            mod_01[8][1]+espesor+riel,
            mod_01[8][2]+espesor]];
            
cajon_04 = [1, mod_01[0]-esp_riel, 150, mod_01[2]-150,
          espesor, "red", "Si", mod_01[0]-espesor*2, 
          300,"green", 
          [mod_01[8][0]+150,
            mod_01[8][1]+espesor+riel,
            mod_01[8][2]+espesor+390+2]];
//////////////////////////////

cajon_05 = [2, mod_02[0]-esp_riel, 180, mod_02[2]-50,
          espesor, "red", "Si", mod_02[0]-espesor*2, 
          230,"green", 
          [mod_02[8][0]+50,
            mod_02[8][1]+espesor+riel,
            mod_02[8][2]+espesor]];
            
cajon_06 = [2, mod_02[0]-esp_riel, 180, mod_02[2]-50,
          espesor, "red", "Si", mod_02[0]-espesor*2, 
          230,"green", 
          [mod_02[8][0]+50,
            mod_02[8][1]+espesor+riel,
            mod_02[8][2]+espesor+230+2]];

cajon_07 = [2, mod_02[0]-esp_riel, 180, mod_02[2]-50,
          espesor, "red", "Si", mod_02[0]-espesor*2, 
          230,"green", 
          [mod_02[8][0]+50,
            mod_02[8][1]+espesor+riel,
            mod_02[8][2]+espesor+230*2+2*2]];

cajon_08 = [3, mod_03[0]-esp_riel, 180, mod_03[2]-50,
          espesor, "red", "Si", mod_03[0]-espesor*2, 
          230,"green", 
          [mod_03[8][0]+50,
            mod_03[8][1]+espesor+riel,
            mod_03[8][2]+espesor]];
            
cajon_09 = [3, mod_03[0]-esp_riel, 180, mod_03[2]-50,
          espesor, "red", "Si", mod_03[0]-espesor*2, 
          230,"green", 
          [mod_03[8][0]+50,
            mod_03[8][1]+espesor+riel,
            mod_03[8][2]+espesor+230+2]];

cajon_10 = [3, mod_03[0]-esp_riel, 180, mod_03[2]-50,
          espesor, "red", "Si", mod_03[0]-espesor*2, 
          230,"green", 
          [mod_03[8][0]+50,
            mod_03[8][1]+espesor+riel,
            mod_03[8][2]+espesor+230*2+2*2]];

cajon_11 = [4, mod_04[0]-esp_riel, 180, mod_04[2]-50,
          espesor, "red", "Si", mod_04[0]-espesor*2, 
          230,"green", 
          [mod_04[8][0]+50,
            mod_04[8][1]+espesor+riel,
            mod_04[8][2]+espesor]];
            
cajon_12 = [4, mod_04[0]-esp_riel, 180, mod_04[2]-50,
          espesor, "red", "Si", mod_04[0]-espesor*2, 
          230,"green", 
          [mod_04[8][0]+50,
            mod_04[8][1]+espesor+riel,
            mod_04[8][2]+espesor+230+2]];

cajon_13 = [4, mod_04[0]-esp_riel, 180, mod_04[2]-50,
          espesor, "red", "Si", mod_04[0]-espesor*2, 
          230,"green", 
          [mod_04[8][0]+50,
            mod_04[8][1]+espesor+riel,
            mod_04[8][2]+espesor+230*2+2*2]];


CajonesModLavaPlatos = [
    cajon_00, cajon_01, cajon_02,
    cajon_03, cajon_04
];
CajonesModCocina = [
   cajon_05, cajon_06, cajon_07, 
   cajon_08, cajon_09, cajon_10, 
   cajon_11, cajon_12, cajon_13, 
];

// puerta = [moduloIndex, ancho, alto, cant, espesor, 
//    color, [x,y,z]], nombre
//]

puerta_00 = [5,mod_05[0]-5,mod_05[1]-5,1,espesor,"green",
            [mod_05[8][0]+mod_05[2],
                mod_05[8][1]+5,
                mod_05[8][2]], 
            "puerta 1"];
puerta_01 = [6,mod_06[0]-5,mod_06[1]-5,1,espesor,"green",
            [mod_06[8][0]+mod_06[2],
                mod_06[8][1]+5,
                mod_06[8][2]], 
            "puerta 2"];
puerta_02 = [7,mod_07[0]-5,mod_07[1]-5,1,espesor,"green",
            [mod_07[8][0]+mod_07[2],
                mod_07[8][1]+5,
                mod_07[8][2]], 
            "puerta 2"];
puerta_03 = [8,mod_08[0]-5,mod_08[1]-5,1,espesor,"green",
            [mod_08[8][0]+mod_08[2],
                mod_08[8][1]+5,
                mod_08[8][2]], 
            "puerta 2"];
puerta_04 = [9,mod_09[0]-5,mod_09[1]-350,1,espesor,"green",
            [mod_09[8][0]+mod_09[2],
                mod_09[8][1]+5,
                mod_09[8][2]+350-5], 
            "puerta 2"];

///
puerta_05 = [10,mod_10[0]-15,mod_10[1]-5,1,espesor,"green",
            [mod_10[8][0]+mod_10[2],
                mod_10[8][1]+5,
                mod_10[8][2]], 
            "puerta 1"];
puerta_06 = [11,mod_11[0]-15,mod_11[1]-5,1,espesor,"green",
            [mod_11[8][0]+mod_11[2],
                mod_11[8][1]+5,
                mod_11[8][2]], 
            "puerta 2"];
puerta_07 = [12,mod_12[0]-15,mod_12[1]-5,1,espesor,"green",
            [mod_12[8][0]+mod_12[2],
                mod_12[8][1]+5,
                mod_12[8][2]], 
            "puerta 2"];


PuertasModAlto = [puerta_00, puerta_01,
                puerta_02, puerta_03,
                puerta_04, 
            ];

PuertasModAlto2 = [puerta_05, puerta_06,
                //puerta_07 
            ];


div_00 = [0,mod_05[0]-espesor*2,mod_05[2]-espesor-7,1,espesor,"green",
            [mod_05[8][0]+espesor+10,
                mod_05[8][1]+espesor,
                mod_05[8][2]+300], 
            "division 1"];
div_01 = [1,mod_06[0]-espesor*2,mod_06[2]-espesor-7,1,espesor,"green",
            [mod_06[8][0]+espesor+10,
                mod_06[8][1]+espesor,
                mod_06[8][2]+300], 
            "division 2"];
div_02 = [0,mod_07[0]-espesor*2,mod_07[2]-espesor-7,1,espesor,"green",
            [mod_07[8][0]+espesor+10,
                mod_07[8][1]+espesor,
                mod_07[8][2]+300], 
            "division 3"];
div_03 = [1,mod_08[0]-espesor*2,mod_08[2]-espesor-7,1,espesor,"green",
            [mod_08[8][0]+espesor+10,
                mod_08[8][1]+espesor,
                mod_08[8][2]+300], 
            "division 4"];
div_04 = [0,mod_09[0]-espesor*2,mod_09[2]-espesor-7,1,espesor,"green",
            [mod_09[8][0]+espesor+10,
                mod_09[8][1]+espesor,
                mod_09[8][2]+350], 
            "division 5"];
div_05 = [0,mod_10[0]-espesor*2,mod_10[2]-espesor-7,1,espesor,"green",
            [mod_10[8][0]+espesor+10,
                mod_10[8][1]+espesor,
                mod_10[8][2]+300], 
            "division 1"];
div_06 = [1,mod_11[0]-espesor*2,mod_11[2]-espesor-7,1,espesor,"green",
            [mod_11[8][0]+espesor+10,
                mod_11[8][1]+espesor,
                mod_11[8][2]+300], 
            "division 2"];
div_07 = [0,mod_12[0]-espesor*2,mod_12[2]-espesor-7,1,espesor,"green",
            [mod_12[8][0]+espesor+10,
                mod_12[8][1]+espesor,
                mod_12[8][2]+300], 
            "division 3"];


Divisiones = [
            div_00, div_01, div_02,         div_03, div_04
];
Divisiones2 = [
            div_05, div_06, //div_07,
];

translate([0,0,0])
union(){
    translate([0,760,0])
    muromeson();
    translate([0,1700,0])
    muromeson();
    //translate([0,0,850])
    //encimerameson(2750);
    modulosdeCocina(ModulosLavaPlatos);
//    puertasdeModulo(PuertasX,cortes);
//    armariodeModulo(armario_00);
    cajonesdeModulo(CajonesModLavaPlatos);
}           
translate([550,2750,0]) rotate([0,0,270]) 
union(){
    translate([0,315,0])
    muromeson();
    translate([0,1180,0])
    muromeson();
    translate([0,2245,0])
    muromeson();
    translate([0,0,850])
    encimerameson(460);
    translate([0,1180,850])
    encimerameson(1210);
    modulosdeCocina(ModulosCocina);
//    puertasdeModulo(PuertasX,cortes);
//    armariodeModulo(armario_00);
    cajonesdeModulo(CajonesModCocina);
}           

translate([0,2750,0]) rotate([0,0,270]) 
union(){
    modulosdeCocina(ModulosAltos);
    divHorizontal(Divisiones); 
    puertasdeModulo(PuertasModAlto);
//    armariodeModulo(armario_00);
    
}           

translate([1100,0,0]) rotate([0,0,90]) 
union(){
    modulosdeCocina(ModulosAltos2);
    divHorizontal(Divisiones2); 
    puertasdeModulo(PuertasModAlto2);
//    armariodeModulo(armario_00);
    
}           