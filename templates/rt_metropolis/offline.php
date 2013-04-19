<?php
/**
* @version   $Id: offline.php 5051 2012-11-05 18:41:52Z josh $
* @author    RocketTheme http://www.rockettheme.com
* @copyright Copyright (C) 2007 - 2013 RocketTheme, LLC
* @license   http://www.gnu.org/licenses/gpl-2.0.html GNU/GPLv2 only
*
* Gantry uses the Joomla Framework (http://www.joomla.org), a GNU/GPLv2 content management system
*
*/
defined( '_JEXEC' ) or die( 'Restricted access' );

// load and inititialize gantry class
require_once(dirname(__FILE__).'/lib/gantry/gantry.php');
$gantry->init();

$doc = JFactory::getDocument();

$gantry->addStyle('grid-responsive.css', 5);
$gantry->addLess('bootstrap.less', 'bootstrap.css', 6);

$defaultBlock = ($gantry->get('blocks-default', '#1685bb') == 'transparent' ? '#999999' : $gantry->get('blocks-default', '#1685bb'));
$gantry->addLess('global.less', 'master.css', 8, array('main-accent'=>$gantry->get('main-accent', '#FFEB54'), 'blocks-default'=>$defaultBlock, 'blocks-box1'=>$gantry->get('blocks-box1', '#e1563f'), 'blocks-box2'=>$gantry->get('blocks-box2', '#23b1bf'), 'blocks-box3'=>$gantry->get('blocks-box3', '#ad4455'), 'blocks-box4'=>$gantry->get('blocks-box4', '#336598'), 'main-overlay'=>$gantry->get('main-overlay','light'), 'defaultOverlay'=>$gantry->get('blocks-default-overlay','dark')));
if ($gantry->browser->name == 'ie') {
	if ($gantry->browser->shortversion == 8) {
		$gantry->addScript('html5shim.js');
	}
}
if ($gantry->get('layout-mode', 'responsive') == 'responsive') $gantry->addScript('rokmediaqueries.js');

ob_start();
?>
<body <?php echo $gantry->displayBodyTag(); ?>>
	<div id="rt-offline-body">
		<div class="rt-container">
			<div class="component-content">
				<div class="rt-grid-12">

					<div class="rt-block offline-image basic <?php echo ($gantry->get('body-overlay') == 'light' ? 'rt-light' : 'rt-dark'); ?>">
						<h1 class="sitename">
							<?php echo htmlspecialchars($app->getCfg('sitename')); ?>
						</h1>
						<?php if ($app->getCfg('offline_image')) : ?>
						<img src="<?php echo $app->getCfg('offline_image'); ?>" alt="<?php echo htmlspecialchars($app->getCfg('sitename')); ?>" />
						<?php endif; ?>
					</div>

					<div class="rt-block <?php echo ($gantry->get('body-overlay') == 'light' ? 'rt-light' : 'rt-dark'); ?>">
						<div class="table">
							<div class="row">
								<div class="cell gantry-width-50 center">
									<div class="rt-block offline basic">
										<h1>Site Offline</h1>
										<?php if ($app->getCfg('display_offline_message', 1) == 1 && str_replace(' ', '', $app->getCfg('offline_message')) != ''): ?>
										<p>
											<?php echo $app->getCfg('offline_message'); ?>
										</p>
											<?php elseif ($app->getCfg('display_offline_message', 1) == 2 && str_replace(' ', '', JText::_('JOFFLINE_MESSAGE')) != ''): ?>
										<p>
											<?php echo JText::_('JOFFLINE_MESSAGE'); ?>
										</p>
										<?php  endif; ?>
									</div>
								</div>
								<div class="cell gantry-width-50 center">
									<div class="rt-block basic">
										<h1 class="title"><?php echo JText::_("AUTHORIZED_LOGIN"); ?></h1>
										<form class="form-horizontal" action="<?php echo JRoute::_('index.php', true); ?>" method="post" id="form-login">
											<div class="control-group">
												<label class="control-label" for="username"><?php echo JText::_('JGLOBAL_USERNAME') ?></label>
												<div class="controls">
													<input name="username" id="username" type="text" alt="<?php echo JText::_('JGLOBAL_USERNAME') ?>" placeholder="<?php echo JText::_('JGLOBAL_USERNAME') ?>" />
												</div>
											</div>
											<div class="control-group">
												<label class="control-label" for="passwd"><?php echo JText::_('JGLOBAL_PASSWORD') ?></label>
												<div class="controls">
													<input type="password" name="password" class="inputbox" alt="<?php echo JText::_('JGLOBAL_PASSWORD') ?>" id="passwd" placeholder="<?php echo JText::_('JGLOBAL_PASSWORD') ?>" />
												</div>
											</div>
											<div class="control-group">
												<div class="controls">
													<label for="remember"><?php echo JText::_('JGLOBAL_REMEMBER_ME') ?>
														<input type="checkbox" name="remember" class="inputbox" value="yes" alt="<?php echo JText::_('JGLOBAL_REMEMBER_ME') ?>" id="remember" />
													</label>

													<input type="submit" name="Submit" class="button" value="<?php echo JText::_('JLOGIN') ?>" />
												</div>
											</div>

											<input type="hidden" name="option" value="com_users" />
											<input type="hidden" name="task" value="user.login" />
											<input type="hidden" name="return" value="<?php echo base64_encode(JURI::base()) ?>" />
											<?php echo JHtml::_('form.token'); ?>

										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
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
