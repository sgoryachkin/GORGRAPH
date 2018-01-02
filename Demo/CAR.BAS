screen 12
'***** Semen SG Gor GRAPH Copyright(c) Горячкин Семён *****
Xms=1.3    ' Кооф. увеличения по оси ОX
Yms=1.1    ' Кооф. увеличение по оси ОY
Xhd=0    ' Смещение   по оси OX
Yhd=0    ' Смещение   по оси OY

SlpT=0.3    'Задержка (в секундах) для создания спецэффектов.
          '(не зависит от тактовой частоты процессора)

'_____ Процедура DlyPt ________
Sub DlyPt(SleepTimerSUB)
    MTimerGET=Timer:While SleepTimerSUB>Timer-MTimerGET:WEnd:Exit Sub
End Sub'---------------------
'------------------------------
CIms=Yms:If Xms>Yms Then CIms=Xms
Call DlyPt(SlpT):Circle( 140*Xms+Xhd, 320*Yms+Yhd), 20*CIms, 14, 0, 6.283, 1/(Xms/Yms)
Call DlyPt(SlpT):Circle( 300*Xms+Xhd, 320*Yms+Yhd), 20*CIms, 14, 0, 6.283, 1/(Xms/Yms)
Call DlyPt(SlpT):Line( 160*Xms+Xhd, 320*Yms+Yhd)-( 280*Xms+Xhd, 320*Yms+Yhd), 14
Call DlyPt(SlpT):Line( 320*Xms+Xhd, 320*Yms+Yhd)-( 340*Xms+Xhd, 320*Yms+Yhd), 14
Call DlyPt(SlpT):Line( 120*Xms+Xhd, 320*Yms+Yhd)-( 100*Xms+Xhd, 320*Yms+Yhd), 14
Call DlyPt(SlpT):Line( 100*Xms+Xhd, 320*Yms+Yhd)-( 90*Xms+Xhd, 310*Yms+Yhd), 14
Call DlyPt(SlpT):Line( 90*Xms+Xhd, 310*Yms+Yhd)-( 90*Xms+Xhd, 280*Yms+Yhd), 14
Call DlyPt(SlpT):Line( 90*Xms+Xhd, 280*Yms+Yhd)-( 100*Xms+Xhd, 270*Yms+Yhd), 14
Call DlyPt(SlpT):Line( 100*Xms+Xhd, 270*Yms+Yhd)-( 140*Xms+Xhd, 270*Yms+Yhd), 14
Call DlyPt(SlpT):Line( 140*Xms+Xhd, 270*Yms+Yhd)-( 150*Xms+Xhd, 265*Yms+Yhd), 14
Call DlyPt(SlpT):Line( 150*Xms+Xhd, 265*Yms+Yhd)-( 170*Xms+Xhd, 260*Yms+Yhd), 14
Call DlyPt(SlpT):Line( 170*Xms+Xhd, 260*Yms+Yhd)-( 195*Xms+Xhd, 260*Yms+Yhd), 14
Call DlyPt(SlpT):Line( 195*Xms+Xhd, 260*Yms+Yhd)-( 225*Xms+Xhd, 265*Yms+Yhd), 14
Call DlyPt(SlpT):Line( 225*Xms+Xhd, 265*Yms+Yhd)-( 255*Xms+Xhd, 280*Yms+Yhd), 14
Call DlyPt(SlpT):Line( 255*Xms+Xhd, 280*Yms+Yhd)-( 285*Xms+Xhd, 285*Yms+Yhd), 14
Call DlyPt(SlpT):Line( 285*Xms+Xhd, 285*Yms+Yhd)-( 325*Xms+Xhd, 290*Yms+Yhd), 14
Call DlyPt(SlpT):Line( 325*Xms+Xhd, 290*Yms+Yhd)-( 335*Xms+Xhd, 295*Yms+Yhd), 14
Call DlyPt(SlpT):Line( 335*Xms+Xhd, 295*Yms+Yhd)-( 340*Xms+Xhd, 305*Yms+Yhd), 14
Call DlyPt(SlpT):Line( 340*Xms+Xhd, 305*Yms+Yhd)-( 340*Xms+Xhd, 320*Yms+Yhd), 14
Call DlyPt(SlpT):Paint( 205*Xms+Xhd, 290*Yms+Yhd), 14, 14
Call DlyPt(SlpT):Line( 229*Xms+Xhd, 267*Yms+Yhd)-( 253*Xms+Xhd, 279*Yms+Yhd), 1
Call DlyPt(SlpT):Line( 253*Xms+Xhd, 279*Yms+Yhd)-( 233*Xms+Xhd, 278*Yms+Yhd), 1
Call DlyPt(SlpT):Line( 233*Xms+Xhd, 278*Yms+Yhd)-( 226*Xms+Xhd, 274*Yms+Yhd), 1
Call DlyPt(SlpT):Line( 226*Xms+Xhd, 274*Yms+Yhd)-( 225*Xms+Xhd, 270*Yms+Yhd), 1
Call DlyPt(SlpT):Line( 225*Xms+Xhd, 270*Yms+Yhd)-( 229*Xms+Xhd, 267*Yms+Yhd), 1
Call DlyPt(SlpT):Paint( 229*Xms+Xhd, 271*Yms+Yhd), 1, 1
Call DlyPt(SlpT):Line( 214*Xms+Xhd, 270*Yms+Yhd)-( 222*Xms+Xhd, 281*Yms+Yhd), 10
Call DlyPt(SlpT):Line( 222*Xms+Xhd, 281*Yms+Yhd)-( 227*Xms+Xhd, 293*Yms+Yhd), 10
Call DlyPt(SlpT):Line( 227*Xms+Xhd, 293*Yms+Yhd)-( 228*Xms+Xhd, 309*Yms+Yhd), 10
Call DlyPt(SlpT):Line( 228*Xms+Xhd, 309*Yms+Yhd)-( 228*Xms+Xhd, 315*Yms+Yhd), 10
Call DlyPt(SlpT):Line( 228*Xms+Xhd, 315*Yms+Yhd)-( 187*Xms+Xhd, 315*Yms+Yhd), 10
Call DlyPt(SlpT):Line( 187*Xms+Xhd, 315*Yms+Yhd)-( 187*Xms+Xhd, 267*Yms+Yhd), 10
Call DlyPt(SlpT):Line( 187*Xms+Xhd, 267*Yms+Yhd)-( 203*Xms+Xhd, 268*Yms+Yhd), 10
Call DlyPt(SlpT):Line( 203*Xms+Xhd, 268*Yms+Yhd)-( 214*Xms+Xhd, 270*Yms+Yhd), 10
Call DlyPt(SlpT):Line( 189*Xms+Xhd, 269*Yms+Yhd)-( 212*Xms+Xhd, 272*Yms+Yhd), 1
Call DlyPt(SlpT):Line( 212*Xms+Xhd, 272*Yms+Yhd)-( 221*Xms+Xhd, 287*Yms+Yhd), 1
Call DlyPt(SlpT):Line( 221*Xms+Xhd, 287*Yms+Yhd)-( 189*Xms+Xhd, 287*Yms+Yhd), 1
Call DlyPt(SlpT):Line( 189*Xms+Xhd, 287*Yms+Yhd)-( 189*Xms+Xhd, 269*Yms+Yhd), 1
Call DlyPt(SlpT):Paint( 192*Xms+Xhd, 277*Yms+Yhd), 1, 1
Call DlyPt(SlpT):Line( 189*Xms+Xhd, 292*Yms+Yhd)-( 199*Xms+Xhd, 292*Yms+Yhd), 3
Call DlyPt(SlpT):Line( 197*Xms+Xhd, 293*Yms+Yhd)-( 191*Xms+Xhd, 293*Yms+Yhd), 3
Call DlyPt(SlpT):Circle( 140*Xms+Xhd, 320*Yms+Yhd), 15*CIms, 8, 0, 6.283, 1/(Xms/Yms)
Call DlyPt(SlpT):Circle( 300*Xms+Xhd, 320*Yms+Yhd), 15*CIms, 8, 0, 6.283, 1/(Xms/Yms)
Call DlyPt(SlpT):Paint( 300*Xms+Xhd, 320*Yms+Yhd), 8, 8
Call DlyPt(SlpT):Paint( 135*Xms+Xhd, 320*Yms+Yhd), 8, 8
Call DlyPt(SlpT):Line( 8*Xms+Xhd, 395*Yms+Yhd)-( 490*Xms+Xhd, 425*Yms+Yhd), 2,BF
Call DlyPt(SlpT):Line( 490*Xms+Xhd, 215*Yms+Yhd)-( 8*Xms+Xhd, 155*Yms+Yhd), 2,BF
Call DlyPt(SlpT):Line( 8*Xms+Xhd, 155*Yms+Yhd)-( 490*Xms+Xhd, 8*Yms+Yhd), 1,BF
Call DlyPt(SlpT):Circle( 106*Xms+Xhd, 61*Yms+Yhd), 45*Xms, 11, 0, 6.283, .2222222/(Xms/Yms)
Call DlyPt(SlpT):Paint( 116*Xms+Xhd, 66*Yms+Yhd), 11, 11
Call DlyPt(SlpT):Circle( 136*Xms+Xhd, 76*Yms+Yhd), 60*Xms, 11, 0, 6.283, .1666667/(Xms/Yms)
Call DlyPt(SlpT):Paint( 166*Xms+Xhd, 76*Yms+Yhd), 11, 11
Call DlyPt(SlpT):Circle( 146*Xms+Xhd, 56*Yms+Yhd), 60*Xms, 11, 0, 6.283, .25/(Xms/Yms)
Call DlyPt(SlpT):Paint( 181*Xms+Xhd, 56*Yms+Yhd), 11, 11
Call DlyPt(SlpT):Circle( 346*Xms+Xhd, 21*Yms+Yhd), 45*Xms, 11, 0, 6.283, .2222222/(Xms/Yms)
Call DlyPt(SlpT):Paint( 366*Xms+Xhd, 26*Yms+Yhd), 11, 11
Call DlyPt(SlpT):Circle( 366*Xms+Xhd, 31*Yms+Yhd), 35*Xms, 11, 0, 6.283, .1428571/(Xms/Yms)
Call DlyPt(SlpT):Paint( 386*Xms+Xhd, 31*Yms+Yhd), 11, 11
Call DlyPt(SlpT):Circle( 401*Xms+Xhd, 26*Yms+Yhd), 30*Xms, 11, 0, 6.283, .1666667/(Xms/Yms)
Call DlyPt(SlpT):Paint( 416*Xms+Xhd, 26*Yms+Yhd), 11, 11
Call DlyPt(SlpT):Line( 8*Xms+Xhd, 8*Yms+Yhd)-( 490*Xms+Xhd, 430*Yms+Yhd), 13,B
Call DlyPt(SlpT):Line( 489*Xms+Xhd, 429*Yms+Yhd)-( 9*Xms+Xhd, 9*Yms+Yhd), 13,B
'**********************************************************
