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

;--Start panel gadget------------------------------------------             
            

PanelGadget     (0, 0, 0, 800, 560)
      AddGadgetItem (0, -1, "Inventaire")
      inventaire()
      AddGadgetItem (0, -1, "Info Personel")
      employer()
      AddGadgetItem (0, -1, "Info Clients")
      Client()
      AddGadgetItem (0, -1, "Info Vehicules")
      flotte()
      AddGadgetItem (0, -1, "Travaux")
      ;mainwo()
      maintravaux()
      CloseGadgetList()
      OpenGadgetList(0)
      AddGadgetItem (0, -1, "Hist. Travaux")
      AddGadgetItem (0, -1, "Facturation")
      AddGadgetItem (0, -1, "Hist. Facturation")
      AddGadgetItem (0, -1, "Compte Comptable")
      AddGadgetItem (0, -1, "Agenda")
      AddGadgetItem (0, -1, "Info Techniques")
      AddGadgetItem (0, -1, "Boite a Outils")
      Testing()
      CloseGadgetList()
      AddGadgetItem (0, -1, "Support Technique")
        CloseGadgetList()

       
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
; CursorPosition = 3
; EnableXP
; DPIAware