<?php
/**
* @version   $Id: sidepanel.php 4854 2012-10-31 19:25:35Z josh $
* @author    RocketTheme http://www.rockettheme.com
* @copyright Copyright (C) 2007 - 2013 RocketTheme, LLC
* @license   http://www.gnu.org/licenses/gpl-2.0.html GNU/GPLv2 only
*
* Gantry uses the Joomla Framework (http://www.joomla.org), a GNU/GPLv2 content management system
*
*/
defined('JPATH_BASE') or die();

gantry_import('core.gantryfeature');

class GantryFeatureSidePanel extends GantryFeature {
	var $_feature_name = 'sidepanel';

	function init(){
		global $gantry;
		if ($this->isEnabled()){
			$gantry->addScript('sidepanel.js');
		}
	}

	function isEnabled()
    {
        global $gantry;

        $cookie = 0;

        if (1 == (int)$this->get('enabled') && $cookie == 0) return true;
        return false;
    }

	function render($position="") {
		ob_start();
		global $gantry;

		$user = JFactory::getUser();
		$site = JURI::root(true);
		?>
		<span class="rt-dark">
		<div class="side-panel-container">
			<div class="side-panel-toggle"></div>
			<div class="side-panel <?php global $gantry; echo 'rt-'.$gantry->get("blocks-default-overlay").'-block'; ?>" style="width: <?php echo $this->get('width'); ?>px;">
				<?php echo $gantry->displayModules('sidepanel','basic','basic'); ?>
			</div>
		</div>
		</span>
		<?php
		return ob_get_clean();
	}
}
