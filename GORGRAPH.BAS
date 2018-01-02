

ParametrMain$=Command$



screen 12
xv1=2:yv1=20
xv2=500:yv2=474
yvv1=36
for i=1 to 34:?chr$(205);:next i
color 8
?" Gor GRAPH ";
color 15
for i=1 to 35:?chr$(205);:next i
line(xv1-2,yvv1-2)-(xv2+2,yv2+2),14,b
line(xv1+7,yvv1+7)-(xv2-7,yv2-7),5,b
locate 2,67:?" Курсор: "
locate 4,72:?" Шаг: "
locate 6,72:?" пикс."
line(xv2+110,yv1+278)-(xv2+138,yv1+305),13,b
line(xv2+85,yv1+310)-(xv2+138,yv1+337),13,b
locate 20,64:?"Цв.под курс.:    "
locate 22,64:?"№ действ.:       "
st=10
color 14:locate 5,74:?"10"
gosub kur
cv%=14
for q=1 to 10
if q>5 then cv%=13
line(xv2+4,yv1+24-q)-(xv2+138,yv1+77+q),cv%,b
next q
circle(xv2+31,yv1+62-q),25,4

'**** МЕНЮ ( ЦВЕТ ) *****
line(xv2+4,yv1+100)-(xv2+138,yv1+260),13,b
color 9:locate 8,66:?" Выбор цвета "
Cvet%=15
for i=0 to 7
    locate 10+i,68:color i :? i
    locate 10+i,74:color 8+i:? 8+i
next i
locate 17,73:color 9:? chr$(26)
'locate 10,66:color 0:?"0"
'***** Cтрока ***********
maximum%=1000
dim dynamic Stroki$(maximum%)  'Массив для строк ,  trek - Переменная
dim dynamic CvSt%(maximum%)    'Mассив для цвета
dim dynamic x1St%(maximum%)    'Mассив для x1
dim dynamic y1St%(maximum%)    'Mассив для y1
dim dynamic x2St%(maximum%)    'Mассив для x2
dim dynamic y2St%(maximum%)    'Mассив для y2
dim dynamic raSt%(maximum%)    'Mассив для радиуса
dim dynamic ndSt(maximum%)     'Mассив для начало дуги (pi1)
dim dynamic kdSt(maximum%)     'Mассив для конец дуги (pi2)
dim dynamic arSt(maximum%)     'Mассив для cжатия
dim dynamic bfSt%(maximum%)    'Массив для 0- ,1-b,2-bf
dim dynamic CpSt%(maximum%)    'Массив для света границ заливки
trek=0
color 15:locate 2,1:?"Строка: "
color 14:locate 2,9:?"LINE  ( 100 , 100 )"
 Oper%=1'                                 Оператор
LI$="   "
xOp=16
yOp=22
xLI2=-10
yLI2=-10
xLI1=-10
yLI1=-10
FileName$="graph"
'1 - LINE (,)-(,),,
'3 - PSET (,),
'2 - CIRCLE (,),,
'4 - PAINT (,),,
'************************
view(xv1,yvv1)-(xv2,yv2),,9
draw"c15bm100,100bd1br4u1l1r1u1"
draw"ta90c14bm100,100r0bd1br4u1l1r1u1"
draw"ta180c13bm100,100bd1br4u1l1r1u1"
draw"ta270c12bm100,100bd1br4u1l1r1u1"
dim Kursor%(40)
get(96,96)-(104,104),Kursor%
'line(96,96)-(104,104),0,bf
'put(96,96),Kursor%,xor
'Коор. курсора
xk=100
yk=100
flag=0
n$=""

while n$<>chr$(27)  '"Сем"

select case n$
case chr$(0)+chr$(77) '                                 Вправо
     if flag<>77 then gosub kur:color 14:locate 5,69,0:? "В"
     flag=77
     xkold=xk
     xk=xk+st
     if xk>xv2-10 then xk=xv2-10
     put(xkold-4,yk-4),Kursor%,xor
     toch=point(xk,yk)
     put(xk-4,yk-4),Kursor%,xor

case chr$(0)+chr$(75) '                                 Влево
     if flag<>75 then gosub kur:color 14:locate 5,65,0:? "З"
     flag=75
     xkold=xk
     xk=xk-st
     if xk<xv1+6 then xk=xv1+6
     put(xkold-4,yk-4),Kursor%,xor
     toch=point(xk,yk)
     put(xk-4,yk-4),Kursor%,xor

case chr$(0)+chr$(72) '                                  Вверх
     if flag<>72 then gosub kur:color 14:locate 4,67,0:? "С"
     flag=72
     ykold=yk
     yk=yk-st
     if yk<yv1-12 then yk=yv1-12
     put(xk-4,ykold-4),Kursor%,xor
     toch=point(xk,yk)
     put(xk-4,yk-4),Kursor%,xor

