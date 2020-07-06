Case of 
	: (Form event code:C388=On Clicked:K2:4)
		Form:C1466.ingredientName:=Form:C1466.selectedPreviewIngredient.Item
		OBJECT SET VISIBLE:C603(*;"autofill_preview_lb";False:C215)
		
End case 