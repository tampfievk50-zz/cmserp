<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="language" content="en" />
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/admin.css" />
	<title><?php echo CHtml::encode($this->pageTitle); ?></title>
	<?php Yii::app()->bootstrap->register(); ?>
</head>

<body>
<?php $this->widget('bootstrap.widgets.TbNavbar', array(
    'type'=>'inverse', // null or 'inverse'
    'brand'=>'&nbspCCMS',
    'brandUrl'=>'#',
    'collapse'=>true, // requires bootstrap-responsive.css
    'items'=>array(
        array(
            'class'=>'bootstrap.widgets.TbMenu',
            'items'=>array(
                array('label'=>'User', 'url'=>'#', 'active'=>true),
                array('label'=>'Article', 'url'=>'#'),
                array('label'=>'Product', 'url'=>'#'),
                array('label'=>'Video', 'url'=>'#'),
            ),
        ),
		array(
            'class'=>'bootstrap.widgets.TbMenu',
            'htmlOptions'=>array('class'=>'pull-right'),
            'items'=>array(
                array('label'=>'Logout', 'url'=>'#'),
                array('label'=>'Setting', 'url'=>'#', 'items'=>array(
                    array('label'=>'Action', 'url'=>'#'),
                    array('label'=>'Another action', 'url'=>'#'),
                    array('label'=>'Something else here', 'url'=>'#'),
                )),
            ),
        ),
    ),
)); ?>
<table style="width:100%;">
	<tr>
		<td width="15%" valign="top" style="background: #dfdfdf;">
			<?php $this->widget('bootstrap.widgets.TbMenu', array(
			    'type'=>'list',
			    'items'=>array(
			        array('label'=>'MAIN MENU'),
			        array('label'=>'Admin Home', 'icon'=>'icon-home', 'url'=>Yii::app()->baseUrl.'/admin'),
			        array('label'=>'Video Manager', 'icon'=>'icon-film', 'url'=>Yii::app()->baseUrl.'/video/admin', 'active'=>true),
			        array('label'=>'Article Manager', 'icon'=>'pencil', 'url'=>Yii::app()->baseUrl.'/post/admin'),
			        array('label'=>'Product Manager', 'icon'=>'icon-shopping-cart', 'url'=>'#'),
			        array('label'=>'Email Maketing', 'icon'=>'icon-envelope', 'url'=>'#'),
			        array('label'=>'QUICK TASK'),
			        array('label'=>'Add Product', 'icon'=>'icon-plus', 'url'=>'#'),
			        array('label'=>'New Article', 'icon'=>'icon-edit', 'url'=>'#'),
			        array('label'=>'New Category', 'icon'=>'icon-plus-sign', 'url'=>'#'),
			        array('label'=>'Upload Video', 'icon'=>'icon-circle-arrow-up', 'url'=>'#'),
			        array('label'=>'SYSTEM SETTING'),
			        array('label'=>'Profile', 'icon'=>'user', 'url'=>'#'),
			        array('label'=>'Settings', 'icon'=>'cog', 'url'=>'#'),
			        array('label'=>'Help', 'icon'=>'flag', 'url'=>'#'),
			    ),
			)); ?>
		</td>
		<td style="padding-left: 5px;" valign="top">
			<?php echo $content; ?>
		</td>
	</tr>
</table>

</body>
</html>