case chr$(0)+chr$(80) '                                  Вниз
     if flag<>80 then gosub kur:color 14:locate 6,67,0:? "Ю"
     flag=80
     ykold=yk
     yk=yk+st
     if yk>yv2-44 then yk=yv2-44
     put(xk-4,ykold-4),Kursor%,xor
     toch=point(xk,yk)
     put(xk-4,yk-4),Kursor%,xor

case " "'                                                 Меню ( выбор цвета )
     color 15
     locate 8,66:?" Выбор цвета "
     if Cvet%<8 then locx%=67:locy%=Cvet%+10
     if Cvet%>7 then locx%=73:locy%=Cvet%-8+10
     locate locy%,locx%:? chr$(26)

'+++++++++++++++++++++++++++++++++++++++++ Cvet% - текущий цвет
     m$=""

     while m$<>" " and m$<>chr$(27) and m$<>chr$(13)
      m$=inkey$
      if m$=chr$(0)+chr$(72) or m$=chr$(0)+chr$(80) or m$=chr$(0)+chr$(75) or m$=chr$(0)+chr$(77) or m$=chr$(13) then

        select case m$
        case chr$(0)+chr$(72)
             Cvetold%=Cvet%
             Cvet%=Cvet%-1
        case chr$(0)+chr$(80)
             Cvetold%=Cvet%
             Cvet%=Cvet%+1
        case chr$(0)+chr$(77)
             Cvetold%=Cvet%
             Cvet%=Cvet%+8
        case chr$(0)+chr$(75)
             Cvetold%=Cvet%
             Cvet%=Cvet%-8


        end select
        if Cvetold%<8 then locx%=67:locy%=Cvetold%+10
        if Cvetold%>7 then locx%=73:locy%=Cvetold%-8+10
        color 15
        locate locy%,locx%:? " "
        if Cvet%<0 or Cvet%>15 then Cvet%=Cvetold%

        'select case Cvet%
        if Cvet%<8 then locx%=67:locy%=Cvet%+10
        if Cvet%>7 then locx%=73:locy%=Cvet%-8+10
        locate locy%,locx%:? chr$(26)
        'end select
'"""
  if Oper%=1 and xOp=30 then

        color 14:locate 2,43:? Cvet%
          put(xk-4,yk-4),Kursor%,xor
          color 15:locate 1,1:? chr$(205)
        pset(xLI1,yLI1),Cvet%
        put(xk-4,yk-4),Kursor%,xor
                   locate 1,1:? " "         '            ================
          color 15:locate 1,1:? chr$(205)   '            ================
      end if
      if Oper%=2            then color 14:locate 2,29:? Cvet%
      if Oper%=3            then color 14:locate 2,35:? Cvet%
      if Oper%=3 and flc%=1 then
        put(xk-4,yk-4),Kursor%,xor
        color 15:locate 1,1:? chr$(205)
      pset(xLI2,yLI2),Cvet%
      put(xk-4,yk-4),Kursor%,xor
                 locate 1,1:? " "         '            ================
        color 15:locate 1,1:? chr$(205)   '            ================
      end if
      if Oper%=4 then color 14:locate 2,28:?","Cvet%:locate 2,33:?","Cvet%

'"""
     end if
     wend
     color 9
     locate 8,66:?" Выбор цвета "
     if Cvet%<8 then locx%=67:locy%=Cvet%+10
     if Cvet%>7 then locx%=73:locy%=Cvet%-8+10
     locate locy%,locx%:? chr$(26)

         'Cvet%                        Новый цвет
'+++++++++++++++++++++++++++++++++++++++++++++++++++
case "l","L","Д","д"                                    'Горячие клавиши
Oper%=1 : color 14:locate 2,9:?"LINE  "
'Rez%  Бывший цвет под точкой
locate 2,28:?"                                       "
if xOp=30 then
        put(xk-4,yk-4),Kursor%,xor
        color 15:locate 1,1:? chr$(205)

pset(xLI1,yLI1),Rez%
        put(xk-4,yk-4),Kursor%,xor
                 locate 1,1:? " "         '            ================
        color 15:locate 1,1:? chr$(205)   '            ================

end if
        put(xk-4,yk-4),Kursor%,xor
        color 15:locate 1,1:? chr$(205)

pset(xLI2,yLI2),Rez%
        put(xk-4,yk-4),Kursor%,xor
                 locate 1,1:? " "         '            ================
        color 15:locate 1,1:? chr$(205)   '            ================

xOp=16:yOp=22
flc%=0
Radius%=0
drob=0
dug%=0
LI$="   "
        xLI2=-10
        yLI2=-10
        xLI1=-10
        yLI1=-10

case "p","P","З","з"
xOp=16:yOp=22
locate 2,28:?"                                       "
Oper%=2 : color 14:locate 2,9:?"PSET  ":locate 2,28:?"," Cvet%
        put(xk-4,yk-4),Kursor%,xor
        color 15:locate 1,1:? chr$(205)

pset(xLI1,yLI1),Rez%
pset(xLI2,yLI2),Rez%
        put(xk-4,yk-4),Kursor%,xor
                 locate 1,1:? " "         '            ================
        color 15:locate 1,1:? chr$(205)   '            ================

