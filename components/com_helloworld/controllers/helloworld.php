<?php

// No direct access.
defined('_JEXEC') or die;

// Include dependancy of the main controllerform class
jimport('joomla.application.component.controllerform');
jimport( 'joomla.application.component.controller' );

class HelloWorldControllerHelloWorld extends JControllerForm
{

	public function getModel($name = '', $prefix = '', $config = array('ignore_request' => true))
	{
		return parent::getModel($name, $prefix, array('ignore_request' => false));
	}

	public function showMe()
        {
            $myModel = $this->getModel('helloworld');
            $res = $myModel->selectArt();
//            $view = getView($name= 'showMe', $type= '', $prefix= '', $config=array());
            $view = $this->getView('showMe', 'html'); // get the view
//            $view->assignRef('res', $res); // set the data to the view
            $view->display(); // show the view          
        }

}
 