//%attributes = {"invisible":true}
  // Method: toggleVisibility
  // Description:
  //   Method for toggling visibility of form objects in subforms
  //
  // Parameters:
  //   $1 - TEXT - Form object name
  //   $2 - BOOLEAN - Visibility
  // ----------------------------------------------------

C_TEXT:C284($1)
C_BOOLEAN:C305($2)

OBJECT SET VISIBLE:C603(*;$1;$2)