flc%=0
Radius%=0
drob=0
dug%=0
LI$="   "
        xLI2=-10
        yLI2=-10
        xLI1=-10
        yLI1=-10


case "C","c","с","С"
xOp=16:yOp=22
locate 2,28:?"                                       "
Oper%=3 : color 14:locate 2,9:?"CIRCLE":locate 2,28:?", 0   ,":locate 2,35:? Cvet%",    ,    , 0.00"
        put(xk-4,yk-4),Kursor%,xor
        color 15:locate 1,1:? chr$(205)

pset(xLI1,yLI1),Rez%
pset(xLI2,yLI2),Rez%
        put(xk-4,yk-4),Kursor%,xor
                 locate 1,1:? " "         '            ================
        color 15:locate 1,1:? chr$(205)   '            ================

Radius%=0
drob=0
flc%=0
dug%=0
LI$="   "
        xLI2=-10
        yLI2=-10
        xLI1=-10
        yLI1=-10


case "a","A","ф","Ф"
locate 2,28:?"                                       "
Oper%=4 : color 14:locate 2,9:?"PAINT ":locate 2,28:?","Cvet%:locate 2,33:?","Cvet%
        put(xk-4,yk-4),Kursor%,xor
        color 15:locate 1,1:? chr$(205)

pset(xLI1,yLI1),Rez%
pset(xLI2,yLI2),Rez%
        put(xk-4,yk-4),Kursor%,xor
                 locate 1,1:? " "         '            ================
        color 15:locate 1,1:? chr$(205)   '            ================

xOp=16:yOp=22
Radius%=0
Drob=0
flc%=0
dug%=0
LI$="   "
        xLI2=-10
        yLI2=-10
        xLI1=-10
        yLI1=-10

'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Рисование дуг ~~~~~~~~~~~~~~~~~~
case chr$(0)+chr$(60)
if Oper%=3 and dug%=0 then dug%=1:goto dodo
if Oper%=3 and dug%=1 then dug%=0
dodo:
Oper%=3 : color 14:locate 2,9:?"CIRCLE":locate 2,28:?", 0   ,":locate 2,35:? Cvet%",    ,    , 0.00"
        put(xk-4,yk-4),Kursor%,xor
        color 15:locate 1,1:? chr$(205)

pset(xLI1,yLI1),Rez%
pset(xLI2,yLI2),Rez%
        put(xk-4,yk-4),Kursor%,xor
                 locate 1,1:? " "         '            ================
        color 15:locate 1,1:? chr$(205)   '            ================

'gosub bbf
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Рисов. не закраш. прям - ка ~~~~
case chr$(0)+chr$(61)
if Oper%=1 and (LI$="   " or LI$=",BF") then LI$=",B ":gosub bbf:goto dodo1
if Oper%=1 and LI$=",B " then LI$="   ":gosub bbf
dodo1:
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Рисов. закраш. прям - ка ~~~~~~~
case chr$(0)+chr$(62)
if Oper%=1 and (LI$="   " or LI$=",B ") then LI$=",BF" :gosub bbf:goto dodo2
if Oper%=1 and LI$=",BF" then LI$="   " :gosub bbf
dodo2:
'~~~~~~~~~~~~~~~~~~~~~~~~~Отмена последнего действия~~~~~~~~~~~
case chr$(0)+chr$(83)
if trek<>0 then
trek=trek-1:gosub obnov
xOp=16:yOp=22
Radius%=0
Drob=0
flc%=0
'dug%=0
'LI$="   "
        xLI2=-10
        yLI2=-10
        xLI1=-10
        yLI1=-10
end if
gosub Nde
'~~~~~~~~~~~~~~~~~~~~~~~~~ Возврат действия ~~~~~~~~~~~~~~~~~
case chr$(0)+chr$(82)
if Stroki$(trek+1)<>"" then
trek=trek+1:gosub obnov
xOp=16:yOp=22
Radius%=0
Drob=0
flc%=0
'dug%=0
'LI$="   "
        xLI2=-10
        yLI2=-10
        xLI1=-10
        yLI1=-10

end if
gosub Nde
'~~~~~~~~~~~~~~~~~~Рисунок готв~~~~~~~~~~~~~~
case chr$(0)+chr$(79)
'xOp=16:yOp=22
'Radius%=0
'Drob=0
'flc%=0
'dug%=0
'LI$="   "
'        xLI2=-10
'        yLI2=-10
'        xLI1=-10
'        yLI1=-10
cls
line(120,85)-(357,148),1,bf
line(120,85)-(357,148),14,b

