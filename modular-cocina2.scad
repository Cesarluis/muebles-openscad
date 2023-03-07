use <CajoneriaLib.scad>
// definicion de medidas de muebles
// Modular Bajo
espesor=15;
anchoM=0;
altoM=1;
profM=2;

// Medidas modulos 
//modularX(anchoMod, altoMod, profundoMod, espesor, refuerzo, esqueleto)
Mod_1 = [400, 800, 600,"Si","Si","No"];
Mod_2 = [600, 800, 600,"Si","Si","No"];
Mod_3 = [900, 800, 600,"Si","Si","No"];
Mod_4 = [400, 2690, 600,"No","No","Si"];
// Cajoneria alta primer nivel
Mod_11 = [400, 650, 350,"No","Si","Si"];
Mod_12 = [600, 650, 350,"No","Si","Si"];
Mod_13 = [900, 650, 350,"No","Si","Si"];
// Cajoneria alta segundo nivel
Mod_21 = [400, 350, 350,"No","Si","Si"];
Mod_22 = [600, 350, 350,"No","Si","Si"];
Mod_23 = [900, 350, 350,"No","Si","Si"];
// Cajoneria alta tercer nivel
Mod_31 = [400, 350, 350,"No","No","Si"];
Mod_32 = [600, 350, 350,"No","No","Si"];
Mod_33 = [900, 350, 350,"No","No","Si"];
// Lista de modulos
Modulos = [
    Mod_1,Mod_2,Mod_3,Mod_4,
    Mod_11,Mod_12,Mod_13,
    Mod_21,Mod_22,Mod_23,
    Mod_31,Mod_32,Mod_33 
    ];

anchoRiel=13*2;
altoZocalo=100;
alturaModAlto=1440;

// Posiciones modulos
PMod_1=[0,0,altoZocalo];
PMod_2=[0,Mod_1[anchoM],altoZocalo];
PMod_3=[0,Mod_1[anchoM]+Mod_2[anchoM],altoZocalo];
PMod_4=[0,Mod_1[anchoM]+Mod_2[anchoM]+Mod_3[anchoM],altoZocalo];
//Posiciones de Modulos Cajoneria Alta primer nivel
PMod_11=[0,0,alturaModAlto];
PMod_12=[0,Mod_11[anchoM],alturaModAlto];
PMod_13=[0,Mod_11[anchoM]+Mod_12[anchoM],alturaModAlto];    
//Posiciones de Modulos Cajoneria Alta segundo nivel
PMod_21=[0,0,alturaModAlto+Mod_11[1]];
PMod_22=[0,Mod_21[anchoM],alturaModAlto+Mod_11[1]];
PMod_23=[0,Mod_21[anchoM]+Mod_22[anchoM],alturaModAlto+Mod_11[1]];
//Posiciones de Modulos Cajoneria Alta tercer nivel
PMod_31=[0,0,alturaModAlto+Mod_11[1]+Mod_21[1]];
PMod_32=[0,Mod_31[anchoM],alturaModAlto+Mod_11[1]+Mod_21[1]];
PMod_33=[0,Mod_21[anchoM]+Mod_22[anchoM],alturaModAlto+Mod_11[1]+Mod_21[1]];

// Lista de posiciones de modulos
Pos_Modulos = [
    PMod_1,PMod_2,PMod_3,PMod_4,
    PMod_11,PMod_12,PMod_13,
    PMod_21,PMod_22,PMod_23,
    PMod_31,PMod_32,PMod_33,
    ];

altoCajon=200;
separaCajon=40;
altoCajonDelgado=80;

// Divisiones 
// Hacemos la suposición que el fondo es de 6mm, por eso
// reducimos y recorremos 21mm las disiones en Y 
DivisionesH =[
    [3,[PMod_4[0]+21,PMod_4[1]+espesor,PMod_4[2]+800]],
    [3,[PMod_4[0]+21,PMod_4[1]+espesor,PMod_4[2]+1072]],
    [3,[PMod_4[0]+21,PMod_4[1]+espesor,PMod_4[2]+1345]],
    [3,[PMod_4[0]+21,PMod_4[1]+espesor,PMod_4[2]+1665]],
    [3,[PMod_4[0]+21,PMod_4[1]+espesor,PMod_4[2]+1980]],
    [3,[PMod_4[0]+21,PMod_4[1]+espesor,PMod_4[2]+2330]],
    [4,[PMod_11[0]+21,PMod_11[1]+espesor,alturaModAlto+Mod_11[1]/2]],
    [5,[PMod_12[0]+21,PMod_12[1]+espesor,alturaModAlto+Mod_12[1]/2]],
    [6,[PMod_13[0]+21,PMod_13[1]+espesor,alturaModAlto+Mod_13[1]/2]]
    ];

Puerta_1 =[Mod_4[0],Mod_4[1]*0.25+15];
Puerta_2 =[Mod_4[0],Mod_4[1]*0.23+15];
Puerta_3 =[Mod_4[0],Mod_4[1]*0.20+20];

