//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // Method: movePageInicator
  // Description
  //    The recipeInput uses this method to change the Page
  //    Indicator when switching from one to another.
  //
  // Parameters
  //   $1  -   Page number
  // ----------------------------------------------------

C_LONGINT:C283($1;$l;$t;$r;$b;$l2;$t2;$r2;$b2;$page_l)

$page_l:=$1
FORM GOTO PAGE:C247($page_l)
OBJECT GET COORDINATES:C663(*;"bPage"+String:C10($page_l);$l;$t;$r;$b)
OBJECT GET COORDINATES:C663(*;"SelectedIndicator";$l2;$t2;$r2;$b2)
OBJECT SET COORDINATES:C1248(*;"SelectedIndicator";$l;$t2;$r;$b2)