use <cajoneriaLibV1.scad>
espesor = 15; riel = 13;
socalo = 100;
// modulo(i) = [
//    ancho, alto, profundidad,
//    refuerzo, esqueleto, fondo, espesor,
//    color, [x,y+sum(modulo(i..i-1)[ancho]),z], nombre
//]
// Modulos anchos sumados 1860
mod_00 = [860,1900,500,"No","No","No",espesor,"white",
         [0,0,socalo], "Modulo 1"];
mod_01 = [600,1900,500,"No","No","No",espesor,"white",
         [0,mod_00[0],socalo], "Modulo 2"];
mod_02 = [410,1900,500,"No","No","No",espesor,"white",
         [0,mod_00[0]+mod_01[0],socalo], "Modulo 3"];
         
         
mod_03 = [860,800,600,"No","No","No",espesor,"white",
         [0,0,socalo+mod_00[1]], "Modulo 1 sup"];
mod_04 = [860+150,800,600,"No","No","No",espesor,"white",
         [0,mod_03[0],socalo+mod_00[1]], "Modulo 2 sup"];


ModulosX = [mod_00, mod_01, mod_02, mod_03, mod_04 ];

// puerta = [moduloIndex, ancho, alto, cant, espesor, 
//    color, [x,y,z]], nombre
//]

puerta_00 = [0,mod_00[0]-26-15,
            mod_00[1]-32-30,1,
            espesor,"brown",
            [mod_00[8][0]+20+mod_00[2],
                mod_00[8][1]+15,
                mod_00[8][2]+5
                 ], 
            "puerta 1"];
puerta_01 = [1,mod_01[0]-26-15+(mod_02[0]-150),
            mod_01[1]-32-30,1,
            espesor,"brown",
            [mod_01[8][0]+40+mod_01[2],
                mod_01[8][1]-15,
                mod_01[8][2]+5], 
            "puerta 2"];
            
puerta_02 = [0,mod_03[0]-26-15,
            mod_03[1]-32-15,1,
            espesor,"brown",
            [mod_03[8][0]-20+mod_03[2],
                mod_03[8][1]+15,
                mod_03[8][2]+5], 
            "puerta 3"];
puerta_03 = [1,mod_04[0]-26-15-150 ,
            mod_04[1]-32-15,1,
            espesor,"brown",
            [mod_04[8][0]-40+mod_04[2],
                mod_04[8][1]-15,
                mod_04[8][2]+20], 
            "puerta 4"];
             
PuertasX = [
        puerta_00, puerta_01,
        puerta_02, puerta_03
    ];


div_00 = [0,mod_00[0]-10,mod_00[2]-5,1,espesor,"white",
            [mod_00[8][0],
                mod_00[8][1]+5,
                mod_00[8][2]+900], 
            "division 1 mod 1",
            "piso"];

div_01 = [0,mod_00[2],900,1,espesor,"white",
            [mod_00[8][0],
                mod_00[8][1]+380,
                mod_00[8][2]], 
            "division 2 mod 1",
            "lateral"];
            
div_02 = [1,mod_01[0]-10,mod_01[2]-5,1,espesor,"white",
            [mod_01[8][0],
                mod_01[8][1]+5,
                mod_01[8][2]+900], 
            "division 3 mod 2",
            "piso"];
Divisiones = [
            div_00, div_01,div_02
];

div_03 = [0,mod_02[0]-10,mod_02[2]-5,1,espesor,"white",
            [mod_02[8][0],
                mod_02[8][1]+5,
                mod_02[8][2]+300], 
            "division 4 mod 3",
            "piso"];
div_04 = [0,mod_02[0]-10,mod_02[2]-5,1,espesor,"white",
            [mod_02[8][0],
                mod_02[8][1]+5,
                mod_02[8][2]+600], 
            "division 5 mod 3",
            "piso"];

div_05 = [0,mod_02[0]-10,mod_02[2]-5,1,espesor,"white",
            [mod_02[8][0],
                mod_02[8][1]+5,
                mod_02[8][2]+900], 
            "division 6 mod 3",
            "piso"];

div_06 = [0,mod_02[0]-10,mod_02[2]-5,1,espesor,"white",
            [mod_02[8][0],
                mod_02[8][1]+5,
                mod_02[8][2]+1200], 
            "division 4 mod 3",
            "piso"];
            
div_07 = [0,mod_02[0]-10,mod_02[2]-5,1,espesor,"white",
            [mod_02[8][0],
                mod_02[8][1]+5,
                mod_02[8][2]+1500], 
            "division 5 mod 3",
            "piso"];

div_08 = [0,mod_02[0]-10,mod_02[2]-5,1,espesor,"white",
            [mod_02[8][0],
                mod_02[8][1]+5,
                mod_02[8][2]+1800], 
            "division 6 mod 3",
            "piso"];

div_09 = [0,mod_03[0]-10,mod_03[2]-5-100,1,espesor,"white",
            [mod_03[8][0],
                mod_03[8][1]+5,
                mod_03[8][2]+400], 
            "division 7 mod 4",
            "piso"];