Xms=1    'Увеличение по оси ОX
Yms=1    'Увеличение по оси ОY
Xhd=-5    'Смещение   по оси OX
Yhd=100    'Смещение   по оси OY
for i=1 to 3
yhd=yhd-31
CIms=Yms:If Xms>Yms then CIms=Xms
Circle( 240*Xms+Xhd, 260*Yms+Yhd), 70*Xms, 14, 0, 6.282999992370605, .2857142984867096/(Xms/Yms)
Circle( 240*Xms+Xhd, 260*Yms+Yhd), 21*Xms, 14, 0, 6.282999992370605, .2857142984867096/(Xms/Yms)
Paint( 261*Xms+Xhd, 272*Yms+Yhd), 14, 14
Circle( 240*Xms+Xhd, 260*Yms+Yhd), 71*Xms, 15, 0, 6.282999992370605, .2816901504993439/(Xms/Yms)
Circle( 240*Xms+Xhd, 260*Yms+Yhd), 21*Xms, 15, 0, 6.282999992370605, .2380952388048172/(Xms/Yms)
Circle( 240*Xms+Xhd, 260*Yms+Yhd), 20*Xms, 5, 0, 6.282999992370605, .2000000029802322/(Xms/Yms)
Paint( 240*Xms+Xhd, 260*Yms+Yhd), 5, 5
Circle( 240*Xms+Xhd, 260*Yms+Yhd), 7*Xms, 0, 0, 6.282999992370605, .2857142984867096/(Xms/Yms)
Paint( 240*Xms+Xhd, 260*Yms+Yhd), 0, 0
Line( 261*Xms+Xhd, 262*Yms+Yhd)-( 301*Xms+Xhd, 269*Yms+Yhd), 10
Line( 258*Xms+Xhd, 264*Yms+Yhd)-( 294*Xms+Xhd, 272*Yms+Yhd), 10
Line( 218*Xms+Xhd, 260*Yms+Yhd)-( 173*Xms+Xhd, 265*Yms+Yhd), 10
Line( 220*Xms+Xhd, 262*Yms+Yhd)-( 185*Xms+Xhd, 271*Yms+Yhd), 10
Line( 219*Xms+Xhd, 261*Yms+Yhd)-( 179*Xms+Xhd, 269*Yms+Yhd), 10
Line( 262*Xms+Xhd, 260*Yms+Yhd)-( 308*Xms+Xhd, 262*Yms+Yhd), 10
next i
Xms=1    'Увеличение по оси ОX
Yms=1    'Увеличение по оси ОY
Xhd=6    'Смещение   по оси OX
Yhd=-15    'Смещение   по оси OY
CIms=Yms:If Xms>Yms then CIms=Xms
Line( 190*Xms+Xhd, 200*Yms+Yhd)-( 220*Xms+Xhd, 250*Yms+Yhd), 2
Line( 240*Xms+Xhd, 250*Yms+Yhd)-( 270*Xms+Xhd, 200*Yms+Yhd), 2
Line( 210*Xms+Xhd, 250*Yms+Yhd)-( 250*Xms+Xhd, 250*Yms+Yhd), 2
Line( 250*Xms+Xhd, 250*Yms+Yhd)-( 230*Xms+Xhd, 270*Yms+Yhd), 2
Line( 230*Xms+Xhd, 270*Yms+Yhd)-( 210*Xms+Xhd, 250*Yms+Yhd), 2
Line( 190*Xms+Xhd, 200*Yms+Yhd)-( 270*Xms+Xhd, 200*Yms+Yhd), 2
Paint( 240*Xms+Xhd, 220*Yms+Yhd), 2, 2
Paint( 230*Xms+Xhd, 260*Yms+Yhd), 2, 2
Line( 250*Xms+Xhd, 250*Yms+Yhd)-( 210*Xms+Xhd, 250*Yms+Yhd), 1


Fil$=""
color 3
locate 10,20:? "                 "
locate 10,20+len(FileName$):? chr$(5)
color 15

locate 10,20:? FileName$
locate 10,38:? ".bas"

while Fil$<>chr$(27)
113 Fil$=inkey$
if Fil$="" then goto 113
if Fil$>=" " and Fil$<="п" then
   if len(FileName$)>15 then goto 113
   FileName$=FileName$+Fil$
   locate 10,20:color 15:? FileName$
   locate 10,20+len(FileName$):color 3:?chr$(5)
end if
if Fil$=chr$(8) then
   if len(FileName$)<1 then goto 113
   FileName$=left$(FileName$,len(FileName$)-1)
   locate 10,20:color 15:? FileName$
   locate 10,20+len(FileName$):color 3:? chr$(5)+" "
end if
if Fil$=chr$(13) then gosub saveFN:goto xplrer
wend
xplrer:
gosub obnov

'~~~~~~~~~~~~~~~~~~~~~~~~~~ HELP ~~~~~~~~~~~~~~~~~~
case chr$(0)+chr$(59)
cls

