//%attributes = {"invisible":true}
// Method: setNavArrow
// Description
//   This method enables the arrow icon when user clicks on a row
//
// Parameters
//   $selectedRow - Selected row (LONGINT)
//Updated by: Al Mahdi
// ----------------------------------------------------

#DECLARE($selectedRow : Integer)
var $name_t : Text

OBJECT SET VISIBLE:C603(*; "arrow@"; False:C215)
$name_t:="arrow"+String:C10($selectedRow)+"@"
OBJECT SET VISIBLE:C603(*; $name_t; True:C214)


