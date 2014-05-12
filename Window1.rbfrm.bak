#tag Window
Begin Window Window1
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   6.24e+2
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   1437743103
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   2
   Resizeable      =   True
   Title           =   "Game Of Life"
   Visible         =   True
   Width           =   6.0e+2
   Begin Slider Slider1
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   23
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
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
      Top             =   601
      Value           =   5
      Visible         =   True
      Width           =   105
   End
   Begin Slider Slider2
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   23
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   117
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
      Top             =   601
      Value           =   0
      Visible         =   True
      Width           =   105
   End
   Begin Timer Timer1
      Height          =   32
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   658
      LockedInPosition=   False
      Mode            =   1
      Period          =   1
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
      Left            =   234
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
      Top             =   601
      Underline       =   ""
      Value           =   True
      Visible         =   True
      Width           =   100
   End
   Begin Thread RenderThread
      Height          =   32
      Index           =   -2147483648
      Left            =   658
      LockedInPosition=   False
      Priority        =   5
      Scope           =   0
      StackSize       =   0
      TabPanelIndex   =   0
      Top             =   44
      Width           =   32
   End
   Begin DXSurface RenderSurface
      AutoDeactivate  =   True
      AutoInit        =   False
      Enabled         =   True
      FullScreen      =   ""
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
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Visible         =   True
      Width           =   600
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Activate()
		  If AcquireWorldLock() Then
		    Repaint()
		    WorldLock.Release
		  End If
		  DoRender
		End Sub
	#tag EndEvent

	#tag Event
		Function CancelClose(appQuitting as Boolean) As Boolean
		  #pragma Unused appQuitting
		  Dim killed As Boolean
		  If Not AcquireWorldLock() Then
		    RenderThread.Kill
		    killed = True
		  End If
		  If Modified And WorldFile <> Nil Then
		    Select Case MsgBox("Save changes to " + WorldFile.Name + "?", 3 + 48, "File modified")
		    Case 2 ' cancel
		      WorldLock.Release
		      If killed Then RenderThread.Run
		      Return True
		    Case 6 ' save
		      Dim f As FolderItem = SpecialFolder.Temporary.Child(WorldFile.Name)
		      Dim bs As BinaryStream = BinaryStream.Create(f, True)
		      If SaveWorld(bs) Then
		        bs.Close
		        WorldFile.Delete
		        f.MoveFileTo(WorldFile)
		      ElseIf MsgBox("Unable to save world! Quit anyway?", 4 + 16, "Error") = 6 Then
		        bs.Close
		      Else
		        bs.Close
		      End If
		    End Select
		  End If
		  
		End Function
	#tag EndEvent

	#tag Event
		Function KeyDown(Key As String) As Boolean
		  If Asc(key) = &hD2 Then
		    Self.FullScreen = Not Self.FullScreen
		    Return True
		  End If
		End Function
	#tag EndEvent

	#tag Event
		Sub Maximize()
		  If AcquireWorldLock() Then
		    Repaint()
		    WorldLock.Release
		  End If
		  DoRender
		End Sub
	#tag EndEvent

	#tag Event
		Sub Minimize()
		  If AcquireWorldLock() Then
		    Repaint()
		    WorldLock.Release
		  End If
		  DoRender
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  If AcquireWorldLock() Then
		    Reset(False, False)
		    Repaint()
		    WorldLock.Release
		  End If
		  DoRender
		End Sub
	#tag EndEvent

	#tag Event
		Sub Restore()
		  If AcquireWorldLock() Then
		    Repaint()
		    WorldLock.Release
		  End If
		  DoRender
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function ClearWorld() As Boolean Handles ClearWorld.Action
			If AcquireWorldLock() Then
			Reset(False, True)
			Repaint()
			DoRender
			WorldLock.Release
			Else
			MsgBox(CurrentMethodName + ": Unable to lock world!")
			End If
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function OpenWorldFile() As Boolean Handles OpenWorldFile.Action
			Dim f As FolderItem = GetOpenFolderItem(FileTypes1.All)
			If f <> Nil Then
			Dim bs As BinaryStream = BinaryStream.Open(f, True)
			LoadWorld(bs)
			bs.Close
			WorldFile = f
			End If
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function Randomize() As Boolean Handles Randomize.Action
			If AcquireWorldLock() Then
			Reset()
			Repaint()
			WorldLock.Release
			DoRender
			Else
			MsgBox(CurrentMethodName + ": Unable to lock world!")
			End If
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function RunItem() As Boolean Handles RunItem.Action
			If AcquireWorldLock() Then
			Select Case RenderThread.State
			Case Thread.Running, Thread.Sleeping
			RenderThread.Suspend
			Case Thread.Suspended
			RenderThread.Resume
			Else
			RenderThread.Run
			End Select
			WorldLock.Release
			Else
			MsgBox(CurrentMethodName + ": Unable to lock world!")
			End If
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function SaveItem() As Boolean Handles SaveItem.Action
			Dim f As FolderItem
			If WorldFile <> Nil And WorldFile.Exists And Not WorldFile.Directory Then
			f = WorldFile
			Else
			Dim dlg As New SaveAsDialog
			dlg.Filter = FileTypes1.All
			dlg.SuggestedFileName = "New World"
			dlg.Title = "Save GOL world"
			If dlg.ShowModal <> Nil Then
			If NthField(dlg.Result.Name, ".", CountFields(dlg.Result.Name, ".")) <> "gol" Then
			dlg.Result.Name = dlg.Result.Name + ".gol"
			End If
			f = dlg.Result
			End If
			End If
			
			If f <> Nil Then
			Dim bs As BinaryStream = BinaryStream.Create(f, True)
			Call SaveWorld(bs)
			bs.Close
			WorldFile = f
			Modified = False
			If AcquireWorldLock() Then
			Repaint
			WorldLock.Release
			End If
			End If
			
			Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function SaveWorldFile() As Boolean Handles SaveWorldFile.Action
			Dim dlg As New SaveAsDialog
			dlg.Filter = FileTypes1.All
			dlg.SuggestedFileName = "New World"
			dlg.Title = "Save GOL world"
			If dlg.ShowModal <> Nil Then
			If NthField(dlg.Result.Name, ".", CountFields(dlg.Result.Name, ".")) <> "gol" Then
			dlg.Result.Name = dlg.Result.Name + ".gol"
			End If
			If dlg.Result <> Nil Then
			Dim bs As BinaryStream = BinaryStream.Create(dlg.Result, True)
			Call SaveWorld(bs)
			bs.Close
			WorldFile = dlg.Result
			Modified = False
			If AcquireWorldLock() Then
			Repaint
			WorldLock.Release
			End If
			End If
			End If
			Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function SetColor() As Boolean Handles SetColor.Action
			Dim c As Color = LifeColor
			If SelectColor(c, "Choose life's color") Then LifeColor = c
			If AcquireWorldLock() Then
			Repaint()
			WorldLock.Release
			End If
			DoRender
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function StepItem() As Boolean Handles StepItem.Action
			StepGen = True
			Select Case RenderThread.State
			Case Thread.Running, Thread.Sleeping
			' just wait
			Case Thread.Suspended
			RenderThread.Resume
			Else
			RenderThread.Run
			End Select
			
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Function AcquireWorldLock(TryCount As Integer = 100) As Boolean
		  If WorldLock = Nil Then WorldLock = New Semaphore
		  While Not WorldLock.TrySignal And TryCount > 0
		    App.YieldToNextThread
		    TryCount = TryCount - 1
		  Wend
		  Return TryCount > 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DoRender()
		  RenderSurface.Render
		  RenderSurface.Flip
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Life(X As Integer, Y As Integer) As Integer
		  If X = 0 Or Y = 0 Or X + 1 > (RenderSurface.Width \ CellSize)  Or Y + 1 > (RenderSurface.Height \ CellSize) Then
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
		  
		Exception
		  Quit
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadWorld(ReadFrom As Readable)
		  If AcquireWorldLock() Then
		    Dim y As Integer
		    Dim x As Integer
		    If ReadFrom.Read(3) <> "GOL" Then Raise New UnsupportedFormatException
		    Dim sz As String
		    While Not ReadFrom.EOF
		      Dim char As String = ReadFrom.Read(1)
		      If char = "#" Then
		        Exit While
		      Else
		        sz = sz + char
		      End If
		    Wend
		    Dim sX, sY As Integer
		    sX = Val(NthField(sz, "*", 1))
		    sY = Val(NthField(sz, "*", 2))
		    If sX > UBound(WorldArray, 1) Then Slider1.Value = World.Width / sX
		    Reset(False)
		    
		    
		    While Not ReadFrom.EOF
		      Dim char As String = ReadFrom.Read(1)
		      Select Case char
		      Case "X"
		        WorldArray(X, Y) = alive
		        Y = Y + 1
		      Case "-"
		        WorldArray(X, Y) = dead
		        Y = Y + 1
		      Case "!"
		        X = X + 1
		        Y = 0
		      Else
		        If char = "E" And ReadFrom.Read(2) = "OF" Then Exit While
		        Raise New UnsupportedFormatException
		      End Select
		    Wend
		    Repaint
		    Modified = False
		    WorldLock.Release
		    DoRender
		  Else
		    MsgBox(CurrentMethodName + ": Unable to lock world!")
		  End If
		  
		Exception Err As OutOfBoundsException
		  Call MsgBox("Increase the window size or decrease the cell size to open this file.", 16, "World too large for current settings")
		  WorldLock.Release
		  
		Exception Err As UnsupportedFormatException
		  Call MsgBox("The file is corrupt.", 16, "Invalid data")
		  WorldLock.Release
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Repaint()
		  If WorldLock.TrySignal Then
		    Raise New IllegalLockingException ' callers must call AcquireWorldLock first!
		  End If
		  LastWorld = World
		  Dim wg As Graphics = World.Graphics
		  wg.ForeColor = DeadColor
		  wg.FillRect(0, 0, wg.Width, wg.Height)
		  Dim sX, sY As Integer
		  sX = UBound(WorldArray, 1)
		  sY = UBound(WorldArray, 2)
		  For X As Integer = 0 To sX
		    For Y As Integer = 0 To sY
		      If WorldArray(X, Y) = alive Then
		        wg.ForeColor = LifeColor
		        wg.FillRect(X * CellSize, Y * CellSize, CellSize, CellSize)
		      End If
		    Next
		  Next
		  
		  If ShowGrid.Value Then
		    wg.ForeColor = RGB(LifeColor.Red, LifeColor.Green, LifeColor.Blue, &h99)
		    Dim c As Integer = Max(RenderSurface.Width, RenderSurface.Height)
		    For X As Integer = 0 To c Step CellSize
		      wg.DrawLine(X, 0, X, RenderSurface.Height)
		    Next
		    
		    For Y As Integer = 0 To c Step CellSize
		      wg.DrawLine(0, Y, RenderSurface.Width, Y)
		    Next
		  End If
		  Timer1.Mode = Timer.ModeSingle
		  
		Exception
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reset(Populate As Boolean = True, EmptyFirst As Boolean = False)
		  If WorldLock.TrySignal Then
		    Raise New IllegalLockingException ' callers must call AcquireWorldLock first!
		  End If
		  RenderSurface.Init
		  World = New Picture(Me.Width, Me.Height, 32)
		  If EmptyFirst Then ReDim WorldArray(-1, -1)
		  ReDim WorldArray(World.Width \ CellSize + 1, World.Height \ CellSize + 1)
		  GenCount = 0
		  If Populate Then
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
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SaveWorld(WriteTo As Writeable) As Boolean
		  If AcquireWorldLock() Then
		    Dim X, Y As Integer
		    X = UBound(WorldArray, 1)
		    Y = UBound(WorldArray, 2)
		    WriteTo.Write("GOL" + Format(X + 1, "#########0") + "*" + Format(Y + 1, "#########0") + "#")
		    For i As Integer = 0 To X
		      For j As Integer = 0 To Y
		        If WorldArray(i, j) = alive Then
		          WriteTo.Write("X")
		        ElseIf WorldArray(i, j) = dead Then
		          WriteTo.Write("-")
		        End If
		      Next
		      WriteTo.Write("!")
		    Next
		    WriteTo.Write("EOF")
		    Modified = False
		    WorldLock.Release
		  Else
		    MsgBox(CurrentMethodName + ": Unable to lock world!")
		  End If
		  Return True
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		CellSize As Integer = 10
	#tag EndProperty

	#tag Property, Flags = &h0
		DeadColor As Color = &c80808000
	#tag EndProperty

	#tag Property, Flags = &h0
		GenCount As UInt64
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
		Modified As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		StepGen As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		World As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		WorldArray(-1,-1) As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private WorldFile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private WorldLock As Semaphore
	#tag EndProperty


	#tag Constant, Name = alive, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = dead, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant


