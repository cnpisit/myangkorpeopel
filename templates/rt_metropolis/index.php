<?php
/**
* @version   $Id: index.php 5051 2012-11-05 18:41:52Z josh $
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
<!doctype html>
<html xml:lang="<?php echo $gantry->language; ?>" lang="<?php echo $gantry->language;?>" >
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <?php
        $gantry->displayHead();

		$gantry->addStyle('grid-responsive.css', 5);
		$gantry->addLess('bootstrap.less', 'bootstrap.css', 6);

		$defaultBlock = ($gantry->get('blocks-default', '#1685bb') == 'transparent' ? '#999999' : $gantry->get('blocks-default', '#1685bb'));
        $gantry->addLess('global.less', 'master.css', 8, array('main-accent'=>$gantry->get('main-accent', '#FFEB54'), 'blocks-default'=>$defaultBlock, 'blocks-box1'=>$gantry->get('blocks-box1', '#e1563f'), 'blocks-box2'=>$gantry->get('blocks-box2', '#23b1bf'), 'blocks-box3'=>$gantry->get('blocks-box3', '#ad4455'), 'blocks-box4'=>$gantry->get('blocks-box4', '#336598'), 'main-overlay'=>$gantry->get('main-overlay','light'), 'defaultOverlay'=>$gantry->get('blocks-default-overlay','dark')));

        if ($gantry->browser->name == 'ie'){
			if ($gantry->browser->shortversion == 8){
				$gantry->addScript('html5shim.js');
			}
		}
		if ($gantry->get('layout-mode', 'responsive') == 'responsive') $gantry->addScript('rokmediaqueries.js');
		if ($gantry->get('loadtransition')) {	
		$gantry->addScript('load-transition.js');
		$hidden = ' class="rt-hidden"';}

    ?>
</head>
<body <?php echo $gantry->displayBodyTag(); ?>>
	<div class="rt-bg"><div class="rt-bg2">
	<div class="rt-container">
	    <?php /** Begin Drawer **/ if ($gantry->countModules('drawer')) : ?>
	    <div id="rt-drawer">
	        <?php echo $gantry->displayModules('drawer','standard','standard'); ?>
	        <div class="clear"></div>
	    </div>
	    <?php /** End Drawer **/ endif; ?>
	    <?php /** Begin Top Surround **/ if ($gantry->countModules('top') or $gantry->countModules('header')) : ?>
	    <header id="rt-top-surround" class="<?php echo ($gantry->get('headerpanel-overlay') == 'light' ? 'rt-light' : 'rt-dark'); ?>">
			<?php /** Begin Top **/ if ($gantry->countModules('top')) : ?>
			<div id="rt-top">
				<?php echo $gantry->displayModules('top','standard','standard'); ?>
				<div class="clear"></div>
			</div>
			<?php /** End Top **/ endif; ?>
			<?php /** Begin Header **/ if ($gantry->countModules('header')) : ?>
			<div id="rt-header">
				<?php echo $gantry->displayModules('header','standard','standard'); ?>
				<div class="clear"></div>
			</div>
			<?php /** End Header **/ endif; ?>
		</header>
		<?php /** End Top Surround **/ endif; ?>
		<?php /** Begin Showcase **/ if ($gantry->countModules('showcase')) : ?>
		<div id="rt-showcase" class="<?php echo ($gantry->get('showcasepanel-overlay') == 'light' ? 'rt-light' : 'rt-dark'); ?>">
			<?php echo $gantry->displayModules('showcase','standard','standard'); ?>
			<div class="clear"></div>
		</div>
		<?php /** End Showcase **/ endif; ?>
		<?php /** Begin Social **/ if ($gantry->countModules('social')) : ?>
		<?php echo $gantry->displayModules('social','basic','basic'); ?>
		<?php /** End Social **/ endif; ?>
		<div id="rt-transition"<?php if ($gantry->get('loadtransition')) echo $hidden; ?>>
			<div id="rt-mainbody-surround" class="<?php echo ($gantry->get('body-overlay') == 'light' ? 'rt-light' : 'rt-dark'); ?>">
				<?php /** Begin Feature **/ if ($gantry->countModules('feature')) : ?>
				<div id="rt-feature">
					<?php echo $gantry->displayModules('feature','standard','standard'); ?>
					<div class="clear"></div>
				</div>
				<?php /** End Feature **/ endif; ?>
				<?php /** Begin Utility **/ if ($gantry->countModules('utility')) : ?>
				<div id="rt-utility">
					<?php echo $gantry->displayModules('utility','standard','standard'); ?>
					<div class="clear"></div>
				</div>
				<?php /** End Utility **/ endif; ?>
				<?php /** Begin Breadcrumbs **/ if ($gantry->countModules('breadcrumb')) : ?>
				<div id="rt-breadcrumbs">
					<?php echo $gantry->displayModules('breadcrumb','standard','standard'); ?>
					<div class="clear"></div>
				</div>
				<?php /** End Breadcrumbs **/ endif; ?>
				<?php /** Begin Main Top **/ if ($gantry->countModules('maintop')) : ?>
				<div id="rt-maintop">
					<?php echo $gantry->displayModules('maintop','standard','standard'); ?>
					<div class="clear"></div>
				</div>
				<?php /** End Main Top **/ endif; ?>
				<?php /** Begin Main Body **/ ?>
			    	<?php echo $gantry->displayMainbody('mainbody','sidebar','standard','standard','standard','standard','standard'); ?>
				<?php /** End Main Body **/ ?>
				<?php /** Begin Main Bottom **/ if ($gantry->countModules('mainbottom')) : ?>
				<div id="rt-mainbottom">
					<?php echo $gantry->displayModules('mainbottom','standard','standard'); ?>
					<div class="clear"></div>
				</div>
				<?php /** End Main Bottom **/ endif; ?>
				<?php /** Begin Extension **/ if ($gantry->countModules('extension')) : ?>
				<div id="rt-extension">
					<?php echo $gantry->displayModules('extension','standard','standard'); ?>
					<div class="clear"></div>
				</div>
				<?php /** End Extension **/ endif; ?>
			</div>
		</div>
		<?php /** Begin Bottom **/ if ($gantry->countModules('bottom')) : ?>
		<div id="rt-bottom" class="<?php echo ($gantry->get('bottompanel-overlay') == 'light' ? 'rt-light' : 'rt-dark'); ?>">
			<?php echo $gantry->displayModules('bottom','standard','standard'); ?>
			<div class="clear"></div>
		</div>
		<?php /** End Bottom **/ endif; ?>
		<?php /** Begin Footer Section **/ if ($gantry->countModules('footer') or $gantry->countModules('copyright')) : ?>
		<footer id="rt-footer-surround" class="<?php echo ($gantry->get('footerpanel-overlay') == 'light' ? 'rt-light' : 'rt-dark'); ?>">
			<?php /** Begin Footer **/ if ($gantry->countModules('footer')) : ?>
			<div id="rt-footer">
				<?php echo $gantry->displayModules('footer','standard','standard'); ?>
				<div class="clear"></div>
			</div>
			<?php /** End Footer **/ endif; ?>
			<?php /** Begin Copyright **/ if ($gantry->countModules('copyright')) : ?>
			<div id="rt-copyright">
				<?php echo $gantry->displayModules('copyright','standard','standard'); ?>
				<div class="clear"></div>
			</div>
			<?php /** End Copyright **/ endif; ?>
		</footer>
		<?php /** End Footer Surround **/ endif; ?>
	</div>
</div></div>
	<?php /** Begin Debug **/ if ($gantry->countModules('debug')) : ?>
	<div id="rt-debug">
		<div class="rt-container">
			<?php echo $gantry->displayModules('debug','standard','standard'); ?>
			<div class="clear"></div>
		</div>
	</div>
	<?php /** End Debug **/ endif; ?>
	<?php /** Begin Auxiliary **/ if ($gantry->countModules('auxiliary') and ($gantry->countModules('sidepanel'))) : ?>
	<?php echo $gantry->displayModules('auxiliary','basic','basic'); ?>
	<?php /** End Auxiliary **/ endif; ?>
	<?php /** Begin Popups **/
			echo $gantry->displayModules('popup','popup','popup');
			echo $gantry->displayModules('login','login','popup');
			/** End Popup s**/ ?>
	<?php /** Begin Analytics **/ if ($gantry->countModules('analytics')) : ?>
	<?php echo $gantry->displayModules('analytics','basic','basic'); ?>
	<?php /** End Analytics **/ endif; ?>
	</body>
</html>
<?php
$gantry->finalize();
?>
