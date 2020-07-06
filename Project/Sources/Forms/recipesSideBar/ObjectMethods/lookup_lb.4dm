Case of 
	: (Form event code:C388=On Clicked:K2:4)
		If (Form:C1466.category#Null:C1517)
			C_OBJECT:C1216($recipes_es)
			Case of 
				: (Form:C1466.lookupType="Categories")
					C_TEXT:C284($category_t)
					Form:C1466.querySelected:=2
					$category_t:=Form:C1466.category.content
					Form:C1466.queryContent:=Form:C1466.category.content
					$recipes_es:=ds:C1482.Recipes.query("Category = :1";$category_t).orderBy("ID desc")
					
				: (Form:C1466.lookupType="Cuisine")
					C_TEXT:C284($cuisine_t)
					Form:C1466.querySelected:=3
					$cuisine_t:=Form:C1466.category.content
					Form:C1466.queryContent:=Form:C1466.category.content
					$recipes_es:=ds:C1482.Recipes.query("Cuisine = :1";$cuisine_t).orderBy("ID desc")
					
				: (Form:C1466.lookupType="Ingredients")
					C_TEXT:C284($ingredient_t)
					Form:C1466.querySelected:=4
					$ingredient_t:=Form:C1466.category.content
					Form:C1466.queryContent:=Form:C1466.category.content
					$recipes_es:=ds:C1482.Recipes.query("ingredients.Item = :1";$ingredient_t).orderBy("ID desc")
					
					
			End case 
			
			Form:C1466.expandListbox:=False:C215
			OBJECT SET VISIBLE:C603(*;"lookup_lb";False:C215)
			OBJECT SET VISIBLE:C603(*;"rectLookupBy";False:C215)
			OBJECT SET VISIBLE:C603(*;"LineLookupBy@";False:C215)
			
			Form:C1466.listData:=$recipes_es
			USE ENTITY SELECTION:C1513($recipes_es)
			
			  // update recipe count
			CALL SUBFORM CONTAINER:C1086(-1)
			
		End if 
		
End case 