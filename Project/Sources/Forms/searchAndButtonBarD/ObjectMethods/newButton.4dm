C_LONGINT:C283($win_l)
C_OBJECT:C1216($form_o)

  // If there is a recipe selected, load recipeInput form
$form_o:=New object:C1471
$form_o.ent:=ds:C1482.Recipes.new()
$form_o.hour:=0
$form_o.min:=0
$form_o.ingredientName:=""
$form_o.autofill_preview:=New collection:C1472

$win_l:=Open form window:C675([Recipes:3];"recipeInput")
DIALOG:C40([Recipes:3];"recipeInput";$form_o)
CLOSE WINDOW:C154($win_l)

If (OK=1)
	  // update recipe count on sidebar
	CALL SUBFORM CONTAINER:C1086(-5)
Else 
	  // If user saved ingredients but not the recipe itself, delete ingredients from that non-existent recipe
	C_OBJECT:C1216($lastOpenedRecipe_o;$ingredients_es;$e;$status_o)
	$lastOpenedRecipe_o:=ds:C1482.Recipes.get(lastOpenedRecipeID_l)
	
	If ($lastOpenedRecipe_o=Null:C1517)
		$ingredients_es:=ds:C1482.Ingredients.query("RecipesID = :1";lastOpenedRecipeID_l)
		For each ($e;$ingredients_es)
			$status_o:=$e.drop()
			If ($status_o.success=False:C215)
				ALERT:C41("Failed to drop ingredient: "+$status_o.statusText)
			End if 
		End for each 
	End if 
End if 