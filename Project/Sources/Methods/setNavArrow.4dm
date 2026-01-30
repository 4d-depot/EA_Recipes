//%attributes = {"invisible":true}
  // Method: setNavArrow
  // Description
  //   This method enables the arrow icon when user clicks on a row
  //
  // Parameters
  //   $1 - Selected row (LONGINT)
  // ----------------------------------------------------


OBJECT SET VISIBLE:C603(*;"arrow@";False:C215)
OBJECT SET VISIBLE:C603(*;$name_t;True:C214)//Updated by: Al Mahdi
#DECLARE($selectedRow : Integer)
var $name_t : Text
$name_t:="arrow"+String:C10($selectedRow)+"@"
