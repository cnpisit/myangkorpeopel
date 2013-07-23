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
            // Create object to get Model by put Module name as argument 
            $myModel = $this->getModel('helloworld');
            //access to function in Model
            $res = $myModel->selectArt();
         
            /*
             * Create View object
             * we can either write in this form 
             * $view = $this->getView('showMe', 'html')
             * or like form below
             */ 
            $view = $this->getView($name= 'showMe', $type= 'html', $prefix= '', $config=array());
            //Pass value in to view 
            $view->assignRef('res', $res); 
            $view->assignRef('id', $_GET['id']); 
            $view->display(); // show the view          
        }
        
        public function detail()
        {
            $myModel = $this->getModel('helloworld');
            //access to function in Model
            $res = $myModel->selectArt();
         
            /*
             * Create View object
             * we can either write in this form 
             * $view = $this->getView('showMe', 'html')
             * or like form below
             */ 
            $view = $this->getView($name='detail', $type= 'html', $prefix= '', $config=array());
            //Pass value in to view 
            $view->assignRef('res', $res); 
            $view->assignRef('id', $_GET['id']); 
            $view->display(); // show the view          
        }
}
 