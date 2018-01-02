screen 12
'***** Semen SG Gor GRAPH Copyright(c) Горячкин Семён *****
Xms=1    ' Кооф. увеличения по оси ОX
Yms=1    ' Кооф. увеличение по оси ОY
Xhd=0    ' Смещение   по оси OX
Yhd=0    ' Смещение   по оси OY

SlpT=0.1    'Задержка (в секундах) для создания спецэффектов.
          '(не зависит от тактовой частоты процессора)

'_____ Процедура DlyPoint _____
Sub DlyPoint(SleepTimerSUB)
    MTimerGET=Timer:While SleepTimerSUB>Timer-MTimerGET:WEnd:Exit Sub
End Sub'---------------------
'------------------------------
CIms=Yms:If Xms>Yms Then CIms=Xms
Call DlyPoint(SlpT):Line( 28*Xms+Xhd, 28*Yms+Yhd)-( 108*Xms+Xhd, 68*Yms+Yhd), 3,BF
Call DlyPoint(SlpT):Line( 28*Xms+Xhd, 68*Yms+Yhd)-( 18*Xms+Xhd, 78*Yms+Yhd), 15
Call DlyPoint(SlpT):Line( 18*Xms+Xhd, 78*Yms+Yhd)-( 18*Xms+Xhd, 18*Yms+Yhd), 15
Call DlyPoint(SlpT):Line( 18*Xms+Xhd, 18*Yms+Yhd)-( 118*Xms+Xhd, 18*Yms+Yhd), 15
Call DlyPoint(SlpT):Line( 118*Xms+Xhd, 18*Yms+Yhd)-( 108*Xms+Xhd, 28*Yms+Yhd), 15
Call DlyPoint(SlpT):Line( 108*Xms+Xhd, 28*Yms+Yhd)-( 28*Xms+Xhd, 28*Yms+Yhd), 15
Call DlyPoint(SlpT):Line( 28*Xms+Xhd, 28*Yms+Yhd)-( 28*Xms+Xhd, 68*Yms+Yhd), 15
Call DlyPoint(SlpT):Paint( 27*Xms+Xhd, 68*Yms+Yhd), 15, 15
Call DlyPoint(SlpT):Line( 18*Xms+Xhd, 78*Yms+Yhd)-( 28*Xms+Xhd, 68*Yms+Yhd), 8
Call DlyPoint(SlpT):Line( 18*Xms+Xhd, 78*Yms+Yhd)-( 118*Xms+Xhd, 78*Yms+Yhd), 8
Call DlyPoint(SlpT):Line( 118*Xms+Xhd, 78*Yms+Yhd)-( 118*Xms+Xhd, 18*Yms+Yhd), 8
Call DlyPoint(SlpT):Line( 118*Xms+Xhd, 18*Yms+Yhd)-( 108*Xms+Xhd, 28*Yms+Yhd), 8
Call DlyPoint(SlpT):Line( 108*Xms+Xhd, 28*Yms+Yhd)-( 108*Xms+Xhd, 68*Yms+Yhd), 8
Call DlyPoint(SlpT):Line( 108*Xms+Xhd, 68*Yms+Yhd)-( 28*Xms+Xhd, 68*Yms+Yhd), 8
Call DlyPoint(SlpT):Paint( 28*Xms+Xhd, 69*Yms+Yhd), 8, 8
Call DlyPoint(SlpT):Line( 53*Xms+Xhd, 36*Yms+Yhd)-( 48*Xms+Xhd, 50*Yms+Yhd), 1
Call DlyPoint(SlpT):Line( 48*Xms+Xhd, 50*Yms+Yhd)-( 43*Xms+Xhd, 56*Yms+Yhd), 1
Call DlyPoint(SlpT):Line( 43*Xms+Xhd, 56*Yms+Yhd)-( 40*Xms+Xhd, 57*Yms+Yhd), 1
Call DlyPoint(SlpT):Line( 40*Xms+Xhd, 57*Yms+Yhd)-( 39*Xms+Xhd, 56*Yms+Yhd), 1
Call DlyPoint(SlpT):Line( 39*Xms+Xhd, 56*Yms+Yhd)-( 38*Xms+Xhd, 53*Yms+Yhd), 1
Call DlyPoint(SlpT):Line( 38*Xms+Xhd, 53*Yms+Yhd)-( 39*Xms+Xhd, 52*Yms+Yhd), 1
Call DlyPoint(SlpT):Line( 39*Xms+Xhd, 52*Yms+Yhd)-( 44*Xms+Xhd, 49*Yms+Yhd), 1
Call DlyPoint(SlpT):Line( 44*Xms+Xhd, 49*Yms+Yhd)-( 52*Xms+Xhd, 47*Yms+Yhd), 1
Call DlyPoint(SlpT):Line( 52*Xms+Xhd, 47*Yms+Yhd)-( 52*Xms+Xhd, 51*Yms+Yhd), 1
Call DlyPoint(SlpT):Line( 52*Xms+Xhd, 51*Yms+Yhd)-( 53*Xms+Xhd, 53*Yms+Yhd), 1
Call DlyPoint(SlpT):Line( 53*Xms+Xhd, 53*Yms+Yhd)-( 56*Xms+Xhd, 54*Yms+Yhd), 1
Call DlyPoint(SlpT):Line( 56*Xms+Xhd, 54*Yms+Yhd)-( 58*Xms+Xhd, 53*Yms+Yhd), 1
Call DlyPoint(SlpT):Line( 58*Xms+Xhd, 53*Yms+Yhd)-( 61*Xms+Xhd, 50*Yms+Yhd), 1
Call DlyPoint(SlpT):Line( 61*Xms+Xhd, 50*Yms+Yhd)-( 61*Xms+Xhd, 47*Yms+Yhd), 1
Call DlyPoint(SlpT):Line( 61*Xms+Xhd, 47*Yms+Yhd)-( 60*Xms+Xhd, 43*Yms+Yhd), 1
Call DlyPoint(SlpT):Line( 60*Xms+Xhd, 43*Yms+Yhd)-( 57*Xms+Xhd, 42*Yms+Yhd), 1
Call DlyPoint(SlpT):Line( 57*Xms+Xhd, 42*Yms+Yhd)-( 56*Xms+Xhd, 42*Yms+Yhd), 1
Call DlyPoint(SlpT):Line( 56*Xms+Xhd, 42*Yms+Yhd)-( 54*Xms+Xhd, 43*Yms+Yhd), 1
Call DlyPoint(SlpT):Line( 54*Xms+Xhd, 43*Yms+Yhd)-( 52*Xms+Xhd, 46*Yms+Yhd), 1
Call DlyPoint(SlpT):Line( 61*Xms+Xhd, 49*Yms+Yhd)-( 73*Xms+Xhd, 43*Yms+Yhd), 1
Call DlyPoint(SlpT):Line( 73*Xms+Xhd, 43*Yms+Yhd)-( 71*Xms+Xhd, 52*Yms+Yhd), 1
Call DlyPoint(SlpT):Line( 71*Xms+Xhd, 52*Yms+Yhd)-( 70*Xms+Xhd, 58*Yms+Yhd), 1
Call DlyPoint(SlpT):Line( 70*Xms+Xhd, 58*Yms+Yhd)-( 68*Xms+Xhd, 62*Yms+Yhd), 1
Call DlyPoint(SlpT):Line( 68*Xms+Xhd, 62*Yms+Yhd)-( 67*Xms+Xhd, 62*Yms+Yhd), 1
Call DlyPoint(SlpT):Line( 67*Xms+Xhd, 62*Yms+Yhd)-( 67*Xms+Xhd, 59*Yms+Yhd), 1
Call DlyPoint(SlpT):Line( 67*Xms+Xhd, 59*Yms+Yhd)-( 73*Xms+Xhd, 50*Yms+Yhd), 1
Call DlyPoint(SlpT):Line( 73*Xms+Xhd, 50*Yms+Yhd)-( 78*Xms+Xhd, 47*Yms+Yhd), 1
Call DlyPoint(SlpT):Line( 78*Xms+Xhd, 47*Yms+Yhd)-( 81*Xms+Xhd, 47*Yms+Yhd), 1
Call DlyPoint(SlpT):Line( 81*Xms+Xhd, 47*Yms+Yhd)-( 82*Xms+Xhd, 49*Yms+Yhd), 1
Call DlyPoint(SlpT):Line( 82*Xms+Xhd, 49*Yms+Yhd)-( 81*Xms+Xhd, 53*Yms+Yhd), 1
Call DlyPoint(SlpT):Line( 81*Xms+Xhd, 53*Yms+Yhd)-( 82*Xms+Xhd, 56*Yms+Yhd), 1
Call DlyPoint(SlpT):Line( 82*Xms+Xhd, 56*Yms+Yhd)-( 84*Xms+Xhd, 56*Yms+Yhd), 1
Call DlyPoint(SlpT):Line( 84*Xms+Xhd, 56*Yms+Yhd)-( 87*Xms+Xhd, 54*Yms+Yhd), 1
Call DlyPoint(SlpT):Line( 39*Xms+Xhd, 42*Yms+Yhd)-( 40*Xms+Xhd, 39*Yms+Yhd), 1
Call DlyPoint(SlpT):Line( 40*Xms+Xhd, 39*Yms+Yhd)-( 45*Xms+Xhd, 37*Yms+Yhd), 1
Call DlyPoint(SlpT):Line( 45*Xms+Xhd, 37*Yms+Yhd)-( 56*Xms+Xhd, 34*Yms+Yhd), 1
Call DlyPoint(SlpT):Line( 56*Xms+Xhd, 34*Yms+Yhd)-( 71*Xms+Xhd, 33*Yms+Yhd), 1
'**********************************************************
