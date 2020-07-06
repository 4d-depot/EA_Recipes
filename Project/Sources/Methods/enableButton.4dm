//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // Method: enableButton
  // Description
  //   Method that will enable or disable a button in a subform
  //
  // Parameters
  //   $1 - Button object name (TEXT)
  //   $2 - Boolean to enable or disable (BOOL)
  // ----------------------------------------------------

C_TEXT:C284($1)
C_BOOLEAN:C305($2)

OBJECT SET ENABLED:C1123(*;$1;$2)