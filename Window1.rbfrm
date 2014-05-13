#tag Window
Begin Window Window1
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   624
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
   Width           =   600
   Begin Canvas Canvas1
      AcceptFocus     =   True
      AcceptTabs      =   True
      AutoDeactivate  =   True
      Backdrop        =   ""
      DoubleBuffer    =   True
      Enabled         =   True
      EraseBackground =   False
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
   Begin Label Status
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   21
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      Text            =   "Rule: 2/23       Gen:0       Pop:0       Dim:0x0"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   603
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   372
   End
   Begin Label Location
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   21
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   486
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      Text            =   "0, 0   "
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   603
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   114
   End
   Begin PopupMenu ComboBox1
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Fastest\r\nFast\r\nNormal\r\nSlow\r\nSlowest"
      Italic          =   ""
      Left            =   384
      ListIndex       =   1
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   602
      Underline       =   ""
      Visible         =   True
      Width           =   90
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
		  Canvas1.Invalidate(True)
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
		      If SaveWorld(bs, WorldFileRLE) Then
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
		Sub EnableMenuItems()
		  Dim mnu As MenuItem = Self.MenuBar.Item(0).Item(1)
		  mnu.Enabled = WorldFile <> Nil
		End Sub
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
		  Canvas1.Invalidate(True)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Minimize()
		  If AcquireWorldLock() Then
		    Repaint()
		    WorldLock.Release
		  End If
		  Canvas1.Invalidate(True)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  WorldLock = New Semaphore
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  If AcquireWorldLock() Then
		    Reset(False, False)
		    Repaint()
		    WorldLock.Release
		  End If
		  Canvas1.Invalidate(True)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Restore()
		  If AcquireWorldLock() Then
		    Repaint()
		    WorldLock.Release
		  End If
		  Canvas1.Invalidate(True)
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function ChangeRulesItem() As Boolean Handles ChangeRulesItem.Action
			If AcquireWorldLock() Then
			Dim s(), b() As Integer
			For i As Integer = 0 To UBound(BornRules)
			b.Append(BornRules(i))
			Next
			For i As Integer = 0 To UBound(SurviveRules)
			s.Append(SurviveRules(i))
			Next
			
			Dim w As New RuleChange
			Dim p As Pair = w.ChangeRules(b, s)
			If p <> Nil Then
			BornRules = p.Left
			SurviveRules = p.Right
			Modified = True
			End If
			Repaint()
			WorldLock.Release
			Canvas1.Refresh(False)
			Else
			MsgBox(CurrentMethodName + ": Unable to lock world!")
			End If
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ClearWorld() As Boolean Handles ClearWorld.Action
			If AcquireWorldLock() Then
			Reset(False, True)
			Repaint()
			Canvas1.Invalidate
			WorldLock.Release
			Else
			MsgBox(CurrentMethodName + ": Unable to lock world!")
			End If
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function CloseItem() As Boolean Handles CloseItem.Action
			Dim killed As Boolean
			If Not AcquireWorldLock() Then
			RenderThread.Kill
			killed = True
			End If
			If Modified Then
			Select Case MsgBox("Save changes to " + WorldFile.Name + "?", 3 + 48, "File modified")
			Case 2
			If killed Then
			RenderThread.Run
			Else
			WorldLock.Release
			End If
			Return True
			Case 6 ' save
			Dim f As FolderItem = SpecialFolder.Temporary.Child(WorldFile.Name)
			Dim bs As BinaryStream = BinaryStream.Create(f, True)
			If SaveWorld(bs, WorldFileRLE) Then
			bs.Close
			WorldFile.Delete
			f.MoveFileTo(WorldFile)
			ElseIf MsgBox("Unable to save world! Quit anyway?", 4 + 16, "Error") = 6 Then
			bs.Close
			Else
			bs.Close
			End If
			End Select
			Reset(False, True)
			Modified = False
			WorldFile = Nil
			Repaint()
			Canvas1.Invalidate
			End If
			If killed Then
			RenderThread.Run
			Else
			WorldLock.Release
			End If
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function DecreaseSize() As Boolean Handles DecreaseSize.Action
			If AcquireWorldLock() Then
			CellSize = CellSize * 0.75
			WorldLock.Release
			End If
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function IncreaseSize() As Boolean Handles IncreaseSize.Action
			If CellSize < 0.5 * Me.Width Then CellSize = Max(CellSize * 1.25, 2)
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
			Canvas1.Refresh(False)
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
		Function SaveAsItem() As Boolean Handles SaveAsItem.Action
			Dim dlg As New SaveAsDialog
			dlg.Filter = FileTypes1.All
			dlg.SuggestedFileName = "New World.gol"
			dlg.Title = "Save GOL world"
			If dlg.ShowModal <> Nil Then
			WorldFileRLE = NthField(dlg.Result.Name, ".", CountFields(dlg.Result.Name, ".")) <> "gol"
			Dim bs As BinaryStream = BinaryStream.Create(dlg.Result, True)
			Call SaveWorld(bs, WorldFileRLE)
			bs.Close
			WorldFile = dlg.Result
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
			WorldFileRLE = NthField(dlg.Result.Name, ".", CountFields(dlg.Result.Name, ".")) <> "gol"
			f = dlg.Result
			End If
			End If
			
			If f <> Nil Then
			Dim bs As BinaryStream = BinaryStream.Create(f, True)
			Call SaveWorld(bs, WorldFileRLE)
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
		Function SetColor() As Boolean Handles SetColor.Action
			Dim c As Color = LifeColor
			If SelectColor(c, "Choose life's color") Then LifeColor = c
			If AcquireWorldLock() Then
			Repaint()
			WorldLock.Release
			End If
			Canvas1.Invalidate(True)
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
			
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Function AcquireWorldLock(TryCount As Integer = 100) As Boolean
		  If UBound(SurviveRules) = -1 Then SurviveRules = Array(2, 3)
		  If UBound(BornRules) = -1 Then BornRules = Array(3)
		  Dim inf As Boolean = (TryCount = -1)
		  
		  If WorldLock = Nil Then WorldLock = New Semaphore
		  While Not WorldLock.TrySignal And (TryCount > 0 Or inf)
		    App.YieldToNextThread
		    TryCount = TryCount - 1
		  Wend
		  System.DebugLog(Str(TryCount) + " remaining")
		  Return TryCount > 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Life(X As Integer, Y As Integer) As Integer
		  If X = 0 Or Y = 0 Or X + 1 > (Canvas1.Width \ CellSize)  Or Y + 1 > (Canvas1.Height \ CellSize) Then
		    Return dead
		  End If
		  
		  If UBound(WorldArray, 1) < X + 1 Or UBound(WorldArray, 2) < Y + 1 Then
		    ReDim WorldArray(Max(X + 1, UBound(WorldArray, 1)), Max(Y + 1, UBound(WorldArray, 2)))
		  End If
		  Dim neighborcount As Integer 
		  
		  neighborcount = WorldArray(X - 1, Y - 1) + WorldArray(X, Y - 1) + WorldArray(X + 1, Y - 1) + WorldArray(X + 1, Y) + _
		  WorldArray(X + 1, Y + 1) + WorldArray(X, Y + 1) + WorldArray(X - 1, Y + 1) + WorldArray(X - 1, Y)
		  
		  Dim status As Integer = WorldArray(X, Y)
		  If SurviveRules.IndexOf(neighborcount) = -1 And status = alive Then
		    status = dead
		  ElseIf BornRules.IndexOf(neighborcount) > -1 And status = dead Then
		    status = alive
		  End If
		  Return status
		  
		Exception
		  Return dead
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadWorld(ReadFrom As Readable)
		  pleasewait.Show
		  If AcquireWorldLock() Then
		    ReDim BornRules(-1)
		    ReDim SurviveRules(-1)
		    Dim y As Integer
		    Dim x As Integer
		    Dim rle As Boolean
		    Dim sz As String
		    Select Case ReadFrom.Read(3)
		    Case "GOL"
		      rle = False
		    Case "RLE"
		      rle = True
		    Else
		      Raise New UnsupportedFormatException
		    End Select
		    While Not ReadFrom.EOF
		      Dim char As String = ReadFrom.Read(1)
		      If char = "#" Then
		        Exit While
		      Else
		        sz = sz + char
		      End If
		    Wend
		    Dim rules As String = NthField(sz, "R", 2)
		    sz = NthField(sz, "R", 1)
		    Dim tmp() As String = Split(NthField(rules, "/", 1), "")
		    For Each r As String In tmp
		      SurviveRules.Append(Val(r))
		    Next
		    tmp = Split(NthField(rules, "/", 2), "")
		    For Each r As String In tmp
		      BornRules.Append(Val(r))
		    Next
		    Dim sX, sY As Integer
		    sX = Val(NthField(sz, "*", 1))
		    sY = Val(NthField(sz, "*", 2))
		    If sX > UBound(WorldArray, 1) Then CellSize = World.Width / sX
		    Reset(False)
		    If rle Then
		      Dim s As String
		      While Not ReadFrom.EOF
		        s = s + ReadFrom.Read(1)
		      Wend
		      s = RLDecode(s)
		      ReadFrom = New BinaryStream(s)
		    End If
		    
		    While Not ReadFrom.EOF
		      Dim char As String = ReadFrom.Read(1)
		      Select Case char
		      Case "X", "o"
		        WorldArray(X, Y) = alive
		        Y = Y + 1
		      Case "-", "b"
		        WorldArray(X, Y) = dead
		        Y = Y + 1
		      Case "!", "$"
		        X = X + 1
		        Y = 0
		      Else
		        'If char = "E" And ReadFrom.Read(2) = "OF" Then
		        Exit While
		        'Raise New UnsupportedFormatException
		      End Select
		    Wend
		    
		    Repaint
		    Modified = False
		    WorldLock.Release
		    Canvas1.Invalidate
		  Else
		    MsgBox(CurrentMethodName + ": Unable to lock world!")
		  End If
		  
		Exception Err As OutOfBoundsException
		  Call MsgBox("Increase the window size or decrease the cell size to open this file.", 16, "World too large for current settings")
		  WorldLock.Release
		  
		Exception Err As UnsupportedFormatException
		  Call MsgBox("The file is corrupt.", 16, "Invalid data")
		  WorldLock.Release
		  
		Finally
		  pleasewait.Close
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Overlay() As Picture
		  If obuff = Nil Or obuff.Width <> Canvas1.Width Or obuff.Height <> Canvas1.Height Then
		    obuff = New Picture(Canvas1.Width, Canvas1.Height)
		    obuff.Graphics.ClearRect(0, 0, obuff.Width, obuff.Height)
		    Dim g As Graphics = obuff.Graphics
		    If ShowGrid Then
		      g.ForeColor = RGB(LifeColor.Red, LifeColor.Green, LifeColor.Blue, &h99)
		      Dim c As Integer = Max(g.Width, g.Height)
		      For X As Integer = 0 To c Step CellSize
		        g.DrawLine(X, 0, X, g.Height)
		      Next
		      
		      For Y As Integer = 0 To c Step CellSize
		        g.DrawLine(0, Y, g.Width, Y)
		      Next
		    End If
		  End If
		  Return obuff
		End Function
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
		  Timer1.Mode = Timer.ModeSingle
		  
		Exception
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reset(Populate As Boolean = True, EmptyFirst As Boolean = False)
		  obuff = Nil
		  If WorldLock.TrySignal Then
		    Raise New IllegalLockingException ' callers must call AcquireWorldLock first!
		  End If
		  
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

	#tag Method, Flags = &h21
		Private Function RLDecode(Data As MemoryBlock) As String
		  Dim Loop0 As Integer, rCount As String, outP As String, m As String
		  
		  For Loop0 = 0 To Data.Size - 1
		    m = Data.StringValue(Loop0, 1)
		    Select Case m
		    Case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"
		      rCount = rCount + m
		    Case Else
		      If Val(rCount) > 0 Then
		        For z As Integer = 1 To Val(rCount)
		          outP = outP + m
		        Next
		        rCount = ""
		      Else
		        outP = outP + m
		      End If
		    End Select
		  Next
		  
		  Return outp
		END FUNCTION
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RLEncode(Data As MemoryBlock) As String
		  Dim tmp1, tmp2, outP As String
		  Dim Loop0, rCount As Integer
		  tmp1 = Data.StringValue(0, 1)
		  tmp2 = tmp1
		  rCount = 1
		  For Loop0 = 1 To Data.Size - 1
		    tmp1 = Data.StringValue(Loop0, 1)
		    If tmp1 <> tmp2 Then
		      tmp2 = Str(rCount).Trim + tmp2
		      outP = outP + tmp2
		      tmp2 = tmp1
		      rCount = 1
		    Else
		      rCount = rCount + 1
		    End If
		  Next
		  
		  outP = outP + Str(rCount).Trim
		  outP = outP + tmp2
		  Return outP
		END FUNCTION
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SaveWorld(WriteTo As Writeable, RLE As Boolean) As Boolean
		  pleasewait.Show
		  If AcquireWorldLock(100000) Then
		    Dim X, Y As Integer
		    X = UBound(WorldArray, 1)
		    Y = UBound(WorldArray, 2)
		    Dim r As String
		    For i As Integer = 0 To UBound(SurviveRules)
		      r = r + Str(SurviveRules(i))
		    Next
		    r = r + "/"
		    For i As Integer = 0 To UBound(BornRules)
		      r = r + Str(BornRules(i))
		    Next
		    If Not RLE Then
		      WriteTo.Write("GOL" + Format(X + 1, "#########0") + "*" + Format(Y + 1, "#########0") + "R" + r + "#")
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
		    Else
		      WriteTo.Write("RLE" + Format(X + 1, "#########0") + "*" + Format(Y + 1, "#########0") + "R" + r + "#")
		      Dim data As New MemoryBlock(UBound(WorldArray, 1) * UBound(WorldArray, 2))
		      Dim w As New BinaryStream(data)
		      For i As Integer = 0 To X
		        For j As Integer = 0 To Y
		          If WorldArray(i, j) = alive Then
		            w.Write("X")
		          ElseIf WorldArray(i, j) = dead Then
		            w.Write("-")
		          End If
		        Next
		        w.Write("!")
		      Next
		      w.Close
		      Data = RLEncode(Data)
		      WriteTo.Write(data)
		    End If
		    Modified = False
		    WorldLock.Release
		  Else
		    MsgBox(CurrentMethodName + ": Unable to lock world!")
		  End If
		  pleasewait.Close
		  Return True
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		BornRules() As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mCellSize
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value <= 0 Then value = 1
			  mCellSize = value
			  If AcquireWorldLock() Then
			    CellSize = Value
			    Reset(False, False)
			    Repaint()
			    WorldLock.Release
			  End If
			  Canvas1.Refresh(False)
			End Set
		#tag EndSetter
		CellSize As Integer
	#tag EndComputedProperty

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

	#tag Property, Flags = &h21
		Private mCellSize As Integer = 10
	#tag EndProperty

	#tag Property, Flags = &h0
		Modified As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private obuff As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		ShowGrid As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		StepGen As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		SurviveRules() As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		ThreadSleep As Integer
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

	#tag Property, Flags = &h0
		WorldFileRLE As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private WorldLock As Semaphore
	#tag EndProperty


	#tag Constant, Name = alive, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = dead, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant


