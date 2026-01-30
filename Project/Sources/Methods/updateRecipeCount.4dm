//%attributes = {"invisible":true}
// Method: updateRecipeCount
// Description
//   Return string of number of found recipes
//
// Parameters
//   $count_l - Number of found recipes (TEXT)
// ----------------------------------------------------
//Updated by: Al Mahdi


#DECLARE($count_l : Integer)->$result : Text

If ($count_l=1)
	$result:=String:C10($count_l)+" recipe"
Else 
	$result:=String:C10($count_l)+" recipes"
End if 