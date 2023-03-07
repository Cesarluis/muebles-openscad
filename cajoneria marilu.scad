use <CajoneriaLib.scad>

// definicion de medidas de muebles
// Modular Bajo
espesor=15;
anchoM=0;
altoM=1;
profM=2;

// Medidas modulos 
//modularX(anchoMod, altoMod, profundoMod, espesor, refuerzo, esqueleto,fondo)
Mod_1 = [480, 900, 670,"No","No","Si","white"];
Mod_2 = [480, 900, 670,"No","No","Si","white"];
Mod_3 = [450, 900, 670,"No","No","Si","white"];
Mod_3a = [450, 1820, 670,"No","No","Si","white"];
// molulo alto nivel 1
Mod_8 = [200, 650, 350,"No","Si","Si","gray"];
Mod_7 = [900, 650, 350,"No","Si","Si","gray"];
Mod_6 = [550, 650, 350,"No","Si","Si","gray"];
Mod_5 = [490, 650, 250,"No","Si","Si","gray"];
// molulo alto nivel 2
Mod_8a = [200, 650, 550,"No","No","Si","white"];
Mod_7a = [900, 650, 550,"No","No","Si","white"];
Mod_6b = [550, 650, 550,"No","No","Si","white"];
Mod_6a = [900, 650, 550,"No","No","Si","white"];
Mod_5a = [490, 650, 550,"No","No","Si","white"];

// modulos bajo lavado
Mod_9 = [900,750,550,"No","Si","No","green"];
Mod_10 = [190,450,500,"No","Si","No","gray"];
Mod_11 = [490,450,230,"No","Si","No","gray"];
Mod_12 = [190,450,500,"No","Si","No","gray"];

// modulos X
Mod_13 = [681,817,670,"No","Si","No","green"];
Mod_14 = [694,754,670,"No","Si","No","green"];
Mod_15 = [413,754,245,"No","Si","No","green"];

Mod_16 = [700,750,550,"No","Si","No","green"];
Mod_17 = [200,750,550,"No","Si","No","green"];

Modulos = [
    Mod_1,Mod_2,Mod_3,Mod_3a
    ];
ModulosAltos =[
    Mod_5,Mod_6,
    Mod_7,Mod_8,
    Mod_5a,Mod_6a,Mod_6b,
    Mod_7a,Mod_8a
    ];
ModulosBajoLavado = [
    Mod_9,Mod_10,Mod_11,
    Mod_12
    ];
ModulosX = [
    Mod_13,Mod_14,Mod_15,
    Mod_16,Mod_17
    ];
   
anchoRiel=13*2;
altoZocalo=130;
alturaModAlto=1950;
alturaModAlto2 =1500;

// Posiciones modulos
PMod_1=[0,0,alturaModAlto];
PMod_2=[0,Mod_1[anchoM],alturaModAlto];
PMod_3=[0,Mod_1[anchoM]+Mod_2[anchoM],altoZocalo];
PMod_3a=[0,Mod_1[anchoM]+Mod_2[anchoM],1030];

//PMod_4=[0,0,alturaModAlto];

PMod_5=[0,0,alturaModAlto2];
PMod_6=[0,Mod_5[anchoM]+900,alturaModAlto2];
PMod_7=[0,Mod_5[anchoM]+900+Mod_6[anchoM],alturaModAlto2];
PMod_8=[0,Mod_5[anchoM]+900+Mod_6[anchoM]+Mod_7[anchoM],alturaModAlto2];

PMod_5a=[0,0,alturaModAlto2+Mod_5[altoM]];
PMod_6a=[0,Mod_5a[anchoM],alturaModAlto2+Mod_5[altoM]];

PMod_6b=[0,Mod_5a[anchoM]+Mod_6a[anchoM],alturaModAlto2+Mod_5[altoM]];

PMod_7a=[0,Mod_5a[anchoM]+Mod_6a[anchoM]+Mod_6b[anchoM],alturaModAlto2+Mod_5[altoM]];
PMod_8a=[0,Mod_5a[anchoM]+Mod_6a[anchoM]+Mod_6b[anchoM]+Mod_7a[anchoM],alturaModAlto2+Mod_5[altoM]];


PMod_9 = [0,0,altoZocalo];
PMod_10 = [50,15,altoZocalo+15];
PMod_11 = [320,Mod_10[anchoM]+15,altoZocalo+15];
PMod_12 = [50,Mod_10[anchoM]+Mod_11[anchoM]+15,altoZocalo+15];
 
