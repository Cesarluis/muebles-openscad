 use <cajoneriaLibV1.scad>

module paredes(){
//    translate ([-100,0,0]) color("Lightslategray")
//    tableroX(ancho=4100,
//            alto=2900,
//            espesor=100,
//            posicion="fondo",
//            color="red",
//            parte="Pared Fondo");
    translate ([0,4100,0]) color("Lightslategray")
    tableroX(ancho=1000,
            alto=2900,
            espesor=100,
            posicion="lateral",
            color="red",
            parte="Pared lateral derecha");
    translate ([1000,4100-180,0]) color("gainsboro")
    tableroX(ancho=320,
            alto=2900,
            espesor=320,
            posicion="lateral",
            color="red",
            parte="Pilar derecha");
    translate ([0,-100,0]) color("White")
    tableroX(ancho=2290,
            alto=2900,
            espesor=100,
            posicion="lateral",
            color="red",
            parte="Pared lateral izquierda");
    translate ([1000,870,0]) color("gainsboro")
    tableroX(ancho=380,
            alto=2900,
            espesor=280,
            posicion="lateral",
            color="red",
            parte="Pilar izquierda");
    
//    translate ([1800,1520,120]) //color("gainsboro")
//    tableroX(ancho=650,
//            alto=780,
//            espesor=650,
//            posicion="fondo",
//            color="green",
//            parte="Lavadora");
            
                                     
    translate ([1330,3800,0]) 
    //translate ([1400,0,0]) 
    color("gainsboro")
    tableroX(ancho=600,
            alto=1880,
            espesor=700, //Profundidad
            posicion="fondo",
            color="green",
            parte="Frizer");
translate ([0,1210,715]) color("blue")
    tableroX(ancho=100,
            alto=100,
            espesor=900,
            posicion="fondo",
            color="green",
            parte="enchufe 1");   
    
translate ([0,1210+660,715]) color("blue")
    tableroX(ancho=100,
            alto=100,
            espesor=900,
            posicion="fondo",
            color="green",
            parte="enchufe 2");        

translate ([0,1210+660+1070,715]) color("blue")
    tableroX(ancho=100,
            alto=100,
            espesor=900,
            posicion="fondo",
            color="green",
            parte="enchufe 3");                            
translate ([0,2575,1130]) color("blue")
    tableroX(ancho=100,
            alto=100,
            espesor=900,
            posicion="fondo",
            color="green",
            parte="enchufe 4");                            
translate ([0,2575+355,1130+1355]) color("blue")
    tableroX(ancho=100,
            alto=100,
            espesor=900,
            posicion="fondo",
            color="green",
            parte="enchufe 4");


//translate ([0,2900,800]) color("blue")
//    tableroX(ancho=100,
//            alto=100,
//            espesor=2850,
//            posicion="fondo",
//            color="green",
//            parte="medida 2");
            
}

//paredes();
module bachas(){
    translate ([125,2053,120]) 
    color("White")
    tableroX(ancho=763,
            alto=870,
            espesor=480,
            posicion="fondo",
            color="green",
            parte="Cocina");
    
    translate ([1890,2150,590]) 
    color("White")
    tableroX(ancho=375,
            alto=330,
            espesor=430,
            posicion="fondo",
            color="green",
            parte="Bacha 1");
    translate ([1890,2580,590]) 
    color("White")
    tableroX(ancho=375,
            alto=330,
            espesor=430,
            posicion="fondo",
            color="green",
            parte="Bacha 2");
            
    translate ([30,3400,1415]) 
    color("White")
    tableroX(ancho=520,
            alto=300,
            espesor=410,
            posicion="fondo",
            color="green",
            parte="Microondas");            
}
    
//bachas();    
    
module puertadevidrio(Puertas){
    // Ensamblado de puertas  
    if (len(Puertas) > 0){   
        for(i=[0:len(Puertas)-1]){
            translate([Puertas[i][6][0],
                    Puertas[i][6][1],
                    Puertas[i][6][2]]) 
            color(Puertas[i][5])
            tableroX(ancho=100,
                alto=Puertas[i][2],
                espesor=Puertas[i][4],
                posicion="frente",
                color=Puertas[i][5],
                parte="Puerta",
                agrupador=i);
            translate([Puertas[i][6][0],
                    Puertas[i][6][1]+
                        Puertas[i][1]-100,
                    Puertas[i][6][2]]) 
            color(Puertas[i][5])
            tableroX(ancho=100,
                alto=Puertas[i][2],
                espesor=Puertas[i][4],
                posicion="frente",
                color=Puertas[i][5],
                parte="Puerta",
                agrupador=i);
            translate([Puertas[i][6][0],
                    Puertas[i][6][1],
                    Puertas[i][6][2]+100]) 
            rotate([-90,0,0])
            color(Puertas[i][5])
            tableroX(ancho=100,
                alto=Puertas[i][1],
                espesor=Puertas[i][4],
                posicion="frente",
                color=Puertas[i][5],
                parte="Puerta",
                agrupador=i);
            translate([Puertas[i][6][0],
                    Puertas[i][6][1],
                    Puertas[i][6][2]+
                        Puertas[i][2]]) 
            rotate([-90,0,0])
            color(Puertas[i][5])
            tableroX(ancho=100,
                alto=Puertas[i][1],
                espesor=Puertas[i][4],
                posicion="frente",
                color=Puertas[i][5],
                parte="Puerta",
                agrupador=i);    
        }
    }
}    

