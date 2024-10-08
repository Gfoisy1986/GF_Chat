 ;----Variable
   UseJPEGImageDecoder() 
  Port = 6832


  
  
  
  
  
  ;-----Enumeration------------------------------------------------------------------------------------------------------------------------
 
  
  Enumeration
 
 
   
   EndEnumeration
  
  
  
  
  
  
  
  
 ;----Start Procedure------------------------------------------------------------------------------------------------------------------

Procedure CloseWindowEvent()
  Debug "Closing window: " + EventWindow()
  
  End
EndProcedure 
  
 



  

  
  
  
  
  
  
  
 ;----Main forms--------------------------------------
  ;InitNetwork()
  ConnectionID = OpenNetworkConnection("127.0.0.1", Port)
  




  If ConnectionID
    Debug "Connected!"
    StringCon$ = "Établie!"
    ServerString$ = "Bienvenue sur 'GF_Chat' !"
OpenWindow(40, 0, 0, 800, 600, "GF_Chat", #PB_Window_SystemMenu | #PB_Window_ScreenCentered)
TextGadget(41, 0, 0, 150, 20, "Connection : "+StringCon$, #PB_Text_Center)
 SetGadgetColor(41, #PB_Gadget_BackColor, $7CFFF7)
TextGadget(43, 150, 0, 650, 20, ""+ServerString$, #PB_Text_Center)
SetGadgetColor(43, #PB_Gadget_BackColor, $ECFF00)
TextGadget(47, 150, 20, 650, 20, "Connecté sur le canal : "+CanalID, #PB_Text_Center)
SetGadgetColor(47, #PB_Gadget_BackColor, $FFFFFF)
TextGadget(45, 0, 40, 150, 25, "Liste des Canaux", #PB_Text_Center)
SetGadgetColor(45, #PB_Gadget_BackColor, $A7E3EF)
If  ListViewGadget(44, 0, 65, 150, 505) 
    SetGadgetColor(44, #PB_Gadget_BackColor, $F3C8F3)
  
  EndIf
  
    
  
 EditorGadget(46, 150, 450, 500, 120)
 SetGadgetColor(46, #PB_Gadget_BackColor, $7A7779)
 ButtonGadget(48, 650, 450, 150, 120,"Envoyer")
 
 
    If     ListIconGadget(53, 150, 40, 750, 410, "UserID", 80, #PB_ListIcon_FullRowSelect | #PB_ListIcon_AlwaysShowSelection)
              SetGadgetColor(53, #PB_Gadget_BackColor, $C1B6BF)

             AddGadgetColumn(53, 1, "Utilisateur", 150)
             AddGadgetColumn(53, 2, "Message", 180)
    EndIf
        ;--Start Menu gadget--------------------------------------
        
        
   If CreateMenu(0, WindowID(40))
     MenuTitle("Menu utilisateur")
     MenuItem(1, "Se Connecter")
     MenuBar()
     MenuItem(2, "Se Déconecter")
     MenuBar()
     MenuItem(3, "Panneau Utilisateur")
     MenuBar()
     MenuItem(4, "Fermer la fenêtre")
     
     
      MenuTitle("Menu des amis")
      MenuItem(5, "Liste des amis")
      MenuBar()
     MenuItem(6, "Ajouter un/e amie")
     MenuBar()
     MenuItem(7, "Supprimé un/e amie")
     
      MenuTitle("Menu des Canaux")
      MenuItem(8, "Ajouter un Canal")
      MenuBar()
     MenuItem(9, "Supprimé un Canal")
     
     MenuTitle("Menu des Canaux Privé")
     MenuItem(10, "Liste des Canaux Privé")
     MenuBar()
     MenuItem(11, "Ajouter un Canal Privé")
      MenuBar()
     MenuItem(12, "Supprimé un Canal Privé")
    
   EndIf
   BindEvent(#PB_Event_CloseWindow, @CloseWindowEvent())
   
   
   

 


  
   
   
   
   
   ;-------------------------------Start loop!-------------------------------------------------------------------------------------------------
  ;Loops
  
  
    Repeat
     Event = WaitWindowEvent()
     Network = NetworkClientEvent(ConnectionID) 
    
    
    
Select Network

  Case #PB_NetworkEvent_None   
    
    
    
    
 Case #PB_NetworkEvent_Data 
   
   
    *Frost = AllocateMemory(1100)
 ReceiveNetworkData(ConnectionID, *Frost, 1100)
    
   
  
     
 If       PeekS(*Frost, 1100, #PB_UTF8) = "elie"
          
          ClearGadgetItems(44)
             
          
ElseIf    PeekS(*Frost, 1111, #PB_UTF8) = "charle"
              *Alex = AllocateMemory(2000)
              *Mario = AllocateMemory(2003)
         *charle = AllocateMemory(1111)
          ReceiveNetworkData(ConnectionID, *charle, 1111)
          ReceiveNetworkData(ConnectionID, *Alex, 2000)
          ReceiveNetworkData(ConnectionID, *Mario, 2003)
             Data46$ = PeekS(*Mario, 2003, #PB_UTF8)
            Data45$ = PeekS(*Alex, 2000, #PB_UTF8)
          AddGadgetItem(44, -1, "Canal Mondial")
          AddGadgetItem(44, -1, "Ventes - Échanges")
          AddGadgetItem(44, -1, "Support Tech...")
         
           AddGadgetItem(44, -1, Data45$)
           AddGadgetItem(44, -1, Data46$)
          
        
         
         
         
           
         
         
          Debug PeekS(*charle, 1111, #PB_UTF8)
        
          FreeMemory(*Frost)
          FreeMemory(*charle)
          FreeMemory(*Alex)
          FreeMemory(*Mario)
          
             
        EndIf
        
        
        
        
        
 
   
    Case #PB_NetworkEvent_Disconnect
   
   
   

EndSelect


 
 
 
 Select Event
   
     
       Case #PB_Event_Gadget
         Select EventGadget()
            
             
             
         
         
    
             
             
           Case 44 : 
             
       *Eric = AllocateMemory(500)
       ddd$ = "Eric"
       PokeS(*Eric, ddd$, 500, #PB_UTF8)
       SendNetworkData(ConnectionID, *Eric, 500)
       ReAllocateMemory(*Eric, 500)
       
       If GetGadgetText(44) = "Canal Mondial" 
        
       dd2$ = "Eric2"
       PokeS(*Eric, dd2$, 500, #PB_UTF8)
       SendNetworkData(ConnectionID, *Eric, 500)
         ReAllocateMemory(*Eric, 500)
        EndIf  
        
         
       
       If GetGadgetText(44) = "Ventes - Échanges" 
        
       dd3$ = "Eric3"
       PokeS(*Eric, dd3$, 500, #PB_UTF8)
       SendNetworkData(ConnectionID, *Eric, 500)
       ReAllocateMemory(*Eric, 500)
        EndIf  
          
       
        If GetGadgetText(44) = "Support Tech..." 
        
       dd4$ = "Eric4"
       PokeS(*Eric, dd4$, 500, #PB_UTF8)
       SendNetworkData(ConnectionID, *Eric, 500)
       ReAllocateMemory(*Eric, 500)
        EndIf 
       
       FreeMemory(*Eric)
        
             
         EndSelect
       
       Case #PB_Event_Menu
         Select EventMenu()
           Case 1 : ;Se conecter
           Case 2 : ;Se deconnecter
           Case 3 : ;user panel
           Case 4 : End;close
         EndSelect
    
     EndSelect
     
  ForEver
   
    Else
   
   MessageRequester("Serveur info!", "Serveur Hors-ligne !!!",#PB_MessageRequester_Ok)
   End
   
 EndIf
   ;-------------------------------------------------------------------------------------------------------------------------------
   ;Footer
  
   
; IDE Options = PureBasic 6.12 LTS (Linux - x64)
; CursorPosition = 64
; FirstLine = 50
; Folding = -
; EnableThread
; EnableXP
; DPIAware
; Compiler = PureBasic 6.12 LTS (Linux - x64)