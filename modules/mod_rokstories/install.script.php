<?php
 /**
  * @version   $Id: install.script.php 6808 2013-01-27 22:00:07Z btowles $
  * @author    RocketTheme http://www.rockettheme.com
  * @copyright Copyright (C) 2007 - 2013 RocketTheme, LLC
  * @license   http://www.gnu.org/licenses/gpl-2.0.html GNU/GPLv2 only
  */

class Mod_RokStoriesInstallerScript
{
    public function update($parent)
    {
	    $old_lang_file = JPATH_SITE.'/language/en-GB/en-GB.mod_rokstories.ini';
	    if (@file_exists($old_lang_file) && is_writable($old_lang_file))
	    {
		    @unlink($old_lang_file);
	    }
        return true;
    }
}