div_10 = [0,mod_04[0]-10,mod_04[2]-5-100,1,espesor,"white",
            [mod_04[8][0],
                mod_04[8][1]+5,
                mod_04[8][2]+400], 
            "division 8 mod 5",
            "piso"];

Divisiones_01 = [
            div_03, div_04,div_05,
            div_06, div_07,div_08,
            div_09, div_10
];


//armario_00 = [moduloIndex, ancho, alto, profundidad,
//            espesor, color, divisiones, [x,y,z]];

armario_00 = [2, mod_00[0]-espesor*2, 500, mod_02[2]-espesor-6,
            espesor, "white", (1+1),
            [mod_00[8][0]+espesor*2,
                mod_00[8][1]+espesor,
                mod_00[8][2]+150],
            "Armario 1"];

socalo_00 = [0, 500, 1870, socalo,
            espesor, "brown", (4+2),
            [0,0,0],
            "Socalo 1"];

// cajon_00 = [moduloIndex, ancho, alto, profundidad,
//          espesor, color, frenteDec, anchoDec, altoDec, 
//          colorDec, [x,y,z]]


cajon_00 = [1, mod_01[0]-espesor*2-riel*2, 200, mod_01[2]-50,
          espesor, "white", "Si", mod_01[0]-espesor*2, 
          250,"yellow", 
          [mod_01[8][0]+50,
            mod_01[8][1]+espesor+riel,
            mod_01[8][2]+espesor]];
cajon_01 = [1, mod_01[0]-espesor*2-riel*2, 200, mod_01[2]-50,
          espesor, "white", "Si", mod_01[0]-espesor*2, 
          250,"yellow", 
          [mod_01[8][0]+50,
            mod_01[8][1]+espesor+riel,
            mod_01[8][2]+espesor+250+2]];
cajon_02 = [1, mod_01[0]-espesor*2-riel*2, 200, mod_01[2]-50,
          espesor, "white", "Si", mod_01[0]-espesor*2, 
          250,"yellow", 
          [mod_01[8][0]+50,
            mod_01[8][1]+espesor+riel,
            mod_01[8][2]+espesor+(250+2)*2]];
cajon_03 = [1, mod_01[0]-espesor*2-riel*2, 120, mod_01[2]-50,
          espesor, "white", "Si", mod_01[0]-espesor*2, 
          150,"yellow", 
          [mod_01[8][0]+50,
            mod_01[8][1]+espesor+riel,
            mod_01[8][2]+espesor+(250+2)*3]];            


CajonesX = [
    cajon_00, cajon_01, cajon_02, cajon_03
];

cajon_10 = [1, mod_00[0]-espesor*2-riel*2-380, 200, mod_00[2]-50,
          espesor, "white", "Si", mod_00[0]-espesor*2-380, 
          250,"yellow", 
          [mod_00[8][0]+50,
            mod_00[8][1]+espesor+riel+380,
            mod_00[8][2]+espesor]];
cajon_11 = [1, mod_00[0]-espesor*2-riel*2-380, 200, mod_00[2]-50,
          espesor, "white", "Si", mod_00[0]-espesor*2-380, 
          250,"yellow", 
          [mod_00[8][0]+50,
            mod_00[8][1]+espesor+riel+380,
            mod_00[8][2]+espesor+250+2]];
cajon_12 = [1, mod_00[0]-espesor*2-riel*2-380, 200, mod_00[2]-50,
          espesor, "white", "Si", mod_00[0]-espesor*2-380, 
          250,"yellow", 
          [mod_00[8][0]+50,
            mod_00[8][1]+espesor+riel+380,
            mod_00[8][2]+espesor+(250+2)*2]];
cajon_13 = [1, mod_00[0]-espesor*2-riel*2-380, 130, mod_00[2]-50,
          espesor, "white", "Si", mod_00[0]-espesor*2-380, 
          150,"yellow", 
          [mod_00[8][0]+50,
            mod_00[8][1]+espesor+riel+380,
            mod_00[8][2]+espesor+(250+2)*3]];

CajonesX_01 = [
    cajon_10, cajon_11, cajon_12, 
    cajon_13,
];

//CajonY = [anchoCajon=400, altoCajon=800, 
//            profundoCajon=500, 
//            espesor=15, color="green",
//            frente="Si",
//            altoFrente=815, anchoPlus=520,
//            colorFrente= "red"];
CajonY_01 = [380-13, 860, 450, 
            15, "white",
            "Si",
            900, 380,
            "white"];
modulosdeCocina(ModulosX);
puertasdeModulo(PuertasX);
divisiones(Divisiones); 
divisiones(Divisiones_01); 
socalo(socalo_00);
cajonesdeModulo(CajonesX);
cajonesdeModulo(CajonesX_01);

translate([50,+13,socalo+20])
cajonY(CajonY_01[0],CajonY_01[1],CajonY_01[2],
        CajonY_01[3],CajonY_01[4],CajonY_01[5],
        CajonY_01[6],CajonY_01[7],CajonY_01[8]
        );
        