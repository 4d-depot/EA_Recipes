//%attributes = {"invisible":true}
  // clear search bar
Form:C1466.toolbar.searchText:=""

  // order list_SF data by most recent and highlight 1st row
Form:C1466.sidebar.listData:=ds:C1482.Recipes.all().orderBy("ID desc")
USE ENTITY SELECTION:C1513(Form:C1466.sidebar.listData)
OBJECT SET SCROLL POSITION:C906(*;"list_SF";1)

  // update recipe count
Form:C1466.recipeCount:=updateRecipeCount (Form:C1466.sidebar.listData.length)
