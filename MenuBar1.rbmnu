#tag Menu
Begin Menu MenuBar1
   Begin MenuItem FileMenu
      SpecialMenu = 0
      Text = "File"
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
      Begin MenuItem CloseItem
         SpecialMenu = 0
         Text = "Close"
         Index = -2147483648
         ShortcutKey = "Q"
         Shortcut = "Cmd+Q"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem ConvertItem
         SpecialMenu = 0
         Text = "Convert RLE..."
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem SaveItem
         SpecialMenu = 0
         Text = "Save"
         Index = -2147483648
         ShortcutKey = "S"
         Shortcut = "Cmd+S"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem SaveAsItem
         SpecialMenu = 0
         Text = "Save As..."
         Index = -2147483648
         AutoEnable = True
      End
   End
   Begin MenuItem EditMenu
      SpecialMenu = 0
      Text = "Edit"
      Index = -2147483648
      AutoEnable = True
      Begin MenuItem ClearWorld
         SpecialMenu = 0
         Text = "Clear"
         Index = -2147483648
         ShortcutKey = "K"
         Shortcut = "Cmd+K"
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
      Begin MenuItem ChangeRulesItem
         SpecialMenu = 0
         Text = "Set rules..."
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem SetColor
         SpecialMenu = 0
         Text = "Set color..."
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem CellFade
         SpecialMenu = 0
         Text = "Fade on death"
         Index = -2147483648
         ShortcutKey = "F"
         Shortcut = "Cmd+F"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem GridItem
         SpecialMenu = 0
         Text = "Show grid"
         Index = -2147483648
         ShortcutKey = "Space"
         Shortcut = "Space"
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
      Begin MenuItem StepItem
         SpecialMenu = 0
         Text = "Step generation"
         Index = -2147483648
         ShortcutKey = "T"
         Shortcut = "Cmd+T"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem IncreaseSize
         SpecialMenu = 0
         Text = "Increase cell size"
         Index = -2147483648
         ShortcutKey = "]"
         Shortcut = "Cmd+]"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem DecreaseSize
         SpecialMenu = 0
         Text = "Decrease cell size"
         Index = -2147483648
         ShortcutKey = "["
         Shortcut = "Cmd+["
         MenuModifier = True
         AutoEnable = True
      End
   End
End
#tag EndMenu