#tag EndWindowCode

#tag Events Slider1
	#tag Event
		Sub ValueChanged()
		  If AcquireWorldLock() Then
		    CellSize = Me.Value
		    Reset(False, False)
		    Repaint()
		    WorldLock.Release
		  End If
		  DoRender
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Timer1
	#tag Event
		Sub Action()
		  If AcquireWorldLock() Then
		    Dim sx, sy As Integer
		    sx = UBound(WorldArray, 1)
		    sy = UBound(WorldArray, 2)
		    Dim m As String
		    If WorldFile <> Nil Then
		      If Modified Then m = "*"
		      m = " - " + WorldFile.Name + m
		    End If
		    Self.Title = "Game of life - " + Format(GenCount, "###,###,###,###,###,###,##0") + " generations (" _
		    + Format(sx, "###,###,##0") + "x" + Format(sy, "###,###,##0") + ";" + _
		    Format(LifeCount, "###,###,##0") + "/" + Format(sx * sy, "###,###,##0") + ")" + m
		    If App.LoadFile <> Nil And App.LoadFile.Exists And Not App.LoadFile.Directory Then
		      Dim bs As BinaryStream = BinaryStream.Open(App.LoadFile)
		      LoadWorld(bs)
		      bs.Close
		      WorldFile = App.LoadFile
		      App.LoadFile = Nil
		    End If
		    WorldLock.Release
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ShowGrid
	#tag Event
		Sub Action()
		  If AcquireWorldLock() Then
		    Repaint()
		    WorldLock.Release
		  End If
		  DoRender
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events RenderThread
	#tag Event
		Sub Run()
		  #pragma BoundsChecking Off
		  Do
		    App.YieldToNextThread
		    If Not AcquireWorldLock() Then
		      Continue
		    End If
		    
		    LifeCount = 0
		    Dim newworld(-1, -1) As Integer
		    ReDim newworld(UBound(WorldArray, 1), UBound(WorldArray, 2))
		    GenCount = GenCount + 1
		    Dim stable As Boolean = True
		    
		    Try
		      Dim u1, u2 As Integer
		      u1 = UBound(WorldArray, 1)
		      u2 = UBound(WorldArray, 2)
		      For X As Integer = 1 To u1
		        For Y As Integer = 1 To u2
		          Dim status As Integer = Life(X, Y)
		          newworld(X, Y) = status
		          If status = alive Then
		            lifecount = lifecount + 1
		          End If
		          
		          If status <> WorldArray(X, Y) Then
		            stable = False
		          End If
		        Next
		      Next
		      
		      WorldArray = newworld
		      Repaint()
		      DoRender ' In my defense, the Canvas1.Paint event will yield on the main thread until WorldLock is released.
		      
		      Modified = True
		    Finally
		      WorldLock.Release
		      Me.Sleep(Slider2.Value)
		      App.YieldToNextThread
		      If StepGen Then 
		        StepGen = False
		        Me.Suspend
		      End If
		    End Try
		  Loop
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events RenderSurface
	#tag Event
		Sub Open()
		  If AcquireWorldLock() Then
		    Reset()
		    WorldLock.Release
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Render(g as Graphics)
		  If Not WorldLock.TrySignal Then
		    g.DrawPicture(LastWorld, 0, 0)
		  Else
		    g.DrawPicture(World, 0, 0)
		    WorldLock.Release
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
