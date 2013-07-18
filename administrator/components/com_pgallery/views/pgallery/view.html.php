<?php
// No direct access to this file
defined('_JEXEC') or die('Restricted access');
 
// import Joomla view library
jimport('joomla.application.component.view');
 
/**
 * HelloWorlds View
 */
class PGalleryViewPGallery extends JView
{
        /**
         * HelloWorlds view display method
         * @return void
         */
        function display($tpl = null) 
        {
                // Get data from the model
                $items = $this->get('Items');
                $pagination = $this->get('Pagination');
 
                // Check for errors.
                if (count($errors = $this->get('Errors'))) 
                {
                        JError::raiseError(500, implode('<br />', $errors));
                        return false;
                }
                // Assign data to the view
                $this->items = $items;
                $this->pagination = $pagination;
                $this->addToolBar();
                // Display the template
                parent::display($tpl);
                
                $this->setDocument();
        }
        
        /**
         * Setting the toolbar
         */
        protected function addToolBar() 
        {
                $input = JFactory::getApplication()->input;
                $input->set('hidemainmenu', true);
                $isNew = ($this->item->id == 0);
                JToolBarHelper::title($isNew ? JText::_('COM_HELLOWORLD_MANAGER_HELLOWORLD_NEW')
                                             : JText::_('COM_HELLOWORLD_MANAGER_HELLOWORLD_EDIT'));
                JToolBarHelper::save('pgallery.save');
                JToolBarHelper::cancel('pgallery.cancel', $isNew ? 'JTOOLBAR_CANCEL'
                                                                   : 'JTOOLBAR_CLOSE');
        }
        
         /**
         * Method to set up the document properties
         *
         * @return void
         */
        protected function setDocument() 
        {
               $isNew = ($this->item->id < 1);
                $document = JFactory::getDocument();
                $document->setTitle($isNew ? JText::_('COM_HELLOWORLD_HELLOWORLD_CREATING')
                                           : JText::_('COM_HELLOWORLD_HELLOWORLD_EDITING'));
                $document->addScript(JURI::root() . $this->script);
                $document->addScript(JURI::root() . "/administrator/components/pgallery"
                                                  . "/views/pgallery/submitbutton.js");
                JText::script('COM_HELLOWORLD_HELLOWORLD_ERROR_UNACCEPTABLE');
        }
}