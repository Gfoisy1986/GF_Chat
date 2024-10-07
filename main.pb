 ;----Variable
  
  Port = 6831


  
  
  
  
  
  ;-----Enumeration------------------------------------------------------------------------------------------------------------------------
 
  
  Enumeration
 
 
   
   EndEnumeration
  
  
  
  
  
  
  
  
 ;----Start Procedure------------------------------------------------------------------------------------------------------------------

     
  
 



  

  
  
  
  
  
  
  
 ;----Main forms--------------------------------------
  ;InitNetwork()
  ConnectionID = OpenNetworkConnection("127.0.0.1", Port)
  
  If ConnectionID
    Debug "Connected!"
    
OpenWindow(40, 0, 0, 800, 600, "GF_Logia", #PB_Window_SystemMenu | #PB_Window_ScreenCentered)


       
        ;--Start Menu gadget--------------------------------------
        
        
   If CreateMenu(0, WindowID(40))
     MenuTitle("Menu")
     MenuItem(1, "Item 1")
     MenuItem(2, "Item 2")
     MenuItem(3, "Item 3")
   EndIf
  
  


  
   
   
   
   
   ;-------------------------------Start loop!-------------------------------------------------------------------------------------------------
  ;Loops
  
  
    Repeat
     Event = WaitWindowEvent()
     Network = NetworkClientEvent(ConnectionID) 
    
    
    
Select Network

    
    
 Case #PB_NetworkEvent_Data 
  
  

EndSelect


 
 
 
 Select Event
     
       Case #PB_Event_Gadget
         Select EventGadget()
            
             
             
         
         
    
             
             
        ;   Case #PB_102 : 
             

             
        
             
         EndSelect
       
       Case #PB_Event_Menu
         Select EventMenu()
           Case 1 : End
           Case 2 : End
           Case 3 : End
         EndSelect
    
     EndSelect
     
   ForEver
   
   
   ;-------------------------------------------------------------------------------------------------------------------------------
   ;Footer
  
   
EndIf
; IDE Options = PureBasic 6.12 LTS (Linux - x64)
; CursorPosition = 52
; FirstLine = 61
; EnableXP
; DPIAware