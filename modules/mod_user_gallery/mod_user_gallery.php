<?php


defined( '_JEXEC' ) or die( 'Restricted access' );
 
require_once( dirname(__FILE__).DS.'helper.php' );
 
$test = modUserGalleryHelper::getArts( $params );
$arts = modUserGalleryHelper::selectAllArts();
$userData = modUserGalleryHelper::userData();
//var_dump($userData);
require( JModuleHelper::getLayoutPath( 'mod_user_gallery' ) );

//var_dump($arts);
?>