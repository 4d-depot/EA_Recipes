If (Form:C1466.cookingStep#"")
	  // Update steps in listbox
	C_OBJECT:C1216($newStep_o)
	$newStep_o:=New object:C1471
	$newStep_o.stepNum:=Form:C1466.cookingSteps.length+1
	$newStep_o.stepDes:=Form:C1466.cookingStep
	Form:C1466.cookingSteps:=Form:C1466.cookingSteps.push($newStep_o)
	
	  // Update data in entity
	If (Form:C1466.ent.CookingSteps=Null:C1517)
		Form:C1466.ent.CookingSteps:=New object:C1471
		Form:C1466.ent.CookingSteps.steps:=New collection:C1472
	End if 
	Form:C1466.ent.CookingSteps.steps.push(Form:C1466.cookingStep)
	
	  // Clear text box after adding
	Form:C1466.cookingStep:=""
Else 
	ALERT:C41("Cooking step cannot be empty")
End if 