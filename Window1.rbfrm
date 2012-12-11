#tag Window
Begin Window Window1
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   6.54e+2
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
   Width           =   5.69e+2
   Begin TabPanel TabPanel1
      AutoDeactivate  =   True
      Bold            =   ""
      Enabled         =   True
      Height          =   620
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Panels          =   ""
      Scope           =   0
      SmallTabs       =   ""
      TabDefinition   =   "Game Board\rSettings"
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   11
      TextUnit        =   0
      Top             =   0
      Underline       =   ""
      Value           =   0
      Visible         =   True
      Width           =   569
      Begin Canvas Canvas1
         AcceptFocus     =   ""
         AcceptTabs      =   ""
         AutoDeactivate  =   True
         Backdrop        =   ""
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   550
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Left            =   9
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         Top             =   29
         UseFocusRing    =   True
         Visible         =   True
         Width           =   550
      End
      Begin ComboBox ComboBox1
         AutoComplete    =   False
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         InitialValue    =   "Load Preset\r\nGlider\r\nPulsar\r\nGun"
         Italic          =   ""
         Left            =   12
         ListIndex       =   0
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   11
         TextUnit        =   0
         Top             =   36
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   108
      End
      Begin Label Label1
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   ""
         Left            =   12
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         Selectable      =   False
         TabIndex        =   1
         TabPanelIndex   =   2
         Text            =   "Cell Size:"
         TextAlign       =   2
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   11
         TextUnit        =   0
         Top             =   97
         Transparent     =   False
         Underline       =   ""
         Visible         =   True
         Width           =   63
      End
      Begin Slider Slider1
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   23
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Left            =   81
         LineStep        =   1
         LiveScroll      =   ""
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Maximum         =   25
         Minimum         =   5
         PageStep        =   1
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   2
         TabStop         =   True
         TickStyle       =   0
         Top             =   97
         Value           =   10
         Visible         =   True
         Width           =   218
      End
      Begin ColorSelector ColorSelector1
         AutoDeactivate  =   True
         BorderColor     =   &h000000
         BorderWidth     =   1
         Enabled         =   True
         FillColor       =   &h0000FF00
         Height          =   25
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Left            =   81
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   2
         Top             =   147
         Visible         =   True
         Width           =   25
      End
      Begin Label Label2
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   ""
         Left            =   12
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         Selectable      =   False
         TabIndex        =   4
         TabPanelIndex   =   2
         Text            =   "Life Color:"
         TextAlign       =   2
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   11
         TextUnit        =   0
         Top             =   147
         Transparent     =   False
         Underline       =   ""
         Visible         =   True
         Width           =   63
      End
      Begin ColorSelector ColorSelector2
         AutoDeactivate  =   True
         BorderColor     =   &h000000
         BorderWidth     =   1
         Enabled         =   True
         FillColor       =   &h00C0C0C0
         Height          =   25
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Left            =   201
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   5
         TabPanelIndex   =   2
         Top             =   147
         Visible         =   True
         Width           =   25
      End
      Begin Label Label3
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   ""
         Left            =   126
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         Selectable      =   False
         TabIndex        =   6
         TabPanelIndex   =   2
         Text            =   "Background:"
         TextAlign       =   2
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   11
         TextUnit        =   0
         Top             =   147
         Transparent     =   False
         Underline       =   ""
         Visible         =   True
         Width           =   69
      End
      Begin CheckBox CheckBox1
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Gridlines"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   ""
         Left            =   266
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         State           =   0
         TabIndex        =   7
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   11
         TextUnit        =   0
         Top             =   147
         Underline       =   ""
         Value           =   False
         Visible         =   True
         Width           =   100
      End
      Begin ColorSelector ColorSelector3
         AutoDeactivate  =   True
         BorderColor     =   &h000000
         BorderWidth     =   1
         Enabled         =   True
         FillColor       =   &h00000000
         Height          =   25
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Left            =   430
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   8
         TabPanelIndex   =   2
         Top             =   147
         Visible         =   True
         Width           =   25
      End
      Begin Label Label4
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   ""
         Left            =   355
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         Selectable      =   False
         TabIndex        =   9
         TabPanelIndex   =   2
         Text            =   "Grid Color:"
         TextAlign       =   2
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   11
         TextUnit        =   0
         Top             =   147
         Transparent     =   False
         Underline       =   ""
         Visible         =   True
         Width           =   69
      End
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
   Begin BevelButton playpause
      AcceptFocus     =   True
      AutoDeactivate  =   True
      BackColor       =   ""
      Bevel           =   1
      Bold            =   ""
      ButtonType      =   0
      Caption         =   ""
      CaptionAlign    =   ""
      CaptionDelta    =   ""
      CaptionPlacement=   ""
      Enabled         =   True
      HasBackColor    =   ""
      HasMenu         =   ""
      Height          =   28
      HelpTag         =   ""
      Icon            =   719679487
      IconAlign       =   1
      IconDX          =   ""
      IconDY          =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   245
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      MenuValue       =   ""
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   ""
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   624
      Underline       =   ""
      Value           =   ""
      Visible         =   True
      Width           =   42
   End
   Begin BevelButton Reseter
      AcceptFocus     =   ""
      AutoDeactivate  =   True
      BackColor       =   ""
      Bevel           =   1
      Bold            =   ""
      ButtonType      =   ""
      Caption         =   ""
      CaptionAlign    =   ""
      CaptionDelta    =   ""
      CaptionPlacement=   ""
      Enabled         =   True
      HasBackColor    =   ""
      HasMenu         =   ""
      Height          =   28
      HelpTag         =   ""
      Icon            =   644884479
      IconAlign       =   ""
      IconDX          =   ""
      IconDY          =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   299
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      MenuValue       =   ""
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   ""
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   624
      Underline       =   ""
      Value           =   ""
      Visible         =   True
      Width           =   30
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
      Top             =   634
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   175
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
      Left            =   394
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
      Top             =   632
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   175
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
		  If X = 0 Or Y = 0 Or X + 1 > (Canvas1.Width \ CellSize)  Or Y + 1 > (Canvas1.Height \ CellSize) Then
		    Return dead
		  End If
		  
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
		        World.Graphics.ForeColor = LifeColor
		      Case dead
		        World.Graphics.ForeColor = DeadColor
		      End Select
		      World.Graphics.FillRect(X * CellSize, Y * CellSize, CellSize, CellSize)
		      
		    Next
		  Next
		  
		  If ShowGrid Then
		    world.Graphics.ForeColor = GridColor
		    For X As Integer = 0 To Canvas1.Width Step CellSize
		      world.Graphics.DrawLine(X, 0, X, Canvas1.Height)
		    Next
		    
		    For Y As Integer = 0 To Canvas1.Width Step CellSize
		      world.Graphics.DrawLine(0, Y, Canvas1.Width, Y)
		    Next
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reset()
		  World = New Picture(Me.Width, Me.Height, 32)
		  ReDim WorldArray(-1, -1)
		  ReDim WorldArray(World.Width \ CellSize, World.Height \ CellSize)
		  GenCount = 0
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		CellSize As Integer = 10
	#tag EndProperty

	#tag Property, Flags = &h0
		Combust As Integer = 15
	#tag EndProperty

	#tag Property, Flags = &h0
		DeadColor As Color = &cC0C0C000
	#tag EndProperty

	#tag Property, Flags = &h0
		GenCount As UInt64
	#tag EndProperty

	#tag Property, Flags = &h0
		GridColor As Color = &c00000000
	#tag EndProperty

	#tag Property, Flags = &h0
		LifeColor As Color = &c00FF0000
	#tag EndProperty

	#tag Property, Flags = &h0
		ShowGrid As Boolean
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
		  
		  cellX = X \ CellSize
		  cellY = Y \ CellSize
		  
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
#tag Events Slider1
	#tag Event
		Sub ValueChanged()
		  CellSize = Me.Value
		  Reset()
		  Repaint()
		  Canvas1.Refresh(False)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ColorSelector1
	#tag Event
		Sub ColorSelected(c As Color)
		  LifeColor = c
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ColorSelector2
	#tag Event
		Sub ColorSelected(c As Color)
		  DeadColor = c
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckBox1
	#tag Event
		Sub Action()
		  ShowGrid = Me.Value
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ColorSelector3
	#tag Event
		Sub ColorSelected(c As Color)
		  GridColor = c
		End Sub
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
#tag Events playpause
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
#tag Events Reseter
	#tag Event
		Sub Action()
		  Reset()
		  Repaint()
		  Canvas1.Refresh(False)
		End Sub
	#tag EndEvent
#tag EndEvents
