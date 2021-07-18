﻿Module Image
  Procedure ConvertToArray(img, Array arr(2))
    StartDrawing(ImageOutput(img))
    For x = 0 To ImageWidth(img) - 1
      For y = 0 To ImageHeight(img) - 1
        arr(x, y) = Point(x, y)
      Next y
    Next x
    StopDrawing()
  EndProcedure
  
  Procedure ConvertToImage(img, Array arr(2))
    StartDrawing(ImageOutput(img))
    For x = 0 To ImageWidth(img) - 1
      For y = 0 To ImageHeight(img) - 1
        Plot(x, y, arr(x, y))
      Next y
    Next x
    StopDrawing()
  EndProcedure
  
  Procedure CalculatePixelsAverage(Array arr(1))
    avg = 0
    asz = ArraySize(arr())
    
    For i = 0 To asz
      r = Red(arr(i))
      g = Green(arr(i))
      b = Blue(arr(i))
      avg + ((r + g + b) / 3)
    Next i
    
    avg = avg / asz
    ProcedureReturn avg
  EndProcedure
  
  Procedure ConvertPartToArray(img, Array arr(2), x, y, width, height)
    tmp = GrabImage(img, #PB_Any, x, y, width, height)
    ConvertToArray(tmp, arr())
    FreeImage(tmp)
  EndProcedure
  
  Procedure FxGrayscale(img)
    StartDrawing(ImageOutput(img))
    For x = 0 To ImageWidth(img) - 1
      For y = 0 To ImageHeight(img) - 1
        px = Point(x, y)
        
        r = Red(px) * 30
        g = Green(px) * 59
        b = Blue(px) * 11
        
        px = Abs((r + g + b) / 100)
        
        Plot(x, y, RGB(px, px, px))
      Next y
    Next x
    StopDrawing()
  EndProcedure
  
  Procedure FxSepia(img, factor)
    StartDrawing(ImageOutput(img))
    For x = 0 To ImageWidth(img) - 1
      For y = 0 To ImageHeight(img) - 1
        px = Point(x, y)
        
        r = Red(px) * 30
        g = Green(px) * 59
        b = Blue(px) * 11
        
        px = Abs((r + g + b) / 100)
        
        sepR = px + k * 2
        sepG = px + k
        
        If sepR > 255 : sepR = 255 : EndIf
        If sepG > 255 : sepG = 255 : EndIf
        
        Plot(x, y, RGB(sepR, sepG, px))
      Next y
    Next x
    StopDrawing()
  EndProcedure
  
  Procedure FxNegate(img)
    StartDrawing(ImageOutput(img))
    For x = 0 To ImageWidth(img) - 1
      For y = 0 To ImageHeight(img) - 1
        px = Point(x, y)
        
        r = Red(px)
        g = Green(px)
        b = Blue(px)
        
        Plot(x, y, RGB(255 - r, 255 - g, 255 - b))
      Next y
    Next x
    StopDrawing()
  EndProcedure
  
  Procedure FxNoise(img, factor)
    StartDrawing(ImageOutput(img))
    For x = 0 To ImageWidth(img) - 1
      For y = 0 To ImageHeight(img) - 1
        px = Point(x, y)
        
        rnd = Random(factor * 2) - factor
        
        r = Red(px) + rnd
        g = Green(px) + rnd
        b = Blue(px) + rnd
        
        If r < 0 : r = 0 : EndIf
        If r > 255 : r = 255 : EndIf
        
        If g < 0 : g = 0 : EndIf
        If g > 255 : g = 255 : EndIf
        
        If b < 0 : b = 0 : EndIf
        If b > 255 : b = 255 : EndIf
        
        Plot(x, y, RGB(r, g, b))
      Next y
    Next x
    StopDrawing()
  EndProcedure
  
  Procedure FxBrightness(img, factor)
    StartDrawing(ImageOutput(img))
    For x = 0 To ImageWidth(img) - 1
      For y = 0 To ImageHeight(img) - 1
        px = Point(x, y)
        
        r = Red(px) + factor
        g = Green(px) + factor
        b = Blue(px) + factor
        
        If r < 0 : r = 0 : EndIf
        If r > 255 : r = 255 : EndIf
        
        If g < 0 : g = 0 : EndIf
        If g > 255 : g = 255 : EndIf
        
        If b < 0 : b = 0 : EndIf
        If b > 255 : b = 255 : EndIf
        
        Plot(x, y, RGB(r, g, b))
      Next y
    Next x
    StopDrawing()
  EndProcedure
  
  Procedure FxBinary(img, factor)
    StartDrawing(ImageOutput(img))
    For x = 0 To ImageWidth(img) - 1
      For y = 0 To ImageHeight(img) - 1
        px = Point(x, y)
        
        r = Red(px)
        g = Green(px)
        b = Blue(px)
        
        px = r + g + b
        If px > (((255 + factor) / 2) * 3)
          Plot(x, y, $FFFFFF)
        Else
          Plot(x, y, 0)
        EndIf
      Next y
    Next x
    StopDrawing()
  EndProcedure
EndModule
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; CursorPosition = 45
; FirstLine = 75
; Folding = --