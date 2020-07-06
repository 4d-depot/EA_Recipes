//%attributes = {"invisible":true}
  // ----------------------------------------------------
  //
  // Method: showPrintPreview2
  // Description
  //    Make sure all object form are set to the right size and placed
  //    in the position that is presentable to the user.
  //
  // ----------------------------------------------------

loadRecipeForPrinting2 

C_LONGINT:C283($bestWidth_l;$bestHeight_l)
C_LONGINT:C283($l;$t;$r;$b;$bb;$newtop_l;$newRectTop_l;$newBottom_l;$bottom_l)

  // Make sure the title object fits
OBJECT GET COORDINATES:C663(*;"recipeTitle";$l;$t;$r;$b)
OBJECT GET BEST SIZE:C717(*;"recipeTitle";$bestWidth_l;$bestHeight_l;$r-$l)
$bb:=$t+$bestHeight_l
OBJECT SET COORDINATES:C1248(*;"recipeTitle";$l;$t;$r;$bb)

  // Make sure the description object is placed in the right
  // location relative to the title object
OBJECT GET COORDINATES:C663(*;"FieldDescription";$l;$t;$r;$b)
OBJECT GET BEST SIZE:C717(*;"FieldDescription";$bestWidth_l;$bestHeight_l;$r-$l)
$t:=$bb+10
$b:=$t+$bestHeight_l
OBJECT SET COORDINATES:C1248(*;"FieldDescription";$l;$t;$r;$b)

  // Move Line1 to 20 pixels down relative to the description object
$newtop_l:=$b+15
OBJECT GET COORDINATES:C663(*;"Line1";$l;$t;$r;$b)
OBJECT SET COORDINATES:C1248(*;"Line1";$l;$newtop_l;$r;$newtop_l)

$newtop_l:=$newtop_l+15
OBJECT GET COORDINATES:C663(*;"FieldCuisine";$l;$t;$r;$b)
OBJECT SET COORDINATES:C1248(*;"FieldCuisine";$l;$newtop_l;$r;$newtop_l+($b-$t))
OBJECT GET COORDINATES:C663(*;"cookingTimePrn_t";$l;$t;$r;$b)
OBJECT SET COORDINATES:C1248(*;"cookingTimePrn_t";$l;$newtop_l;$r;$newtop_l+($b-$t))
OBJECT GET COORDINATES:C663(*;"FieldServings";$l;$t;$r;$b)
OBJECT SET COORDINATES:C1248(*;"FieldServings";$l;$newtop_l;$r;$newtop_l+($b-$t))

$newtop_l:=$newtop_l+($b-$t)+5
OBJECT GET COORDINATES:C663(*;"CuisineLabel";$l;$t;$r;$b)
OBJECT SET COORDINATES:C1248(*;"CuisineLabel";$l;$newtop_l;$r;$newtop_l+($b-$t))
OBJECT GET COORDINATES:C663(*;"TotalTimeLabel";$l;$t;$r;$b)
OBJECT SET COORDINATES:C1248(*;"TotalTimeLabel";$l;$newtop_l;$r;$newtop_l+($b-$t))
OBJECT GET COORDINATES:C663(*;"ServingsLabel";$l;$t;$r;$b)
OBJECT SET COORDINATES:C1248(*;"ServingsLabel";$l;$newtop_l;$r;$newtop_l+($b-$t))

$newtop_l:=$newtop_l+($b-$t)+15

  // Move Line1 to 20 pixels down relative to the description object
OBJECT GET COORDINATES:C663(*;"Line2";$l;$t;$r;$b)
OBJECT SET COORDINATES:C1248(*;"Line2";$l;$newtop_l;$r;$newtop_l)

$newRectTop_l:=$newtop_l+5

$newtop_l:=$newtop_l+20
OBJECT GET COORDINATES:C663(*;"CookingStepsLabel";$l;$t;$r;$b)
OBJECT SET COORDINATES:C1248(*;"CookingStepsLabel";$l;$newtop_l;$r;$newtop_l+($b-$t))

$newtop_l:=$newtop_l+($b-$t)+10
OBJECT GET COORDINATES:C663(*;"cookingStepsPrn_t";$l;$t;$r;$b)
OBJECT GET BEST SIZE:C717(*;"cookingStepsPrn_t";$bestWidth_l;$bestHeight_l;$r-$l)
OBJECT SET COORDINATES:C1248(*;"cookingStepsPrn_t";$l;$newtop_l;$r;$newtop_l+$bestHeight_l)

$bottom_l:=$newtop_l+$bestHeight_l

OBJECT GET COORDINATES:C663(*;"ingredientsPrn_t";$l;$t;$r;$b)
OBJECT GET BEST SIZE:C717(*;"ingredientsPrn_t";$bestWidth_l;$bestHeight_l;$r-$l)
OBJECT SET COORDINATES:C1248(*;"ingredientsPrn_t";$l;$t;$r;$t+$bestHeight_l)

$newBottom_l:=$t+$bestHeight_l
OBJECT GET COORDINATES:C663(*;"ingredientBG";$l;$t;$r;$b)
OBJECT SET COORDINATES:C1248(*;"ingredientBG";$l;$t;$r;$newBottom_l+10)

OBJECT GET COORDINATES:C663(*;"mainRec";$l;$t;$r;$b)

If ($bottom_l>$newBottom_l)
	$newBottom_l:=$bottom_l
End if 

minSubformHeight_l:=607  // 607

If (($newBottom_l+10)<minSubformHeight_l)
	$newBottom_l:=minSubformHeight_l
Else 
	$newBottom_l:=$newBottom_l+20
End if 
OBJECT SET COORDINATES:C1248(*;"mainRec";0;0;$r;$newBottom_l+20)

