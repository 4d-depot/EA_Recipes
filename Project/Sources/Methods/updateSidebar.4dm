//%attributes = {"invisible":true}
C_OBJECT:C1216($recipes_es)
$recipes_es:=ds:C1482.Recipes.all()

Form:C1466.sidebar.recipeCount:=$recipes_es.length
Form:C1466.sidebar.favCount:=$recipes_es.query("Favorites = True").length