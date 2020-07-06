OBJECT SET VISIBLE:C603(*;"autofill_preview_lb";False:C215)

If (Form:C1466.ingredientName="")
	ALERT:C41("Cannot save empty ingredient")
Else 
	If (Form:C1466.selectedIngredient#Null:C1517)
		  // update ingredient entity
		C_OBJECT:C1216($ingredient_e)
		$ingredient_e:=ds:C1482.Ingredients.get(Form:C1466.selectedIngredient.ID)
		$ingredient_e.Item:=Form:C1466.ingredientName
		$ingredient_e.Quantity:=Form:C1466.ingredientsQty
		$ingredient_e.Unit:=Form:C1466.ingredientsUnit
		$ingredient_e.Description:=Form:C1466.ingredientsDes
		
		  // update ingredient listbox appearance
		Form:C1466.selectedIngredient.Item:=Form:C1466.ingredientName
		Form:C1466.selectedIngredient.Quantity:=Form:C1466.ingredientsQty
		Form:C1466.selectedIngredient.Unit:=Form:C1466.ingredientsUnit
		Form:C1466.selectedIngredient.Description:=Form:C1466.ingredientsDes
		Form:C1466.ingredientList:=Form:C1466.ingredientList
		
		C_OBJECT:C1216($status_o)
		$status_o:=$ingredient_e.save()
		If ($status_o.success=False:C215)
			ALERT:C41("Failed to save ingredient")
		End if 
	Else 
		  // Else save as new ingredient
		C_OBJECT:C1216($newIngredient_e;$status_o)
		$newIngredient_e:=ds:C1482.Ingredients.new()
		$newIngredient_e.RecipesID:=Form:C1466.ent.ID
		$newIngredient_e.Item:=Form:C1466.ingredientName
		$newIngredient_e.Quantity:=Form:C1466.ingredientsQty
		$newIngredient_e.Unit:=Form:C1466.ingredientsUnit
		$newIngredient_e.Description:=Form:C1466.ingredientsDes
		
		$status_o:=$newIngredient_e.save()
		If ($status_o.success=False:C215)
			ALERT:C41("Failed to save ingredient: "+$status_o.statusText)
		Else 
			  // update ingredient listbox appearance
			C_OBJECT:C1216($newIngredient_o)
			$newIngredient_o:=New object:C1471
			$newIngredient_o.ID:=$newIngredient_e.ID
			$newIngredient_o.Item:=$newIngredient_e.Item
			$newIngredient_o.Quantity:=$newIngredient_e.Quantity
			$newIngredient_o.Unit:=$newIngredient_e.Unit
			$newIngredient_o.Description:=$newIngredient_e.Description
			Form:C1466.ingredientList.push($newIngredient_o)
			
		End if 
		
		Form:C1466.ingredientName:=""
		Form:C1466.ingredientsQty:=""
		Form:C1466.ingredientsUnit:=""
		Form:C1466.ingredientsDes:=""
		unitFull_t:=""
		
		OBJECT SET ENABLED:C1123(*;"delIngredient";False:C215)
	End if 
End if 

