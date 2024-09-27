def convert(Red,Green,Blue):
    Red = Red / 255
    Green = Green / 255
    Blue = Blue / 255
    Cmax = max(Red,Green,Blue)
    Cmin = min(Red,Green,Blue)
    denta1 = Cmax - Cmin
    
    if (denta1 == 0):
        H = 0;
    elif(Cmax==Red):
        H = 60*(((Green-Blue) / denta1) % 6)
    elif (Cmax==Green):
        H = 60*((Blue-Red) / denta1 + 2)
    else:
        H = 60*((Red-Green) / denta1 + 4)

    if(Cmax==0):
        S = 0
    else :
        S = denta1 / Cmax * 100
    
    V = (Cmax*100)
 
    return int(H),int(S),int(V)

