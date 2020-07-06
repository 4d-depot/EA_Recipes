Case of 
	: (Form event code:C388=On Load:K2:1)
		  // Select "All Recipes" upon load
		setNavArrow (1)
		Form:C1466.lastSelected:=1
		
		  // Hide expanded listbox upon load
		Form:C1466.expandListbox:=False:C215
		
End case 