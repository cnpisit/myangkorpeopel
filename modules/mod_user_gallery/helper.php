<?php
/**
 * Helper class for Hello World! module
 * 
 * @package    Joomla.Tutorials
 * @subpackage Modules
 * @link http://dev.joomla.org/component/option,com_jd-wiki/Itemid,31/id,tutorials:modules/
 * @license        GNU/GPL, see LICENSE.php
 * mod_helloworld is free software. This version may have been modified pursuant
 * to the GNU General Public License, and as distributed it includes or
 * is derivative of works licensed under the GNU General Public License or
 * other free or open source software licenses.
 */
class modUserGalleryHelper
{  
    function getArts( $params )
    {
        return 'What the fuck';
    }
    
    function selectAllArts()
    {
        $db = JFactory::getDbo();
        $user = JFactory::getUser();
        $userId = (int) $user->get('id');
        var_dump($user);
        
        $sql = 'select * from tblz_arts where sur_id='.$userId;
        
        $db->setQuery($sql);
        $arts = $db->loadObjectList();
        return $arts;
    }
    
    function userData()
    {
        $user = JFactory::getUser();
        return $user;
    }
}
?>