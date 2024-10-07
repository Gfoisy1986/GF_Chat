UseSQLiteDatabase()
  Filename$ = "chatdb.sqlite3"
  If OpenDatabase(90, Filename$, "", "")
    Debug "Connected to myDatabase.sqlite3"
  EndIf
  
                    
  
  
  ;_____________________________________________________________________________________________________________________________
  ;Variable
  
  Port = 6831





  
  ;---------------------------------------------------------------------------------------------------------------------------------
  ;Enumeration
  
  
    

  ;==============================================================================================================================
  ;Structure
  
  
      Structure Client
        Id.s
        Con.l
  EndStructure
  
  

 ;--------------------------------------------------------------------------------------------------------------------------   
   ;List:

Global NewList Programm.Client()  ; The list for storing the elements

   ;-----------------------------------------------------------------------------------------------------------------------------------
  ;Start Procedure

  
  
  
  
  ;_______________________________________________________________________________________________________________________________
  ;Main forms
  
;InitNetwork()

serverID =    CreateNetworkServer(0, Port, #PB_Network_IPv4 | #PB_Network_TCP, "127.0.0.1")

If serverID
 
  Debug "PureBasic - Server created (Port "+Port+")."
  
  OpenConsole("GF_Logia_Server", #PB_UTF8)
  ConsoleTitle("GF_Logia_Server") 
  Debug "Console Launch!"
  



        
      
      
         
 

  
  ;--------------------------------------------------------------------------------------------------------------------------------
  ;Loops
  
  
  
  Repeat
      
    ServerEvent = NetworkServerEvent()
   key = EventClient()
    
    
    
    
     
             
    
    
    
     Select ServerEvent
         
            

         Case #PB_NetworkEvent_None


        

     



          

    



  
           
                
         Case #PB_NetworkEvent_Connect
             
    
    *Element.Client = AddElement(Programm())  ; Add a new element to the list
    If *Element <> 0  ; Check if the element was successfully allocated
      *Element\Id = "Client ID  "+Str(EventClient()) ; Assign the ID to the new element
       *Element\Con = EventClient() ; Assign the Connection Client to the new element
        Debug "Added client with ID: " + *Element\Id
    Else
        MessageRequester("Error!", "Unable to allocate memory for new element", #PB_MessageRequester_Ok)
    EndIf 
          
        

           
   
 
           
                Debug "PureBasic - Server A new client has connected !"+ Str(EventClient())
                Debug Programm()\Id
                Debug Programm()\Con
                PrintN("Client : "+Programm()\Id+" is connected")
                PrintN("Connection : "+Programm()\Con+" for client : "+Programm()\Id+" is etablish!")

        Case #PB_NetworkEvent_Data
           
         
       
            
          Case #PB_NetworkEvent_Disconnect
          Debug "PureBasic - Server Client "+Key+" has closed the connection..."
          PrintN("PureBasic - Server Client "+Key+" has closed the connection...")
          DeleteElement(Programm())
         
  
      EndSelect
    
  ForEver
  
  
  
  ;----------------------------------------------------------------------------------------------------------------------------
  ;Footer
  
  
EndIf
   Debug "PureBasic - Server Click To quit the server."
     ClearList(Programm())
   CloseDatabase(90)
   CloseNetworkServer(0)
   CloseConsole()
  
End
  
  
; IDE Options = PureBasic 6.12 LTS (Linux - x64)
; ExecutableFormat = Console
; CursorPosition = 135
; FirstLine = 116
; EnableXP
; DPIAware