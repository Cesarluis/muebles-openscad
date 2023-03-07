use <cajoneriaLibV1.scad>

espesor = 15; riel = 13;
socalo = 100;
// modulo(i) = [
//    ancho, alto, profundidad,
//    refuerzo, esqueleto, fondo, espesor,
//    color, [x,y+sum(modulo(i..i-1)[ancho]),z], nombre
//]
// Modulos Isla
mod_00 = [500,800,550,"No","Si","No",espesor,"red",
         [0,0,socalo], "Mod_Isla 1"];
mod_01 = [600,800,550,"No","Si","No",espesor,"red",
         [0,mod_00[0],socalo], "Mod_Isla 2"];
mod_02 = [500,800,550,"No","Si","No",espesor,"red",
         [0,mod_00[0]+mod_01[0],socalo], "Mod_Isla 3"];
         
mod_03 = [800,800,550,"No","Si","No",espesor,"red",
         [0,0,socalo], "Mod_Isla 4"];
mod_04 = [800,800,550,"No","Si","No",espesor,"red",
         [0,mod_03[0],socalo], "Mod_Isla 5"];         
         
Modulos_01 = [mod_00, mod_01, mod_02 ];
Modulos_02 = [mod_03, mod_04 ];

// modulos Columna-Cocina

mod_05 = [600,800,550,"No","Si","No",espesor,"red",
         [0,0,socalo], "Mod_Torre 1"];

mod_06 = [730,800,550,"No","Si","No",espesor,"red",
         [0,mod_05[0],socalo], "Mod_Cocina"];

mod_07 = [600,1500,550,"No","Si","No",espesor,"red",
         [0,0,mod_05[1]+socalo], "Mod_Torre 2"];

Modulos_03 = [mod_05, mod_06, mod_07 ];

// puerta = [moduloIndex, ancho, alto, cant, espesor, 
//    color, [x,y,z]], nombre
//]

puerta_00 = [7,mod_07[0]-10,650,1,espesor,"green",
            [mod_07[8][0]+mod_07[2],
                mod_07[8][1]+5,
                mod_07[8][2]+850], 
            "puerta 1"];
puerta_01 = [1,mod_01[0]-10,mod_01[1]-10,1,espesor,"green",
            [mod_01[8][0]+mod_01[2],
                mod_01[8][1]+5,
                mod_01[8][2]], 
            "puerta 2"];
PuertasX = [
        puerta_00, //puerta_01
    ];

div_00 = [7,mod_07[0]-10,mod_07[2]-5,1,espesor,"green",
            [mod_07[8][0],
                mod_07[8][1]+5,
                mod_07[8][2]+500], 
            "division 1"];
div_01 = [7,mod_07[0]-10,mod_07[2]-5,1,espesor,"green",
            [mod_07[8][0],
                mod_07[8][1]+5,
                mod_07[8][2]+850], 
            "division 2"];
            
div_02 = [7,mod_07[0]-10,mod_07[2]-5,1,espesor,"green",
            [mod_07[8][0],
                mod_07[8][1]+5,
                mod_07[8][2]+1150], 
            "division 2"];
            
