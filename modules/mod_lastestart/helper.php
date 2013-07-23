<?php 

class modLastArtHelper
{
    /**
     * Retrieves the hello message
     *
     * @param array $params An object containing the module parameters
     * @access public
     */    
    public static function getLastArt( $params )
    {
        $user = JFactory::getUser();
        return $user;
    }
    
    public static function showLastArt()
    {
        
        $database = JFactory::getDbo();
        $user = JFactory::getUser();
         
        $userId = (int) $user->get('id');
        $userName =  $user->get('username');
        
        $sql = "SELECT * FROM `tblz_arts` WHERE `sur_id` =".$userId." ORDER BY `art_id` DESC LIMIT 1";
        $database->setQuery($sql);
        $art = (array) $database->loadObjectList();
        if(!empty($art))
        {
            foreach ($art['0'] as $k => $v)
            {
                $array[$k] = $v;
            }
//            var_dump($array['art_name']);
        }
              
    }
}
?>