//%attributes = {}
//Updated by: Al Mahdi
#DECLARE($pid_l : Integer)

If (Count parameters:C259=0)
	$pid_l:=New process:C317(Current method name:C684;0;"Recipes";1;*)
Else 
	var $form_o : Object
	var $win_l : Integer
	$form_o:=New object:C1471
	$form_o.sidebar:=New object:C1471
	$form_o.toolbar:=New object:C1471
	$form_o.recipe:=New object:C1471
	$form_o.recipe.ent:=ds:C1482.Recipes.all().orderBy("ID desc").first()
	
	$win_l:=Open form window:C675("mainWindow")
	DIALOG:C40("mainWindow";$form_o)
	CLOSE WINDOW:C154($win_l)
End if 