Xms=1.3    'Увеличение по оси ОX
Yms=1    'Увеличение по оси ОY
Xhd=-20    'Смещение   по оси OX
Yhd=0    'Смещение   по оси OY
CIms=Yms:If Xms>Yms then CIms=Xms
Circle( 137*Xms+Xhd, 52*Yms+Yhd), 40*CIms, 3, 0, 3.141499996185303, 1/(Xms/Yms)
Circle( 357*Xms+Xhd, 52*Yms+Yhd), 40*CIms, 3, 0, 3.141499996185303, 1/(Xms/Yms)
Circle( 277*Xms+Xhd, 372*Yms+Yhd), 40*CIms, 3, 3.141499996185303, 6.282999992370605, 1/(Xms/Yms)
Circle( 57*Xms+Xhd, 372*Yms+Yhd), 40*CIms, 3, 3.141499996185303, 6.282999992370605, 1/(Xms/Yms)
Line( 97*Xms+Xhd, 372*Yms+Yhd)-( 97*Xms+Xhd, 52*Yms+Yhd), 3
Line( 317*Xms+Xhd, 52*Yms+Yhd)-( 317*Xms+Xhd, 372*Yms+Yhd), 3
Line( 357*Xms+Xhd, 12*Yms+Yhd)-( 137*Xms+Xhd, 12*Yms+Yhd), 3
Line( 397*Xms+Xhd, 52*Yms+Yhd)-( 317*Xms+Xhd, 52*Yms+Yhd), 3
Line( 237*Xms+Xhd, 372*Yms+Yhd)-( 17*Xms+Xhd, 372*Yms+Yhd), 3
Line( 57*Xms+Xhd, 412*Yms+Yhd)-( 277*Xms+Xhd, 412*Yms+Yhd), 3
Paint( 217*Xms+Xhd, 392*Yms+Yhd), 3, 3
Paint( 28*Xms+Xhd, 392*Yms+Yhd), 3, 3
Paint( 348*Xms+Xhd, 32*Yms+Yhd), 3, 3
Line( 140*Xms+Xhd, 13*Yms+Yhd)-( 181*Xms+Xhd, 59*Yms+Yhd), 0,BF
paint(1,1),1,3
'##### СПРАВКА #####
color 7:locate 6,26:?"Горячие клавиши:"
color 15
locate 7,16:?"Справка _____________________ F1"
locate 8,16:?"PAINT _______________________ A "
locate 9,16:?"PSET ________________________ P "
locate 10,16:?"LINE ________________________ L "
locate 11,16:?"* Рис.контур.прям-ка ________ F3"
locate 12,16:?"* Рис.закраш.прям-ка ________ F4"
locate 13,16:?"CIRCLE ______________________ C "
locate 14,16:?"* Рис.дуги __________________ F2"
locate 15,16:?"Сохранить как.. _____________ End"
locate 16,16:?"Выход (отмена) ______________ Esc"
locate 17,16:?"Отмена действия _____________ Del"
locate 18,16:?"Возврат действия ____________ Ins"
locate 19,16:?"Выбор Цвета ______________ ПРОБЕЛ"
locate 20,16:?"Больше/меньше шаг курсора____ +/-"
color 13
locate 22,16:?"      GSPro 2001-2002 г."
locate 23,16:?"      GorGRAPH Версия: 1.3 Basic"
locate 24,16:?"      Copyright: Горячкин Семен."
color 14
'color 13:locate 6,16:?"LINE _______________________ ''L''
'color 13:locate 6,16:?"LINE _______________________ ''L''
'color 13:locate 6,16:?"LINE _______________________ ''L''
'###################
while inkey$=""
wend
gosub obnov


'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
case chr$(13)'                            Ввод
'    {{{{{{{{ Если оператор LINE (Oper%=1) }}}}}}}}
     if Oper%=1 and xOp=16 then
        xLI1=xk
        yLI1=yk
        put(xk-4,yk-4),Kursor%,xor
        locate 1,1:? " "         '            ================
        color 15:locate 1,1:? chr$(205)   '   ================
        Rez%=point(xLI1,yLI1)
        pset(xLI1,yLI1),Cvet%
        toch=Cvet%
        put(xk-4,yk-4),Kursor%,xor
        locate 1,1:? " "         '            ================
        locate 1,1:? chr$(205)   '            ================
        color 14
        locate 2,28:? "-("xk
        locate 2,35:? ","yk
        locate 2,41:? "),"Cvet%
        gosub bbf
        xOp=30
        yOp=36
        goto jek
     end if
     if Oper%=1 and xOp=30 then
        trek=trek+1
        put(xk-4,yk-4),Kursor%,xor
color 15
        locate 1,1:? " "         '            ================
        locate 1,1:? chr$(205)   '            ================
        locate 2,28:?"                      "
select case LI$
case "   ":line(xLI1,yLI1)-(xk,yk),Cvet%   :bfSt%(trek)=0
case ",B ":line(xLI1,yLI1)-(xk,yk),Cvet%,b :bfSt%(trek)=1
case ",BF":line(xLI1,yLI1)-(xk,yk),Cvet%,bf:bfSt%(trek)=2
end select
        toch=Cvet%
        put(xk-4,yk-4),Kursor%,xor
        locate 1,1:? " "         '            ================
        locate 1,1:? chr$(205)   '            ================
        xOp=16
        yOp=22
