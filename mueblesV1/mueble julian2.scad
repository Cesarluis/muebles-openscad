use <cajoneriaLibV1.scad>
espesor = 15; riel = 13;
socalo = 100;
// modulo(i) = [
//    ancho, alto, profundidad,
//    refuerzo, esqueleto, fondo, espesor,
//    color, [x,y+sum(modulo(i..i-1)[ancho]),z], nombre
//]
// Modulos anchos sumados 1860
mod_00 = [860,800,630,"No","Si","No",espesor,"White",
         [0,0,socalo], "ModBajo 1"];
mod_01 = [600,800,610,"No","Si","No",espesor,"White",
         [0,mod_00[0],socalo], "ModBajo 2"];
mod_02 = [410,800,610,"No","No","No",espesor,"White",
         [0,mod_00[0]+mod_01[0],socalo], "ModBajo 3"];
         
mod_03 = [860,1900,630,"No","No","Si",espesor,"White",
         [0,0,socalo+mod_00[1]], "ModAlto 1 +10 al fondo"];
mod_04 = [860+150,1900,610,"No","No","Si",espesor,"White",
         [0,mod_03[0],socalo+mod_00[1]], "ModAlto 2 +10 al fondo"];

ModulosX = [mod_00, mod_01, mod_02, mod_03, mod_04, 
];

// puerta = [moduloIndex, ancho, alto, cant, espesor, 
//    color, [x,y,z]], nombre
//]

puerta_00 = [0,mod_02[0]-150,
            mod_02[1]-15,1,
            espesor,"Yellow",
            [mod_02[8][0]+mod_02[2],
                mod_02[8][1]+15,
                mod_02[8][2]+5 ], 
            "Puerta modBajo 2"];
//puerta_01 = [1,mod_01[0]-26-15+(mod_02[0]-150),
//            mod_01[1]-32-30,1,
//            espesor,"Yellow",
//            [mod_01[8][0]+40+mod_01[2],
//                mod_01[8][1]-15,
//                mod_01[8][2]+5], 
//            "puerta 2"];
            
puerta_02 = [0,mod_03[0]-26-15,
            mod_03[1]-32-15,1,
            espesor,"Yellow",
            [mod_03[8][0]-20+mod_03[2],
                mod_03[8][1]+15,
                mod_03[8][2]+5], 
            "puerta corre1"];
puerta_03 = [1,mod_04[0]-26-15-150 ,
            mod_04[1]-32-15,1,
            espesor,"Yellow",
            [mod_04[8][0]-40+mod_04[2],
                mod_04[8][1]-15,
                mod_04[8][2]+20], 
            "puerta corre2"];
             
            
PuertasX = [
        puerta_00, //puerta_01,
        puerta_02, 
        puerta_03
    ];
//div_X = [0,100,1700,
//            1,espesor,"BLUE",
//            [1000, 1000, 0], 
//            "ALTURA DE UNA PERSONA",
//            "lateral"];

div_00 = [0,mod_00[2],mod_00[1]-30,
            1,espesor,"White",
            [mod_00[8][0],
                mod_00[8][1]+380,
                mod_00[8][2]+15], 
            "div vert mod1",
            "lateral"];
div_01 = [0,mod_04[2]-100,mod_04[1]-1030,
            1,espesor,"White",
            [mod_04[8][0],
                mod_04[8][1]+590,
                mod_04[8][2]+1015], 
            "div vert mod2 sup",
            "lateral"];

            
div_02 = [1,mod_04[0]-30-590,
            mod_04[2]-100,1,espesor,"White",
            [mod_04[8][0],
                mod_04[8][1]+15+590,
                mod_04[8][2]+250], 
            "div hori mod2 sup",
            "piso"];
div_03 = [1,mod_04[0]-30-590,
            mod_04[2]-100,1,espesor,"White",
            [mod_04[8][0],
                mod_04[8][1]+15+590,
                mod_04[8][2]+500], 
            "div hori mod2 sup",
            "piso"];
div_04 = [1,mod_04[0]-30-590,
            mod_04[2]-100,1,espesor,"White",
            [mod_04[8][0],
                mod_04[8][1]+15+590,
                mod_04[8][2]+750], 
            "div hori mod2 sup",
            "piso"];
div_05 = [1,mod_04[0]-30,mod_04[2]-100,1,espesor,"White",
            [mod_04[8][0],
                mod_04[8][1]+15,
                mod_04[8][2]+1000], 
            "div hori mod2 sup",
            "piso"];
div_06 = [1,mod_04[0]-30,mod_04[2]-100,1,espesor,"White",
            [mod_04[8][0],
                mod_04[8][1]+15,
                mod_04[8][2]+1250], 
            "div hori mod2 sup",
            "piso"];
div_07 = [1,mod_04[0]-30,mod_04[2]-100,1,espesor,"White",
            [mod_04[8][0],
                mod_04[8][1]+15,
                mod_04[8][2]+1500], 
            "div hori mod2 sup",
            "piso"];

Divisiones = [ //div_X,
            div_00, 
            div_01,
            //div_02,div_03,div_04, 
            div_05,div_06,div_07
];

