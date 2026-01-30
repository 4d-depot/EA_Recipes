var $bw; $bh; $bw1; $bh1 : Integer
var $l; $t; $r; $b; $ris_l; $i : Integer
var $l2; $t2; $r2; $b2 : Integer
var $ingredient_t : Text
var $foundIngredients_es : cs:C1710.IngredientsSelection
var $e : cs:C1710.IngredientsEntity
var $uniqueCheck_o : Object

Case of 
		  // Titlecase user input
	: (Form event code:C388=On Data Change:K2:15)
		If (Form:C1466.ingredientName#"")
			Form:C1466.ingredientName:=Lowercase:C14(Form:C1466.ingredientName)
			Form:C1466.ingredientName:=Uppercase:C13(Substring:C12(Form:C1466.ingredientName; 1; 1))+Substring:C12(Form:C1466.ingredientName; 2)
		End if 
		
	: (Form event code:C388=On After Edit:K2:43)
		
		$ingredient_t:=FORM Event:C1606.data
		
		Form:C1466.autofill_preview:=New collection:C1472
		
		If ($ingredient_t#"")
			$ingredient_t:=Uppercase:C13($ingredient_t+"@")
			
			$foundIngredients_es:=ds:C1482.Ingredients.query("Item = :1";$ingredient_t)
			
			$uniqueCheck_o:=New object:C1471
			
			For each ($e;$foundIngredients_es)
				If ($uniqueCheck_o[$e.Item]=Null:C1517)
					$uniqueCheck_o[$e.Item]:=True:C214
					Form:C1466.autofill_preview.push(New object:C1471("Item";$e.Item))
				End if 
			End for each 
			
			$ris_l:=Form:C1466.autofill_preview.length
			If ($ris_l>0)
				If ($ris_l>10)  // if more than 10 ingredients found, limit to 10
					$ris_l:=10
				End if 
				  // Get longest width row from ingredient name
				For ($i;1;$ris_l)
					autofill_preview_t:=Form:C1466.autofill_preview[$i-1]
					OBJECT GET BEST SIZE:C717(*;"autofill_preview_t";$bw1;$bh1)
					If ($bw1>$bw)
						$bw:=$bw1
					End if 
				End for 
				
				$bh:=LISTBOX Get rows height:C836(*;"autofill_preview_lb";lk pixels:K53:22)*$ris_l
				
				OBJECT GET COORDINATES:C663(*;"autofill_preview_lb";$l;$t;$r;$b)
				OBJECT GET COORDINATES:C663(*;"IngredientsName_t";$l2;$t2;$r2;$b2)
				OBJECT SET COORDINATES:C1248(*;"autofill_preview_lb";$l2;$t2+21;$bw+$l2+25;$bh+$t2+21)
				
				OBJECT SET VISIBLE:C603(*;"autofill_preview_at";True:C214)
				OBJECT SET VISIBLE:C603(*;"autofill_preview_lb";True:C214)
				LISTBOX SET ROWS HEIGHT:C835(*;"autofill_preview_lb";25;lk pixels:K53:22)
				
			Else   // Else if no ingredients found, don't show preview box
				OBJECT SET VISIBLE:C603(*;"autofill@";False:C215)
			End if 
		Else 
			OBJECT SET VISIBLE:C603(*;"autofill@";False:C215)
		End if 
		
End case 