/////////////////////////////////////
espesor = 15; riel = 13;
socalo = 100;
espacioFrizer = 900;
// modulo(i) = [
//    ancho, alto, profundidad,
//    refuerzo, esqueleto, fondo, espesor,
//    color, [x,y+sum(modulo(i..i-1)[ancho]),z], nombre
//]
// Modulos Bajos Fondo
mod_00 = [575,800,450,"No","Si","No",espesor,"White",
         [0,0,socalo], "Modulo 00"];
mod_01 = [575,800,450,"No","Si","No",espesor,"White",
         [0,mod_00[0],socalo], "Modulo 01"];
mod_02 = [550,800,550,"No","Si","No",espesor,"White",
         [0,mod_00[0]+mod_01[0],socalo], "Modulo 02"];
mod_03 = [950,800,550,"No","Si","No",espesor,"White",
         [0,mod_00[0]+mod_01[0]+mod_02[0]+763,socalo], "Modulo 03"];
mod_04 = [335,800,550,"No","No","Si",espesor,"Tan",
         [0,mod_00[0]+mod_01[0]+mod_02[0]+mod_03[0]+763,socalo], "Modulo 04"];
         
div_100 = [0,mod_04[0]-30,
            mod_04[2]-60,1,espesor,
            "Tan",
            [32,
                mod_04[8][1]+15,
                mod_04[8][2]+115], 
            "division vitrina 10",
            "techo"];        
div_101 = [0,mod_04[0]-30,
            mod_04[2]-60,1,espesor,
            "Tan",
            [32,
                mod_04[8][1]+15,
                mod_04[8][2]+215], 
            "division vitrina 10",
            "techo"];        
div_102 = [0,mod_04[0]-30,
            mod_04[2]-60,1,espesor,
            "Tan",
            [32,
                mod_04[8][1]+15,
                mod_04[8][2]+315], 
            "division vitrina 10",
            "techo"];        
div_103 = [0,mod_04[0]-30,
            mod_04[2]-60,1,espesor,
            "Tan",
            [32,
                mod_04[8][1]+15,
                mod_04[8][2]+415], 
            "division vitrina 10",
            "techo"];        
div_104 = [0,mod_04[2]-60,
            mod_04[2]-150,1,espesor,
            "blue",
            [32,
                mod_04[8][1]+mod_04[0]/2,
                mod_04[8][2]+15], 
            "division vitrina 10",
            "lateral"];        

div_105 = [0,mod_04[0]-30,
            mod_04[2]-60,1,espesor,
            "Tan",
            [32,
                mod_04[8][1]+15,
                mod_04[8][2]+515], 
            "division vitrina 10",
            "techo"];        
div_106 = [0,mod_04[0]-30,
            mod_04[2]-60,1,espesor,
            "Tan",
            [32,
                mod_04[8][1]+15,
                mod_04[8][2]+615], 
            "division vitrina 10",
            "techo"];        
div_107 = [0,mod_04[0]-30,
            mod_04[2]-60,1,espesor,
            "Tan",
            [32,
                mod_04[8][1]+15,
                mod_04[8][2]+715], 
            "division vitrina 10",
            "techo"];        
div_108 = [0,mod_04[2]-60,
            mod_04[2]-265,1,espesor,
            "Tan",
            [32,
                mod_04[8][1]+mod_04[0]/3*2,
                mod_04[8][2]+430], 
            "division vitrina 10",
            "lateral"];        
div_109 = [0,mod_04[2]-60,
            mod_04[2]-265,1,espesor,
            "Tan",
            [32,
                mod_04[8][1]+mod_04[0]/3,
                mod_04[8][2]+430], 
            "division vitrina 10",
            "lateral"];        
            
            