'************* Запись строки в массив LINE **************

        Stroki$(trek)="Line("+str$(xLI1)+"*Xms+Xhd,"+str$(yLI1)+"*Yms+Yhd)-("+str$(xk)+"*Xms+Xhd,"+str$(yk)+"*Yms+Yhd),"+str$(Cvet%)+LI$
CvSt%(trek)=Cvet%
x1St%(trek)=xLI1
y1St%(trek)=yLI1
x2St%(trek)=xk
y2St%(trek)=yk

'********************************************************
        xLI1=-10
        yLI1=-10

     end if
'    {{{{{{{{ Если оператор PSET (Oper%=2) }}}}}}}}
     if Oper%=2 then
        put(xk-4,yk-4),Kursor%,xor
        color 15:locate 1,1:? chr$(205)
        Cvethel%=point(xk,yk)
        pset(xk,yk),Cvet%
        toch=Cvet%
        put(xk-4,yk-4),Kursor%,xor
                 locate 1,1:? " "         '            ================
        color 15:locate 1,1:? chr$(205)   '            ================
        if Cvethel%=Cvet% then goto methel
'************* Запись строки в массив PSET **************
        trek=trek+1
        Stroki$(trek)="Pset("+str$(xk)+"*Xms+Xhd,"+str$(yk)+"*Yms+Yhd),"+str$(Cvet%)
CvSt%(trek)=Cvet%
x1St%(trek)=xk
y1St%(trek)=yk

'********************************************************
methel:
     end if
'    {{{{{{{{ Если оператор CIRCLE (Oper%=3) }}}}}}}}
     if Oper%=3 and flc%=0 then
        xLI2=xk
        yLI2=yk
        put(xk-4,yk-4),Kursor%,xor
        locate 1,1:? " "         '            ================
        color 15:locate 1,1:? chr$(205)   '   ================
        Rez%=point(xLI2,yLI2)
        pset(xLI2,yLI2),Cvet%
        toch=Cvet%
        put(xk-4,yk-4),Kursor%,xor
        locate 1,1:? " "         '            ================
        locate 1,1:? chr$(205)   '            ================
        color 14
        flc%=1
        goto jek
     end if
     if Oper%=3 and flc%=1 then
        Radius%=abs(xLI2-xk) : spesh$="Xms"
        if Radius%=0 then goto jek
        if yLI2-yk=0 then goto jek
        Drob=abs((yLI2-yk)/Radius%)
        if Radius%<abs(yLI2-yk) then Radius%=abs(yLI2-yk):Drob=abs(Radius%/(xLI2-xk)):spesh$="Yms"
        if abs(xLI2-xk)=abs(yLI2-yk) then spesh$="CIms"
      if dug%=1 and yLI2>yk then pi1=0:pi2=3.1415
      if dug%=1 and yLI2<yk then pi1=3.1415:pi2=6.283
      if dug%=0 then pi1=0:pi2=6.283
        put(xk-4,yk-4),Kursor%,xor
        locate 1,1:? chr$(205)
        circle(xLI2,yLI2),Radius%,Cvet%,pi1,pi2,Drob
        pset(xLI2,yLI2),Rez%
        put(xk-4,yk-4),Kursor%,xor
                 locate 1,1:? " "         '            ================
        color 15:locate 1,1:? chr$(205)   '            ================
        flc%=0

'************* Запись строки в массив CIRCLE **************
        trek=trek+1
        Stroki$(trek)="Circle("+str$(xLI2)+"*Xms+Xhd,"+str$(yLI2)+"*Yms+Yhd),"+str$(Radius%)+"*"+spesh$+","+str$(Cvet%)+","+str$(pi1)+","+str$(pi2)+","+str$(Drob)+"/(Xms/Yms)"
CvSt%(trek)=Cvet%
x1St%(trek)=xLI2
y1St%(trek)=yLI2
raSt%(trek)=Radius%
arSt(trek)=Drob
ndSt(trek)=pi1
kdSt(trek)=pi2

'********************************************************
        xLI2=-10
        yLI2=-10

     end if

'    {{{{{{{{ Если оператор PAINT (Oper%=4) }}}}}}}}
     if Oper%=4 then
        put(xk-4,yk-4),Kursor%,xor
        locate 1,1:? chr$(205)
	paint(xk,yk),Cvet%,Cvet%
        toch=Cvet%
        put(xk-4,yk-4),Kursor%,xor
                 locate 1,1:? " "         '            ================
        color 15:locate 1,1:? chr$(205)   '            ================
'************* Запись строки в массив PAINT **************
        trek=trek+1
        Stroki$(trek)="Paint("+str$(xk)+"*Xms+Xhd,"+str$(yk)+"*Yms+Yhd),"+str$(Cvet%)+","+str$(Cvet%)
CvSt%(trek)=Cvet%
CpSt%(trek)=Cvet% '                                               сменить
x1St%(trek)=xk
y1St%(trek)=yk


'********************************************************
     end if

jek:

gosub Nde
end select          ' Конец выбора клавиш.

