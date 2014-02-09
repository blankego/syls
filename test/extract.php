<?php

$zip = new ZipArchive();
$zip->open(__DIR__."/"."my.zip");
$zip->extractTo(__DIR__);
$zip->close();