DivMod04 = [
            div_100,div_101,div_102,
            div_103,div_104,div_105,
            div_106,div_107,div_108,
            div_109,//div_104,div_105,
];
         
         
mod_05 = [335,800,550,"No","No","No",espesor,"White",
         [0,mod_00[0]+mod_01[0]+mod_02[0]+mod_03[0]+mod_04[0]+763,socalo], "Modulo 05"];

// Modulos altos vitrina Fondo
mod_10 = [1150,1700,450,"No","No","Si",espesor,"Tan",
         [0,0,(socalo+mod_00[1])], "Vitrina izquierda"];
div_10 = [0,mod_10[2]-110,
            mod_10[1]-30,1,espesor,
            "Tan",
            [22,
                mod_10[8][1]+420-15+130,
                mod_10[8][2]+15], 
            "division vitrina 10",
            "lateral"];
div_11 = [0,mod_10[0]-30,
            mod_10[2]-120,1,espesor,
            "Tan",
            [32,
                15,
                mod_10[8][2]+300], 
            "division vitrina 10",
            "techo"];        
div_12 = [0,mod_10[0]-30,
            mod_10[2]-120,1,espesor,
            "Tan",
            [32,
                15,
                mod_10[8][2]+600], 
            "division vitrina 10",
            "techo"];                        
div_13 = [0,mod_10[0]-30,
            mod_10[2]-120,1,espesor,
            "Tan",
            [32,
                15,
                mod_10[8][2]+900], 
            "division vitrina 10",
            "techo"];        
            
div_14 = [0,mod_10[0]-30,
            mod_10[2]-120,1,espesor,
            "Tan",
            [32,
                15,
                mod_10[8][2]+1200], 
            "division vitrina 10",
            "techo"];                        
div_15 = [0,mod_10[0]-30,
            mod_10[2]-120,1,espesor,
            "Tan",
            [32,
                15,
                mod_10[8][2]+1500], 
            "division vitrina 10",
            "techo"];            
DivMod10 = [
            div_10, div_11,
            div_12, div_13,
            div_14, div_15,
];

mod_11 = [735,1200,450,"No","No","Si",espesor,"Tan",
         [0,mod_04[8][1]-400,socalo+mod_04[1]+500], "Vitrina microondas derecha"];
         
div_20 = [0,mod_11[2]-32,
            mod_11[1]-370,1,espesor,
            "Tan",
            [32,
                mod_11[8][1]+mod_11[0]/2,
                mod_11[8][2]+355], 
            "division vitrina der",
            "lateral"];
div_21 = [0,mod_11[0]-30,
            mod_11[2]-32,1,espesor,
            "Tan",
            [32,
                mod_11[8][1]+15,
                mod_11[8][2]+340], 
            "division vitrina der",
            "techo"];        
div_22 = [0,mod_11[0]-30,
            mod_11[2]-32,1,espesor,
            "Tan",
            [32,
                mod_11[8][1]+15,
                mod_11[8][2]+600], 
            "division vitrina der",
            "techo"];                        
div_23 = [0,mod_11[0]-30,
            mod_11[2]-32,1,espesor,
            "Tan",
            [32,
                mod_11[8][1]+15,
                mod_11[8][2]+900], 
            "division vitrina der",
            "techo"];        
div_24 = [0,mod_11[2]-30,
            325,1,espesor,
            "Tan",
            [30,
                mod_11[8][1]+600,
                mod_11[8][2]+15], 
            "division vitrina der",
            "lateral"];            
            
DivMod11 = [
            div_20, div_21,
            div_22, div_23, div_24
];
         
// Modulos altos colgantes Fondo 1
mod_30 =[550,550,350,"No","No","Si",espesor,"Tan",
         [0,mod_00[0]+mod_01[0],1480], "Modulo 30"];
div_70 = [0,mod_30[0]-30,
            mod_30[2]-32,1,espesor,
            "Tan",
            [32,
                mod_30[8][1]+15,
                mod_30[8][2]+mod_30[1]/2], 
            "division 70",
            "techo"];                 
mod_31 =[763,550,350,"No","No","Si",espesor,"Tan",
         [0,mod_30[8][1]+mod_30[0],1480], "Modulo 31"];
div_71 = [0,mod_31[0]-30,
            mod_31[2]-32,1,espesor,
            "Tan",
            [32,
                mod_31[8][1]+15,
                mod_31[8][2]+mod_31[1]/2], 
            "division 71",
            "techo"];                          
mod_32 =[550,550,350,"No","No","Si",espesor,"Tan",
         [0,mod_10[0]+mod_30[0]+mod_31[0],1480], "Modulo 32"];
div_72 = [0,mod_32[0]-30,
            mod_32[2]-32,1,espesor,
            "Tan",
            [32,
                mod_32[8][1]+15,
                mod_32[8][2]+mod_32[1]/2], 
            "division 71",
            "techo"];                                   
