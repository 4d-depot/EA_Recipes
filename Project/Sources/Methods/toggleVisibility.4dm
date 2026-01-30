//%attributes = {"invisible":true}
// Method: toggleVisibility
// Description:
//   Method for toggling visibility of form objects in subforms
//
// Parameters:
//   $objectName - TEXT - Form object name
//   $visibility - BOOLEAN - Visibility
// ----------------------------------------------------
//Updated by: Al Mahdi


#DECLARE($objectName : Text; $visibility : Boolean)

OBJECT SET VISIBLE:C603(*; $objectName; $visibility)