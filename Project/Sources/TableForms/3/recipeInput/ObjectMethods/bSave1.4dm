UNLOAD RECORD:C212([Recipes:3])

If (Form:C1466.ent.Title="")
	ALERT:C41("Recipe must have at least a title")
Else 
	C_OBJECT:C1216($status_o)
	$status_o:=Form:C1466.ent.save()
	
	If ($status_o.success=False:C215)
		ALERT:C41("Failed to save entity: "+$status_o.statusText)
	Else 
		ACCEPT:C269
	End if 
End if 