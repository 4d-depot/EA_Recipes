If (Form:C1466.showDetailView)  // show list view
	OBJECT SET VISIBLE:C603(*;"OnDetail";False:C215)
	OBJECT SET VISIBLE:C603(*;"previewRect";False:C215)
	OBJECT SET SUBFORM:C1138(*;"toolbar_SF";"searchAndButtonBarL")
Else   // show detail view
	OBJECT SET VISIBLE:C603(*;"OnDetail";True:C214)
	OBJECT SET SUBFORM:C1138(*;"detail_SF";"recipePreview")
	OBJECT SET VISIBLE:C603(*;"previewRect";True:C214)
	OBJECT SET SUBFORM:C1138(*;"toolbar_SF";"searchAndButtonBarD")
End if 
Form:C1466.showDetailView:=Not:C34(Form:C1466.showDetailView)

OBJECT SET VISIBLE:C603(*;"detail_SF";Form:C1466.showDetailView)
togglePreviousNextButtons 