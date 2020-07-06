setNavArrow (1)
Form:C1466.lastSelected:=1
Form:C1466.querySelected:=1

Form:C1466.expandListbox:=False:C215
POST OUTSIDE CALL:C329(Current process:C322)

Form:C1466.listData:=ds:C1482.Recipes.all().orderBy("ID desc")
USE ENTITY SELECTION:C1513(Form:C1466.listData)

  // update recipe count
CALL SUBFORM CONTAINER:C1086(-1)