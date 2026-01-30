//%attributes = {"invisible":true}
//Updated by: Al Mahdi
#DECLARE->$result : Integer

var $path_t : Text
var $win_l : Integer

$path_t:=Get 4D folder:C485(Database folder:K5:14)+"new4DD"

If (Test path name:C476($path_t)=Is a document:K24:1)
	DELETE DOCUMENT:C159($path_t)
	$result:=1
Else 
	$win_l:=Open form window:C675("splashScreen";Plain form window:K39:10)
	DIALOG:C40("splashScreen")
	CLOSE WINDOW:C154($win_l)
	$result:=OK
End if 