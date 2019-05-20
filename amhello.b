rem

#c
  Am_Initialize();

  Am_Screen
    .Add_Part( Am_Window.Create("window")
      .Set( Am_LEFT, 50 )
      .Set( Am_TOP, 50 )
      .Set( Am_WIDTH, 200 )
      .Set( Am_HEIGHT, 50 )
      .Add_Part( Am_Text.Create ("string")
        .Set( Am_TEXT, "Hello World!")
      )
    );

  Am_Main_Event_Loop();
  Am_Cleanup();

  return 0;
#endc

rem
