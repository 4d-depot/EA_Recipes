Case of 
	: (Form event code:C388=-1)
		  // update recipe count
		Form:C1466.recipeCount:=updateRecipeCount 
		
		  // update recipe in detail view
		If (Form:C1466.sidebar.listData.length>0)
			Form:C1466.recipe.ent:=Form:C1466.sidebar.listData.first()
			Form:C1466.toolbar.ent:=Form:C1466.sidebar.listData.first()
			EXECUTE METHOD IN SUBFORM:C1085("detail_SF";"showPrintPreview")
			togglePreviousNextButtons 
		Else 
			Form:C1466.recipe.ent:=Null:C1517
			Form:C1466.toolbar.ent:=Null:C1517
		End if 
		
		  // reset subform container dimensions to default
		OBJECT GET COORDINATES:C663(*;"sidebar_SF";$l;$t;$r;$b)
		OBJECT SET COORDINATES:C1248(*;"sidebar_SF";$l;$t;$l+310;$b)
		
		C_BOOLEAN:C305($isVisible_b)
		If (Form:C1466.recipe.ent=Null:C1517)
			$isVisible_b:=False:C215
			EXECUTE METHOD IN SUBFORM:C1085("detail_SF";"toggleVisibility";*;"cookingTimePrn_t";$isVisible_b)
			EXECUTE METHOD IN SUBFORM:C1085("detail_SF";"toggleVisibility";*;"ingredientsPrn_t";$isVisible_b)
			EXECUTE METHOD IN SUBFORM:C1085("detail_SF";"toggleVisibility";*;"cookingStepsPrn_t";$isVisible_b)
			EXECUTE METHOD IN SUBFORM:C1085("detail_SF";"toggleVisibility";*;"CuisineLabel";$isVisible_b)
			EXECUTE METHOD IN SUBFORM:C1085("detail_SF";"toggleVisibility";*;"TotalTimeLabel";$isVisible_b)
			EXECUTE METHOD IN SUBFORM:C1085("detail_SF";"toggleVisibility";*;"ServingsLabel";$isVisible_b)
			EXECUTE METHOD IN SUBFORM:C1085("detail_SF";"toggleVisibility";*;"ingredientsLabel";$isVisible_b)
			EXECUTE METHOD IN SUBFORM:C1085("detail_SF";"toggleVisibility";*;"CookingStepsLabel";$isVisible_b)
			EXECUTE METHOD IN SUBFORM:C1085("detail_SF";"toggleVisibility";*;"FieldPhoto";$isVisible_b)
			EXECUTE METHOD IN SUBFORM:C1085("detail_SF";"toggleVisibility";*;"Line1";$isVisible_b)
			EXECUTE METHOD IN SUBFORM:C1085("detail_SF";"toggleVisibility";*;"Line2";$isVisible_b)
			EXECUTE METHOD IN SUBFORM:C1085("detail_SF";"toggleVisibility";*;"ingredientBG";$isVisible_b)
			EXECUTE METHOD IN SUBFORM:C1085("detail_SF";"toggleVisibility";*;"noRecipeText";Not:C34($isVisible_b))
		Else 
			$isVisible_b:=True:C214
			EXECUTE METHOD IN SUBFORM:C1085("detail_SF";"toggleVisibility";*;"cookingTimePrn_t";$isVisible_b)
			EXECUTE METHOD IN SUBFORM:C1085("detail_SF";"toggleVisibility";*;"ingredientsPrn_t";$isVisible_b)
			EXECUTE METHOD IN SUBFORM:C1085("detail_SF";"toggleVisibility";*;"cookingStepsPrn_t";$isVisible_b)
			EXECUTE METHOD IN SUBFORM:C1085("detail_SF";"toggleVisibility";*;"CuisineLabel";$isVisible_b)
			EXECUTE METHOD IN SUBFORM:C1085("detail_SF";"toggleVisibility";*;"TotalTimeLabel";$isVisible_b)
			EXECUTE METHOD IN SUBFORM:C1085("detail_SF";"toggleVisibility";*;"ServingsLabel";$isVisible_b)
			EXECUTE METHOD IN SUBFORM:C1085("detail_SF";"toggleVisibility";*;"ingredientsLabel";$isVisible_b)
			EXECUTE METHOD IN SUBFORM:C1085("detail_SF";"toggleVisibility";*;"CookingStepsLabel";$isVisible_b)
			EXECUTE METHOD IN SUBFORM:C1085("detail_SF";"toggleVisibility";*;"FieldPhoto";$isVisible_b)
			EXECUTE METHOD IN SUBFORM:C1085("detail_SF";"toggleVisibility";*;"Line1";$isVisible_b)
			EXECUTE METHOD IN SUBFORM:C1085("detail_SF";"toggleVisibility";*;"Line2";$isVisible_b)
			EXECUTE METHOD IN SUBFORM:C1085("detail_SF";"toggleVisibility";*;"ingredientBG";$isVisible_b)
			EXECUTE METHOD IN SUBFORM:C1085("detail_SF";"toggleVisibility";*;"noRecipeText";Not:C34($isVisible_b))
		End if 
		
End case 