// Modulos altos colgantes Fondo 2
mod_40 =[550,570,450,"No","No","Si",espesor,"Tan",
         [0,mod_00[0]+mod_01[0],1480+mod_30[1]], "Modulo 40"];
div_80 = [0,mod_40[0]-30,
            mod_40[2]-32,1,espesor,
            "Tan",
            [32,
                mod_40[8][1]+15,
                mod_40[8][2]+mod_40[1]/2], 
            "division 71",
            "techo"];                                   
mod_41 =[763,570,450,"No","No","Si",espesor,"Tan",
         [0,mod_40[8][1]+mod_40[0],1480+mod_30[1]], "Modulo 41"];
div_81 = [0,mod_41[0]-30,
            mod_41[2]-32,1,espesor,
            "Tan",
            [32,
                mod_41[8][1]+15,
                mod_41[8][2]+mod_41[1]/2], 
            "division 71",
            "techo"];         
mod_42 =[550,570,450,"No","No","Si",espesor,"Tan",
         [0,mod_10[0]+mod_40[0]+mod_31[0],1480+mod_30[1]], "Modulo 42"];
div_82 = [0,mod_42[0]-30,
            mod_42[2]-32,1,espesor,
            "Tan",
            [32,
                mod_42[8][1]+15,
                mod_42[8][2]+mod_42[1]/2], 
            "division 71",
            "techo"];         
DivModAlto = [
            div_70, div_71, div_72,
            div_80, div_81, div_82
];         
            
puerta_70 = [0,mod_30[0]-10,
            mod_30[1]-10,1,espesor,"Tan",
            [mod_30[8][0]+mod_30[2],
                mod_30[8][1]+5,
                mod_30[8][2]], 
            "puerta 1 mod30"];              
puerta_71 = [0,mod_31[0]-10,
            mod_31[1]-10,1,espesor,"Tan",
            [mod_31[8][0]+mod_31[2],
                mod_31[8][1]+5,
                mod_31[8][2]], 
            "puerta 1 mod30"];
puerta_72 = [0,mod_32[0]-10,
            mod_32[1]-10,1,espesor,"Tan",
            [mod_32[8][0]+mod_32[2],
                mod_32[8][1]+5,
                mod_32[8][2]], 
            "puerta 1 mod30"];         
PuertasModAlto1 = [
            puerta_70, puerta_71, puerta_72
];            

puerta_80 = [0,mod_40[0]-10,
            mod_40[1]-10,1,espesor,"Lightslategray",
            [mod_40[8][0]+mod_40[2],
                mod_40[8][1]+5,
                mod_40[8][2]], 
            "puerta 1 mod30"];              
puerta_81 = [0,mod_41[0]-10,
            mod_41[1]-10,1,espesor,"Lightslategray",
            [mod_41[8][0]+mod_41[2],
                mod_41[8][1]+5,
                mod_41[8][2]], 
            "puerta 1 mod30"];
puerta_82 = [0,mod_42[0]-10,
            mod_42[1]-10,1,espesor,"Lightslategray",
            [mod_42[8][0]+mod_42[2],
                mod_42[8][1]+5,
                mod_42[8][2]], 
            "puerta 1 mod30"];         
PuertasModAlto2 = [
            puerta_80, puerta_81, puerta_82
];            

// Modulos Bajos Izquierda
mod_50 = [600,800,350,"No","Si","No",espesor,"White",
         [0,0,socalo], "Modulo 50"];
mod_51 = [600,800,350,"No","Si","No",espesor,"White",
         [0,mod_50[0],socalo], "Modulo 51"];
// Modulo Calef{on escobero
mod_52 = [900+200,2000,350,"No","No","No",espesor,"Tan",
         [0,mod_50[0]+mod_51[0],socalo], "Modulo Calefón"];
div_00 = [0,mod_52[0]/2,
            mod_52[1]-30,1,espesor,
            "Tan",
            [mod_52[8][0]+mod_52[2]-15,
                mod_52[8][1]+420-15+130,
                mod_52[8][2]+15], 
            "division vertical Calefón",
            "fondo"];
DivMod52 = [  //mod escobero
            div_00,// div_14,
];

// Modulo vitrina Izquierda

// Modulos Isla de Atras
mod_80 = [900,800,600,"No","Si","No",espesor,"White",
         [0,0,socalo], "Lavaplatos"];
         
div_30 = [0,150,
            mod_80[1]-30,1,espesor,
            "White",
            [450,
                mod_80[8][1]+mod_80[0]/2,
                mod_80[8][2]+15], 
            "division vertical lavaplatos",
            "lateral"];
