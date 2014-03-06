<?php
return array(
	'modules'=>array(
            'user'=>array(
                'tableUsers' => 'tbl_users',
                'tableProfiles' => 'tbl_profiles',
                'tableProfileFields' => 'tbl_profiles_fields',
            ),
            'rights'=>array(
//                  'install'=>true,
            ),
            'gii' => array(
                'class'=>'system.gii.GiiModule',
                'password'=>'admin',
                'generatorPaths' => array('bootstrap.gii'),
            ),
	),
);