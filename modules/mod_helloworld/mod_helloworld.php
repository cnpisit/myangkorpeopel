<?php


defined( '_JEXEC' ) or die( 'Restricted access' );
 
require_once( dirname(__FILE__).DS.'helper.php' );
require_once( dirname(__FILE__).DS.'form.php' );
 
$hello = modHelloWorldHelper::getHello( );
$showForm = modHelloWorldForm::showForm( );
$hell = modHelloWorldHelper::showResult();
require( JModuleHelper::getLayoutPath( 'mod_helloworld' ) );
?>