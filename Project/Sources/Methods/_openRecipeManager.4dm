//%attributes = {}
C_LONGINT:C283($1;$pid_l)

If (Count parameters:C259=0)
	$pid_l:=New process:C317(Current method name:C684;0;"Recipes";1;*)
Else 
	C_OBJECT:C1216($form_o)
	$form_o:=New object:C1471
	$form_o.sidebar:=New object:C1471
	$form_o.toolbar:=New object:C1471
	$form_o.recipe:=New object:C1471
	$form_o.recipe.ent:=ds:C1482.Recipes.all().orderBy("ID desc").first()
	
	C_LONGINT:C283($win_l)
	$win_l:=Open form window:C675("mainWindow")
	DIALOG:C40("mainWindow";$form_o)
	CLOSE WINDOW:C154($win_l)
End if 