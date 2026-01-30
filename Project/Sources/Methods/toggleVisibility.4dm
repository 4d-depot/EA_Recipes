//%attributes = {"invisible":true}
  // Method: toggleVisibility
  // Description:
  //   Method for toggling visibility of form objects in subforms
  //
  // Parameters:
  //   $1 - TEXT - Form object name
  //   $2 - BOOLEAN - Visibility
  // ----------------------------------------------------
//Updated by: Al Mahdi


#DECLARE($objectName : Text; $visibility : Boolean)

OBJECT SET VISIBLE:C603(*; $objectName; $visibility)