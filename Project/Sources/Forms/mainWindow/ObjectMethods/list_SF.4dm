Case of 
	: (Form event code:C388=-1)  // when user clicks on existing record
		  // update recipe in detail view
		Form:C1466.recipe.ent:=Form:C1466.sidebar.listData[Selected record number:C246([Recipes:3])-1]
		
		  // store selected recipe in toolbar subform for the Edit button
		Form:C1466.toolbar.ent:=Form:C1466.sidebar.listData[Selected record number:C246([Recipes:3])-1]
		
		  // update object sizes in detail subform
		EXECUTE METHOD IN SUBFORM:C1085("detail_SF";"showPrintPreview")
		EXECUTE METHOD IN SUBFORM:C1085("detail_SF";"loadRecipeForPrinting")
		
		  // enable or disable prev/next buttons
		togglePreviousNextButtons 
		
	: (Form event code:C388=-2)  // when user clicks on blank row
		Form:C1466.recipe.ent:=Null:C1517
		
	: (Form event code:C388=-3)  // update recipe on detail view after editing
		updateSidebar 
		Form:C1466.recipe.ent:=Form:C1466.sidebar.listData[Selected record number:C246([Recipes:3])-1]
		Form:C1466.toolbar.ent:=Form:C1466.sidebar.listData[Selected record number:C246([Recipes:3])-1]
		EXECUTE METHOD IN SUBFORM:C1085("detail_SF";"showPrintPreview")
		
End case 