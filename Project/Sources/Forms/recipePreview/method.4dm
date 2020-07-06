C_BOOLEAN:C305($isVisible_b)
If (Form:C1466.ent=Null:C1517)
	$isVisible_b:=False:C215
	toggleVisibility ("cookingTimePrn_t";$isVisible_b)
	toggleVisibility ("ingredientsPrn_t";$isVisible_b)
	toggleVisibility ("cookingStepsPrn_t";$isVisible_b)
	toggleVisibility ("CuisineLabel";$isVisible_b)
	toggleVisibility ("TotalTimeLabel";$isVisible_b)
	toggleVisibility ("ServingsLabel";$isVisible_b)
	toggleVisibility ("ingredientsLabel";$isVisible_b)
	toggleVisibility ("CookingStepsLabel";$isVisible_b)
	toggleVisibility ("FieldPhoto";$isVisible_b)
	toggleVisibility ("Line1";$isVisible_b)
	toggleVisibility ("Line2";$isVisible_b)
	toggleVisibility ("ingredientBG";$isVisible_b)
	toggleVisibility ("noRecipeText";Not:C34($isVisible_b))
Else 
	$isVisible_b:=True:C214
	toggleVisibility ("cookingTimePrn_t";$isVisible_b)
	toggleVisibility ("ingredientsPrn_t";$isVisible_b)
	toggleVisibility ("cookingStepsPrn_t";$isVisible_b)
	toggleVisibility ("CuisineLabel";$isVisible_b)
	toggleVisibility ("TotalTimeLabel";$isVisible_b)
	toggleVisibility ("ServingsLabel";$isVisible_b)
	toggleVisibility ("ingredientsLabel";$isVisible_b)
	toggleVisibility ("CookingStepsLabel";$isVisible_b)
	toggleVisibility ("FieldPhoto";$isVisible_b)
	toggleVisibility ("Line1";$isVisible_b)
	toggleVisibility ("Line2";$isVisible_b)
	toggleVisibility ("ingredientBG";$isVisible_b)
	toggleVisibility ("noRecipeText";Not:C34($isVisible_b))
End if 

showPrintPreview 