PMod_13=[0,0,altoZocalo];
PMod_14=[0,Mod_13[anchoM],altoZocalo];
PMod_15=[0,Mod_13[anchoM]+Mod_14[anchoM],altoZocalo];

PMod_16=[0,Mod_13[anchoM]+Mod_14[anchoM]+
        Mod_15[anchoM],altoZocalo];
PMod_17=[0,Mod_13[anchoM]+Mod_14[anchoM]+
        Mod_15[anchoM]+Mod_16[anchoM],altoZocalo];

Pos_Modulos = [
    PMod_1,PMod_2,PMod_3, PMod_3a
    ];

Pos_ModulosAltos = [
    PMod_5,PMod_6,
    PMod_7,PMod_8,
    PMod_5a,PMod_6a,PMod_6b,
    PMod_7a,PMod_8a
    ];
    
Pos_ModulosBajoLavado = [
    PMod_9,PMod_10,PMod_11,
    PMod_12
];

Pos_ModulosX =[
    PMod_13,PMod_14,PMod_15,
    PMod_16,PMod_17
    ];
Puerta_1 =[Mod_1[0]-10,Mod_1[1]-10,"White"];
Puerta_2 =[Mod_2[0]-10,Mod_2[1]-10,"White"];
Puerta_3a =[Mod_3a[0]-10,(Mod_3a[1]/2)-120,"White"];
Puerta_3b =[Mod_3a[0]-10,Mod_3a[1]-(Mod_3a[1]/2)+120,"White"];

Puertas =[
    [Puerta_1,[PMod_1[0]+Mod_1[2],PMod_1[1],PMod_1[2]]],
    [Puerta_2,[PMod_2[0]+Mod_2[2],PMod_2[1],PMod_2[2]]],
    [Puerta_3a,[PMod_3a[0]+Mod_3a[2],PMod_3a[1],PMod_3a[2]]],
    [Puerta_3b,[PMod_3a[0]+Mod_3a[2],PMod_3a[1],PMod_3a[2]+Puerta_3a[1]+5]]
];
// Pos Puertas modulo alto nivel 2
// Mod_5a,6a,6b,7a,8a
Puerta_11 = [Mod_5a[0]-4,Mod_5a[1],"White"];
Puerta_12a = [(Mod_6a[0]-4)/2,Mod_6a[1],"White"];
Puerta_12b = [(Mod_6a[0]-4)/2,Mod_6a[1],"White"];
Puerta_13 = [Mod_6b[0]-4,Mod_6b[1],"White"];
Puerta_14a = [(Mod_7a[0]-4)/2,Mod_7a[1],"White"];
Puerta_14b = [(Mod_7a[0]-4)/2,Mod_7a[1],"White"];
Puerta_15 = [Mod_8a[0]-4,Mod_8a[1],"White"];
// Pos Puertas modulo alto nivel 1
// Mod_5,6,7,8
Puerta_16 = [Mod_5[0]-4,Mod_5[1]/2+60,"gray"];
Puerta_17 = [Mod_6[0]-4,Mod_6[1],"gray"];
Puerta_18a = [(Mod_7[0]-4)/2,Mod_7[1],"gray"];
Puerta_18b = [(Mod_7[0]-4)/2,Mod_7[1],"gray"];
Puerta_19 = [Mod_8[0]-4,Mod_8[1],"gray"];

Puertas2 = [
    // nivel 2
    [Puerta_11,[PMod_5a[0]+Mod_5a[2],PMod_5a[1],PMod_5a[2]]],
    [Puerta_12a,[PMod_6a[0]+Mod_6a[2],PMod_6a[1],PMod_5a[2]]],
    [Puerta_12b,[PMod_6a[0]+Mod_6a[2],PMod_6a[1]+Puerta_12a[0]+2,PMod_5a[2]]],
    [Puerta_13,[PMod_6b[0]+Mod_6b[2],PMod_6b[1],PMod_6b[2]]],
    [Puerta_14a,[PMod_7a[0]+Mod_7a[2],PMod_7a[1],PMod_6b[2]]],
    [Puerta_14b,[PMod_7a[0]+Mod_7a[2],PMod_7a[1]+Puerta_14a[0]+2,PMod_7a[2]]],
    [Puerta_15,[PMod_8a[0]+Mod_8a[2],PMod_8a[1],PMod_8a[2]]],
    // nivel 1
     [Puerta_16,[PMod_5[0]+Mod_5[2],PMod_5[1],PMod_5[2]+(Mod_5[1]/2)-60]],
    [Puerta_17,[PMod_6[0]+Mod_6[2],PMod_6[1],PMod_6[2]]],
    [Puerta_18a,[PMod_7[0]+Mod_7[2],PMod_7[1],PMod_7[2]]],
    [Puerta_18b,[PMod_7[0]+Mod_7[2],PMod_7[1]+Puerta_18a[0]+2,PMod_7[2]]],
    [Puerta_19,[PMod_8[0]+Mod_8[2],PMod_8[1],PMod_8[2]]],
];
     
     
     
