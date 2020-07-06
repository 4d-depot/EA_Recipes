C_LONGINT:C283($recordNum_l)
C_OBJECT:C1216($recipeSelection_es)

$recordNum_l:=Selected record number:C246([Recipes:3])
$recipeSelection_es:=Create entity selection:C1512([Recipes:3])

  // Only go to next record if next record exists
If ($recordNum_l<Records in selection:C76([Recipes:3]))
	Form:C1466.ent:=$recipeSelection_es[$recordNum_l]
	NEXT RECORD:C51([Recipes:3])
	loadRecipeInput 
	CALL FORM:C1391(mainWinRef;"updateDetailForm")
End if 