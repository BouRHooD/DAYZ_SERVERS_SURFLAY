void main()
{
	//INIT ECONOMY--------------------------------------
	Hive ce = CreateHive();
	if ( ce )
		ce.InitOffline();

	//DATE RESET AFTER ECONOMY INIT-------------------------
	int year, month, day, hour, minute;
	int reset_month = 8, reset_day = 10;
	GetGame().GetWorld().GetDate(year, month, day, hour, minute);

	if ((month == reset_month) && (day < reset_day))
	{
		GetGame().GetWorld().SetDate(year, reset_month, reset_day, hour, minute);
	}
	else
	{
		if ((month == reset_month + 1) && (day > reset_day))
		{
			GetGame().GetWorld().SetDate(year, reset_month, reset_day, hour, minute);
		}
		else
		{
			if ((month < reset_month) || (month > reset_month + 1))
			{
				GetGame().GetWorld().SetDate(year, reset_month, reset_day, hour, minute);
			}
		}
	}
}

class CustomMission: MissionServer
{
	void SetRandomHealth(EntityAI itemEnt)
	{
		if ( itemEnt )
		{
			float rndHlt = Math.RandomFloat( 0.65, 1.00 );
			itemEnt.SetHealth01( "", "", rndHlt );
		}
	}

	override PlayerBase CreateCharacter(PlayerIdentity identity, vector pos, ParamsReadContext ctx, string characterName)
	{
		Entity playerEnt;
		playerEnt = GetGame().CreatePlayer( identity, characterName, pos, 0, "NONE" );
		Class.CastTo( m_player, playerEnt );

		GetGame().SelectPlayer( identity, m_player );

		return m_player;
	}

	void StartingEquipSetupV0(PlayerBase player, bool clothesChosen)
	{
		EntityAI itemClothing;
		EntityAI itemEnt;
		ItemBase itemBs;
		float rand;

		itemClothing = player.FindAttachmentBySlotName( "Body" );
		if ( itemClothing )
		{
			SetRandomHealth( itemClothing );
            
            itemEnt = itemClothing.GetInventory().CreateInInventory( "AmmoBox_380_35rnd" );
			player.SetQuickBarEntityShortcut(itemEnt, 8);
            
            itemEnt = itemClothing.GetInventory().CreateInInventory( "StoneKnife" );
			player.SetQuickBarEntityShortcut(itemEnt, 1);
            
			itemEnt = itemClothing.GetInventory().CreateInInventory( "BandageDressing" );
			player.SetQuickBarEntityShortcut(itemEnt, 2);

			string chemlightArray[] = { "Chemlight_White", "Chemlight_Yellow", "Chemlight_Green", "Chemlight_Red" };
			int rndIndex = Math.RandomInt( 0, 4 );
			itemEnt = itemClothing.GetInventory().CreateInInventory( chemlightArray[rndIndex] );
			player.SetQuickBarEntityShortcut(itemEnt, 9);
			SetRandomHealth( itemEnt );
		}
		
		itemClothing = player.FindAttachmentBySlotName( "Legs" );
		if ( itemClothing )
        {
			SetRandomHealth( itemClothing );
            
            itemEnt = itemClothing.GetInventory().CreateInInventory( "MakarovIJ70" );
			player.SetQuickBarEntityShortcut(itemEnt, 0);
            
            itemEnt = itemClothing.GetInventory().CreateInInventory( "Mag_IJ70_8Rnd" );
			player.SetQuickBarEntityShortcut(itemEnt, 9);
            
            itemEnt = itemClothing.GetInventory().CreateInInventory( "Mag_IJ70_8Rnd" );
			player.SetQuickBarEntityShortcut(itemEnt, 9);
            
        }
		
		itemClothing = player.FindAttachmentBySlotName( "Feet" );
	}

	void StartingEquipSetupV1(PlayerBase player, bool clothesChosen)
	{
		EntityAI itemClothing;
        EntityAI itemEnt;
        ItemBase itemBs;

        // Одеваем игрока
        player.RemoveAllItems();
        
        // Головной убор
        itemClothing = player.GetInventory().CreateInInventory("SFP_Shapka_old");
        
        // Верхняя одежда
        itemClothing = player.GetInventory().CreateInInventory("SFP_SurvScav_Tors");
        if (itemClothing)
        {
            // UpperGear - предметы в карманы верхней одежды
            itemEnt = itemClothing.GetInventory().CreateInInventory("Rag");
            if (itemEnt)
            {
                itemEnt.SetQuantity(5);
                player.SetQuickBarEntityShortcut(itemEnt, 2); // Слот 3 - бинты
            }
            
            itemClothing.GetInventory().CreateInInventory("SFP_Matchbox_Rus");
            itemClothing.GetInventory().CreateInInventory("SFP_SIGARETA_SMOKE");
            itemClothing.GetInventory().CreateInInventory("SFP_Food_LomtikHleb");
            itemClothing.GetInventory().CreateInInventory("SFP_Food_Kolbasa");
            itemClothing.GetInventory().CreateInInventory("SFP_Can_water_closed");
            itemClothing.GetInventory().CreateInInventory("SFP_DrinkCan_Zhigulevskoe");
            itemClothing.GetInventory().CreateInInventory("Chemlight_White");
        }
        
        // Штаны
        itemClothing = player.GetInventory().CreateInInventory("SFP_SurvScav_Pants");
        if (itemClothing)
        {
            // PantsGear - предметы в карманы штанов
			// Нож
            itemEnt = itemClothing.GetInventory().CreateInInventory("SFP_knife_Prut_handmade");
			if (itemEnt)
            {
                player.SetQuickBarEntityShortcut(itemEnt, 0); // Слот 1 - нож
            }

            // Пистолет с магазином
            itemEnt = itemClothing.GetInventory().CreateInInventory("MakarovIJ70");
            if (itemEnt)
            {
                EntityAI magazine = itemEnt.GetInventory().CreateAttachment("Mag_IJ70_8Rnd");
                player.SetQuickBarEntityShortcut(itemEnt, 1); // Слот 2 - пистолет
            }
            
            // Запасные магазины
            itemClothing.GetInventory().CreateInInventory("Mag_IJ70_8Rnd");
            itemClothing.GetInventory().CreateInInventory("Mag_IJ70_8Rnd");
        }
        
        // Обувь
        itemClothing = player.GetInventory().CreateInInventory("SFP_Stranik_Boots");
	}

	override void StartingEquipSetup(PlayerBase player, bool clothesChosen)
	{
		StartingEquipSetupV1(player, clothesChosen);
	}
};

Mission CreateCustomMission(string path)
{
	return new CustomMission();
}