div_13 = [0,mod_02[0]-10,mod_02[2]-5,1,espesor,"White",
            [mod_02[8][0],
                mod_02[8][1]+5,
                mod_02[8][2]+250], 
            "div hori mod3 bajo",
            "piso"];
div_14 = [0,mod_02[0]-10,mod_02[2]-5,1,espesor,"White",
            [mod_02[8][0],
                mod_02[8][1]+5,
                mod_02[8][2]+500], 
            "div hori mod3 bajo",
            "piso"];

Divisiones_01 = [
            div_13, div_14,
];


//armario_00 = [moduloIndex, ancho, alto, profundidad,
//            espesor, color, divisiones, [x,y,z]];

armario_00 = [2, mod_00[0]-espesor*2, 500, mod_02[2]-espesor-6,
            espesor, "White", (1+1),
            [mod_00[8][0]+espesor*2,
                mod_00[8][1]+espesor,
                mod_00[8][2]+150],
            "Armario 1"];

socalo_00 = [0, 500, 1870, socalo,
            espesor, "White", (4+2),
            [0,0,0],
            "Socalo 1"];

// cajon_00 = [moduloIndex, ancho, alto, profundidad,
//          espesor, color, frenteDec, anchoDec, altoDec, 
//          colorDec, [x,y,z]]


cajon_00 = [1, mod_01[0]-espesor*2-riel*2, 200, mod_01[2]-50,
          espesor, "White", "Si", mod_01[0]-espesor*2, 
          250,"Yellow", 
          [mod_01[8][0]+50,
            mod_01[8][1]+espesor+riel,
            mod_01[8][2]+espesor]];
cajon_01 = [1, mod_01[0]-espesor*2-riel*2, 
            200, mod_01[2]-50,
          espesor, "White", "Si", 
          mod_01[0]-espesor*2, 
          250,"Yellow", 
          [mod_01[8][0]+50,
            mod_01[8][1]+espesor+riel,
            mod_01[8][2]+espesor+260+3]];
cajon_02 = [1, mod_01[0]-espesor*2-riel*2, 200, mod_01[2]-50,
          espesor, "White", "Si", mod_01[0]-espesor*2, 
          250,"Yellow", 
          [mod_01[8][0]+50,
            mod_01[8][1]+espesor+riel,
            mod_01[8][2]+espesor+(260+3)*2]];
cajon_03 = [1, mod_01[0]-espesor*2-riel*2, 120, mod_01[2]-50,
          espesor, "White", "Si", mod_01[0]-espesor*2, 
          150,"Yellow", 
          [mod_01[8][0]+50,
            mod_01[8][1]+espesor+riel,
            mod_01[8][2]+espesor+(260+3)*3]];            


CajonesX = [
    cajon_00, cajon_01, cajon_02, //cajon_03
];

cajon_10 = [1, mod_00[0]-espesor*2-riel*2-380, 200, mod_00[2]-50,
          espesor, "White", "Si", mod_00[0]-espesor*2-380, 
          250,"Yellow", 
          [mod_00[8][0]+50,
            mod_00[8][1]+espesor+riel+380,
            mod_00[8][2]+espesor]];
cajon_11 = [1, mod_00[0]-espesor*2-riel*2-380, 200, mod_00[2]-50,
          espesor, "White", "Si", mod_00[0]-espesor*2-380, 
          250,"Yellow", 
          [mod_00[8][0]+50,
            mod_00[8][1]+espesor+riel+380,
            mod_00[8][2]+espesor+260+3]];
cajon_12 = [1, mod_00[0]-espesor*2-riel*2-380, 200, mod_00[2]-50,
          espesor, "White", "Si", mod_00[0]-espesor*2-380, 
          250,"Yellow", 
          [mod_00[8][0]+50,
            mod_00[8][1]+espesor+riel+380,
            mod_00[8][2]+espesor+(260+3)*2]];
cajon_13 = [1, mod_00[0]-espesor*2-riel*2-380, 130, mod_00[2]-50,
          espesor, "White", "Si", mod_00[0]-espesor*2-380, 
          150,"Yellow", 
          [mod_00[8][0]+50,
            mod_00[8][1]+espesor+riel+380,
            mod_00[8][2]+espesor+(260+3)*3]];

CajonesX_01 = [
    cajon_10, cajon_11, cajon_12, 
    //cajon_13,
];

//CajonY = [anchoCajon=400, altoCajon=800, 
//            profundoCajon=500, 
//            espesor=15, color="green",
//            frente="Si",
//            altoFrente=815, anchoPlus=520,
//            colorFrente= "red"];

CajonY_01 = [380-13-15, 750, 550, 
            15, "White",
            "Si",
            770, 380,
            "Yellow"];

modulosdeCocina(ModulosX);
//puertasdeModulo(PuertasX);
divisiones(Divisiones); 
divisiones(Divisiones_01); 
socalo(socalo_00);
//cajonesdeModulo(CajonesX);
//cajonesdeModulo(CajonesX_01);

//translate([50+30,13,socalo+20])
//cajonY(CajonY_01[0],CajonY_01[1],CajonY_01[2],
//        CajonY_01[3],CajonY_01[4],CajonY_01[5],
//        CajonY_01[6],CajonY_01[7],CajonY_01[8]
//        );
//        