Divisiones = [
            div_00, div_01, div_02
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
esp_riel = espesor*2+riel*2;
altoCajon1 = 200;
cajon_00 = [0, mod_00[0]-esp_riel, altoCajon1, mod_00[2]-50,
          espesor, "blue", "Si", mod_00[0]-4, 
          altoCajon1+50,"green", 
          [mod_00[8][0]+50,
            mod_00[8][1]+espesor+riel,
            mod_00[8][2]+espesor]];
            
cajon_01 = [0, mod_00[0]-esp_riel, altoCajon1, mod_00[2]-50,
          espesor, "red", "Si", mod_00[0]-4, 
          altoCajon1+50,"green", 
          [mod_00[8][0]+50,
            mod_00[8][1]+espesor+riel,
            mod_00[8][2]+espesor+altoCajon1+50+2*2]];

cajon_02 = [0, mod_00[0]-esp_riel, altoCajon1, mod_00[2]-50,
          espesor, "red", "Si", mod_00[0]-4, 
          altoCajon1+50,"green", 
          [mod_00[8][0]+50,
            mod_00[8][1]+espesor+riel,
            mod_00[8][2]+espesor+(altoCajon1+50)*2+2*3+6]];
///////
cajon_03 = [1, mod_01[0]-esp_riel, altoCajon1, mod_01[2]-50,
          espesor, "blue", "Si", mod_01[0]-4, 
          altoCajon1+50,"green", 
          [mod_01[8][0]+50,
            mod_01[8][1]+espesor+riel,
            mod_01[8][2]+espesor]];
            
cajon_04 = [1, mod_01[0]-esp_riel, altoCajon1, mod_01[2]-50,
          espesor, "red", "Si", mod_01[0]-4, 
          altoCajon1+50,"green", 
          [mod_01[8][0]+50,
            mod_01[8][1]+espesor+riel,
            mod_01[8][2]+espesor+altoCajon1+50+2*2]];

cajon_05 = [1, mod_01[0]-esp_riel, altoCajon1, mod_01[2]-50,
          espesor, "red", "Si", mod_01[0]-4, 
          altoCajon1+50,"green", 
          [mod_01[8][0]+50,
            mod_01[8][1]+espesor+riel,
            mod_01[8][2]+espesor+(altoCajon1+50)*2+2*3+6]];
//////
cajon_06 = [1, mod_02[0]-esp_riel, altoCajon1, mod_02[2]-50,
          espesor, "blue", "Si", mod_02[0]-4, 
          altoCajon1+50,"green", 
          [mod_02[8][0]+50,
            mod_02[8][1]+espesor+riel,
            mod_02[8][2]+espesor]];
            
cajon_07 = [1, mod_02[0]-esp_riel, altoCajon1, mod_02[2]-50,
          espesor, "red", "Si", mod_02[0]-4, 
          altoCajon1+50,"green", 
          [mod_02[8][0]+50,
            mod_02[8][1]+espesor+riel,
            mod_02[8][2]+espesor+altoCajon1+50+2*2]];

cajon_08 = [1, mod_02[0]-esp_riel, altoCajon1, mod_02[2]-50,
          espesor, "red", "Si", mod_02[0]-4, 
          altoCajon1+50,"green", 
          [mod_02[8][0]+50,
            mod_02[8][1]+espesor+riel,
            mod_02[8][2]+espesor+(altoCajon1+50)*2+2*3+6]];


Cajones_00 = [
    cajon_00, cajon_01, cajon_02,
    cajon_03, cajon_04, cajon_05,
    cajon_06, cajon_07, cajon_08,
];

altoCajon2 = 300;
altoCajon3 = 150;
cajon_09 = [0, mod_03[0]-esp_riel, altoCajon2, mod_03[2]-50,
          espesor, "blue", "Si", mod_03[0]-4, 
          altoCajon2+50,"green", 
          [mod_03[8][0]+50,
            mod_03[8][1]+espesor+riel,
            mod_03[8][2]+espesor]];
            
cajon_10 = [0, mod_03[0]-esp_riel, altoCajon3, mod_03[2]-50,
          espesor, "red", "Si", mod_03[0]-4, 
          altoCajon3+50,"green", 
          [mod_03[8][0]+50,
            mod_03[8][1]+espesor+riel,
            mod_03[8][2]+espesor+altoCajon2+50+2*2]];
cajon_11 = [1, mod_03[0]-esp_riel, altoCajon3, mod_03[2]-50,
          espesor, "red", "Si", mod_03[0]-4, 
          altoCajon3+50,"green", 
          [mod_03[8][0]+50,
            mod_03[8][1]+espesor+riel,
            mod_03[8][2]+espesor+altoCajon3+altoCajon2+50*2+2*3+6]];
////////
cajon_12 = [4, mod_04[0]-esp_riel, altoCajon2, mod_04[2]-50,
          espesor, "blue", "Si", mod_04[0]-4, 
          altoCajon2+50,"green", 
          [mod_04[8][0]+50,
            mod_04[8][1]+espesor+riel,
            mod_04[8][2]+espesor]];
            
cajon_13 = [0, mod_04[0]-esp_riel, altoCajon3, mod_04[2]-50,
          espesor, "red", "Si", mod_04[0]-4, 
          altoCajon3+50,"green", 
          [mod_04[8][0]+50,
            mod_04[8][1]+espesor+riel,
            mod_04[8][2]+espesor+altoCajon2+50+2*2]];
cajon_14 = [1, mod_04[0]-esp_riel, altoCajon3, mod_04[2]-50,
          espesor, "red", "Si", mod_04[0]-4, 
          altoCajon3+50,"green", 
          [mod_04[8][0]+50,
            mod_04[8][1]+espesor+riel,
            mod_04[8][2]+espesor+altoCajon3+altoCajon2+50*2+2*3+6]];

Cajones_01 = [
    cajon_09, cajon_10, cajon_11,
    cajon_12, cajon_13, cajon_14,
    
];
/// Cajones torre
cajon_15 = [5, mod_05[0]-esp_riel, altoCajon1, mod_05[2]-50,
          espesor, "blue", "Si", mod_05[0]-4, 
          altoCajon1+50,"green", 
          [mod_05[8][0]+50,
            mod_05[8][1]+espesor+riel,
            mod_05[8][2]+espesor]];
            
cajon_16 = [5, mod_05[0]-esp_riel, altoCajon1, mod_05[2]-50,
          espesor, "red", "Si", mod_05[0]-4, 
          altoCajon1+50,"green", 
          [mod_05[8][0]+50,
            mod_05[8][1]+espesor+riel,
            mod_05[8][2]+espesor+altoCajon1+50+2*2]];

cajon_17 = [5, mod_05[0]-esp_riel, altoCajon1, mod_05[2]-50,
          espesor, "red", "Si", mod_05[0]-4, 
          altoCajon1+50,"green", 
          [mod_05[8][0]+50,
            mod_05[8][1]+espesor+riel,
            mod_05[8][2]+espesor+(altoCajon1+50)*2+2*3+6]];
// Cajones modulo cocina
cajon_18 = [6, mod_06[0]-esp_riel, altoCajon1, mod_06[2]-50,
          espesor, "blue", "Si", mod_06[0]-4, 
          altoCajon1+50,"green", 
          [mod_06[8][0]+50,
            mod_06[8][1]+espesor+riel,
            mod_06[8][2]+espesor]];
            
cajon_19 = [6, mod_06[0]-esp_riel, altoCajon1, mod_06[2]-50,
          espesor, "red", "Si", mod_06[0]-4, 
          altoCajon1+50,"green", 
          [mod_06[8][0]+50,
            mod_06[8][1]+espesor+riel,
            mod_06[8][2]+espesor+altoCajon1+50+2*2]];

cajon_20 = [6, mod_06[0]-esp_riel, altoCajon1, mod_06[2]-50,
          espesor, "red", "Si", mod_06[0]-4, 
          altoCajon1+50,"green", 
          [mod_06[8][0]+50,
            mod_06[8][1]+espesor+riel,
            mod_06[8][2]+espesor+(altoCajon1+50)*2+2*3+6]];

Cajones_02 = [
    cajon_15, cajon_16, cajon_17,
    cajon_18, cajon_19, cajon_20,
    
];

translate([2000,1000,0])
union(){
    echo("Inicia Isla");
    union(){
        modulosdeCocina(Modulos_01);
        cajonesdeModulo(Cajones_00);
        }
    translate([0,1600,0]) rotate([0,0,180])    
    union(){
        modulosdeCocina(Modulos_02);
        cajonesdeModulo(Cajones_01);
    }
    echo("Fin Isla");
}
union(){
        modulosdeCocina(Modulos_03);
        cajonesdeModulo(Cajones_02);
        divHorizontal(Divisiones); 
        puertasdeModulo(PuertasX);
    }




//armariodeModulo(armario_00);

//socalo(socalo_00);


