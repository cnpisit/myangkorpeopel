<?php
/**
* @version   $Id: component.php 7382 2013-02-08 18:05:29Z arifin $
 * @author RocketTheme http://www.rockettheme.com
 * @copyright Copyright (C) 2007 - 2013 RocketTheme, LLC
 * @license http://www.gnu.org/licenses/gpl-2.0.html GNU/GPLv2 only
 *
 * Gantry uses the Joomla Framework (http://www.joomla.org), a GNU/GPLv2 content management system
 *
 */
// no direct access
defined( '_JEXEC' ) or die( 'Restricted index access' );

// load and inititialize gantry class
require_once(dirname(__FILE__).'/lib/gantry/gantry.php');
$gantry->init();

?>
<?php if (JFactory::getApplication()->input->getString('type')=='raw'):?>
	<jdoc:include type="component" />
<?php else: ?>
	<!doctype html>
	<html xml:lang="<?php echo $gantry->language; ?>" lang="<?php echo $gantry->language;?>" >
		<head>
			<meta name="viewport" content="width=device-width, initial-scale=1.0"></meta>
			<?php
				$gantry->displayHead();
				
				$gantry->addLess('bootstrap.less', 'bootstrap.css', 6);
				$defaultBlock = ($gantry->get('blocks-default', '#1685bb') == 'transparent' ? '#999999' : $gantry->get('blocks-default', '#1685bb'));
				$gantry->addLess('global.less', 'master.css', 8, array('main-accent'=>$gantry->get('main-accent', '#FFEB54'), 'blocks-default'=>$defaultBlock, 'blocks-box1'=>$gantry->get('blocks-box1', '#e1563f'), 'blocks-box2'=>$gantry->get('blocks-box2', '#23b1bf'), 'blocks-box3'=>$gantry->get('blocks-box3', '#ad4455'), 'blocks-box4'=>$gantry->get('blocks-box4', '#336598'), 'main-overlay'=>$gantry->get('main-overlay','light'), 'defaultOverlay'=>$gantry->get('blocks-default-overlay','dark')));
			?>
		</head>
		<body class="component-body">
			<div class="component-content">
		    	<jdoc:include type="message" />
				<jdoc:include type="component" />
			</div>
		</body>
	</html>
<?php endif; ?>
<?php
$gantry->finalize();
?>
