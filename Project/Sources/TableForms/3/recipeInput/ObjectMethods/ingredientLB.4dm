Case of 
	: (Form event code:C388=On Clicked:K2:4)
		If (Form:C1466.selectedIngredient#Null:C1517)
			OBJECT SET ENABLED:C1123(*;"delIngredient";True:C214)
			
			Form:C1466.ingredientName:=Form:C1466.selectedIngredient.Item
			Form:C1466.ingredientsQty:=Form:C1466.selectedIngredient.Quantity
			Form:C1466.ingredientsUnit:=Form:C1466.selectedIngredient.Unit
			Form:C1466.ingredientsDes:=Form:C1466.selectedIngredient.Description
			
			C_LONGINT:C283($foundat_l)
			$foundat_l:=Find in array:C230(unit_at;Form:C1466.ingredientsUnit)
			unit_at:=$foundat_l
			If ($foundat_l#-1)
				unitFull_t:=unitFull_at{unit_at}
			Else 
				unitFull_t:=""
			End if 
			
		Else 
			OBJECT SET ENABLED:C1123(*;"delIngredient";False:C215)
			
			Form:C1466.ingredientName:=""
			Form:C1466.ingredientsQty:=""
			Form:C1466.ingredientsUnit:=""
			Form:C1466.ingredientsDes:=""
			unitFull_t:=""
		End if 
		
End case 

  //If (Records in set("$ListboxSet0")=0)
  //UNLOAD RECORD([Ingredients])
  //OBJECT SET ENABLED(*;"delIngredient";False)
  //Else 
  //GOTO SELECTED RECORD([Ingredients];Selected record number([Ingredients]))
  //OBJECT SET ENABLED(*;"delIngredient";True)
  //End if 
  //IngredientsName_t:=[Ingredients]Item
  //IngredientsQty_r:=[Ingredients]Quantity
  //IngredientsUnit_t:=[Ingredients]Unit
  //IngredientsDes_t:=[Ingredients]Description

  //C_LONGINT($foundat_l)
  //$foundat_l:=Find in array(unit_at;IngredientsUnit_t)
  //unit_at:=$foundat_l
  //If ($foundat_l#-1)
  //unitFull_t:=unitFull_at{unit_at}
  //Else 
  //unitFull_t:=""
  //End if 