div_31 = [0,150,
            mod_80[1]-30,1,espesor,
            "White",
            [450,
                mod_80[8][1]+mod_80[0]/2-15,
                mod_80[8][2]+15], 
            "division vertical lavaplatos",
            "lateral"];            
DivMod80 = [
            div_30, div_31,
];         
// Modulos Isla Atras         
mod_81 = [600,800,600,"No","Si","No",espesor,"White",
         [0,mod_80[0],socalo], "Modulo 81"];
mod_82 = [600,800,550,"No","Si","No",espesor,"White",
         [0,mod_80[0]+mod_81[0],socalo], "Modulo 82"];
// Modulos Isla de Frente
mod_90 = [750,800,450,"No","Si","No",espesor,"White",
         [0,0,socalo], "Modulo 90"];
mod_91 = [750,800,450,"No","Si","No",espesor,"White",
         [0,mod_90[0],socalo], "Modulo 91"];

//Mesada
div_60 = [0,1800,
            1110,1,espesor,
            "Tan",
            [-630,
                1215,
                mod_81[1]+socalo], 
            "division meson Isla",
            "piso"];
div_61 = [0,2595,
            600,1,espesor,
            "Tan",
            [-2400,
                1500,
                mod_81[1]+socalo], 
            "division meson Isla",
            "piso"];
            
DivModIsla = [
            div_60, div_61,
];

ModulosX = [// Modulos bajos fondo
            mod_00, mod_01, mod_02, 
            mod_03, mod_04, //mod_05, 
            // Modulos altos fondo
            mod_10, mod_11, // vitrina
            // modulos altos centro
            //mod_30, mod_31, mod_32,
            //mod_40, mod_41, mod_42,
            
    ];
    
ModulosY = [//Modulos bajos izquierda 
            //mod_50, mod_51, 
            //mod_52,
            //Modulos altos izquierda
            //mod_60, 
    ];    
    
ModulosZ =[// Modulos isla de frente
            mod_80, mod_81, //mod_82,
    ];
    
ModulosW =[// Modulos isla de atras
            mod_90, mod_91, //mod_92, 
            //mod_93
    ];
    
// puerta = [moduloIndex, ancho, alto, cant, espesor, 
//    color, [x,y,z]], nombre
//]
// Puerta modulo bajo Fondo
puerta_00 = [0,mod_04[0]-10,
            mod_04[1]-10,1,espesor,"Lightslategray",
            [mod_04[8][0]+mod_04[2],
                mod_04[8][1]+5,
                mod_04[8][2]], 
            "puerta 1"];
PuertasX = [ puerta_00
];
// Puerta modulo Isla de Frente 

// Puerta vitrina Izquierda
puerta_50 = [0,mod_10[0]/2-10,
            mod_10[1]-10,1,espesor,"Lightslategray",
            [mod_10[8][0]+mod_10[2],
                mod_10[8][1]+5,
                mod_10[8][2]], 
            "puerta 1 vitrina iz"];
puerta_51 = [0,mod_10[0]/2-10,
            mod_10[1]-10,1,espesor,"Lightslategray",
            [mod_10[8][0]+mod_10[2],
                mod_10[8][1]+mod_10[0]/2+5,
                mod_10[8][2]], 
            "puerta 1 vitrina iz"]; 
 // puerta vitrina derecha
puerta_60 = [0,mod_11[0]/2-10,
            mod_11[1]-10-330,1,espesor,"Lightslategray",
            [mod_11[8][0]+mod_11[2],
                mod_11[8][1]+5,
                mod_11[8][2]+340], 
            "puerta 1 vitrina der"];
puerta_61 = [0,mod_11[0]/2-10,
            mod_11[1]-10-330,1,espesor,"Lightslategray",
            [mod_11[8][0]+mod_11[2],
                mod_11[8][1]+mod_11[0]/2+5,
                mod_11[8][2]+340], 
            "puerta 1 vitrina der"];  
PuertasVitrina = [ puerta_50, puerta_51,
                    puerta_60, puerta_61,
];

// cajon_00 = [
//   moduloIndex, ancho, alto, profundidad,
//   espesor, color, frenteDec, anchoDec,   
//   altoDec, colorDec, [x,y,z]]

// Cajones Modulos Bajo de Fondo
cajon_00 = [3, mod_00[0]-espesor*2-riel*2, 
          300, mod_00[2]-50,
          espesor, "Tan", "Si", 
          mod_00[0]-espesor*2+10+10,395,"Lightslategray", 
          [mod_00[8][0]+50,
            mod_00[8][1]+espesor+riel,
            mod_00[8][2]+espesor]];
