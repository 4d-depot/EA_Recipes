//%attributes = {"invisible":true}

  // ----------------------------------------------------
  // User name (OS): Add Komoncharoensiri
  // Date and time: 08/03/16, 15:02:16
  // ----------------------------------------------------
  // Method: loadRecipeForPrinting
  // Description
  //    This method prepare the current recipe data to be shown
  //    in the Preview form or Printable form.
  //
  // ----------------------------------------------------

C_TEXT:C284(cookingTimePrn_t;ingredientsPrn_t;cookingStepsPrn_t;$item_t)
cookingTimePrn_t:=""
ingredientsPrn_t:=""
cookingStepsPrn_t:=""

C_LONGINT:C283($hour_l;$min_l;$i)
$hour_l:=Int:C8([Recipes:3]CookTime:5/60)
$min_l:=Int:C8([Recipes:3]CookTime:5%60)
If ($hour_l>0)
	cookingTimePrn_t:=String:C10($hour_l)+" Hr"
End if 
If ($min_l>0)
	If (cookingTimePrn_t#"")
		cookingTimePrn_t:=cookingTimePrn_t+" "
	End if 
	cookingTimePrn_t:=cookingTimePrn_t+String:C10($min_l)+" Min"
End if 

C_BOOLEAN:C305($lowerCase_b)
RELATE MANY:C262([Recipes:3]ID:1)
ORDER BY:C49([Ingredients:4];[Ingredients:4]ID:1;>)
For ($i;1;Records in selection:C76([Ingredients:4]))
	$lowerCase_b:=False:C215
	If ([Ingredients:4]Quantity:4>0)
		ingredientsPrn_t:=ingredientsPrn_t+String:C10([Ingredients:4]Quantity:4)+" "
		$lowerCase_b:=True:C214
	End if 
	If ([Ingredients:4]Unit:5#"")
		ingredientsPrn_t:=ingredientsPrn_t+[Ingredients:4]Unit:5+" "
	End if 
	If ([Ingredients:4]Item:3#"")
		If ($lowerCase_b)
			ingredientsPrn_t:=ingredientsPrn_t+Lowercase:C14([Ingredients:4]Item:3)
		Else 
			$item_t:=Lowercase:C14([Ingredients:4]Item:3)
			$item_t[[1]]:=Uppercase:C13($item_t[[1]])
			ingredientsPrn_t:=ingredientsPrn_t+$item_t
		End if 
	End if 
	
	If ([Ingredients:4]Description:6#"")
		ingredientsPrn_t:=ingredientsPrn_t+", "+Lowercase:C14([Ingredients:4]Description:6)
	End if 
	
	ingredientsPrn_t:=ingredientsPrn_t+".\n"
	NEXT RECORD:C51([Ingredients:4])
End for 


ARRAY TEXT:C222($cookingDescSteps_at;0)
If (Not:C34(OB Is empty:C1297([Recipes:3]CookingSteps:11)))
	OB GET ARRAY:C1229([Recipes:3]CookingSteps:11;"steps";$cookingDescSteps_at)
	For ($i;1;Size of array:C274($cookingDescSteps_at))
		cookingStepsPrn_t:=cookingStepsPrn_t+String:C10($i)+". "+$cookingDescSteps_at{$i}
		Case of 
			: ($i<Size of array:C274($cookingDescSteps_at))
				cookingStepsPrn_t:=cookingStepsPrn_t+"\n\n"
			: ($i=Size of array:C274($cookingDescSteps_at))
				cookingStepsPrn_t:=cookingStepsPrn_t
			Else 
				cookingStepsPrn_t:=cookingStepsPrn_t+"\n"
		End case 
	End for 
End if 