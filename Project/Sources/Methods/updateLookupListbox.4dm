//%attributes = {"invisible":true}
  // Method: updateLookupListbox
  // Description
  //   This method updates the content of the lookup listbox
  //
  // Parameters
  //   $1 - Button type that the user clicked 
  // ----------------------------------------------------
//Updated by: Al Mahdi

#DECLARE($buttonType : Text)

var $i; $count_l : Integer
var $recipes_es; $item_o; $e; $ingredients_es; $temp_o : Object
var $category_t; $cuisine_t; $ingredient_t : Text

$recipes_es:=ds:C1482.Recipes.all()
Form:C1466.lookup:=New collection:C1472

Case of 
	: ($buttonType="Categories")
		ARRAY TEXT:C222($categories_array; 0)
		LIST TO ARRAY:C288("Recipe Categories"; $categories_array)
		
		For ($i; 1; Size of array:C274($categories_array))
			$category_t:=$categories_array{$i}
			$item_o:=New object:C1471
			$item_o.content:=$category_t
			
			$count_l:=$recipes_es.query("Category = :1";$category_t).length
			If ($count_l>0)
				$item_o.count:=$count_l
			End if 
			
			Form:C1466.lookup.push($item_o)
		End for 
		
	: ($buttonType="Cuisines")
		ARRAY TEXT:C222($cuisines_array; 0)
		LIST TO ARRAY:C288("Cuisines"; $cuisines_array)
		
		For ($i; 1; Size of array:C274($cuisines_array))
			$cuisine_t:=$cuisines_array{$i}
			$item_o:=New object:C1471
			$item_o.content:=$cuisine_t
			
			$count_l:=$recipes_es.query("Cuisine = :1";$cuisine_t).length
			If ($count_l>0)
				$item_o.count:=$count_l
			End if 
			
			Form:C1466.lookup.push($item_o)
		End for 
		
		  // Ingredients button clicked
	: ($buttonType="Ingredients")
		$ingredients_es:=ds:C1482.Ingredients.all()
		
		$temp_o:=New object:C1471
		For each ($e;$ingredients_es)
			If ($temp_o[$e.Item]=Null:C1517)
				$temp_o[$e.Item]:=1
			Else 
				$temp_o[$e.Item]:=$temp_o[$e.Item]+1
			End if 
		End for each 
		
		For each ($ingredient_t;$temp_o)
			$item_o:=New object:C1471
			$item_o.content:=$ingredient_t
			$item_o.count:=$temp_o[$ingredient_t]
			Form:C1466.lookup.push($item_o)
		End for each 
		
End case 