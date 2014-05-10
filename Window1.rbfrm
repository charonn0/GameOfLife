#tag Window
Begin Window Window1
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   654
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
   Width           =   569
   Begin PlacardButton playpause
      AcceptFocus     =   True
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      bold            =   ""
      caption         =   ""
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      hasIcon         =   ""
      Height          =   28
      HelpTag         =   ""
      Icon            =   719679487
      iconDX          =   0
      iconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      invertTextColor =   ""
      isSticky        =   True
      italic          =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      textColor       =   0
      textFont        =   "System"
      textSize        =   0
      Top             =   619
      underline       =   ""
      UseFocusRing    =   True
      value           =   ""
      Visible         =   True
      Width           =   42
   End
   Begin PlacardButton Reseter
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      bold            =   ""
      caption         =   ""
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      hasIcon         =   ""
      Height          =   28
      HelpTag         =   ""
      Icon            =   644884479
      iconDX          =   0
      iconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      invertTextColor =   ""
      isSticky        =   0
      italic          =   ""
      Left            =   74
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      textColor       =   0
      textFont        =   "System"
      textSize        =   0
      Top             =   619
      underline       =   ""
      UseFocusRing    =   True
      value           =   ""
      Visible         =   True
      Width           =   30
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
   Begin Slider Slider1
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   23
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   116
      LineStep        =   1
      LiveScroll      =   ""
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Maximum         =   25
      Minimum         =   1
      PageStep        =   1
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   619
      Value           =   5
      Visible         =   True
      Width           =   105
   End
   Begin Canvas Canvas1
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   False
      Height          =   612
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
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   569
   End
   Begin Slider Slider2
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   23
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   242
      LineStep        =   1
      LiveScroll      =   ""
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Maximum         =   1000
      Minimum         =   10
      PageStep        =   20
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   619
      Value           =   0
      Visible         =   True
      Width           =   105
   End
   Begin Timer Timer1
      Height          =   32
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   653
      LockedInPosition=   False
      Mode            =   2
      Period          =   500
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   0
      Width           =   32
   End
   Begin CheckBox ShowGrid
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Show grid"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   359
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      State           =   1
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   619
      Underline       =   ""
      Value           =   True
      Visible         =   True
      Width           =   100
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function CancelClose(appQuitting as Boolean) As Boolean
		  If RenderThread.State = Thread.Running Then RenderThread.Kill
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  RenderLock = New Semaphore
		  RenderThread = New Thread
		  AddHandler RenderThread.Run, WeakAddressOf ThreadRun
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  Reset()
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function ResetItem() As Boolean Handles ResetItem.Action
			Reset()
			Repaint()
			Canvas1.Refresh(False)
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Function Fire(X As Integer, Y As Integer) As Integer
		  If X = 0 Or Y = 0 Or X + 1 > (Canvas1.Width \ CellSize)  Or Y + 1 > (Canvas1.Height \ CellSize) Then
		    Return dead
		  End If
		  Dim rand As New Random
		  Dim neighborcount As Integer = WorldArray(X - 1, Y - 1) + WorldArray(X, Y - 1) + WorldArray(X + 1, Y - 1) + WorldArray(X + 1, Y) + _
		  WorldArray(X + 1, Y + 1) + WorldArray(X, Y + 1) + WorldArray(X - 1, Y + 1) + WorldArray(X - 1, Y)
		  
		  If neighborcount Mod fire = 0 And neighborcount > 1 Then
		    If WorldArray(X, Y) = alive Then
		      Return fire
		    Else
		      Return dead
		    End If
		  Else
		    If WorldArray(X, Y) = alive Then
		      If rand.InRange(0, FireProbability) = FireProbability Then
		        Return fire
		      Else
		        Return alive
		      End If
		      
		    Else
		      If rand.InRange(0, LifeProbability) = LifeProbability Then
		        Return alive
		      Else
		        Return dead
		      End If
		    End If
		  End If
		End Function
	#tag EndMethod

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

	#tag Method, Flags = &h21
		Private Sub Repaint()
		  LastWorld = World
		  Dim wg As Graphics = World.Graphics
		  wg.ForeColor = DeadColor
		  wg.FillRect(0, 0, wg.Width, wg.Height)
		  For X As Integer = 0 To UBound(WorldArray, 1)
		    For Y As Integer = 0 To UBound(WorldArray, 2)
		      Select Case WorldArray(X, Y)
		      Case alive
		        wg.ForeColor = LifeColor
		      Case dead
		        'wg.ForeColor = DeadColor
		        Continue
		      Case fire
		        wg.ForeColor = &cFF000000
		      End Select
		      wg.FillRect(X * CellSize, Y * CellSize, CellSize, CellSize)
		      
		    Next
		  Next
		  
		  If ShowGrid.Value Then
		    wg.ForeColor = GridColor
		    Dim c As Integer = Max(Canvas1.Width, Canvas1.Height)
		    For X As Integer = 0 To c Step CellSize
		      wg.DrawLine(X, 0, X, Canvas1.Height)
		    Next
		    
		    For Y As Integer = 0 To c Step CellSize
		      wg.DrawLine(0, Y, Canvas1.Width, Y)
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
		  Dim rand As New Random
		  For X As Integer = 0 To UBound(WorldArray, 1)
		    For Y As Integer = 0 To UBound(WorldArray, 2)
		      If Rand.InRange(2, 10) = 8 Then
		        WorldArray(X, Y) = alive
		      Else
		        WorldArray(X, Y) = dead
		      End If
		    Next
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ThreadRun(Sender As Thread)
		  Do
		    While Not RenderLock.TrySignal
		      App.YieldToNextThread
		    Wend
		    If Pause Then
		      RenderLock.Release
		      Continue
		    End If
		    
		    LifeCount = 0
		    Dim newworld(-1, -1) As Integer
		    ReDim newworld(UBound(WorldArray, 1), UBound(WorldArray, 2))
		    GenCount = GenCount + 1
		    Dim stable As Boolean = True
		    
		    Try
		      For X As Integer = 1 To UBound(WorldArray, 1) - 1
		        For Y As Integer = 1 To UBound(WorldArray, 2) - 1
		          If GameStyle = 0 Then 'life
		            newworld(X, Y) = Life(X, Y)
		          Else
		            newworld(X, Y) = Fire(X, Y)
		          End If
		          If newworld(X, Y) = alive Then
		            lifecount = lifecount + 1
		          End If
		          
		          If newworld(X, Y) <> WorldArray(X, Y) Then
		            stable = False
		          End If
		        Next
		      Next
		    Catch Err As OutOfBoundsException ' resized!
		      RenderLock.Release
		      Continue
		    End Try
		    
		    WorldArray = newworld
		    Repaint()
		    'Canvas1.Refresh(False)
		    Canvas1.Refresh(True)
		    
		    
		    If lifecount = 0 Then
		      MsgBox("Extinction occurred after " + Format(GenCount, "###,###,###,###,###,###,##0") + " generations.")
		      Exit Do
		    ElseIf stable Then
		      MsgBox("Biostasis achieved after " + Format(GenCount, "###,###,###,###,###,###,##0") + " generations.")
		      Exit Do
		    End If
		    Sender.Sleep(Slider2.Value)
		    RenderLock.Release
		  Loop
		  RenderLock.Release
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		CellSize As Integer = 5
	#tag EndProperty

	#tag Property, Flags = &h0
		DeadColor As Color = &c80808000
	#tag EndProperty

	#tag Property, Flags = &h0
		FireProbability As Integer = 50
	#tag EndProperty

	#tag Property, Flags = &h0
		GameStyle As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		GenCount As UInt64
	#tag EndProperty

	#tag Property, Flags = &h0
		GridColor As Color = &c0000A000
	#tag EndProperty

	#tag Property, Flags = &h21
		Private LastWorld As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		LifeColor As Color = &c0000FF00
	#tag EndProperty

	#tag Property, Flags = &h21
		Private LifeCount As UInt64
	#tag EndProperty

	#tag Property, Flags = &h0
		LifeProbability As Integer = 15
	#tag EndProperty

	#tag Property, Flags = &h0
		Pause As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h21
		Private RenderLock As Semaphore
	#tag EndProperty

	#tag Property, Flags = &h21
		Private RenderThread As Thread
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

	#tag Constant, Name = fire, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant


#tag EndWindowCode

#tag Events playpause
	#tag Event
		Sub Action()
		  Pause = Not Pause
		  If RenderThread.State <> Thread.Running And RenderThread.State <> Thread.Sleeping Then RenderThread.Run
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
#tag Events Canvas1
	#tag Event
		Sub Paint(g As Graphics)
		  If Not RenderLock.TrySignal Then
		    g.DrawPicture(LastWorld, 0, 0)
		  Else
		    g.DrawPicture(World, 0, 0)
		    RenderLock.Release
		  End If
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
#tag Events Timer1
	#tag Event
		Sub Action()
		  If Not RenderLock.TrySignal Then
		    Self.Title = "Game of life - " + Format(GenCount, "###,###,###,###,###,###,##0") + " generations; " + Format(LifeCount, "###,###,###,###,###,###,##0") + " life forms"
		  Else
		    RenderLock.Release
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