separaCajon= 50;
altoCajon = 170;
// Cajones alto frizer
// Pcajon[x,y,z]

Pcajon_01 = [50,
            espesor+anchoRiel/2,
            alturaModAlto+espesor];
Pcajon_02 = [50,
            espesor+anchoRiel/2,
            alturaModAlto+espesor+240*1+separaCajon*1];
Pcajon_03 = [50,
            espesor+anchoRiel/2,
            alturaModAlto+espesor+240*2+separaCajon*2];
Pcajon_11 = [50,
            Mod_1[0]+espesor+anchoRiel/2,
            alturaModAlto+espesor];
Pcajon_12 = [50,
            Mod_1[0]+espesor+anchoRiel/2,
            alturaModAlto+espesor+espesor+240*1+separaCajon*1];
Pcajon_13 = [50,
            Mod_1[0]+espesor+anchoRiel/2,
            alturaModAlto+espesor+espesor+240*2+separaCajon*2];
Pcajon_21 = [50,
            Mod_1[0]+Mod_2[0]+espesor+anchoRiel/2,
            altoZocalo+espesor+10];
Pcajon_22 = [50,
            Mod_1[0]+Mod_2[0]+espesor+anchoRiel/2,
            altoZocalo+espesor+altoCajon+separaCajon+10];
Pcajon_23 = [50,
            Mod_1[0]+Mod_2[0]+espesor+anchoRiel/2,
            altoZocalo+espesor+altoCajon*2+separaCajon*2+10];   
Pcajon_24 = [50,
            Mod_1[0]+Mod_2[0]+espesor+anchoRiel/2,
            altoZocalo+espesor+altoCajon*3+separaCajon*3+10];
Pcajon_25 = [50,
            Mod_1[0]+Mod_2[0]+espesor+anchoRiel/2,
            altoZocalo+espesor+altoCajon*2+separaCajon*2+465];
// Cajones Modulo_2a            
Pcajon_26 = [50,
            Mod_1[0]+Mod_2[0]+espesor+anchoRiel/2,
            altoZocalo+espesor+altoCajon*2+separaCajon*2+900];
Pcajon_27 = [50,
            Mod_1[0]+Mod_2[0]+espesor+anchoRiel/2,
            altoZocalo+espesor+altoCajon*2+separaCajon*2+1250];            
Pcajon_28 = [50,
            Mod_1[0]+Mod_2[0]+espesor+anchoRiel/2,
            altoZocalo+espesor+altoCajon*2+separaCajon*2+1600];
Pcajon_29 = [50,
            Mod_1[0]+Mod_2[0]+espesor+anchoRiel/2,
            altoZocalo+espesor+altoCajon*2+separaCajon*2+1950];            
// Cajones bajo lavado
Pcajon_30 = [50,
            espesor+anchoRiel/2,
            altoZocalo+espesor+Mod_10[altoM]+5];            
Pcajon_31 = [50,
            espesor+anchoRiel/2,
            altoZocalo+espesor+Mod_10[altoM]+5+130];
Pcajon_32 = [100,
            espesor+anchoRiel,
            altoZocalo+espesor*2+5];  
Pcajon_32a = [100,
            espesor+anchoRiel,
            altoZocalo+espesor*2+45+(Pcajon_32[2])];
            
Pcajon_33 = [370,
            espesor*2+anchoRiel/2+Mod_10[anchoM],
            altoZocalo+espesor*2+5];
Pcajon_34 = [100,
            espesor*2+anchoRiel/2+Mod_10[anchoM]+Mod_11[anchoM],
            altoZocalo+espesor*2+5];

Pcajon_34a= [100,
            espesor*2+anchoRiel/2+Mod_10[anchoM]+Mod_11[anchoM],
            altoZocalo+espesor*2+45+(Pcajon_34[2])];

// Pos Cajones modulo alto nivel 2
// Mod_5a,6a,6b,7a,8a
Pcajon_41 = [50,
           espesor+anchoRiel/2,
           espesor+PMod_5a[2]];
Pcajon_42 = [50,
           espesor+anchoRiel/2,
           PMod_5a[2]+(Mod_5a[1]/2)];