if n$<>"" then
   locate 20,79:? "  "
   color toch:locate 20,77:? toch
end if
'Рассчён Radius% и Drob

'Координаты курсора
if flc%=1 then
select case n$
case chr$(0)+chr$(60),"A","ф","Ф",chr$(0)+chr$(75),chr$(0)+chr$(77),chr$(0)+chr$(72),chr$(0)+chr$(80),chr$(13),"l","L","Д","д","c","C","с","С","p","P","з","З","a"
        Radius%=abs(xLI2-xk)
        if Radius%=0 then goto zero1
        if yLI2-yk=0 then goto zero1
        Drob=abs((yLI2-yk)/Radius%)
        if Radius%<abs(yLI2-yk) then Radius%=abs(yLI2-yk):Drob=abs(Radius%/(xLI2-xk))
 if dug%=1 and yLI2>yk then pi1=0:pi2=3.1415
 if dug%=1 and yLI2<yk then pi1=3.1415:pi2=6.283
zero1:
color 14
   locate 2,29:? "    "
   locate 2,29:? Radius%
locate 2,40:? "    ":locate 2,45:? "    "
if dug%=1 then locate 2,40:? using"#.##";pi1:locate 2,45:? using"#.##";pi2

   locate 2,50:? "     "
   locate 2,50:? using"##.##";Drob
   goto metc
end select
end if
if n$=chr$(0)+chr$(75) or n$=chr$(0)+chr$(77) or n$=chr$(13) or n$="l" or n$="L" or n$="Д" or n$="д" or n$="c" or n$="C" or n$="с" or n$="С" or n$="p" or n$="P" or n$="з" or n$="З" or n$="a" or n$="A" or n$="ф" or n$="Ф" then
   color 14
   locate 2,xOp:?"   "
   locate 2,xOp:? xk
end if
if n$=chr$(0)+chr$(72) or n$=chr$(0)+chr$(80) or n$=chr$(13) or n$="l" or n$="L" or n$="Д" or n$="д" or n$="c" or n$="C" or n$="с" or n$="С" or n$="p" or n$="P" or n$="з" or n$="З" or n$="a" or n$="A" or n$="ф" or n$="Ф" then
   color 14
   locate 2,yOp:?"   "
   locate 2,yOp:? yk
end if
metc:
n$=inkey$
'mous=inp(1016)

if n$="1" or n$="2" or n$="3" or n$="4" or n$="5" or n$="6" or n$="7" or n$="8" or n$="9" then
     st=val(n$)
     gosub ste
end if
select case n$
case "0"
     st=10
     gosub ste
case "-","_"
     st=st-1
     gosub ste
case "=","+"
     st=st+1
     gosub ste
end select

wend
cls

'"""Esc
Xms=1    'Увеличение по оси ОX
Yms=1    'Увеличение по оси ОY
Xhd=-5    'Смещение   по оси OX
Yhd=0    'Смещение   по оси OY
CIms=Yms:If Xms>Yms then CIms=Xms
Line( 190*Xms+Xhd, 200*Yms+Yhd)-( 270*Xms+Xhd, 360*Yms+Yhd), 3,BF
Line( 266*Xms+Xhd, 356*Yms+Yhd)-( 194*Xms+Xhd, 204*Yms+Yhd), 0,BF
Line( 194*Xms+Xhd, 204*Yms+Yhd)-( 206*Xms+Xhd, 230*Yms+Yhd), 8
Line( 206*Xms+Xhd, 230*Yms+Yhd)-( 206*Xms+Xhd, 386*Yms+Yhd), 8
Line( 206*Xms+Xhd, 386*Yms+Yhd)-( 194*Xms+Xhd, 356*Yms+Yhd), 8
Line( 194*Xms+Xhd, 356*Yms+Yhd)-( 194*Xms+Xhd, 204*Yms+Yhd), 8
Paint( 200*Xms+Xhd, 232*Yms+Yhd), 8, 8
Circle( 202*Xms+Xhd, 304*Yms+Yhd), 4*Yms, 10, 0, 6.282999992370605, 4/(Xms/Yms)
Paint( 202*Xms+Xhd, 304*Yms+Yhd), 10, 10
Pset( 204*Xms+Xhd, 303*Yms+Yhd), 2
Pset( 204*Xms+Xhd, 305*Yms+Yhd), 2
Pset( 204*Xms+Xhd, 304*Yms+Yhd), 2
Pset( 205*Xms+Xhd, 304*Yms+Yhd), 2
Pset( 205*Xms+Xhd, 305*Yms+Yhd), 2
Pset( 205*Xms+Xhd, 303*Yms+Yhd), 2
Line( 208*Xms+Xhd, 386*Yms+Yhd)-( 207*Xms+Xhd, 229*Yms+Yhd), 1,BF
Line( 208*Xms+Xhd, 228*Yms+Yhd)-( 196*Xms+Xhd, 204*Yms+Yhd), 1
Line( 195*Xms+Xhd, 204*Yms+Yhd)-( 207*Xms+Xhd, 228*Yms+Yhd), 1
Line( 206*Xms+Xhd, 228*Yms+Yhd)-( 195*Xms+Xhd, 205*Yms+Yhd), 1
Line( 191*Xms+Xhd, 199*Yms+Yhd)-( 271*Xms+Xhd, 199*Yms+Yhd), 5
Line( 271*Xms+Xhd, 199*Yms+Yhd)-( 271*Xms+Xhd, 359*Yms+Yhd), 5

