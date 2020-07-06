//%attributes = {"invisible":true}
  // Method: setNavArrow
  // Description
  //   This method enables the arrow icon when user clicks on a row
  //
  // Parameters
  //   $1 - Selected row (LONGINT)
  // ----------------------------------------------------

C_LONGINT:C283($1)
C_TEXT:C284($name_t)

OBJECT SET VISIBLE:C603(*;"arrow@";False:C215)
$name_t:="arrow"+String:C10($1)+"@"
OBJECT SET VISIBLE:C603(*;$name_t;True:C214)