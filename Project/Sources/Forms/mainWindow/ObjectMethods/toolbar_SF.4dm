Case of 
	: (Form event code:C388=-1)
		Case of 
			: (Form:C1466.sidebar.querySelected=1)
				Form:C1466.sidebar.listData:=ds:C1482.Recipes\
					.query("Title = :1";"@"+Form:C1466.toolbar.searchText+"@")\
					.orderBy("ID desc")
				
			: (Form:C1466.sidebar.querySelected=2)
				Form:C1466.sidebar.listData:=ds:C1482.Recipes\
					.query("Title = :1 & Category = :2";"@"+Form:C1466.toolbar.searchText+"@";Form:C1466.sidebar.queryContent)\
					.orderBy("ID desc")
				
			: (Form:C1466.sidebar.querySelected=3)
				Form:C1466.sidebar.listData:=ds:C1482.Recipes\
					.query("Title = :1 & Cuisine = :2";"@"+Form:C1466.toolbar.searchText+"@";Form:C1466.sidebar.queryContent)\
					.orderBy("ID desc")
				
			: (Form:C1466.sidebar.querySelected=4)
				Form:C1466.sidebar.listData:=ds:C1482.Recipes\
					.query("Title = :1 & ingredients.Item = :2";"@"+Form:C1466.toolbar.searchText+"@";Form:C1466.sidebar.queryContent)\
					.orderBy("ID desc")
				
			: (Form:C1466.sidebar.querySelected=5)
				Form:C1466.sidebar.listData:=ds:C1482.Recipes\
					.query("Title = :1 & Favorites = :2";"@"+Form:C1466.toolbar.searchText+"@";True:C214)\
					.orderBy("ID desc")
				
		End case 
		
		If (Form:C1466.sidebar.listData.length>0)
			Form:C1466.recipe.ent:=Form:C1466.sidebar.listData.first()
			Form:C1466.toolbar.ent:=Form:C1466.sidebar.listData.first()
			EXECUTE METHOD IN SUBFORM:C1085("detail_SF";"loadRecipeForPrinting")
		Else 
			Form:C1466.recipe.ent:=Null:C1517
			Form:C1466.toolbar.ent:=Null:C1517
		End if 
		
		USE ENTITY SELECTION:C1513(Form:C1466.sidebar.listData)
		Form:C1466.recipeCount:=updateRecipeCount 
		
	: (Form event code:C388=-2)  // toggle prev/next buttons after On Load
		togglePreviousNextButtons 
		
	: (Form event code:C388=-3)  // On Prev Button Clicked event
		If (Form:C1466.recipe.ent#Null:C1517)
			Form:C1466.recipe.ent:=Form:C1466.recipe.ent.previous()
			Form:C1466.toolbar.ent:=Form:C1466.recipe.ent
			PREVIOUS RECORD:C110([Recipes:3])
			EXECUTE METHOD IN SUBFORM:C1085("detail_SF";"showPrintPreview")
			togglePreviousNextButtons 
		End if 
		
	: (Form event code:C388=-4)  // On Next Button Clicked event
		If (Form:C1466.recipe.ent#Null:C1517)
			Form:C1466.recipe.ent:=Form:C1466.recipe.ent.next()
			Form:C1466.toolbar.ent:=Form:C1466.recipe.ent
			NEXT RECORD:C51([Recipes:3])
			
			EXECUTE METHOD IN SUBFORM:C1085("detail_SF";"showPrintPreview")
			togglePreviousNextButtons 
		End if 
		
	: (Form event code:C388=-5)  // On New Recipe Created event
		updateSidebar 
		updateListData 
		Form:C1466.toolbar.ent:=Form:C1466.sidebar.listData[Selected record number:C246([Recipes:3])-1]
		Form:C1466.recipe.ent:=Form:C1466.sidebar.listData[Selected record number:C246([Recipes:3])-1]
		
		  // update sidebar arrow
		EXECUTE METHOD IN SUBFORM:C1085("sidebar_SF";"setNavArrow";*;1)
		Form:C1466.sidebar.querySelected:=1
		
		  // go to list view
		OBJECT SET VISIBLE:C603(*;"OnDetail";False:C215)
		OBJECT SET VISIBLE:C603(*;"previewRect";False:C215)
		OBJECT SET SUBFORM:C1138(*;"toolbar_SF";"searchAndButtonBarL")
		Form:C1466.showDetailView:=Not:C34(Form:C1466.showDetailView)
		OBJECT SET VISIBLE:C603(*;"detail_SF";Form:C1466.showDetailView)
		
	: (Form event code:C388=-6)  // Update recipe on detail view
		updateSidebar 
		Form:C1466.recipe.ent:=Form:C1466.sidebar.listData[Selected record number:C246([Recipes:3])-1]
		Form:C1466.toolbar.ent:=Form:C1466.sidebar.listData[Selected record number:C246([Recipes:3])-1]
		EXECUTE METHOD IN SUBFORM:C1085("detail_SF";"showPrintPreview")
		
	: (Form event code:C388=-7)  // On Delete event
		Case of 
			: (Form:C1466.sidebar.querySelected=1)
				Form:C1466.sidebar.listData:=ds:C1482.Recipes\
					.query("Title = :1";"@"+Form:C1466.toolbar.searchText+"@")\
					.orderBy("ID desc")
				
			: (Form:C1466.sidebar.querySelected=2)
				Form:C1466.sidebar.listData:=ds:C1482.Recipes\
					.query("Title = :1 & Category = :2";"@"+Form:C1466.toolbar.searchText+"@";Form:C1466.sidebar.queryContent)\
					.orderBy("ID desc")
				
			: (Form:C1466.sidebar.querySelected=3)
				Form:C1466.sidebar.listData:=ds:C1482.Recipes\
					.query("Title = :1 & Cuisine = :2";"@"+Form:C1466.toolbar.searchText+"@";Form:C1466.sidebar.queryContent)\
					.orderBy("ID desc")
				
			: (Form:C1466.sidebar.querySelected=4)
				Form:C1466.sidebar.listData:=ds:C1482.Recipes\
					.query("Title = :1 & ingredients.Item = :2";"@"+Form:C1466.toolbar.searchText+"@";Form:C1466.sidebar.queryContent)\
					.orderBy("ID desc")
				
			: (Form:C1466.sidebar.querySelected=5)
				Form:C1466.sidebar.listData:=ds:C1482.Recipes\
					.query("Title = :1 & Favorites = :2";"@"+Form:C1466.toolbar.searchText+"@";True:C214)\
					.orderBy("ID desc")
				
		End case 
		
		USE ENTITY SELECTION:C1513(Form:C1466.sidebar.listData)
		Form:C1466.recipeCount:=updateRecipeCount 
		updateSidebar 
		
		If (Form:C1466.sidebar.listData.length>0)
			  // Highlight next record, then previous
			If (deletedRecordPos_l>Form:C1466.sidebar.listData.length)
				GOTO SELECTED RECORD:C245([Recipes:3];deletedRecordPos_l-1)
				Form:C1466.recipe.ent:=Form:C1466.sidebar.listData[deletedRecordPos_l-2]
				Form:C1466.toolbar.ent:=Form:C1466.sidebar.listData[deletedRecordPos_l-2]
			Else 
				GOTO SELECTED RECORD:C245([Recipes:3];deletedRecordPos_l)
				Form:C1466.recipe.ent:=Form:C1466.sidebar.listData[deletedRecordPos_l-1]
				Form:C1466.toolbar.ent:=Form:C1466.sidebar.listData[deletedRecordPos_l-1]
			End if 
		Else 
			Form:C1466.recipe.ent:=Null:C1517
			Form:C1466.toolbar.ent:=Null:C1517
		End if 
		
		  // Switch back to list view if deleted item was last item
		If (Form:C1466.recipe.ent=Null:C1517)
			OBJECT SET VISIBLE:C603(*;"OnDetail";False:C215)
			OBJECT SET VISIBLE:C603(*;"previewRect";False:C215)
			OBJECT SET SUBFORM:C1138(*;"toolbar_SF";"searchAndButtonBarL")
			Form:C1466.showDetailView:=False:C215
			OBJECT SET VISIBLE:C603(*;"detail_SF";Form:C1466.showDetailView)
		End if 
		
End case 