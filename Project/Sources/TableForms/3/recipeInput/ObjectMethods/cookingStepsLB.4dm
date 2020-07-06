Case of 
	: (Form event code:C388=On Clicked:K2:4)
		If (Form:C1466.selectedStep#Null:C1517)
			Form:C1466.cookingStep:=Form:C1466.selectedStep.stepDes
			
			OBJECT SET ENABLED:C1123(*;"saveDesc";True:C214)
			OBJECT SET ENABLED:C1123(*;"delDesc";True:C214)
		Else 
			Form:C1466.cookingStep:=""
			
			OBJECT SET ENABLED:C1123(*;"saveDesc";False:C215)
			OBJECT SET ENABLED:C1123(*;"delDesc";False:C215)
		End if 
		
End case 

  //Case of 
  //: (Form event=On Row Moved)

  //saveCookingSteps 
  //updateDescriptionOrdering 

  //Else 

  //If (cookingStepsLB>0) & (cookingStepsLB<=Size of array(cookingStepsLB))
  //OBJECT SET ENABLED(*;"saveDesc";True)
  //OBJECT SET ENABLED(*;"delDesc";True)
  //cookingDescSteps_t:=cookingDescSteps_at{cookingStepsLB}
  //Else 
  //OBJECT SET ENABLED(*;"saveDesc";False)
  //OBJECT SET ENABLED(*;"delDesc";False)
  //cookingDescSteps_t:=""
  //End if 

  //End case 