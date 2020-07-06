OBJECT SET VISIBLE:C603(*;"autofill_preview_lb";False:C215)

If (Form:C1466.selectedIngredient#Null:C1517)
	C_OBJECT:C1216($status_o;$ingredient_e)
	
	$ingredient_e:=ds:C1482.Ingredients.get(Form:C1466.selectedIngredient.ID)
	$status_o:=$ingredient_e.drop()
	If ($status_o.success=False:C215)
		ALERT:C41("Failed to drop ingredient: "+$status_o.statusText)
	Else 
		  // Reload listbox
		Form:C1466.ingredientList.remove(Form:C1466.selectedIngredientPos-1)
		  //Form.ent:=ds.Recipes.get([Recipes]ID)
		
		Form:C1466.ingredientName:=""
		Form:C1466.ingredientsQty:=""
		Form:C1466.ingredientsUnit:=""
		Form:C1466.ingredientsDes:=""
		unitFull_t:=""
		
		LISTBOX SELECT ROW:C912(*;"ingredientLB";0;lk remove from selection:K53:3)
		
		OBJECT SET ENABLED:C1123(*;"delIngredient";False:C215)
	End if 
End if 