Pcajon_51 = [50,
           espesor+anchoRiel/2+PMod_6a[1],
           espesor+(PMod_6a[2])];
Pcajon_52 = [50,
           espesor+anchoRiel/2+PMod_6a[1],
           PMod_6a[2]+(Mod_6a[1]/2)];

Pcajon_61 = [50,
           espesor+anchoRiel/2+PMod_6b[1],
           espesor+(PMod_6b[2])];
Pcajon_62 = [50,
           espesor+anchoRiel/2+PMod_6b[1],
           PMod_6b[2]+(Mod_6b[1]/2)];
           
Pcajon_71 = [50,
           espesor+anchoRiel/2+PMod_7a[1],
           espesor+(PMod_7a[2])];
Pcajon_72 = [50,
           espesor+anchoRiel/2+PMod_7a[1],
           PMod_7a[2]+(Mod_7a[1]/2)];
           
Pcajon_81 = [50,
           espesor+anchoRiel/2+PMod_8a[1],
           espesor+(PMod_8a[2])];
Pcajon_82 = [50,
           espesor+anchoRiel/2+PMod_8a[1],
           PMod_8a[2]+(Mod_8a[1]/2)];


Pcajon_91 = [50,
            espesor+anchoRiel/2,
            altoZocalo+espesor];
Pcajon_92 = [50,
            espesor+anchoRiel/2,
            altoZocalo+espesor+615];

Pcajon_101 = [50,
            PMod_14[1]+espesor+anchoRiel/2,
            altoZocalo+espesor];
Pcajon_102 = [50,
            PMod_14[1]+espesor+anchoRiel/2,
            altoZocalo+espesor+322];
Pcajon_103 = [50,
            PMod_14[1]+espesor+anchoRiel/2,
            altoZocalo+espesor+525];
            
Pcajon_104 = [50,
            PMod_16[1]+espesor+anchoRiel/2,
            altoZocalo+espesor];
Pcajon_105 = [50,
            PMod_16[1]+espesor+anchoRiel/2,
            altoZocalo+espesor+110];
Pcajon_106 = [50,
            PMod_17[1]+espesor+anchoRiel/2,
            altoZocalo+espesor];
Pcajon_107 = [50,
            PMod_17[1]+espesor+anchoRiel/2,
            altoZocalo+espesor+350];            

//Cajones = [[nroModulo, Poscajon, altoCajon,
//          Color, frenteDec, altoFrente,
//          anchoPlus],....[]];
Cajones = [
    [0,Pcajon_01,50,"white","No",0,1,"white"],
    [0,Pcajon_02,50,"white","No",0,1,"white"],
    [0,Pcajon_03,50,"white","No",0,1,"white"],
    [1,Pcajon_11,50,"white","No",0,1,"white"],
    [1,Pcajon_12,50,"white","No",0,1,"white"],
    [1,Pcajon_13,50,"white","No",0,1,"white"],
    [2,Pcajon_21,altoCajon,"white","Si",215,50,"white"],
    [2,Pcajon_22,altoCajon,"white","Si",215,50,"white"],
    [2,Pcajon_23,altoCajon,"white","Si",215,50,"white"],
    [2,Pcajon_24,altoCajon,"white","Si",215,50,"white"],
    [2,Pcajon_25,50,"white","No",0,1,"white"],
    [2,Pcajon_26,50,"white","No",0,1,"white"],
    [2,Pcajon_27,50,"white","No",0,1,"white"],
    [2,Pcajon_28,50,"white","No",0,1,"white"],
    [2,Pcajon_29,50,"white","No",0,1,"white"]
    ];

CajonesBajoLavado = [
    [0,Pcajon_30,100,"gray","Si",125,50,"white"],
    [0,Pcajon_31,100,"gray","Si",125,50,"white"],
    [1,Pcajon_32,100,"gray","Si",430,60,"white"],
    [1,Pcajon_32a,100,"gray","Si",225,60,"white"],
    [2,Pcajon_33,100,"gray","Si",430,50,"white"],
    [3,Pcajon_34,100,"gray","Si",430,60,"white"],
    [3,Pcajon_34a,100,"gray","Si",225,60,"white"],
];