cajon_01 = [3, mod_00[0]-espesor*2-riel*2, 
          200, mod_00[2]-50,
          espesor, "Tan", "Si", 
          mod_00[0]-espesor*2+10+10,395,"Lightslategray", 
          [mod_00[8][0]+50,
            mod_00[8][1]+espesor+riel,
            mod_00[8][2]+espesor+395+3]];
cajon_02 = [3, mod_00[0]-espesor*2-riel*2, 
          100, mod_00[2]-50,
          espesor, "Tan", "No", 
          mod_00[0]-espesor*2+10,255,"Lightslategray", 
          [mod_00[8][0]+50,
            mod_00[8][1]+espesor+riel,
            mod_00[8][2]+espesor+(310+3)*2]];

cajon_10 = [3, mod_01[0]-espesor*2-riel*2, 
          300, mod_01[2]-50,
          espesor, "Tan", "Si", 
          mod_01[0]-espesor*2+10+10,395,"Lightslategray", 
          [mod_01[8][0]+50,
            mod_01[8][1]+espesor+riel,
            mod_01[8][2]+espesor]];
cajon_11 = [3, mod_01[0]-espesor*2-riel*2, 
          200, mod_01[2]-50,
          espesor, "Tan", "Si", 
          mod_01[0]-espesor*2+10+10,395,"Lightslategray", 
          [mod_01[8][0]+50,
            mod_01[8][1]+espesor+riel,
            mod_01[8][2]+espesor+395+3]];
cajon_12 = [3, mod_01[0]-espesor*2-riel*2, 
          100, mod_01[2]-50,
          espesor, "Tan", "No", 
          mod_01[0]-espesor*2+10,255,"Lightslategray", 
          [mod_01[8][0]+50,
            mod_01[8][1]+espesor+riel,
            mod_01[8][2]+espesor+(310+3)*2]];
cajon_20 = [3, mod_02[0]-espesor*2-riel*2, 
          300, mod_02[2]-50,
          espesor, "Tan", "Si", 
          mod_02[0]-espesor*2+10+10,395,"Lightslategray", 
          [mod_02[8][0]+50,
            mod_02[8][1]+espesor+riel,
            mod_02[8][2]+espesor]];
cajon_21 = [3, mod_02[0]-espesor*2-riel*2, 
          200, mod_02[2]-50,
          espesor, "Tan", "Si", 
          mod_02[0]-espesor*2+10+10,395,"Lightslategray", 
          [mod_02[8][0]+50,
            mod_02[8][1]+espesor+riel,
            mod_02[8][2]+espesor+395+3]];
cajon_22 = [3, mod_02[0]-espesor*2-riel*2, 
          100, mod_02[2]-50,
          espesor, "Tan", "No", 
          mod_02[0]-espesor*2+10,255,"Lightslategray", 
          [mod_02[8][0]+50,
            mod_02[8][1]+espesor+riel,
            mod_02[8][2]+espesor+(310+3)*2]];
cajon_30 = [3, mod_03[0]-espesor*2-riel*2, 
          300, mod_03[2]-50,
          espesor, "Tan", "Si", 
          mod_03[0]-espesor*2+10+10,395,"Lightslategray", 
          [mod_03[8][0]+50,
            mod_03[8][1]+espesor+riel,
            mod_03[8][2]+espesor]];
cajon_31 = [3, mod_03[0]-espesor*2-riel*2, 
          200, mod_03[2]-50,
          espesor, "Tan", "Si", 
          mod_03[0]-espesor*2+10+10,395,"Lightslategray", 
          [mod_03[8][0]+50,
            mod_03[8][1]+espesor+riel,
            mod_03[8][2]+espesor+395+3]];
cajon_32 = [3, mod_03[0]-espesor*2-riel*2, 
          100, mod_03[2]-50,
          espesor, "Tan", "No", 
          mod_03[0]-espesor*2+10,255,"Lightslategray", 
          [mod_03[8][0]+50,
            mod_03[8][1]+espesor+riel,
            mod_03[8][2]+espesor+(310+3)*2]];
            
CajonesX = [
    cajon_00, cajon_01,cajon_02,
    cajon_10, cajon_11,cajon_12,
    cajon_20, cajon_21,cajon_22,
    cajon_30, cajon_31,cajon_32,
//    cajon_40, cajon_41,cajon_42,
];

//Cajones Modulo Bajo Izquierda
cajon_50 = [3, mod_50[0]-espesor*2-riel*2, 
          200, mod_50[2]-50,
          espesor, "Tan", "Si", 
          mod_50[0]-espesor*2+10,255,"Lightslategray", 
          [mod_50[8][0]+50,
            mod_50[8][1]+espesor+riel,
            mod_50[8][2]+espesor]];
