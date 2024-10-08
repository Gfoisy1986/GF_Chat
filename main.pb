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
TextGadget(42, 150, 0, 100, 20, " Message:")
SetGadgetColor(42, #PB_Gadget_BackColor, $ECFF00)
TextGadget(43, 250, 0, 550, 20, ""+ServerString$, #PB_Text_Center)
SetGadgetColor(43, #PB_Gadget_BackColor, $ECFF00)
TextGadget(47, 0, 20, 800, 20, "Connecté sur le canal : "+CanalID, #PB_Text_Center)
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
             
      
         
  
 ElseIf   PeekS(*Frost, 1100, #PB_UTF8) = "gui"
          *sty = AllocateMemory(5501)
          ReceiveNetworkData(ConnectionID, *sty, 5501)
         
          Debug PeekS(*sty, 5501, #PB_UTF8)   
     
 ElseIf   PeekS(*Frost, 1100, #PB_UTF8) = "gui1"
          *Frost8 = AllocateMemory(191)
          ReceiveNetworkData(ConnectionID, *Frost8, 191)
          
          Debug PeekS(*Frost8, 191, #PB_UTF8)
          
          
          
              AddGadgetItem(44, -1,  PeekS(*sty, 5501, #PB_UTF8)+Chr(10)+PeekS(*Frost8, 191, #PB_UTF8));fff+Chr(10)+qqq+Chr(10)+www+Chr(10)+eee+Chr(10)+rrr+Chr(10)+ttt+Chr(10)+yyy+Chr(10)+uuu+Chr(10)+iii+Chr(10)+ooo+Chr(10)+ppp)
              
              
              
  
  
         
ElseIf    PeekS(*Frost, 1111, #PB_UTF8) = "charle"
         *charle = AllocateMemory(1111)
          ReceiveNetworkData(ConnectionID, *charle, 1111)
         
             AddGadgetItem(44, -1, PeekS(*charle, 1111, #PB_UTF8))
          Debug PeekS(*charle, 1111, #PB_UTF8)
        
          
          
             
        EndIf
        
        
        
        
        
 
   
    Case #PB_NetworkEvent_Disconnect
   
   
   

EndSelect


 
 
 
 Select Event
   
     
       Case #PB_Event_Gadget
         Select EventGadget()
            
             
             
         
         
    
             
             
        ;   Case #PB_102 : 
             

             
        
             
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
; CursorPosition = 186
; FirstLine = 166
; Folding = -
; EnableThread
; EnableXP
; DPIAware
; Compiler = PureBasic 6.12 LTS (Linux - x64)