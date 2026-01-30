modded class LoadingScreen
{
	ref TStringArray MyFuckingLoadingScreenArray = {
		"MainMenu\\data\\edds\\Loading_01.edds",
        "MainMenu\\data\\edds\\Loading_02.edds",
        "MainMenu\\data\\edds\\Loading_03.edds",
        "MainMenu\\data\\edds\\Loading_04.edds",
        "MainMenu\\data\\edds\\Loading_05.edds",
        "MainMenu\\data\\edds\\Loading_06.edds",
        "MainMenu\\data\\edds\\Loading_07.edds",
        "MainMenu\\data\\edds\\Loading_08.edds",
        "MainMenu\\data\\edds\\Loading_09.edds",
        "MainMenu\\data\\edds\\Loading_10.edds",
        "MainMenu\\data\\edds\\Loading_11.edds"
    };

	override void Show()
	{		
		string preel = MyFuckingLoadingScreenArray.GetRandomElement();
		m_ImageWidgetBackground.LoadMaskTexture("MainMenu/data/ls_mask.paa");
		m_ImageWidgetBackground.LoadImageFile(0, preel);   
        m_ImageLogoMid.Show(false);
		m_ImageLogoCorner.Show(false);	    	
		m_ModdedWarning.Show(false); // Show / Hide - Modded version warning // 1.17 OK
		super.Show();
	}
}


modded class LoginTimeBase extends UIScriptedMenu
{
	ref TStringArray MyFuckingLoadingScreenArray = {
		"MainMenu\\data\\edds\\Loading_01.edds",
        "MainMenu\\data\\edds\\Loading_02.edds",
        "MainMenu\\data\\edds\\Loading_03.edds",
        "MainMenu\\data\\edds\\Loading_04.edds",
        "MainMenu\\data\\edds\\Loading_05.edds",
        "MainMenu\\data\\edds\\Loading_06.edds",
        "MainMenu\\data\\edds\\Loading_07.edds",
        "MainMenu\\data\\edds\\Loading_08.edds",
        "MainMenu\\data\\edds\\Loading_09.edds",
        "MainMenu\\data\\edds\\Loading_10.edds",
        "MainMenu\\data\\edds\\Loading_11.edds"
    };

    override void Show()
    {
        super.Show();
        if (layoutRoot)
        {
            string preel = MyFuckingLoadingScreenArray.GetRandomElement();
            ImageWidget background = ImageWidget.Cast( layoutRoot.FindAnyWidget("Background"));
            background.LoadImageFile(0, preel);  
        }
    }
}


modded class LoginQueueBase extends UIScriptedMenu
{
	ref TStringArray MyFuckingLoadingScreenArray = {
		"MainMenu\\data\\edds\\Loading_01.edds",
        "MainMenu\\data\\edds\\Loading_02.edds",
        "MainMenu\\data\\edds\\Loading_03.edds",
        "MainMenu\\data\\edds\\Loading_04.edds",
        "MainMenu\\data\\edds\\Loading_05.edds",
        "MainMenu\\data\\edds\\Loading_06.edds",
        "MainMenu\\data\\edds\\Loading_07.edds",
        "MainMenu\\data\\edds\\Loading_08.edds",
        "MainMenu\\data\\edds\\Loading_09.edds",
        "MainMenu\\data\\edds\\Loading_10.edds",
        "MainMenu\\data\\edds\\Loading_11.edds"
    };

    override void Show()
    {
        super.Show();
        if (layoutRoot)
        {
            string preel = MyFuckingLoadingScreenArray.GetRandomElement();
            ImageWidget background = ImageWidget.Cast( layoutRoot.FindAnyWidget("Background"));
            background.LoadImageFile(0, preel);  
        }
    }
}