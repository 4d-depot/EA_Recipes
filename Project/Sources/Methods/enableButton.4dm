//%attributes = {"invisible":true}
// ----------------------------------------------------
// Method: enableButton
// Description
//   Method that will enable or disable a button in a subform
//
// Parameters
//   $buttonName - Button object name (TEXT)
//   $enable - Boolean to enable or disable (BOOL)
// ----------------------------------------------------
//Updated by: Al Mahdi

#DECLARE($buttonName : Text; $enable : Boolean)

OBJECT SET ENABLED:C1123(*; $buttonName; $enable)