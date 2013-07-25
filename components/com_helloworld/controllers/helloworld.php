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
            
            $art_id = $_GET['id'];
            
            $myModel = $this->getModel('helloworld');
            //access to function in Model
            $art = $myModel->selectArtDetail($art_id);
         
            /*
             * Create View object
             * we can either write in this form 
             * $view = $this->getView('showMe', 'html')
             * or like form below
             */ 
            $view = $this->getView($name='detail', $type= 'html', $prefix= '', $config=array());
            //Pass value in to view 
            $view->assignRef('art', $art);

            $view->display(); // show the view          
        }
        
        public function edit()
        {
            $art_id = $_GET['id'];
            
            $model = $this->getModel('helloworld');
            
            $art = $model->selectArtDetail($art_id);
                
            $view = $this->getView($name='edit', $type= 'html', $prefix= '', $config=array());
            //Pass value in to view 
            $view->assignRef('art', $art); 
             $view->display();
        }
        
        public function save()
        {
            $art_id = $_GET['id'];
            $post = JRequest::get( 'post' );
            $model = $this->getModel('helloworld');
            //pass data to update query 
            $model->updateArt($post, $art_id);
            
            //redirect to page detail
            $mainframe = JFactory::getApplication();    
            $mainframe->redirect('index.php?option=com_helloworld&task=helloworld.detail&id='.$art_id,'Your modifying has been Saved');
        }
        
        public function delete()
        {
            $id = $_GET['id'];
            $model = $this->getModel('helloworld');
            $model->deleteArt($id);
            $mainframe = JFactory::getApplication();    
            $mainframe->redirect(JRoute::_('index.php?option=com_helloworld'));
            
        }
}
 