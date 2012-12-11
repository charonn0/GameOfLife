#tag Menu
Begin Menu MenuBar1
   Begin MenuItem FileMenu
      SpecialMenu = 0
      Text = "&File"
      Index = -2147483648
      AutoEnable = True
      Begin MenuItem FasterItem
         SpecialMenu = 0
         Text = "Faster"
         Index = -2147483648
         ShortcutKey = "+"
         Shortcut = "Cmd++"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem SlowerItem
         SpecialMenu = 0
         Text = "Slower"
         Index = -2147483648
         ShortcutKey = "-"
         Shortcut = "Cmd+-"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem StopItem
         SpecialMenu = 0
         Text = "Stop/Start"
         Index = -2147483648
         ShortcutKey = "L"
         Shortcut = "Cmd+L"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem ResetItem
         SpecialMenu = 0
         Text = "Reset"
         Index = -2147483648
         ShortcutKey = "R"
         Shortcut = "Cmd+R"
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
End
#tag EndMenu
