C_LONGINT:C283($win_l)
C_OBJECT:C1216($form_o)

  // If there is a recipe selected, load recipeInput form
If (Form:C1466.ent#Null:C1517)
	$form_o:=New object:C1471
	$form_o.ent:=Form:C1466.ent
	$form_o.hour:=0
	$form_o.min:=0
	$form_o.ingredientName:=""
	$form_o.autofill_preview:=New collection:C1472
	
	$win_l:=Open form window:C675([Recipes:3];"recipeInput")
	DIALOG:C40([Recipes:3];"recipeInput";$form_o)
	CLOSE WINDOW:C154($win_l)
	
	If (OK=1)
		CALL SUBFORM CONTAINER:C1086(-6)  // On Save event from edit button
	End if 
End if 