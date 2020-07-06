C_LONGINT:C283($stepNum_l)
$stepNum_l:=Form:C1466.selectedStepPos

If ($stepNum_l>0)
	CONFIRM:C162("Are you sure you want to delete step #"+String:C10($stepNum_l)+"?";"Delete";"Cancel")
	If (OK=1)
		Form:C1466.cookingSteps.remove($stepNum_l-1)  // Delete step from listbox
		Form:C1466.ent.CookingSteps.steps.remove($stepNum_l-1)  // Delete step from entity
		Form:C1466.cookingStep:=""
		
		  // Reset cooking step numbers
		C_LONGINT:C283($i)
		C_OBJECT:C1216($step)
		$i:=1
		
		For each ($step;Form:C1466.cookingSteps)
			$step.stepNum:=$i
			$i:=$i+1
		End for each 
		
		  // Disable buttons since no step is currently selected
		OBJECT SET ENABLED:C1123(*;"saveDesc";False:C215)
		OBJECT SET ENABLED:C1123(*;"delDesc";False:C215)
	End if 
End if 