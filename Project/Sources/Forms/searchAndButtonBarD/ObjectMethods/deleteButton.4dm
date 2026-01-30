  // Make sure a recipe is selected before deletion
//updated by: Al Mahdi
var deletedRecordPos_l : Integer
var $status_o : Object

If (Selected record number:C246([Recipes:3])#0)
	CONFIRM:C162("Are you sure you want to delete recipe \""+Form:C1466.ent.Title+"\"?";"Yes";"Cancel")
	If (OK=1)
		  // save deleted record position
		deletedRecordPos_l:=Selected record number:C246([Recipes:3])
		
		$status_o:=Form:C1466.ent.drop()
		If ($status_o.success=False:C215)
			ALERT:C41("Failed to drop entity: "+$status_o.statusText)
		Else 
			CALL SUBFORM CONTAINER:C1086(-7)  // On Delete event
		End if 
	End if 
Else 
	ALERT:C41("Please select a recipe to delete")
End if 
