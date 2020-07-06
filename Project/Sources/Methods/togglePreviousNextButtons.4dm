//%attributes = {"invisible":true}
If (Form:C1466.recipe.ent#Null:C1517)
	If (Form:C1466.recipe.ent.previous()=Null:C1517)
		EXECUTE METHOD IN SUBFORM:C1085("toolbar_SF";"enableButton";*;"prevButton";False:C215)
	Else 
		EXECUTE METHOD IN SUBFORM:C1085("toolbar_SF";"enableButton";*;"prevButton";True:C214)
	End if 
	
	If (Form:C1466.recipe.ent.next()=Null:C1517)
		EXECUTE METHOD IN SUBFORM:C1085("toolbar_SF";"enableButton";*;"nextButton";False:C215)
	Else 
		EXECUTE METHOD IN SUBFORM:C1085("toolbar_SF";"enableButton";*;"nextButton";True:C214)
	End if 
End if 