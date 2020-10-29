MODULE MainModule
 

    !***********************************************************
    !
    ! Module:  Module1
    !
    ! Description:
    !   Pick & place from 2 to 14 cubes at pre-established position,
    !   from defined positions in grid with 4 lines.
    !
    ! Authors 
    !
    ! Version: 1.0
    !
    !***********************************************************

    !***********************************************************
    !
    ! Procedure main
    !
    !   This is the entry point of your program
    !
    !***********************************************************

    !MJ, EmRe and Fre
    !**************************************
    VAR num nVolba:=0;
    VAR num counter:=0;
    VAR num nNumero:=0;
    VAR num nDiameter:=0;
    VAR num nLength:=0;
    VAR num nEn:=0;
    VAR num i:=0;
    VAR num x:=0;
    VAR num y:=0;
    VAR num picked_cubes:=0;
    VAR num to_pick_cubes:=0;
    VAR num nOddSpaces:=3;
    VAR num nEvenSpaces:=4;
    VAR num max_cubes:=14;
    VAR num min_cubes:=2;
    VAR num number_rows:=0;
    VAR bool change:=FALSE;
    VAR num pitch:=113.1;
    !pitch
    !**************************************

    !Our tools
    !***************************************
    CONST tooldata toolemre:=[TRUE,[[6.06101,19.6454,238.34],[0.96198,-0.261195,0.0770351,-0.0209165]],[1,[0,0,60],[1,0,0,0],0,0,0]];
    PERS tooldata ToolAhmet:=[TRUE,[[6.06101,19.6454,238.34],[0.96198,-0.261195,0.0770351,-0.0209165]],[1,[0,0,60],[1,0,0,0],0,0,0]];
    PERS tooldata fre:=[TRUE,[[7.16222,18.7353,235.966],[0.959162,-0.258051,0.111855,-0.0300933]],[1,[0,0,60],[1,0,0,0],0,0,0]];
    !***************************************    

    !Our target position
    !***************************************
    CONST robtarget writetarget:=[[624.68,-57.25,-4.49],[0.0245461,0.187596,-0.980995,-0.0430645],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    !***************************************

    PERS tooldata FIX_STUDENT:=[TRUE,[[5.23034,18.2232,233.135],[0.961311,-0.256765,0.0963882,-0.0257453]],[1,[1,1,1],[1,0,0,0],0,0,0]];
    PERS tooldata KopirovaciEfektor:=[TRUE,[[-4.08162,-8.086,246.164],[0.999958,0.00730936,0.00555808,4.06087E-05]],[1,[1,1,1],[1,0,0,0],0,0,0]];
    PERS tooldata Gripper:=[TRUE,[[2.9156,13.8555,238.745],[0.999989,-0.00232681,-0.00403261,-9.38932E-06]],[1.5,[0,0,60],[1,0,0,0],0,0,0]];
    PERS tooldata TRN:=[TRUE,[[0.252509,0.263168,65.6963],[0.999992,0.00366197,0.0013975,5.03411E-06]],[0.5,[0,0,10],[1,0,0,0],0,0,0]];
    CONST robtarget pFixVychozi:=[[668.79,14.07,4.53],[0.0134317,0.890343,-0.454956,-0.0110971],[-1,0,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST jointtarget pHomeABS:=[[0.0275167,-0.0180456,-0.0446064,-0.00458959,47.6289,-69.2662],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pHome:=[[649.69,2.46,422.34],[0.00639829,0.608221,-0.793514,-0.0190333],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pTrnPoz1:=[[204.07,428.45,257.81],[0.0025699,-0.981325,0.192311,-0.00321256],[0,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pTrnPoz2:=[[38.86,428.56,256.91],[0.0114772,-0.979957,0.198859,-0.00251302],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pTrnPoz3:=[[-126.44,428.56,255.37],[0.0114835,-0.980433,0.196501,-0.0025271],[1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS loaddata load_HotWire:=[0.5,[0,0,50],[1,0,0,0],0,0,0];
    PERS loaddata load_Chapadlo:=[2,[0,0,50],[1,0,0,0],0,0,0];
    PERS loaddata load_FIX:=[1,[0,0,50],[1,0,0,0],0,0,0];
    VAR bool alive:=TRUE;
    PERS loaddata loadChapadlo:=[2,[0,0,50],[1,0,0,0],0,0,0];
    PERS loaddata loadFIX:=[1,[0,0,50],[1,0,0,0],0,0,0];
    PERS tooldata ToolHFH:=[TRUE,[[-4.25733,1.53203,248.978],[0.999935,0.00673816,-0.00920871,6.20482E-05]],[1,[0,0,40],[1,0,0,0],0,0,0]];
    CONST robtarget ppruchozi21:=[[588.37,189.05,274.98],[0.325802,0.105692,0.937593,-0.0600128],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget ppruchozi11:=[[588.37,189.05,274.98],[0.325802,0.105692,0.937593,-0.0600128],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget ppruchozi31:=[[589.72,146.99,333.29],[0.325517,0.105408,0.937713,-0.0601884],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget bod117:=[[773.00,2.39,388.85],[0.439279,0.110124,0.888545,0.0734488],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget triang007:=[[689.19,244.21,283.05],[0.0777828,-0.562259,0.823262,-0.00738733],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget triang17:=[[843.37,-17.73,283.03],[0.0777749,-0.562253,0.823267,-0.00737542],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget triang27:=[[597.53,-18.04,283.02],[0.0777662,-0.562234,0.823281,-0.00736622],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget triang37:=[[597.53,-18.05,283.02],[0.0777687,-0.562232,0.823282,-0.00736859],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pizzatime:=[[597.53,-18.04,283.02],[0.0777693,-0.562231,0.823282,-0.00736585],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pizzatime10:=[[756.86,52.15,282.92],[0.0777717,-0.562146,0.823341,-0.00731868],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pizzatime20:=[[534.46,-96.65,283.06],[0.077832,-0.562064,0.82339,-0.00743326],[-1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pizzatime40:=[[534.46,-96.65,283.06],[0.077831,-0.562067,0.823388,-0.00743507],[-1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pizzatime30:=[[534.46,-96.65,283.06],[0.077831,-0.562067,0.823388,-0.00743507],[-1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pizzatime60:=[[487.85,17.82,283.06],[0.0778328,-0.562057,0.823394,-0.00743373],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pizzatime50:=[[487.85,17.82,283.06],[0.0778328,-0.562057,0.823394,-0.00743373],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pizzatime80:=[[530.16,17.82,283.05],[0.0778252,-0.562059,0.823394,-0.00742733],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget picktrgt:=[[530.16,17.82,283.05],[0.0778252,-0.562059,0.823394,-0.00742733],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pzaa:=[[687.19,335.15,11.68],[0.0778099,-0.562086,0.823378,-0.00739832],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pzaa10:=[[753.39,169.50,11.68],[0.077807,-0.562084,0.823379,-0.00740043],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pzaa30:=[[669.90,126.44,11.68],[0.0778026,-0.562087,0.823377,-0.00739554],[0,-2,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pzaa20:=[[669.90,126.44,11.68],[0.0778026,-0.562087,0.823377,-0.00739554],[0,-2,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pzaa40:=[[671.05,118.65,11.68],[0.0777978,-0.562106,0.823365,-0.00740064],[0,-2,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pzaa50:=[[598.91,186.31,11.68],[0.0777897,-0.562094,0.823374,-0.00740119],[0,-2,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pzaa70:=[[598.91,186.33,11.68],[0.0777974,-0.562096,0.823372,-0.0073991],[0,-2,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pzaa60:=[[598.91,186.33,11.68],[0.0777974,-0.562096,0.823372,-0.0073991],[0,-2,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pzaa80:=[[598.90,186.33,11.68],[0.0777858,-0.562096,0.823373,-0.00738242],[0,-2,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget bodpapir:=[[658.88,284.58,-11.73],[0.0778028,-0.562087,0.823378,-0.0073913],[0,-2,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST jointtarget jtHome:=[[0,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    !********************************************************************************

    PROC main()
        MyMain;
    ENDPROC

    PROC MyMain()
        MoveAbsJ jtHome,v300,z10,ToolAhmet;
        TPReadFK nVolba,"Select an option:","Pick&Place","Exit",stEmpty,stEmpty,stEmpty;
        TEST nVolba
        CASE 1:
            selectAmount;
        CASE 2:
            TPWrite "Exit program.";
            EXIT;
        DEFAULT:
            TPWrite "Error on program. It will try again...";
            MyMain;
        ENDTEST
    ENDPROC

    PROC selectAmount()
        TPWrite "Starting...";
        TPReadNum nNumero,"Enter number of cubes to pick & place (from 2 to 14 cubes): ";
        IF nNumero<2 OR nNumero>14 THEN
            TPWrite "Out of range. Please select between 2 to 14 cubes.";
            WaitTime 5;
            selectAmount;
        ELSE
            to_pick_cubes:=nNumero;
            ODD_Logic;
        ENDIF

    ENDPROC


    PROC ODD_Logic()
        y:=0.5;
        !to move to half a pitch        
        FOR k FROM 1 TO 3 DO
            MoveJ Offs(picktrgt,x*pitch,y*pitch,50),v100,z0,ToolAhmet;
            MoveJ Offs(picktrgt,x*pitch,y*pitch,0),v100,z0,ToolAhmet;
            MoveJ Offs(picktrgt,x*pitch,y*pitch,50),v100,z0,ToolAhmet;
            IF nNumero=picked_cubes THEN
                MoveAbsJ jtHome,v500,z10,ToolAhmet;
                EXIT;
            ELSE
                CubeSelect;
                i:=i+1;
                !to increase the for-loop
                y:=y+1;
                !to advance one pitch
                picked_cubes:=picked_cubes+1;
                !to advance the count of picked cubes
            ENDIF
        ENDFOR
        x:=x+0.5;
        EVEN_Logic;
    ENDPROC

    PROC EVEN_Logic()
        y:=0;
        !to reset y starting position        
        FOR j FROM 1 TO 4 DO
            MoveJ Offs(picktrgt,x*pitch,y*pitch,50),v100,z0,ToolAhmet;
            MoveJ Offs(picktrgt,x*pitch,y*pitch,0),v100,z0,ToolAhmet;
            MoveJ Offs(picktrgt,x*pitch,y*pitch,50),v100,z0,ToolAhmet;
            IF nNumero=picked_cubes THEN
                MoveAbsJ jtHome,v500,z10,ToolAhmet;
                EXIT;
            ELSE
                CubeSelect;
                i:=i+1;
                y:=y+1;
                picked_cubes:=picked_cubes+1;
            ENDIF
        ENDFOR
        x:=x+0.5;
        ODD_Logic;
    ENDPROC

    PROC CubeSelect()
        SetDO DO10_5,1;
        ! change this value to correct input DO....
        MoveJ bod117,v500,z10,ToolAhmet;
        !define this new position outside the box
        SingArea\Wrist;
        !avoids singularity errors
        WaitRob\inpos;
        !waits real position of robot
        SetDO DO10_5,0;
        TPWRITE "Ok. Robot picking and placing cubes";
        !print message        
        TPWrite "picked cubes ="\Num:=picked_cubes+1;
        SingArea\Off;
    ENDPROC  
ENDMODULE