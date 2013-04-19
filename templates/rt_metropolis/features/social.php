<?php
/**
* @version   $Id: social.php 4255 2012-10-12 18:11:55Z josh $
* @author    RocketTheme http://www.rockettheme.com
* @copyright Copyright (C) 2007 - 2013 RocketTheme, LLC
* @license   http://www.gnu.org/licenses/gpl-2.0.html GNU/GPLv2 only
*
* Gantry uses the Joomla Framework (http://www.joomla.org), a GNU/GPLv2 content management system
*
*/
defined('JPATH_BASE') or die();

gantry_import('core.gantryfeature');

class GantryFeatureSocial extends GantryFeature {
	var $_feature_name = 'social';

	function init(){
		global $gantry;
	}

	function render($position="") {
		ob_start();
		global $gantry;
		?>
		<div class="rt-social-buttons">
			<?php if ($gantry->get('social-facebook') != "") : ?>
			<a class="social-button rt-facebook-btn" href="<?php echo $gantry->get('social-facebook'); ?>">
				<span></span>
			</a>
			<?php endif; ?>
			<?php if ($gantry->get('social-twitter') != "") : ?>
			<a class="social-button rt-twitter-btn" href="<?php echo $gantry->get('social-twitter'); ?>">
				<span></span>
			</a>
			<?php endif; ?>
			<?php if ($gantry->get('social-google') != "") : ?>
			<a class="social-button rt-google-btn" href="<?php echo $gantry->get('social-google'); ?>">
				<span></span>
			</a>
			<?php endif; ?>
			<?php if ($gantry->get('social-rss') != "") : ?>
			<a class="social-button rt-rss-btn" href="<?php echo $gantry->get('social-rss'); ?>">
				<span></span>
			</a>
			<?php endif; ?>
		</div>
		<?php
		return ob_get_clean();
	}
}
