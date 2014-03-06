<?php
return array(
    'components'=>array(
        'bootstrap' => array(
            'class'=>'bootstrap.components.Bootstrap', 
        ),
        // 'user'=>array(
                // // enable cookie-based authentication
                // 'allowAutoLogin'=>true,
        // ),
        'user'=>array(
            'class'=>'RWebUser',
            // enable cookie-based authentication
            'allowAutoLogin'=>true,
            'loginUrl'=>array('/user/login'),
        ),
        'authManager'=>array(
                'class'=>'RDbAuthManager',
                'connectionID'=>'db',
                'defaultRoles'=>array('Authenticated', 'Guest'),
        ),
        // 'db'=>array(
                // 'connectionString' => 'sqlite:protected/data/blog.db',
                // 'tablePrefix' => 'tbl_',
        // ),
        // uncomment the following to use a MySQL database
        'errorHandler'=>array(
            // use 'site/error' action to display errors
            'errorAction'=>'site/error',
        ),
        'urlManager'=>array(
            'urlFormat'=>'path',
            'rules'=>array(
                    'post/<id:\d+>/<title:.*?>'=>'post/view',
                    'posts/<tag:.*?>'=>'post/index',
                    '<controller:\w+>/<action:\w+>'=>'<controller>/<action>',
            ),
        ),
        'log'=>array(
            'class'=>'CLogRouter',
            'routes'=>array(
                    array(
                            'class'=>'CFileLogRoute',
                            'levels'=>'error, warning',
                    ),
                    // uncomment the following to show log messages on web pages
                    /*
                    array(
                            'class'=>'CWebLogRoute',
                    ),
                    */
            ),
        ),
        'db'=>require('dbconfig.php'),
    ),
);