CajonesModAlto = [
    [4,Pcajon_41,50,"white","No",0,1,"white"],
    [4,Pcajon_42,50,"white","No",0,1,"white"],
    [5,Pcajon_51,50,"white","No",0,1,"white"],
    [5,Pcajon_52,50,"white","No",0,1,"white"],
    [6,Pcajon_61,50,"white","No",0,1,"white"],
    [6,Pcajon_62,50,"white","No",0,1,"white"],
    [7,Pcajon_71,50,"white","No",0,1,"white"],
    [7,Pcajon_72,50,"white","No",0,1,"white"],
    [8,Pcajon_81,50,"white","No",0,1,"white"],
    [8,Pcajon_82,50,"white","No",0,1,"white"]
];

CajonesModX = [
    [0,Pcajon_91,180,"gray","Si",255,50,"white"],
    [0,Pcajon_92,100,"gray","Si",170,50,"white"],
    [1,Pcajon_101,250,"gray","Si",320,50,"white"],
    [1,Pcajon_102,150,"gray","Si",200,50,"white"],
    [1,Pcajon_103,150,"gray","Si",200,50,"white"],
    
    [3,Pcajon_104,100,"gray","Si",250,50,"white"],
    [3,Pcajon_105,100,"gray","Si",100,26,"white"],
    [4,Pcajon_106,100,"gray","Si",705,50,"white"],
    [4,Pcajon_107,100,"gray","Si",350,26,"white"],
    ];

// Mod_8,7,6
DivisionesH = [
    [0,[PMod_5[0],PMod_5[1]+espesor,PMod_5[2]+(Mod_5[1]/2)-60],"gray"],
    [1,[PMod_6[0],PMod_6[1]+espesor,PMod_6[2]+(Mod_6[1]/2)],"gray"],
    [2,[PMod_7[0],PMod_7[1]+espesor,PMod_7[2]+(Mod_7[1]/2)],"gray"],
    [3,[PMod_8[0],PMod_8[1]+espesor,PMod_8[2]+(Mod_8[1]/2)],"gray"],
    ];
echo("INICIAMOS");
echo("INPRIMIMOS LOS MODULOS");

translate([0,1000,0])
modulosdeCocina(Modulos, Pos_Modulos, espesor);
echo("INPRIMIMOS LOS Cajones");
translate([0,1000,0])
cajonesdeCocina(Modulos, Pos_Modulos, 
                Cajones, espesor);

translate([0,1000,0])
puertasdeCocina(Modulos, Pos_Modulos, 
                Puertas,
                espesor);
                
//Modulos Altos
echo("INPRIMIMOS Modulos Altos");
translate([2040+1000,0,0]) rotate([0,0,90])
modulosdeCocina(ModulosAltos, Pos_ModulosAltos, espesor);
// 490, 650, 350,
translate([2040+1000-15,espesor,1500+espesor]) color("white") rotate([0,0,90])
armario(490-15, (250), 250-25, 15, 2,100,"white");

translate([2040+1000,0,0]) rotate([0,0,90])
cajonesdeCocina(ModulosAltos, Pos_ModulosAltos, 
                CajonesModAlto, espesor);

translate([2040+1000,0,0]) rotate([0,0,90])
puertasdeCocina(ModulosAltos, Pos_ModulosAltos, 
                Puertas2,
                espesor);
translate([2040+1000,0,0]) rotate([0,0,90])
divisionesdeModulos(ModulosAltos, Pos_ModulosAltos, 
                DivisionesH, espesor);

// Modulos Bajo lavado
echo("INPRIMIMOS Modulos Bajo lavado");
translate([0,2500,0]) rotate([0,0,0])
modulosdeCocina(ModulosBajoLavado, Pos_ModulosBajoLavado, 
                espesor);
echo("INPRIMIMOS LOS Cajones Bajo lavado");
translate([0,2500,0]) rotate([0,0,0])
cajonesdeCocina(ModulosBajoLavado, Pos_ModulosBajoLavado, 
                CajonesBajoLavado, espesor);
                
//Modulos X
echo("INPRIMIMOS Modulos X");
translate([0,3500,0]) rotate([0,0,0])
modulosdeCocina(ModulosX, Pos_ModulosX, 
                espesor);
translate([0,espesor+3500,260+espesor+altoZocalo]) 
color("white") 
armario(Mod_13[0]-espesor, 350, 670, espesor, 2,1,"white");
translate([0,espesor+3500+PMod_15[1],250+espesor+altoZocalo]) 
color("white") 
armario(Mod_15[0]-espesor, 250, 240, espesor, 2,1,"white");
echo("INPRIMIMOS LOS Cajones Modulo X");
translate([0,3500,0]) rotate([0,0,0])
cajonesdeCocina(ModulosX, Pos_ModulosX, 
                CajonesModX, espesor);

echo("TERMINAMOS");

a = concat([],[[4,5,6]] );
echo(a);