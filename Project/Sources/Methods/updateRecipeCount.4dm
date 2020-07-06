//%attributes = {"invisible":true}
  // Method: updateRecipeCount
  // Description
  //   Return string of number of found recipes
  //
  // Parameters
  //   $0 - Number of found recipes (TEXT)
  // ----------------------------------------------------

C_TEXT:C284($0)
C_LONGINT:C283($count_l)
$count_l:=Records in selection:C76([Recipes:3])

If ($count_l=1)
	$0:=String:C10($count_l)+" recipe"
Else 
	$0:=String:C10($count_l)+" recipes"
End if 