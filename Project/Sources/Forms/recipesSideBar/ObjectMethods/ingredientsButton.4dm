setNavArrow (4)
updateLookupListbox ("Ingredients")

Case of 
	: (Form:C1466.lastSelected=1) | (Form:C1466.lastSelected=5)
		Form:C1466.expandListbox:=True:C214
		POST OUTSIDE CALL:C329(Current process:C322)
		
	: (Form:C1466.lastSelected=4)
		Form:C1466.expandListbox:=Not:C34(Form:C1466.expandListbox)
		POST OUTSIDE CALL:C329(Current process:C322)
		
	Else 
		If (Not:C34(Form:C1466.expandListbox))
			Form:C1466.expandListbox:=True:C214
			POST OUTSIDE CALL:C329(Current process:C322)
		End if 
		
End case 

Form:C1466.lastSelected:=4
Form:C1466.lookupType:="Ingredients"

If (Form:C1466.expandListbox)
	OBJECT SET VISIBLE:C603(*;"lookup_lb";True:C214)
	OBJECT SET VISIBLE:C603(*;"rectLookupBy";True:C214)
	
	C_LONGINT:C283($l;$t;$r;$b;$tt;$i)
	OBJECT GET COORDINATES:C663(*;"ingredientsButton";$l;$t;$r;$b)
	
	OBJECT GET COORDINATES:C663(*;"rectLookupBy";$l;$tt;$r;$b)
	OBJECT SET COORDINATES:C1248(*;"rectLookupBy";$l;$t-8)
	OBJECT GET COORDINATES:C663(*;"lookup_lb";$l;$tt;$r;$b)
	OBJECT SET COORDINATES:C1248(*;"lookup_lb";$l;$t+2)
	
	For ($i;1;11)
		OBJECT GET COORDINATES:C663(*;"LineLookupBy"+String:C10($i);$l;$tt;$r;$b)
		OBJECT SET COORDINATES:C1248(*;"LineLookupBy"+String:C10($i);$l;$t+11+$i)
	End for 
End if 