#tag EndWindowCode

#tag Events Canvas1
	#tag Event
		Sub Paint(g As Graphics)
		  If Not WorldLock.TrySignal Then
		    g.DrawPicture(LastWorld, 0, 0)
		  Else
		    g.DrawPicture(World, 0, 0)
		    WorldLock.Release
		  End If
		  g.DrawPicture(Overlay, 0, 0)
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  RenderThread.Priority = RenderThread.Priority * 2
		  If AcquireWorldLock() Then
		    Reset()
		    WorldLock.Release
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  Dim cellX, cellY As Integer
		  
		  cellX = X \ CellSize
		  cellY = Y \ CellSize
		  
		  If AcquireWorldLock() Then
		    If WorldArray(cellX, cellY) = dead Then
		      WorldArray(cellX, cellY) = alive
		    Else
		      WorldArray(cellX, cellY) = dead
		    End If
		    Modified = True
		    Repaint()
		    WorldLock.Release
		  End If
		  Me.Refresh(False)
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  Dim cellX, cellY As Integer
		  cellX = X \ CellSize
		  cellY = Y \ CellSize
		  Location.Text = Format(cellX, "###,###,##0") + ", " + Format(cellY, "###,###,##0") + " "
		  Location.Invalidate
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  ShowGrid = Not ShowGrid
		  If Key = " " Then
		    If AcquireWorldLock() Then
		      obuff = Nil
		      Repaint()
		      WorldLock.Release
		    End If
		    Canvas1.Invalidate(True)
		    Return True
		  End If
		End Function
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
		    Self.Title = "Game of life" + m
		    ' Rule: 2/23       Gen:0       Pop:0       Dim:0x0
		    
		    Dim rl, gn, pp, dm As String
		    BornRules.Sort
		    SurviveRules.Sort
		    For i As Integer = 0 To UBound(BornRules)
		      rl = rl + Str(BornRules(i))
		    Next
		    rl = rl + "/"
		    For i As Integer = 0 To UBound(SurviveRules)
		      rl = rl + Str(SurviveRules(i))
		    Next
		    rl = "Rule: " + rl
		    gn = "Gen: " + Format(GenCount, "###,###,###,###,###,###,##0")
		    pp = "Pop: " + Format(LifeCount, "###,###,##0") + "/" + Format(sx * sy, "###,###,##0")
		    dm = "Dim: " + Format(sx, "###,###,##0") + "x" + Format(sy, "###,###,##0")
		    Status.Text = rl + "    " + dm + "     " + gn + "     " + pp
		    
		    If App.LoadFile <> Nil And App.LoadFile.Exists And Not App.LoadFile.Directory Then
		      Reset(False, True)
		      WorldLock.Release
		      Dim bs As BinaryStream = BinaryStream.Open(App.LoadFile)
		      LoadWorld(bs)
		      bs.Close
		      WorldFile = App.LoadFile
		      App.LoadFile = Nil
		    Else
		      WorldLock.Release
		    End If
		  End If
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
		      Canvas1.Invalidate(True) ' In my defense, the Canvas1.Paint event will yield on the main thread until WorldLock is released.
		      
		      Modified = True
		    Finally
		      WorldLock.Release
		      App.YieldToNextThread
		      If StepGen Then
		        StepGen = False
		        Me.Suspend
		      Else
		        Me.Sleep(ThreadSleep)
		      End If
		    End Try
		  Loop
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ComboBox1
	#tag Event
		Sub Change()
		  If AcquireWorldLock() Then
		    Select Case Me.Text
		    Case "Fastest"
		      ThreadSleep = 10
		    Case "Fast"
		      ThreadSleep = 25
		    Case "Normal"
		      ThreadSleep = 100
		    Case "Slow"
		      ThreadSleep = 500
		    Case "Slowest"
		      ThreadSleep = 1000
		    End Select
		    WorldLock.Release
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
