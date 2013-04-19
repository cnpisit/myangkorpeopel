<?php
/**
* @version   $Id: error.php 5051 2012-11-05 18:41:52Z josh $
* @author    RocketTheme http://www.rockettheme.com
* @copyright Copyright (C) 2007 - 2013 RocketTheme, LLC
* @license   http://www.gnu.org/licenses/gpl-2.0.html GNU/GPLv2 only
*
* Gantry uses the Joomla Framework (http://www.joomla.org), a GNU/GPLv2 content management system
*
*/
defined( '_JEXEC' ) or die( 'Restricted access' );
if (!isset($this->error)) {
	$this->error = JError::raiseWarning( 403, JText::_('ALERTNOTAUTH') );
	$this->debug = false;
}

// load and inititialize gantry class
global $gantry;
require_once(dirname(__FILE__).'/lib/gantry/gantry.php');
$gantry->init();

$doc = JFactory::getDocument();
$doc->setTitle($this->error->getCode() . ' - '.$this->title);

$gantry->addStyle('grid-responsive.css', 5);
$gantry->addLess('bootstrap.less', 'bootstrap.css', 6);

$defaultBlock = ($gantry->get('blocks-default', '#1685bb') == 'transparent' ? '#999999' : $gantry->get('blocks-default', '#1685bb'));
$gantry->addLess('global.less', 'master.css', 8, array('main-accent'=>$gantry->get('main-accent', '#FFEB54'), 'blocks-default'=>$defaultBlock, 'blocks-box1'=>$gantry->get('blocks-box1', '#e1563f'), 'blocks-box2'=>$gantry->get('blocks-box2', '#23b1bf'), 'blocks-box3'=>$gantry->get('blocks-box3', '#ad4455'), 'blocks-box4'=>$gantry->get('blocks-box4', '#336598'), 'main-overlay'=>$gantry->get('main-overlay','light'), 'defaultOverlay'=>$gantry->get('blocks-default-overlay','dark')));

if ($gantry->browser->name == 'ie') {
	if ($gantry->browser->shortversion == 8) {
		$gantry->addScript('html5shim.js');
	}
}
$gantry->addScript('rokmediaqueries.js');

ob_start();
?>
<body <?php echo $gantry->displayBodyTag(); ?>>
	<div id="rt-error-page">
		<div id="rt-top-surround" class="<?php echo ($gantry->get('headerpanel-overlay') == 'light' ? 'rt-light' : 'rt-dark'); ?>">
			<div id="rt-header">
				<div class="rt-container">
					<?php echo $gantry->displayModules('header','standard','standard'); ?>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<div class="rt-container">
			<div id="rt-main" class="component-content">
				<div class="rt-grid-12">
					<div class="rt-block component-block rt-error-content <?php global $gantry; echo 'main-overlay-'.$gantry->get("main-overlay"); ?>">
						<h1 class="error-title title">Error: <span><?php echo $this->error->getCode(); ?></span> - <?php echo $this->error->getMessage(); ?></h1>
						<div class="error-content">
							<p><strong>You may not be able to visit this page because of:</strong></p>
							<ol>
								<li>an out-of-date bookmark/favourite</li>
								<li>a search engine that has an out-of-date listing for this site</li>
								<li>a mistyped address</li>
								<li>you have no access to this page</li>
								<li>The requested resource was not found.</li>
								<li>An error has occurred while processing your request.</li>
							</ol>
							<p><a href="<?php echo $gantry->baseUrl; ?>" class="readon"><span>&larr; Home</span></a></p>
						</div>
					</div>
				</div>
			</div>
		<div class="clear"></div>
		</div>
		<?php /** Begin Footer Section **/ if ($gantry->countModules('copyright')) : ?>
		<footer id="rt-footer-surround" class="<?php echo ($gantry->get('footerpanel-overlay') == 'light' ? 'rt-light' : 'rt-dark'); ?>">
			<?php /** Begin Copyright **/ if ($gantry->countModules('copyright')) : ?>
			<div id="rt-copyright">
				<div class="rt-container">
					<?php echo $gantry->displayModules('copyright','standard','standard'); ?>
					<div class="clear"></div>
				</div>
			</div>
			<?php /** End Copyright **/ endif; ?>
		</footer>
		<?php /** End Footer Surround **/ endif; ?>
	</div>
</body>
</html>
<?php

$body = ob_get_clean();
$gantry->finalize();

require_once(JPATH_LIBRARIES.'/joomla/document/html/renderer/head.php');
$header_renderer = new JDocumentRendererHead($doc);
$header_contents = $header_renderer->render(null);
ob_start();
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php echo $this->language; ?>" lang="<?php echo $this->language; ?>" dir="<?php echo $this->direction; ?>">
<head>
	<?php echo $header_contents; ?>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<?php
$header = ob_get_clean();
echo $header.$body;;
