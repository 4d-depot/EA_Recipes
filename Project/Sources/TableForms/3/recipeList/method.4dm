Case of 
	: (Form event code:C388=On Selection Change:K2:29)
		C_LONGINT:C283($recordNum_l)
		$recordNum_l:=Selected record number:C246([Recipes:3])
		
		If ($recordNum_l#0)
			GOTO SELECTED RECORD:C245([Recipes:3];$recordNum_l)
			CALL SUBFORM CONTAINER:C1086(-1)  // Update selected recipe in detail view
		Else 
			CALL SUBFORM CONTAINER:C1086(-2)  // Set Form.recipe.ent to null when clicking on blank row
		End if 
		
	: (Form event code:C388=On Double Clicked:K2:5)
		C_LONGINT:C283($win_l)
		C_OBJECT:C1216($form_o)
		
		  // If there is a recipe selected, load recipeInput form
		If ([Recipes:3]ID:1#0)
			$form_o:=New object:C1471
			$form_o.ent:=ds:C1482.Recipes.get([Recipes:3]ID:1)
			$form_o.hour:=0
			$form_o.min:=0
			$form_o.ingredientName:=""
			$form_o.autofill_preview:=New collection:C1472
			
			$win_l:=Open form window:C675([Recipes:3];"recipeInput")
			DIALOG:C40([Recipes:3];"recipeInput";$form_o)
			CLOSE WINDOW:C154($win_l)
			
			If (OK=1)
				  // Update recipe on detail view after editing
				CALL SUBFORM CONTAINER:C1086(-3)
			Else 
				
			End if 
		End if 
		
End case 