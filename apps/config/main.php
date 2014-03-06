<?php
Yii::setPathOfAlias('bootstrap', dirname(__FILE__).'/../extensions/bootstrap');
return CMap::mergeArray(
    CMap::mergeArray(require(dirname(__FILE__).'/module.php'), 
        require(dirname(__FILE__).'/component.php')), 
        array(
            'basePath'=>dirname(__FILE__).DIRECTORY_SEPARATOR.'..',
            'name'=>'Hệ thống quán lý bán hàng - CCORP',
            'theme'=>'bootstrap',
            'preload'=>array('log'),
            'import'=>array(
                'application.models.*',
		'application.components.*',
		'application.modules.user.models.*',
                'application.modules.user.components.*',
                'application.modules.rights.*',
                'application.modules.rights.components.*',
            ),
            'defaultController'=>'post',
            'params'=>require(dirname(__FILE__).'/params.php'),
            'language'=>'vi',
        )
    );