line(70,85)-(407,148),1,bf
line(70,85)-(407,148),14,b
if FileName$="" then FileName$="graph"
inBA=instr(FileName$,".")
if inBA<>0 then FileName$=left$(FileName$,inBA-1)
color 6:locate 14,27:?"выход"
color 15
locate 10,12:? "                                      "
locate 10,12:? "Сохранить "+chr$(34)+FileName$+".bas"+chr$(34)+" ?(Д/Н)"
while ex$<>"д" and ex$<>"L" and ex$<>"l" and ex$<>"Д"
ex$=inkey$
select case ex$
case chr$(27):n$="":gosub obnov:goto dodo1
case "Y","y","Н","н":end
end select
wend
'"""
if FileName$="" then FileName$="graph"
Izum%=1
gosub saveFN

end

saveFN:
if FileName$="" then FileName$="graph"
inBA=instr(FileName$,".")
if inBA<>0 then FileName$=left$(FileName$,inBA-1)

Open FileName$+".bas" for output as #1
? #1, "screen 12"
? #1, chr$(39)"***** GSPro GorGRAPH Copyright(c) Горячкин Семен ********"
? #1, "Xms=1    "chr$(39)" Кооф. увеличения по оси ОX"
? #1, "Yms=1    "chr$(39)" Кооф. увеличение по оси ОY"
? #1, "Xhd=0    "chr$(39)" Смещение   по оси OX"
? #1, "Yhd=0    "chr$(39)" Смещение   по оси OY"
'Задержка
? #1, ""
? #1, "SlpT=0    "chr$(39)"Задержка (в секундах) для создания спецэффектов."
? #1, "          "chr$(39)"(не зависит от тактовой частоты процессора)"
? #1, ""
? #1, chr$(39)"_____ Процедура DlyPt ________ "
? #1, "Sub DlyPt(SleepTimerSUB)"
? #1, "    MTimerGET=Timer:While SleepTimerSUB>Timer-MTimerGET:WEnd:Exit Sub"
? #1, "End Sub"chr$(39)"--------------------- "
? #1, chr$(39)"------------------------------ "

? #1, "CIms=Yms:If Xms>Yms Then CIms=Xms"
for i=1 to trek
? #1, "Call DlyPt(SlpT):";
? #1, Stroki$(i)
next i

? #1, chr$(39)"*********************************************************"
Close

RETURN

kur:
'Обновление стрелок
color 9:locate 4,67,0:print " "
locate 4,67,0:print "С"
locate 5,69,0:? "В"
locate 6,67,0:? "Ю"
locate 5,65,0:? "З"
color 8:locate 5,67,0:? chr$(18)
locate 4,67,0
RETURN

ste:
'Шаг
color 14
locate 5,72:?"     "
locate 5,73:? st
RETURN

bbf:
' B или BF в LINE
color 14
locate 2,50:? LI$
RETURN

Nde:
' Номер действия
color 14
locate 22,74:?"     "
locate 22,74:?"     "
locate 22,74:? trek
RETURN

obnov:
'Обновление
          put(xk-4,yk-4),Kursor%,xor
          color 15:locate 1,1:? chr$(205)
cls
'line(0,0)-(500,450),0,bf
line(7,7)-(491,431),5,b

for i=1 to trek
buk2$=left$(Stroki$(i),2)
select case buk2$
case "Li":
  select case bfSt%(i)
  case 0:line(x1St%(i),y1St%(i))-(x2St%(i),y2St%(i)),CvSt%(i)
  case 1:line(x1St%(i),y1St%(i))-(x2St%(i),y2St%(i)),CvSt%(i),b
  case 2:line(x1St%(i),y1St%(i))-(x2St%(i),y2St%(i)),CvSt%(i),bf
  end select
case "Ps":
  pset(x1St%(i),y1St%(i)),CvSt%(i)
case "Ci":
  circle(x1St%(i),y1St%(i)),raSt%(i),CvSt%(i),ndSt(i),kdSt(i),arSt(i)
case "Pa":
  paint(x1St%(i),y1St%(i)),CvSt%(i),CpSt%(i)
end select
next i
pset(xLI1,yLI1),Cvet%
pset(xLI2,yLI2),Cvet%
toch=point(xk,yk)
          put(xk-4,yk-4),Kursor%,xor
                   locate 1,1:? " "         '            ================
          color 15:locate 1,1:? chr$(205)   '            ================

RETURN

'Пожалуй редактор готов, ещё не плохо бы открывать BAS-овские файлы и преобразовывать
'Ещё рисунок вправом нижнем углу