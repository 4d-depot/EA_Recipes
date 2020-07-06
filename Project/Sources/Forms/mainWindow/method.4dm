Case of 
	: (Form event code:C388=On Load:K2:1)
		C_LONGINT:C283(mainWinRef)
		C_BOOLEAN:C305(bFavorite)
		
		bFavorite:=False:C215
		mainWinRef:=Current form window:C827
		
		Form:C1466.sidebar.listData:=ds:C1482.Recipes.all().orderBy("ID desc")
		Form:C1466.sidebar.querySelected:=1
		USE ENTITY SELECTION:C1513(Form:C1466.sidebar.listData)
		
		  // Store entity into top toolbar for the Edit button
		If (Form:C1466.sidebar.listData.length#0)
			Form:C1466.toolbar.ent:=Form:C1466.sidebar.listData.first()
		End if 
		
		  // Init searchText
		Form:C1466.toolbar.searchText:=""
		
		Form:C1466.showDetailView:=False:C215
		updateSidebar 
		Form:C1466.recipeCount:=updateRecipeCount 
		
		calculateSubformMinHeight 
		
	: (Form event code:C388=On Outside Call:K2:11)
		If (Form:C1466.sidebar.expandListbox)
			OBJECT GET COORDINATES:C663(*;"sidebar_SF";$l;$t;$r;$b)
			OBJECT SET COORDINATES:C1248(*;"sidebar_SF";$l;$t;$l+622;$b)
			GET WINDOW RECT:C443($l;$t;$r;$b)
		Else 
			OBJECT GET COORDINATES:C663(*;"sidebar_SF";$l;$t;$r;$b)
			OBJECT SET COORDINATES:C1248(*;"sidebar_SF";$l;$t;$l+310;$b)
		End if 
		
End case 