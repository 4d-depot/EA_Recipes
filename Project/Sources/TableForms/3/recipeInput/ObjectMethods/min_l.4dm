Case of 
	: (Form event code:C388=On Data Change:K2:15)
		If (Form:C1466.min>59)
			Form:C1466.min:=59
		End if 
		
		Form:C1466.ent.CookTime:=(Form:C1466.hour*60)+Form:C1466.min
		
End case 