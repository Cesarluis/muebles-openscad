use <CajoneriaLib.scad>
// definicion de medidas de muebles
// Modular Bajo
espesor=15;
anchoM=0;
altoM=1;
profM=2;

// Medidas modulos 
Mod_1 = [400, 800, 600];
Mod_2 = [600, 800, 600];
Mod_3 = [900, 800, 600];
Mod_4 = [400, 2690, 600];
// Cajoneria alta primer nivel
Mod_11 = [400, 650, 350];
Mod_12 = [600, 650, 350];
Mod_13 = [900, 650, 350];
// Cajoneria alta segundo nivel
Mod_21 = [400, 350, 350];
Mod_22 = [600, 350, 350];
Mod_23 = [900, 350, 350];
// Cajoneria alta tercer nivel
Mod_31 = [400, 350, 350];
Mod_32 = [600, 350, 350];
Mod_33 = [900, 350, 350];
// Lista de modulos
Modulos = [
    Mod_1,Mod_2,Mod_3,Mod_4,
    Mod_11,Mod_12,Mod_13,
    Mod_21,Mod_22,Mod_23,
    Mod_31,Mod_32,Mod_33 ];

anchoRiel=13*2;
altoZocalo=100;
alturaModAlto=1440;

// Posiciones modulos
PMod_1=[0,0,altoZocalo];
PMod_2=[-Mod_1[anchoM],0,altoZocalo];
PMod_3=[-Mod_1[anchoM]-Mod_2[anchoM],0,altoZocalo];
PMod_4=[-Mod_1[anchoM]-Mod_2[anchoM]-Mod_3[anchoM],0,altoZocalo];

//Posiciones de Modulos Cajoneria Alta primer nivel
PMod_11=[0,0,alturaModAlto];
PMod_12=[-Mod_11[anchoM],0,alturaModAlto];
PMod_13=[-Mod_11[anchoM]-Mod_12[anchoM],0,alturaModAlto];    
//Posiciones de Modulos Cajoneria Alta segundo nivel
PMod_21=[0,0,alturaModAlto+Mod_11[1]];
PMod_22=[-Mod_21[anchoM],0,alturaModAlto+Mod_11[1]];
PMod_23=[-Mod_21[anchoM]-Mod_22[anchoM],0,alturaModAlto+Mod_11[1]];
//Posiciones de Modulos Cajoneria Alta tercer nivel
PMod_31=[0,0,alturaModAlto+Mod_11[1]+Mod_21[1]];
PMod_32=[-Mod_31[anchoM],0,alturaModAlto+Mod_11[1]+Mod_21[1]];
PMod_33=[-Mod_21[anchoM]-Mod_22[anchoM],0,alturaModAlto+Mod_11[1]+Mod_21[1]];

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
Pos_Modulos_divH =[
    [3,[PMod_4[0]-espesor,PMod_4[1],PMod_4[2]+800]],
    [3,[PMod_4[0]-espesor,PMod_4[1],PMod_4[2]+1072]],
    [3,[PMod_4[0]-espesor,PMod_4[1],PMod_4[2]+1345]],
    [3,[PMod_4[0]-espesor,PMod_4[1],PMod_4[2]+1665]],
    [3,[PMod_4[0]-espesor,PMod_4[1],PMod_4[2]+1980]],
    [3,[PMod_4[0]-espesor,PMod_4[1],PMod_4[2]+2330]],
    [4,[PMod_11[0]-espesor,PMod_11[1],alturaModAlto+Mod_11[1]/2]],
    [5,[PMod_12[0]-espesor,PMod_12[1],alturaModAlto+Mod_12[1]/2]],
    [6,[PMod_13[0]-espesor,PMod_13[1],alturaModAlto+Mod_13[1]/2]]
    ];

// Posiciones cajones
Pcajon_11 = [0-anchoRiel-2,50,altoZocalo+espesor+10];
Pcajon_12 = [0-anchoRiel-2,50,altoZocalo+espesor+altoCajon+separaCajon+10];
Pcajon_13 = [0-anchoRiel-2,50,altoZocalo+espesor+altoCajon*2+separaCajon*2+10];
Pcajon_21 = [-Mod_1[anchoM]-anchoRiel-2,50,altoZocalo+espesor+10];
Pcajon_22 = [-Mod_1[anchoM]-anchoRiel-2,50,altoZocalo+espesor+altoCajon+separaCajon+10];
Pcajon_23 = [-Mod_1[anchoM]-anchoRiel-2,50,altoZocalo+espesor+altoCajon*2+separaCajon*2+10];
Pcajon_24 = [-Mod_1[anchoM]-anchoRiel-2,50,altoZocalo+espesor+altoCajon*2+altoCajonDelgado+separaCajon*3+10];
Pcajon_31 = [-Mod_1[anchoM]-Mod_2[anchoM]-anchoRiel-2,50,altoZocalo+espesor+10];
Pcajon_32 = [-Mod_1[anchoM]-Mod_2[anchoM]-anchoRiel-2,50,altoZocalo+espesor+altoCajon+separaCajon+10];
Pcajon_33 = [-Mod_1[anchoM]-Mod_2[anchoM]-anchoRiel-2,50,altoZocalo+espesor+altoCajon*2+separaCajon*2+10];
Pcajon_41 = [-Mod_1[anchoM]-Mod_2[anchoM]-Mod_3[anchoM]-anchoRiel-2,50,altoZocalo+espesor+10];
Pcajon_42 = [-Mod_1[anchoM]-Mod_2[anchoM]-Mod_3[anchoM]-anchoRiel-2,50,altoZocalo+espesor+altoCajon+separaCajon+10];
Pcajon_43 = [-Mod_1[anchoM]-Mod_2[anchoM]-Mod_3[anchoM]-anchoRiel-2,50,altoZocalo+espesor+altoCajon*2+separaCajon*2+10];
Pcajon_44 = [-Mod_1[anchoM]-Mod_2[anchoM]-Mod_3[anchoM]-anchoRiel-2,50,altoZocalo+espesor+altoCajon*3+separaCajon*3+10];

//Pos_Cajones =[
//          [indexModulo,Pos_Cajon,AltoCajon],
//          [indexModulo,Pos_Cajon,AltoCajon],
//]
// Lista de Cajones
Pos_Cajones = [
    [0,Pcajon_11,altoCajon],[0,Pcajon_12,altoCajon],[0,Pcajon_13,altoCajon],
    [1,Pcajon_21,altoCajon],[1,Pcajon_22,altoCajon],[1,Pcajon_23,altoCajonDelgado],[1,Pcajon_24,altoCajonDelgado],
    [2,Pcajon_31,altoCajon],[2,Pcajon_32,altoCajon],[2,Pcajon_33,altoCajon],
    [3,Pcajon_41,altoCajon],[3,Pcajon_42,altoCajon],[3,Pcajon_43,altoCajon],[3,Pcajon_44,altoCajon]
    ];

//paredes2();
//socalo(Ar_ancho, Ar_alto, Ar_profundo, espesor, div=10,espacio=240)
socalo(350, 900, 100, 15, 5, 200);

modulosdeCocina(Modulos, Pos_Modulos, 12, Pos_Cajones, 12, Pos_Modulos_divH, 8, espesor);