//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // Method: printRecipe
  // Description
  //    This method print the current loaded recipe.
  //
  // ----------------------------------------------------

C_BOOLEAN:C305($end_b)
C_LONGINT:C283($hpaper_l;$wpaper_l)

If (Selected record number:C246([Recipes:3])>0)
	GOTO SELECTED RECORD:C245([Recipes:3];Selected record number:C246([Recipes:3]))
	LOAD RECORD:C52([Recipes:3])
	
	PRINT SETTINGS:C106
	If (OK=1)
		
		OPEN PRINTING JOB:C995
		If (OK=1)
			FORM LOAD:C1103("recipePrintable")
			GET PRINTABLE AREA:C703($hpaper_l;$wpaper_l)
			
			$end_b:=Print object:C1095(*;"fieldPhoto")
			
			C_LONGINT:C283($bestWidth_l;$bestHeight_l)
			C_LONGINT:C283($l;$t;$r;$b;$bb;$newtop_l;$newRectTop_l;$newBottom_l)
			
			  // Make sure the title object fits
			OBJECT GET COORDINATES:C663(*;"recipeTitle";$l;$t;$r;$b)
			OBJECT GET BEST SIZE:C717(*;"recipeTitle";$bestWidth_l;$bestHeight_l;$r-$l)
			$bb:=$t+$bestHeight_l
			OBJECT SET COORDINATES:C1248(*;"recipeTitle";$l;$t;$r;$bb)
			$end_b:=Print object:C1095(*;"recipeTitle")
			
			  // Make sure the description object is placed in the right
			  // location relative to the title object
			OBJECT GET COORDINATES:C663(*;"FieldDescription";$l;$t;$r;$b)
			OBJECT GET BEST SIZE:C717(*;"FieldDescription";$bestWidth_l;$bestHeight_l;$r-$l)
			$t:=$bb+10
			$b:=$t+$bestHeight_l
			OBJECT SET COORDINATES:C1248(*;"FieldDescription";$l;$t;$r;$b)
			$end_b:=Print object:C1095(*;"FieldDescription")
			
			  // Move Line1 to 20 pixels down relative to the description object
			$newtop_l:=$b+15
			OBJECT GET COORDINATES:C663(*;"Line1";$l;$t;$r;$b)
			OBJECT SET COORDINATES:C1248(*;"Line1";$l;$newtop_l;$wpaper_l-10;$newtop_l)
			$end_b:=Print object:C1095(*;"Line1")
			
			$newtop_l:=$newtop_l+15
			OBJECT GET COORDINATES:C663(*;"FieldCuisine";$l;$t;$r;$b)
			OBJECT SET COORDINATES:C1248(*;"FieldCuisine";$l;$newtop_l;$r;$newtop_l+($b-$t))
			$end_b:=Print object:C1095(*;"FieldCuisine")
			
			OBJECT GET COORDINATES:C663(*;"cookingTimePrn_t";$l;$t;$r;$b)
			OBJECT SET COORDINATES:C1248(*;"cookingTimePrn_t";$l;$newtop_l;$r;$newtop_l+($b-$t))
			$end_b:=Print object:C1095(*;"cookingTimePrn_t")
			
			OBJECT GET COORDINATES:C663(*;"FieldServings";$l;$t;$r;$b)
			OBJECT SET COORDINATES:C1248(*;"FieldServings";$l;$newtop_l;$r;$newtop_l+($b-$t))
			$end_b:=Print object:C1095(*;"FieldServings")
			
			$newtop_l:=$newtop_l+($b-$t)+5
			OBJECT GET COORDINATES:C663(*;"CuisineLabel";$l;$t;$r;$b)
			OBJECT SET COORDINATES:C1248(*;"CuisineLabel";$l;$newtop_l;$r;$newtop_l+($b-$t))
			$end_b:=Print object:C1095(*;"CuisineLabel")
			
			OBJECT GET COORDINATES:C663(*;"TotalTimeLabel";$l;$t;$r;$b)
			OBJECT SET COORDINATES:C1248(*;"TotalTimeLabel";$l;$newtop_l;$r;$newtop_l+($b-$t))
			$end_b:=Print object:C1095(*;"TotalTimeLabel")
			
			OBJECT GET COORDINATES:C663(*;"ServingsLabel";$l;$t;$r;$b)
			OBJECT SET COORDINATES:C1248(*;"ServingsLabel";$l;$newtop_l;$r;$newtop_l+($b-$t))
			$end_b:=Print object:C1095(*;"ServingsLabel")
			
			$newtop_l:=$newtop_l+($b-$t)+15
			
			  // Move Line1 to 20 pixels down relative to the description object
			OBJECT GET COORDINATES:C663(*;"Line2";$l;$t;$r;$b)
			OBJECT SET COORDINATES:C1248(*;"Line2";$l;$newtop_l;$wpaper_l-10;$newtop_l)
			$end_b:=Print object:C1095(*;"Line2")
			
			$newRectTop_l:=$newtop_l+5
			
			$newtop_l:=$newtop_l+20
			OBJECT GET COORDINATES:C663(*;"CookingStepsLabel";$l;$t;$r;$b)
			OBJECT SET COORDINATES:C1248(*;"CookingStepsLabel";$l;$newtop_l;$r;$newtop_l+($b-$t))
			$end_b:=Print object:C1095(*;"CookingStepsLabel")
			
			$newtop_l:=$newtop_l+($b-$t)+10
			OBJECT GET COORDINATES:C663(*;"cookingStepsPrn_t";$l;$t;$r;$b)
			OBJECT GET BEST SIZE:C717(*;"cookingStepsPrn_t";$bestWidth_l;$bestHeight_l;$r-$l)
			OBJECT SET COORDINATES:C1248(*;"cookingStepsPrn_t";$l;$newtop_l;$r;$newtop_l+$bestHeight_l)
			$end_b:=Print object:C1095(*;"cookingStepsPrn_t")
			
			
			OBJECT GET COORDINATES:C663(*;"ingredientsPrn_t";$l;$t;$r;$b)
			OBJECT GET BEST SIZE:C717(*;"ingredientsPrn_t";$bestWidth_l;$bestHeight_l;$r-$l)
			OBJECT SET COORDINATES:C1248(*;"ingredientsPrn_t";$l;$t;$r;$t+$bestHeight_l)
			
			$newBottom_l:=$t+$bestHeight_l
			OBJECT GET COORDINATES:C663(*;"ingredientBG";$l;$t;$r;$b)
			OBJECT SET COORDINATES:C1248(*;"ingredientBG";$l;$t;$r;$newBottom_l+10)
			$end_b:=Print object:C1095(*;"ingredientBG")
			$end_b:=Print object:C1095(*;"ingredientsLabel")
			$end_b:=Print object:C1095(*;"ingredientsPrn_t")
			
		End if 
		CLOSE PRINTING JOB:C996
		
	End if 
	
End if 