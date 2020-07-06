//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // Method: calculateSubformMinHeight
  // Description
  //    This method calculate the current minimum height of the 
  //    currently displayed subform.
  //
  // ----------------------------------------------------

C_LONGINT:C283($i;$t;$r;$b;minSubformHeight_l)
If (Form:C1466.showDetailView)
	OBJECT GET COORDINATES:C663(*;"detail_SF";$i;$t;$r;$b)
Else 
	OBJECT GET COORDINATES:C663(*;"list_SF";$i;$t;$r;$b)
End if 
minSubformHeight_l:=$b-$t
