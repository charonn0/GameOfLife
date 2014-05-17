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
      Priority        =   10
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
		  
		  Canvas1.Invalidate(True)
		End Sub
	#tag EndEvent

	#tag Event
		Function CancelClose(appQuitting as Boolean) As Boolean
		  #pragma Unused appQuitting
		  Dim killed As Boolean
		  If Not AcquireWorldLock() Then
		    #If DebugBuild Then
		      System.DebugLog(CurrentMethodName + " failed to acquire the world lock.")
		    #endif
		    RenderThread.Kill
		    killed = True
		  End If
		  #If DebugBuild Then
		    System.DebugLog(CurrentMethodName + " has acquired the world lock.")
		  #endif
		  If Modified And WorldFile <> Nil Then
		    Select Case MsgBox("Save changes to " + WorldFile.Name + "?", 3 + 48, "File modified")
		    Case 2 ' cancel
		      WorldLock.Release
		      If killed Then RenderThread.Run
		      Return True
		    Case 6 ' save
		      Dim f As FolderItem = SpecialFolder.Temporary.Child(WorldFile.Name)
		      If SaveWorld(f, WorldFileRLE) Then
		        WorldFile.Delete
		        f.MoveFileTo(WorldFile)
		      ElseIf MsgBox("Unable to save world! Quit anyway?", 4 + 16, "Error") <> 6 Then
		        Return True
		      End If
		    End Select
		  End If
		Finally
		  WorldLock.Release
		  #If DebugBuild Then
		    System.DebugLog(CurrentMethodName + " has released the world lock.")
		  #endif
		End Function
	#tag EndEvent

	#tag Event
		Sub EnableMenuItems()
		  Dim mnu As MenuItem = Self.MenuBar.Item(0).Item(1)
		  mnu.Enabled = WorldFile <> Nil
		  mnu = Self.MenuBar.Item(1).Item(4)
		  mnu.Checked = DoFade
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
		Sub Minimize()
		  IsVisible = False
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
		    #If DebugBuild Then
		      System.DebugLog(CurrentMethodName + " has acquired the world lock.")
		    #endif
		    Dim g As Integer = GenCount
		    Reset(False, False)
		    GenCount = g
		    Repaint()
		    WorldLock.Release
		    #If DebugBuild Then
		      System.DebugLog(CurrentMethodName + " has released the world lock.")
		    #endif
		  Else
		    #If DebugBuild Then
		      System.DebugLog(CurrentMethodName + " failed to acquire the world lock.")
		    #endif
		  End If
		  Canvas1.Invalidate(True)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Restore()
		  IsVisible = True
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function CellFade() As Boolean Handles CellFade.Action
			Dim mnu As MenuItem = Self.MenuBar.Item(1).Item(4)
			DoFade = Not DoFade
			mnu.Checked = DoFade
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ChangeRulesItem() As Boolean Handles ChangeRulesItem.Action
			If AcquireWorldLock() Then
			#If DebugBuild Then
			System.DebugLog(CurrentMethodName + " has acquired the world lock.")
			#endif
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
			#If DebugBuild Then
			System.DebugLog(CurrentMethodName + " failed to acquire the world lock.")
			#endif
			End If
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ClearWorld() As Boolean Handles ClearWorld.Action
			If AcquireWorldLock() Then
			#If DebugBuild Then
			System.DebugLog(CurrentMethodName + " has acquired the world lock.")
			#endif
			Reset(False, True)
			Repaint()
			Canvas1.Invalidate
			WorldLock.Release
			#If DebugBuild Then
			System.DebugLog(CurrentMethodName + " has released the world lock.")
			#endif
			Else
			#If DebugBuild Then
			System.DebugLog(CurrentMethodName + " failed to acquire the world lock.")
			#endif
			End If
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function CloseItem() As Boolean Handles CloseItem.Action
			Dim killed As Boolean
			If Not AcquireWorldLock() Then
			#If DebugBuild Then
			System.DebugLog(CurrentMethodName + " failed to acquire the world lock.")
			#endif
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
			#If DebugBuild Then
			System.DebugLog(CurrentMethodName + " has released the world lock.")
			#endif
			End If
			Return True
			Case 6 ' save
			Dim f As FolderItem = SpecialFolder.Temporary.Child(WorldFile.Name)
			If SaveWorld(f, WorldFileRLE) Then
			WorldFile.Delete
			f.MoveFileTo(WorldFile)
			ElseIf MsgBox("Unable to save world! Quit anyway?", 4 + 16, "Error") <> 6 Then
			Return True
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
		Function ConvertItem() As Boolean Handles ConvertItem.Action
			Dim f As FolderItem = GetOpenFolderItem(FileTypes1.RLEEncodedGOLSavedWorld)
			If f <> Nil And f.Exists Then
			Dim g As FolderItem = GetSaveFolderItem(FileTypes1.RLEEncodedGOLSavedWorld, "Converted_" + f.Name)
			If g <> Nil Then
			pleasewait.Show
			Dim data As String
			Dim ins As BinaryStream = BinaryStream.Open(f)
			Dim out As BinaryStream = BinaryStream.Create(g, True)
			data = ins.Read(ins.Length)
			ins.Close
			out.Write(ConvertRLEFormat(data))
			out.Close
			pleasewait.Close
			End If
			End If
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function DecreaseSize() As Boolean Handles DecreaseSize.Action
			If Not AcquireWorldLock() Then
			MsgBox(CurrentMethodName + ": Unable to lock world!")
			#If DebugBuild Then
			System.DebugLog(CurrentMethodName + " failed to acquire the world lock.")
			#endif
			Return True
			End If
			#If DebugBuild Then
			System.DebugLog(CurrentMethodName + " has acquired the world lock.")
			#endif
			CellSize = CellSize * 0.75
			obuff = Nil
			Reset(False, False)
			WorldLock.Release
			Repaint
			Canvas1.Invalidate(True)
			#If DebugBuild Then
			System.DebugLog(CurrentMethodName + " has released the world lock.")
			#endif
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function GridItem() As Boolean Handles GridItem.Action
			Dim mnu As MenuItem = Self.MenuBar.Item(1).Item(5)
			ShowGrid = Not ShowGrid
			obuff = Nil
			Repaint()
			Canvas1.Invalidate(True)
			mnu.Checked = ShowGrid
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function IncreaseSize() As Boolean Handles IncreaseSize.Action
			If Not AcquireWorldLock() Then
			MsgBox(CurrentMethodName + ": Unable to lock world!")
			#If DebugBuild Then
			System.DebugLog(CurrentMethodName + " failed to acquire the world lock.")
			#endif
			Return True
			End If
			#If DebugBuild Then
			System.DebugLog(CurrentMethodName + " has acquired the world lock.")
			#endif
			If CellSize < 0.5 * Me.Width Then CellSize = Max(CellSize * 1.25, 6)
			obuff = Nil
			Reset(False, False)
			WorldLock.Release
			Repaint
			Canvas1.Invalidate(True)
			#If DebugBuild Then
			System.DebugLog(CurrentMethodName + " has released the world lock.")
			#endif
			Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function OpenWorldFile() As Boolean Handles OpenWorldFile.Action
			Dim f As FolderItem = GetOpenFolderItem(FileTypes1.All)
			If f <> Nil Then
			Dim bs As BinaryStream = BinaryStream.Open(f, True)
			Dim data As MemoryBlock = bs.Read(bs.Length)
			bs.Close
			LoadWorld(data)
			WorldFile = f
			End If
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function Randomize() As Boolean Handles Randomize.Action
			If AcquireWorldLock() Then
			#If DebugBuild Then
			System.DebugLog(CurrentMethodName + " has acquired the world lock.")
			#endif
			Reset()
			Repaint()
			WorldLock.Release
			#If DebugBuild Then
			System.DebugLog(CurrentMethodName + " has released the world lock.")
			#endif
			Canvas1.Refresh(False)
			Else
			MsgBox(CurrentMethodName + ": Unable to lock world!")
			#If DebugBuild Then
			System.DebugLog(CurrentMethodName + " failed to acquire the world lock.")
			#endif
			End If
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function RunItem() As Boolean Handles RunItem.Action
			While Not AcquireWorldLock()
			#If DebugBuild Then
			System.DebugLog(CurrentMethodName + " failed to acquire the world lock.")
			#endif
			Continue
			Wend
			#If DebugBuild Then
			System.DebugLog(CurrentMethodName + " has acquired the world lock.")
			#endif
			Select Case RenderThread.State
			Case Thread.Running, Thread.Sleeping
			RenderThread.Suspend
			Case Thread.Suspended
			RenderThread.Resume
			Else
			RenderThread.Run
			End Select
			WorldLock.Release
			#If DebugBuild Then
			System.DebugLog(CurrentMethodName + " has released the world lock.")
			#endif
			Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function SaveAsItem() As Boolean Handles SaveAsItem.Action
			If Not AcquireWorldLock() Then
			MsgBox(CurrentMethodName + ": Unable to lock world!")
			#If DebugBuild Then
			System.DebugLog(CurrentMethodName + " failed to acquire the world lock.")
			#endif
			Return True
			End If
			Dim dlg As New SaveAsDialog
			dlg.Filter = FileTypes1.All
			dlg.SuggestedFileName = "New World.gol"
			dlg.Title = "Save GOL world"
			If dlg.ShowModal <> Nil Then
			WorldFileRLE = NthField(dlg.Result.Name, ".", CountFields(dlg.Result.Name, ".")) <> "gol"
			Call SaveWorld(dlg.Result, WorldFileRLE)
			WorldFile = dlg.Result
			Modified = False
			End If
			WorldLock.Release
			Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function SaveItem() As Boolean Handles SaveItem.Action
			If Not AcquireWorldLock() Then
			MsgBox(CurrentMethodName + ": Unable to lock world!")
			#If DebugBuild Then
			System.DebugLog(CurrentMethodName + " failed to acquire the world lock.")
			#endif
			Return True
			End If
			#If DebugBuild Then
			System.DebugLog(CurrentMethodName + " has acquired the world lock.")
			#endif
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
			Call SaveWorld(f, WorldFileRLE)
			WorldFile = f
			Modified = False
			End If
			WorldLock.Release
			#If DebugBuild Then
			System.DebugLog(CurrentMethodName + " has released the world lock.")
			#endif
			Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function SetColor() As Boolean Handles SetColor.Action
			Dim c As Color = LifeColor
			If SelectColor(c, "Choose life's color") Then LifeColor = c
			Repaint()
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
		  Return TryCount > 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConvertRLEFormat(Standard As String) As String
		  Dim w, h As Integer
		  Dim out As String = ReplaceLineEndings(Standard, EndOfLine.Windows)
		  out = ""
		  Dim l As String = NthField(out, EndOfLine.Windows, 1)
		  out = Replace(out, l, "").Trim
		  Dim x, y, r As String
		  x = NthField(l, ",", 1)
		  y = NthField(l, ",", 2)
		  r = NthField(l, ",", 3)
		  w = Val(NthField(x, "=", 2).Trim)
		  h = Val(NthField(y, "=", 2).Trim)
		  r = NthField(r, "=", 2).Trim
		  r = NthField(r, "/", 1) + "/" + NthField(r, "/", 2)
		  r = Replace(r, "B", "")
		  r = Replace(r, "S", "")
		  r = Replace(r, "b", "")
		  r = Replace(r, "s", "")
		  out = "RLE" + Format(w, "############") + "*" + Format(h, "############") + "R" + r + "#" + out
		  'x = 251, y = 815, rule = B2/S0
		  Return out
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Life(X As Integer, Y As Integer) As Integer
		  If X = 0 Or Y = 0 Or X + 1 > (Canvas1.Width \ CellSize)  Or Y + 1 > (Canvas1.Height \ CellSize) Then
		    Return dead
		  End If
		  
		  If UBound(LifeWorld, 1) < X + 1 Or UBound(LifeWorld, 2) < Y + 1 Then
		    ReDim LifeWorld(Max(X + 1, UBound(LifeWorld, 1)), Max(Y + 1, UBound(LifeWorld, 2)))
		  End If
		  Dim neighborcount As Integer
		  
		  neighborcount = LifeWorld(X - 1, Y - 1) + LifeWorld(X, Y - 1) + LifeWorld(X + 1, Y - 1) + LifeWorld(X + 1, Y) + _
		  LifeWorld(X + 1, Y + 1) + LifeWorld(X, Y + 1) + LifeWorld(X - 1, Y + 1) + LifeWorld(X - 1, Y)
		  
		  Dim status As Integer = LifeWorld(X, Y)
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
		Sub LoadWorld(Data As MemoryBlock)
		  pleasewait.Show
		  If Not AcquireWorldLock() Then
		    MsgBox(CurrentMethodName + ": Unable to lock world!")
		  End If
		  #If DebugBuild Then
		    System.DebugLog(CurrentMethodName + " has acquired the world lock.")
		  #endif
		  ReDim BornRules(-1)
		  ReDim SurviveRules(-1)
		  Dim y As Integer
		  Dim x As Integer
		  Dim rle As Boolean
		  Dim sz As String
		  Select Case Data.StringValue(0, 3)
		  Case "GOL"
		    rle = False
		    sz = Replace(NthField(Data, "#", 1), "GOL", "")
		  Case "RLE"
		    rle = True
		    sz = Replace(NthField(Data, "#", 1), "RLE", "")
		  Else
		    Raise New UnsupportedFormatException
		  End Select
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
		  If sX > UBound(RenderWorld, 1) Then CellSize = World.Width / sX
		  ReDim LifeWorld(sX, sY)
		  ReDim RenderWorld(sX, sY)
		  
		  Reset(False)
		  Dim s As String = NthField(data, "#", 2)
		  If rle Then
		    pleasewait.Status.Text = "Decoding world data..."
		    pleasewait.Status.Refresh
		    Dim r As New RLEStream(s)
		    Dim rd As String
		    While Not r.EOF
		      rd = rd + r.Read(64)
		      pleasewait.ProgressBar1.Value = r.Position * 100 / r.Length
		    Wend
		    s = rd
		  End If
		  Dim count, ln As Integer
		  ln = s.Len
		  pleasewait.Status.Text = "Loading world..."
		  pleasewait.Status.Refresh
		  
		  For p As Integer = 1 To ln
		    If count Mod 10 = 0 Then pleasewait.ProgressBar1.Value = count * 100 / ln
		    count = count + 1
		    Dim char As String = Mid(s, p, 1)
		    Select Case char
		    Case "X", "o"
		      RenderWorld(X, Y) = alive
		      LifeWorld(X, Y) = alive
		      Y = Y + 1
		    Case "-", "b"
		      RenderWorld(X, Y) = dead
		      LifeWorld(X, Y) = dead
		      Y = Y + 1
		    Case "!", "$"
		      X = X + 1
		      Y = 0
		    Else
		      'If char = "E" And ReadFrom.Read(2) = "OF" Then
		      Exit For
		      'Raise New UnsupportedFormatException
		    End Select
		    App.YieldToNextThread
		  Next
		  WorldLock.Release
		  #If DebugBuild Then
		    System.DebugLog(CurrentMethodName + " has released the world lock.")
		  #endif
		  pleasewait.Status.Text = "Drawing world..."
		  Repaint
		  Modified = False
		  Canvas1.Invalidate
		  
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
		  If IsVisible Then
		    LastWorld = World
		    Dim wg As Graphics = World.Graphics
		    If DoFade Then
		      wg.ForeColor = RGB(DeadColor.Red,DeadColor.Green, DeadColor.Blue, 99)
		    Else
		      wg.ForeColor = Deadcolor
		    End If
		    wg.FillRect(0, 0, wg.Width, wg.Height)
		    If CellSize > 1 Then
		      Dim sX, sY As Integer
		      sX = UBound(RenderWorld, 1)
		      sY = UBound(RenderWorld, 2)
		      For X As Integer = 0 To sX
		        For Y As Integer = 0 To sY
		          If RenderWorld(X, Y) = alive Then
		            wg.ForeColor = LifeColor
		            wg.FillRect(X * CellSize, Y * CellSize, CellSize, CellSize)
		          End If
		        Next
		      Next
		    Else
		      Dim surf As RGBSurface = World.RGBSurface
		      Dim sX, sY As Integer
		      sX = UBound(RenderWorld, 1)
		      sY = UBound(RenderWorld, 2)
		      For X As Integer = 0 To sX
		        For Y As Integer = 0 To sY
		          If RenderWorld(X, Y) = alive Then
		            surf.Pixel(X * CellSize, Y * CellSize) = LifeColor
		          End If
		        Next
		      Next
		    End If
		    
		    Timer1.Mode = Timer.ModeSingle
		  End If
		  
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
		  If EmptyFirst Then ReDim LifeWorld(-1, -1)
		  ReDim LifeWorld(World.Width \ CellSize + 1, World.Height \ CellSize + 1)
		  GenCount = 0
		  If Populate Then
		    Dim rand As New Random
		    For X As Integer = 0 To UBound(LifeWorld, 1)
		      For Y As Integer = 0 To UBound(LifeWorld, 2)
		        If Rand.InRange(2, 10) = 8 Then
		          LifeWorld(X, Y) = alive
		        Else
		          LifeWorld(X, Y) = dead
		        End If
		      Next
		    Next
		  End If
		  Swap()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SaveWorld(f As FolderItem, RLE As Boolean) As Boolean
		  pleasewait.Show
		  pleasewait.Status.Text = "Saving world..."
		  pleasewait.Status.Refresh
		  Dim WriteTo As Writeable
		  If RLE Then
		    WriteTo = RLEStream.Create(f, True)
		  Else
		    WriteTo = BinaryStream.Create(f, True)
		  End If
		  Dim X, Y As Integer
		  X = UBound(RenderWorld, 1)
		  Y = UBound(RenderWorld, 2)
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
		  Else
		    RLEStream(WriteTo).RawIO = True
		    WriteTo.Write("RLE" + Format(X + 1, "#########0") + "*" + Format(Y + 1, "#########0") + "R" + r + "#")
		    RLEStream(WriteTo).RawIO = False
		  End If
		  For i As Integer = 0 To X
		    For j As Integer = 0 To Y
		      If RenderWorld(i, j) = alive Then
		        WriteTo.Write("X")
		      ElseIf RenderWorld(i, j) = dead Then
		        WriteTo.Write("-")
		      End If
		    Next
		    WriteTo.Write("!")
		  Next
		  'WriteTo.Write("EOF")
		  WriteTo.Flush
		  If RLE Then
		    RLEStream(WriteTo).Close
		  Else
		    BinaryStream(WriteTo).Close
		  End If
		  Modified = False
		  pleasewait.Close
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Swap()
		  Dim i, j As Integer
		  i = UBound(LifeWorld, 1)
		  j = UBound(LifeWorld, 2)
		  If i = 0 Or j = 0 Then Break
		  ReDim RenderWorld(i, j)
		  For X As Integer = 0 To i
		    For Y As Integer = 0 To j
		      RenderWorld(X, Y) = LifeWorld(X, Y)
		    Next
		  Next
		  
		End Sub
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
			  'If AcquireWorldLock() Then
			  'CellSize = Value
			  'Reset(False, False)
			  'Repaint()
			  'WorldLock.Release
			  'End If
			  Canvas1.Refresh(False)
			End Set
		#tag EndSetter
		CellSize As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		DeadColor As Color = &cC0C0C000
	#tag EndProperty

	#tag Property, Flags = &h21
		Private DoFade As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		GenCount As UInt64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private IsVisible As Boolean = True
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
		LifeWorld(-1,-1) As Integer
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
		RenderWorld(-1,-1) As Integer
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
		    #If DebugBuild Then
		      System.DebugLog(CurrentMethodName + " has acquired the world lock.")
		    #endif
		    Reset()
		    WorldLock.Release
		    #If DebugBuild Then
		      System.DebugLog(CurrentMethodName + " has release the world lock.")
		    #endif
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  Dim cellX, cellY As Integer
		  If AcquireWorldLock() Then
		    #If DebugBuild Then
		      System.DebugLog(CurrentMethodName + " has acquired the world lock.")
		    #endif
		    cellX = X \ CellSize
		    cellY = Y \ CellSize
		    If LifeWorld(cellX, cellY) = dead Then
		      LifeWorld(cellX, cellY) = alive
		      RenderWorld(cellX, cellY) = alive
		    Else
		      LifeWorld(cellX, cellY) = dead
		      RenderWorld(cellX, cellY) = dead
		    End If
		    Modified = True
		    
		    Repaint()
		    WorldLock.Release
		    #If DebugBuild Then
		      System.DebugLog(CurrentMethodName + " has acquired the world lock.")
		    #endif
		  Else
		    MsgBox(CurrentMethodName + ": Unable to lock world!")
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
#tag EndEvents
#tag Events Timer1
	#tag Event
		Sub Action()
		  Dim sx, sy As Integer
		  sx = UBound(RenderWorld, 1)
		  sy = UBound(RenderWorld, 2)
		  Dim m As String
		  If WorldFile <> Nil Then
		    If Modified Then m = "*"
		    m = " - " + WorldFile.Name + m
		  End If
		  Select Case RenderThread.State
		  Case Thread.Running, Thread.Sleeping
		    m = m + " (running)"
		  Case Thread.Suspended
		    m = m + " (suspended)"
		  End Select
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
		    Dim data As MemoryBlock = bs.Read(bs.Length)
		    bs.Close
		    LoadWorld(data)
		    WorldFile = App.LoadFile
		    App.LoadFile = Nil
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
		      #If DebugBuild Then
		        System.DebugLog(CurrentMethodName + " failed to acquire the world lock!")
		      #endif
		      Continue
		    End If
		    #If DebugBuild Then
		      System.DebugLog(CurrentMethodName + " has acquired the world lock.")
		    #endif
		    LifeCount = 0
		    Dim newworld(-1, -1) As Integer
		    ReDim newworld(UBound(LifeWorld, 1), UBound(LifeWorld, 2))
		    GenCount = GenCount + 1
		    Dim stable As Boolean = True
		    
		    Try
		      Dim u1, u2 As Integer
		      u1 = UBound(LifeWorld, 1)
		      u2 = UBound(LifeWorld, 2)
		      For X As Integer = 1 To u1
		        For Y As Integer = 1 To u2
		          Dim status As Integer = Life(X, Y)
		          newworld(X, Y) = status
		          If status = alive Then
		            lifecount = lifecount + 1
		          End If
		          
		          If status <> LifeWorld(X, Y) Then
		            stable = False
		          End If
		        Next
		      Next
		      
		      LifeWorld = newworld
		      Swap()
		      Repaint()
		      Canvas1.Invalidate(True) ' In my defense, the Canvas1.Paint event will yield on the main thread until WorldLock is released.
		      
		      Modified = True
		    Finally
		      WorldLock.Release
		      #If DebugBuild Then
		        System.DebugLog(CurrentMethodName + " has released the world lock.")
		      #endif
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
		End Sub
	#tag EndEvent
#tag EndEvents
