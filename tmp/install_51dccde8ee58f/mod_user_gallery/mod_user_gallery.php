<?php

defined( '_JEXEC' ) or die( 'Restricted access' );
 
// Include the syndicate functions only once
	require_once( dirname(__FILE__).DS.'helper.php' );
	 
	$arts = modUserGalleryHelper::getLastArt( $params );
	require( JModuleHelper::getLayoutPath( 'mod_user_gallery' ) );
?>