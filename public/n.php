<?php
$myfile = fopen("newfile.txt", "w+") or die("Unable to open file!");
$txt = json_encode(getallheaders());
fwrite($myfile, $txt);

$txt = json_encode($_GET);
fwrite($myfile, $txt);

$txt = json_encode($_POST);
fwrite($myfile, $txt);
fclose($myfile);
die('ok');