cajon_51 = [3, mod_50[0]-espesor*2-riel*2, 
          200, mod_50[2]-50,
          espesor, "Tan", "Si", 
          mod_50[0]-espesor*2+10,255,"Lightslategray", 
          [mod_50[8][0]+50,
            mod_50[8][1]+espesor+riel,
            mod_50[8][2]+espesor+255+3]];
cajon_52 = [3, mod_50[0]-espesor*2-riel*2, 
          200, mod_50[2]-50,
          espesor, "Tan", "Si", 
          mod_50[0]-espesor*2+10,255,"Lightslategray", 
          [mod_50[8][0]+50,
            mod_50[8][1]+espesor+riel,
            mod_50[8][2]+espesor+(255+3)*2]];
cajon_60 = [3, mod_51[0]-espesor*2-riel*2, 
          200, mod_51[2]-50,
          espesor, "Tan", "Si", 
          mod_51[0]-espesor*2+10,255,"Lightslategray", 
          [mod_51[8][0]+50,
            mod_51[8][1]+espesor+riel,
            mod_51[8][2]+espesor]];
cajon_61 = [3, mod_51[0]-espesor*2-riel*2, 
          200, mod_51[2]-50,
          espesor, "Tan", "Si", 
          mod_51[0]-espesor*2+10,255,"Lightslategray", 
          [mod_51[8][0]+50,
            mod_51[8][1]+espesor+riel,
            mod_51[8][2]+espesor+255+3]];
cajon_62 = [3, mod_51[0]-espesor*2-riel*2, 
          200, mod_51[2]-50,
          espesor, "Tan", "Si", 
          mod_51[0]-espesor*2+10,255,"Lightslategray", 
          [mod_51[8][0]+50,
            mod_51[8][1]+espesor+riel,
            mod_51[8][2]+espesor+(255+3)*2]];

//CajonesY = [
//    cajon_50, cajon_51,cajon_52,
//    cajon_60, cajon_61,cajon_62,
//];

//Cajones Isla de Atras
cajon_70 = [3, mod_81[0]-espesor*2-riel*2, 
          300, mod_81[2]-50,
          espesor, "Tan", "Si", 
          mod_81[0]-espesor*2+10+10,395,"Lightslategray", 
          [mod_81[8][0]+50,
            mod_81[8][1]+espesor+riel,
            mod_81[8][2]+espesor]];
           
cajon_71 = [3, mod_81[0]-espesor*2-riel*2, 
          200, mod_81[2]-50,
          espesor, "Tan", "Si", 
          mod_81[0]-espesor*2+10+10,395,"Lightslategray", 
          [mod_81[8][0]+50,
            mod_81[8][1]+espesor+riel,
            mod_81[8][2]+espesor+395+3]];
cajon_72 = [3, mod_81[0]-espesor*2-riel*2, 
          100, mod_81[2]-50,
          espesor, "Tan", "No", 
          mod_81[0]-espesor*2+10,255,"Lightslategray", 
          [mod_81[8][0]+50,
            mod_81[8][1]+espesor+riel,
            mod_81[8][2]+espesor+(310+3)*2]];

cajon_80 = [3, mod_80[0]/2-espesor*2-riel*2, 
          200, mod_80[2]-50,
          espesor, "Tan", "No", 
          mod_80[0]/2-espesor*2+20,795,"Lightslategray", 
          [mod_80[8][0]+50,
            mod_80[8][1]+espesor+riel,
            mod_80[8][2]+espesor]];
cajon_81 = [3, mod_80[0]/2-espesor*2-riel*2, 
          200, mod_80[2]-50,
          espesor, "Tan", "No", 
          mod_80[0]/2-espesor*2+20,795,"Lightslategray", 
          [mod_80[8][0]+50,
            mod_80[8][1]+mod_80[0]/2 +espesor+riel,
            mod_80[8][2]+espesor]];

CajonesZ =[
            cajon_70, cajon_71, cajon_72,
            cajon_80, cajon_81,
           // cajon_82
];

//Cajones de modulo Isla de Frente
cajon_90 = [3, mod_90[0]-espesor*2-riel*2, 
          300, mod_90[2]-50,
          espesor, "Tan", "Si", 
          mod_90[0]-espesor*2+10+10,395,"Lightslategray", 
          [mod_90[8][0]+50,
            mod_90[8][1]+espesor+riel,
            mod_90[8][2]+espesor]];
cajon_91 = [3, mod_90[0]-espesor*2-riel*2, 
          200, mod_90[2]-50,
          espesor, "Tan", "Si", 
          mod_90[0]-espesor*2+10+10,395,"Lightslategray", 
          [mod_90[8][0]+50,
            mod_90[8][1]+espesor+riel,
            mod_90[8][2]+espesor+395+3]];
