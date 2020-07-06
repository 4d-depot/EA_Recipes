//%attributes = {"invisible":true}
  // Method: updateDetailForm
  // Description:
  //   Updates detail form when previous or next button is pressed from [Recipes]recipeInput
  //
  // ----------------------------------------------------


C_LONGINT:C283($recordNum_l)
$recordNum_l:=Selected record number:C246([Recipes:3])

If ($recordNum_l#0)
	Form:C1466.recipe.ent:=Form:C1466.sidebar.listData[$recordNum_l-1]
	Form:C1466.toolbar.ent:=Form:C1466.recipe.ent
End if 

EXECUTE METHOD IN SUBFORM:C1085("detail_SF";"showPrintPreview")