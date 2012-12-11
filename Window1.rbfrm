#tag Window
Begin Window Window1
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   620
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   1718751231
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   2
   Resizeable      =   True
   Title           =   "Game Of Life"
   Visible         =   True
   Width           =   600
   Begin Canvas Canvas1
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   600
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   600
   End
   Begin Timer Timer1
      Height          =   32
      Index           =   -2147483648
      Left            =   812
      LockedInPosition=   False
      Mode            =   0
      Period          =   200
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   -27
      Width           =   32
   End
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Untitled"
      Default         =   True
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   325
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   -61
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin PushButton PushButton2
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "Untitled"
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   417
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   -61
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin Label Generations
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      Text            =   ""
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   600
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   313
   End
   Begin Label LifeForms
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   287
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      Text            =   ""
      TextAlign       =   2
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   600
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   313
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Resized()
		  Reset()
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function FasterItem() As Boolean Handles FasterItem.Action
			If Timer1.Period > 50 Then
			Timer1.Period = Timer1.Period - 10
			End If
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ResetItem() As Boolean Handles ResetItem.Action
			Reset()
			Repaint()
			Canvas1.Refresh(False)
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function SlowerItem() As Boolean Handles SlowerItem.Action
			If Timer1.Period < 5000 Then
			Timer1.Period = Timer1.Period + 10
			End If
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function StopItem() As Boolean Handles StopItem.Action
			If Timer1.Mode = Timer.ModeOff Then
			Timer1.Mode = Timer.ModeMultiple
			Else
			Timer1.Mode = Timer.ModeOff
			End If
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Function Life(X As Integer, Y As Integer) As Integer
		  Dim neighborcount As Integer = WorldArray(X - 1, Y - 1) + WorldArray(X, Y - 1) + WorldArray(X + 1, Y - 1) + WorldArray(X + 1, Y) + _
		  WorldArray(X + 1, Y + 1) + WorldArray(X, Y + 1) + WorldArray(X - 1, Y + 1) + WorldArray(X - 1, Y) 
		  
		  Select Case neighborcount
		  Case 0, 1, 4, 5, 6, 7, 8
		    Return dead
		    
		  Case 2, 3
		    If WorldArray(X, Y) = dead Then
		      If neighborcount = 3 Then 
		        Return alive
		      Else
		        Return dead
		      End If
		    End If
		    Return alive
		    
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Repaint()
		  For X As Integer = 0 To UBound(WorldArray, 1)
		    For Y As Integer = 0 To UBound(WorldArray, 2)
		      Select Case WorldArray(X, Y)
		      Case alive
		        World.Graphics.ForeColor = &c00FF0000
		      Case dead
		        World.Graphics.ForeColor = &c80808000
		      End Select
		      World.Graphics.FillRect(X * 10, Y * 10, 10, 10)
		      
		    Next
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reset()
		  World = New Picture(Me.Width, Me.Height, 32)
		  ReDim WorldArray(-1, -1)
		  ReDim WorldArray(World.Width \ 10, World.Height \ 10)
		  GenCount = 0
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Combust As Integer = 15
	#tag EndProperty

	#tag Property, Flags = &h0
		GenCount As UInt64
	#tag EndProperty

	#tag Property, Flags = &h0
		Spawn As Integer = 50
	#tag EndProperty

	#tag Property, Flags = &h0
		World As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		WorldArray(-1,-1) As Integer
	#tag EndProperty


	#tag Constant, Name = alive, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Birth, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = dead, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant


#tag EndWindowCode

#tag Events Canvas1
	#tag Event
		Sub Paint(g As Graphics)
		  g.DrawPicture(World, 0, 0)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Reset()
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  Dim cellX, cellY As Integer
		  
		  cellX = X \ 10
		  cellY = Y \ 10
		  
		  If WorldArray(cellX, cellY) = dead Then
		    WorldArray(cellX, cellY) = alive
		  Else
		    WorldArray(cellX, cellY) = dead
		  End If
		  
		  Repaint()
		  Me.Refresh(False)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events Timer1
	#tag Event
		Sub Action()
		  Dim lifecount As UInt64
		  Dim newworld(-1, -1) As Integer
		  ReDim newworld(UBound(WorldArray, 1), UBound(WorldArray, 2))
		  GenCount = GenCount + 1
		  Dim stable As Boolean = True
		  
		  For X As Integer = 1 To UBound(WorldArray, 1) - 1
		    For Y As Integer = 1 To UBound(WorldArray, 2) - 1
		      newworld(X, Y) = Life(X, Y)
		      If newworld(X, Y) = alive Then
		        lifecount = lifecount + 1
		      End If
		      
		      If newworld(X, Y) <> WorldArray(X, Y) Then
		        stable = False
		      End If
		    Next
		  Next
		  
		  WorldArray = newworld
		  
		  World = New Picture(World.Width, World.Height, 32)
		  Repaint()
		  Canvas1.Refresh(False)
		  
		  Generations.Text = Format(GenCount, "###,###,###,###,###,###,##0") + " generations"
		  LifeForms.Text = Format(LifeCount, "###,###,###,###,###,###,##0") + " life forms"
		  
		  If lifecount = 0 Then
		    Me.Mode = Timer.ModeOff
		    MsgBox("Extinction occurred after " + Format(GenCount, "###,###,###,###,###,###,##0") + " generations.")
		  ElseIf stable Then
		    Me.Mode = Timer.ModeOff
		    MsgBox("Biostasis achieved after " + Format(GenCount, "###,###,###,###,###,###,##0") + " generations.")
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton1
	#tag Event
		Sub Action()
		  If Timer1.Mode = Timer.ModeOff Then
		    Timer1.Mode = Timer.ModeMultiple
		  Else
		    Timer1.Mode = Timer.ModeOff
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton2
	#tag Event
		Sub Action()
		  Reset()
		  Repaint()
		  Canvas1.Refresh(False)
		End Sub
	#tag EndEvent
#tag EndEvents
