#tag Menu
Begin Menu MenuBar1
   Begin MenuItem FileMenu
      SpecialMenu = 0
      Text = "&File"
      Index = -2147483648
      AutoEnable = True
      Begin MenuItem OpenWorldFile
         SpecialMenu = 0
         Text = "Open..."
         Index = -2147483648
         ShortcutKey = "O"
         Shortcut = "Cmd+O"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem SaveWorldFile
         SpecialMenu = 0
         Text = "Save As..."
         Index = -2147483648
         ShortcutKey = "S"
         Shortcut = "Cmd+S"
         MenuModifier = True
         AutoEnable = True
      End
      Begin QuitMenuItem FileQuit
         SpecialMenu = 0
         Text = "#App.kFileQuit"
         Index = -2147483648
         ShortcutKey = "#App.kFileQuitShortcut"
         Shortcut = "#App.kFileQuitShortcut"
         AutoEnable = True
      End
   End
   Begin MenuItem WorldControl
      SpecialMenu = 0
      Text = "World"
      Index = -2147483648
      AutoEnable = True
      Begin MenuItem RunItem
         SpecialMenu = 0
         Text = "Run/Pause"
         Index = -2147483648
         ShortcutKey = "R"
         Shortcut = "Cmd+R"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem Randomize
         SpecialMenu = 0
         Text = "Randomize"
         Index = -2147483648
         ShortcutKey = "W"
         Shortcut = "Cmd+W"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem ClearWorld
         SpecialMenu = 0
         Text = "Clear"
         Index = -2147483648
         ShortcutKey = "K"
         Shortcut = "Cmd+K"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem SetColor
         SpecialMenu = 0
         Text = "Set color..."
         Index = -2147483648
         AutoEnable = True
      End
   End
End
#tag EndMenu