cajon_92 = [3, mod_90[0]-espesor*2-riel*2, 
          100, mod_90[2]-50,
          espesor, "Tan", "No", 
          mod_90[0]-espesor*2+10,255,"Lightslategray", 
          [mod_90[8][0]+50,
            mod_90[8][1]+espesor+riel,
            mod_90[8][2]+espesor+(310+3)*2]];

cajon_100 = [3, mod_91[0]-espesor*2-riel*2, 
          300, mod_91[2]-50,
          espesor, "Tan", "Si", 
          mod_91[0]-espesor*2+10+10,395,"Lightslategray", 
          [mod_91[8][0]+50,
            mod_91[8][1]+espesor+riel,
            mod_91[8][2]+espesor]];
cajon_101 = [3, mod_91[0]-espesor*2-riel*2, 
          200, mod_91[2]-50,
          espesor, "Tan", "Si", 
          mod_91[0]-espesor*2+10+10,395,"Lightslategray", 
          [mod_91[8][0]+50,
            mod_91[8][1]+espesor+riel,
            mod_91[8][2]+espesor+395+3]];
cajon_102 = [3, mod_91[0]-espesor*2-riel*2, 
          100, mod_91[2]-50,
          espesor, "Tan", "No", 
          mod_91[0]-espesor*2+10,255,"Lightslategray", 
          [mod_91[8][0]+50,
            mod_91[8][1]+espesor+riel,
            mod_91[8][2]+espesor+(310+3)*2]];

CajonesW =[
            cajon_90, cajon_91, cajon_92,
            cajon_100, cajon_101, cajon_102
];
cortes = [];

translate([0,450-100,0])
union(){
    modulosdeCocina(ModulosX);
    //puertasdeModulo(PuertasX);
    cajonesdeModulo(CajonesX);
    divisiones(DivMod04);
    divisiones(DivMod10);
    divisiones(DivMod11);
    puertadevidrio(PuertasVitrina);
    //divisiones(DivModAlto);
    //puertasdeModulo(PuertasModAlto1);
    //puertadevidrio(PuertasModAlto2);
}
// Modulos Izquierda
translate([2100+200,0,0])
rotate([0,0,90])
union(){
    modulosdeCocina(ModulosY);
    //cajonesdeModulo(CajonesY);
    //divisiones(DivMod52);
}
// Isla
translate([2400,0,0])
union(){
    translate([0,3000,0])
    rotate([0,0,180])
    union(){
        modulosdeCocina(ModulosZ);
        cajonesdeModulo(CajonesZ);
        divisiones(DivMod80);
        
    }
    translate([0,1500,0])
    rotate([0,0,0])
    union(){
        modulosdeCocina(ModulosW);
        cajonesdeModulo(CajonesW);
        //puertasdeModulo(PuertasW);
        
    }
    divisiones(DivModIsla);
}



socalo_01 = [0, 400, 1500, socalo,
            espesor, "Lightslategray", 
            (2+4), [0,0,0],
            "Socalo 1"];
socalo_02 = [0, 500, 2595, socalo,
            espesor, "Lightslategray", 
            (2+8), [0,0,0],
            "Socalo 2"];
socalo_03 = [0, 950, 1450, socalo,
            espesor, "blue",
            (2+3), [0,0,0],
            "Socalo 3"];
translate([0,0,0]) 
socalo(socalo_01);
translate([0,1500,0]) 
socalo(socalo_02);
translate([1850,1500,0]) 
socalo(socalo_03);



mod_100 = [900,350,450,"No","Si","No",espesor,"White",
         [0,0,500], "Modulo Baño"];
cajon_201 = [3, mod_100[0]-espesor*2-riel*2, 
          150, mod_100[2]-50,
          espesor, "Tan", "Si", 
          mod_100[0]-espesor*2+10+10,340,"Lightslategray", 
          [mod_100[8][0]+50,
            mod_100[8][1]+espesor+riel,
            mod_100[8][2]+espesor+385+3-380-15]];
cajon_202 = [3, mod_100[0]-espesor*2-riel*2, 
          100, mod_100[2]-50,
          espesor, "Tan", "No", 
          mod_100[0]-espesor*2+10,255,"Lightslategray", 
          [mod_100[8][0]+50,
            mod_100[8][1]+espesor+riel,
            mod_100[8][2]+espesor+(310+3)*2-430]];

ModuloBano = [mod_100];      
CajonesBano = [ cajon_201, cajon_202];

translate([0,4500,0])
union(){
  modulosdeCocina(ModuloBano); 
  cajonesdeModulo(CajonesBano);
}