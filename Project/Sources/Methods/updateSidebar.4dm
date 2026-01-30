//%attributes = {"invisible":true}
$recipes_es:=ds:C1482.Recipes.all()
//Updated by: Al Mahdi
var $recipes_es : Object

Form:C1466.sidebar.recipeCount:=$recipes_es.length
Form:C1466.sidebar.favCount:=$recipes_es.query("Favorites = True").length