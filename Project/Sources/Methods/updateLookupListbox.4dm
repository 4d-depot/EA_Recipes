//%attributes = {"invisible":true}
  // Method: updateLookupListbox
  // Description
  //   This method updates the content of the lookup listbox
  //
  // Parameters
  //   $1 - Button type that the user clicked 
  // ----------------------------------------------------

C_TEXT:C284($1)

C_LONGINT:C283($i)
C_OBJECT:C1216($recipes_es)
C_OBJECT:C1216($item_o;$e)
C_LONGINT:C283($count_l)

$recipes_es:=ds:C1482.Recipes.all()
Form:C1466.lookup:=New collection:C1472

Case of 
		  // Categories button clicked
		
	: ($1="Categories")
		C_TEXT:C284($category_t)
		ARRAY TEXT:C222($categories_at;0)
		LIST TO ARRAY:C288("Recipe Categories";$categories_at)
		
		For ($i;1;Size of array:C274($categories_at))
			$category_t:=$categories_at{$i}
			$item_o:=New object:C1471
			$item_o.content:=$category_t
			
			$count_l:=$recipes_es.query("Category = :1";$category_t).length
			If ($count_l>0)
				$item_o.count:=$count_l
			End if 
			
			Form:C1466.lookup.push($item_o)
		End for 
		
		  // Cuisines button clicked
		
	: ($1="Cuisines")
		C_TEXT:C284($cuisine_t)
		ARRAY TEXT:C222($cuisines_at;0)
		LIST TO ARRAY:C288("Cuisines";$cuisines_at)
		
		For ($i;1;Size of array:C274($cuisines_at))
			$cuisine_t:=$cuisines_at{$i}
			$item_o:=New object:C1471
			$item_o.content:=$cuisine_t
			
			$count_l:=$recipes_es.query("Cuisine = :1";$cuisine_t).length
			If ($count_l>0)
				$item_o.count:=$count_l
			End if 
			
			Form:C1466.lookup.push($item_o)
		End for 
		
		  // Ingredients button clicked
		
	: ($1="Ingredients")
		C_OBJECT:C1216($ingredients_es;$e;$temp_o)
		$ingredients_es:=ds:C1482.Ingredients.all()
		
		$temp_o:=New object:C1471
		For each ($e;$ingredients_es)
			If ($temp_o[$e.Item]=Null:C1517)
				$temp_o[$e.Item]:=1
			Else 
				$temp_o[$e.Item]:=$temp_o[$e.Item]+1
			End if 
		End for each 
		
		C_TEXT:C284($ingredient_t)
		For each ($ingredient_t;$temp_o)
			$item_o:=New object:C1471
			$item_o.content:=$ingredient_t
			$item_o.count:=$temp_o[$ingredient_t]
			Form:C1466.lookup.push($item_o)
		End for each 
		
End case 