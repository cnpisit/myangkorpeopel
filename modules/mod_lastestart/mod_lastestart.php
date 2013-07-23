<?php

defined( '_JEXEC' ) or die( 'Restricted access' );
 
// Include the syndicate functions only once
	require_once( dirname(__FILE__).DS.'helper.php' );
	 
	$hello = modLastArtHelper::getLastArt( $params );
        $art = modLastArtHelper::showLastArt();
	require( JModuleHelper::getLayoutPath( 'mod_lastestart' ) );
?>