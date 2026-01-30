//Updated by: Al Mahdi

setNavArrow (5)
var $recipes_es : Object
Form:C1466.lastSelected:=5
Form:C1466.querySelected:=5
Form:C1466.expandListbox:=False:C215
POST OUTSIDE CALL:C329(Current process:C322)

$recipes_es:=ds:C1482.Recipes.query("Favorites = True")
Form:C1466.listData:=$recipes_es
USE ENTITY SELECTION:C1513($recipes_es)

  // update recipe count
CALL SUBFORM CONTAINER:C1086(-1)