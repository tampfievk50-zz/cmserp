<?php
define('LIBRARY_PATH', dirname(__FILE__).'/libraries/yii/');
// change the following paths if necessary
$yii=LIBRARY_PATH.'yii.php';
$config=dirname(__FILE__).'/apps/config/main.php';

// remove the following line when in production mode
defined('YII_DEBUG') or define('YII_DEBUG',true);
require_once($yii);
Yii::createWebApplication($config)->run();
