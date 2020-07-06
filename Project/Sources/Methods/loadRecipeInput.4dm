//%attributes = {"invisible":true}
C_LONGINT:C283(lastOpenedRecipeID_l)
lastOpenedRecipeID_l:=Form:C1466.ent.ID

ARRAY TEXT:C222(unit_at;0)
ARRAY TEXT:C222(unitFull_at;0)
LIST TO ARRAY:C288("Measurement Units";unit_at)
LIST TO ARRAY:C288("Measurement Units Full";unitFull_at)

Form:C1466.hour:=Int:C8(Form:C1466.ent.CookTime/60)
Form:C1466.min:=Int:C8(Form:C1466.ent.CookTime%60)

bFavorite:=Form:C1466.ent.Favorites

Form:C1466.ingredientList:=Form:C1466.ent.ingredients.toCollection("ID,Item,Quantity,Unit,Description")

  // init cooking steps collection
Form:C1466.cookingSteps:=New collection:C1472
Form:C1466.cookingStep:=""
If (Form:C1466.ent.CookingSteps#Null:C1517)
	If (Form:C1466.ent.CookingSteps.steps#Null:C1517)
		C_TEXT:C284($step_t)
		C_OBJECT:C1216($step_o)
		
		For each ($step_t;Form:C1466.ent.CookingSteps.steps)
			$step_o:=New object:C1471
			$step_o.stepNum:=Form:C1466.cookingSteps.length+1
			$step_o.stepDes:=$step_t
			Form:C1466.cookingSteps.push($step_o)
		End for each 
	End if 
End if 