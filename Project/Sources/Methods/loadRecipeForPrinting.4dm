//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // Method: showPrintPreview
  // Description
  //    Make sure all object form are set to the right size and placed
  //    in the position that is presentable to the user.
  //
  // ----------------------------------------------------

  // Format list of ingredients

If (Form:C1466.ent#Null:C1517)
	
	C_OBJECT:C1216($ingredient_e)
	Form:C1466.ingredients:=""
	
	For each ($ingredient_e;Form:C1466.ent.ingredients)
		
		If ($ingredient_e.Quantity>0)
			Form:C1466.ingredients:=Form:C1466.ingredients+String:C10($ingredient_e.Quantity)+" "
		End if 
		
		If ($ingredient_e.Unit#"")
			Form:C1466.ingredients:=Form:C1466.ingredients+$ingredient_e.Unit+" "
		End if 
		
		If ($ingredient_e.Item#"")
			Form:C1466.ingredients:=Form:C1466.ingredients+Lowercase:C14($ingredient_e.Item)
		End if 
		
		If ($ingredient_e.Description#"")
			Form:C1466.ingredients:=Form:C1466.ingredients+", "+Lowercase:C14($ingredient_e.Description)
		End if 
		
		Form:C1466.ingredients:=Form:C1466.ingredients+".\n"
		
	End for each 
	
	
	
	  // Format time
	
	C_LONGINT:C283($hour_l;$min_l)
	Form:C1466.CookTime:=""
	
	$hour_l:=Int:C8(Form:C1466.ent.CookTime/60)
	$min_l:=Int:C8(Form:C1466.ent.CookTime%60)
	If ($hour_l>0)
		Form:C1466.CookTime:=String:C10($hour_l)+" hr"
	End if 
	If ($min_l>0)
		If (Form:C1466.CookTime#"")
			Form:C1466.CookTime:=Form:C1466.CookTime+" "
		End if 
		Form:C1466.CookTime:=Form:C1466.CookTime+String:C10($min_l)+" min"
	End if 
	
	
	
	  // Format cooking steps
	
	C_TEXT:C284($step_t)
	C_LONGINT:C283($i)
	Form:C1466.CookingSteps:=""
	
	If (Form:C1466.ent.CookingSteps#Null:C1517)
		If (Not:C34(OB Is empty:C1297(Form:C1466.ent.CookingSteps)))
			For each ($step_t;Form:C1466.ent.CookingSteps.steps)
				$i:=$i+1
				Form:C1466.CookingSteps:=Form:C1466.CookingSteps+String:C10($i)+". "+$step_t+"\n\n"
			End for each 
		End if 
	End if 
	
End if 