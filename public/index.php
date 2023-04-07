<?php
require __DIR__ . '/../vendor/autoload.php';

$app = (new Parkman\App\ParkmanRoute())->get();
$app->run();