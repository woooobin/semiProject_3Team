$url = 'https://www.google.com/recaptcha/api/siteverify?secret=6LfBSYwaAAAAAKS-sNfMsvufd775DgGqttvyWAYU&response='.$_POST['g-recaptcha-response'].'&remoteip='.$_POST[remoteip];



$flag = json_decode(file_get_contents($url));

	

echo($flag->success);

if(!$flag->success == "1")

{

	#예외처리

	echo "error";

}