Puertas =[
    [Puerta_1,[PMod_4[0]+Mod_1[2],PMod_4[1],PMod_4[2]+1995]],
    [Puerta_2,[PMod_4[0]+Mod_1[2],PMod_4[1],PMod_4[2]+1355]],
    [Puerta_3,[PMod_4[0]+Mod_1[2],PMod_4[1],PMod_4[2]+790]],
    [Puerta_2,[0,0,0]],
    [Puerta_2,[0,0,0]],
    [Puerta_2,[0,0,0]],
    [Puerta_2,[0,0,0]],
    [Puerta_2,[0,0,0]],
    [Puerta_2,[0,0,0]],
    [Puerta_2,[0,0,0]]
    ];
   
//    [5,[PMod_12[0]+650,PMod_12[1]+espesor,PMod_12[2]]],
//    [6,[PMod_13[0]+650,PMod_13[1],PMod_13[2]]],
//    [7,[PMod_21[0]+600,PMod_21[1],PMod_21[2]]],
//    [8,[PMod_22[0]+600,PMod_22[1]+espesor,alturaModAlto+Mod_22[1]/2]],
//    [9,[PMod_23[0]+600,PMod_23[1]+espesor,alturaModAlto+Mod_23[1]/2]],
//    [11,[PMod_31[0]+600,PMod_31[1]+espesor,alturaModAlto+Mod_31[1]/2]],
//    [12,[PMod_32[0]+600,PMod_13[1]+espesor,alturaModAlto+Mod_32[1]/2]]
//    ];

// Posiciones cajones
Pcajon_11 = [50,anchoRiel+2,altoZocalo+espesor+10];
Pcajon_12 = [50,anchoRiel+2,altoZocalo+espesor+altoCajon+separaCajon+10];
Pcajon_13 = [50,anchoRiel+2,altoZocalo+espesor+altoCajon*2+separaCajon*2+10];
Pcajon_21 = [50,Mod_1[anchoM]+anchoRiel+2,altoZocalo+espesor+10];
Pcajon_22 = [50,Mod_1[anchoM]+anchoRiel+2,altoZocalo+espesor+altoCajon+separaCajon+10];
Pcajon_23 = [50,Mod_1[anchoM]+anchoRiel+2,altoZocalo+espesor+altoCajon*2+separaCajon*2+10];
Pcajon_24 = [50,Mod_1[anchoM]+anchoRiel+2,altoZocalo+espesor+altoCajon*2+altoCajonDelgado+separaCajon*3+10];
Pcajon_31 = [50,Mod_1[anchoM]+Mod_2[anchoM]+anchoRiel+2,altoZocalo+espesor+10];
Pcajon_32 = [50,Mod_1[anchoM]+Mod_2[anchoM]+anchoRiel+2,altoZocalo+espesor+altoCajon+separaCajon+10];
Pcajon_33 = [50,Mod_1[anchoM]+Mod_2[anchoM]+anchoRiel+2,altoZocalo+espesor+altoCajon*2+separaCajon*2+10];
Pcajon_41 = [50,Mod_1[anchoM]+Mod_2[anchoM]+Mod_3[anchoM]+anchoRiel+2,altoZocalo+espesor+10];
Pcajon_42 = [50,Mod_1[anchoM]+Mod_2[anchoM]+Mod_3[anchoM]+anchoRiel+2,altoZocalo+espesor+altoCajon+separaCajon+10];
Pcajon_43 = [50,Mod_1[anchoM]+Mod_2[anchoM]+Mod_3[anchoM]+anchoRiel+2,altoZocalo+espesor+altoCajon*2+separaCajon*2+10];
Pcajon_44 = [50,Mod_1[anchoM]+Mod_2[anchoM]+Mod_3[anchoM]+anchoRiel+2,altoZocalo+espesor+altoCajon*3+separaCajon*3+10];

//Cajones =[
//          [indexModulo,Pos_Cajon,AltoCajon],
//          [indexModulo,Pos_Cajon,AltoCajon],
//]
// Lista de Cajones
Cajones = [
    [0,Pcajon_11,altoCajon],[0,Pcajon_12,altoCajon],[0,Pcajon_13,altoCajon],
    [1,Pcajon_21,altoCajon],[1,Pcajon_22,altoCajon],[1,Pcajon_23,altoCajonDelgado],[1,Pcajon_24,altoCajonDelgado],
    [2,Pcajon_31,altoCajon],[2,Pcajon_32,altoCajon],[2,Pcajon_33,altoCajon],
    [3,Pcajon_41,altoCajon],[3,Pcajon_42,altoCajon],[3,Pcajon_43,altoCajon],[3,Pcajon_44,altoCajon]
    ];

//paredes2();
//socalo(Ar_ancho, Ar_alto, Ar_profundo, espesor, div=10,espacio=240)
socalo(490, 2300, 100, 15, 5, 200);

modulosdeCocina(Modulos, Pos_Modulos, 12, Cajones, 12, DivisionesH, 8, Puertas, 9, espesor);