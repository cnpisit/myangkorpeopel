<?php
// No direct access to this file
defined('_JEXEC') or die('Restricted access');
 
// import Joomla modelitem library
jimport('joomla.application.component.modelitem');
 
/**
 * HelloWorld Model
 */
class HelloWorldModelHelloWorld extends JModelItem
{
        /**
         * @var string msg
         */
        protected $msg;
		
		/**
         * Returns a reference to the a Table object, always creating it.
         *
         * @param       type    The table type to instantiate
         * @param       string  A prefix for the table class name. Optional.
         * @param       array   Configuration array for model. Optional.
         * @return      JTable  A database object
         * @since       2.5
         */
        public function getTable($type = 'PGallery', $prefix = 'PGalleryTable', $config = array()) 
        {
                return JTable::getInstance($type, $prefix, $config);
        }
        /**
         * Get the message
         * @return string The message to be displayed to the user
         */
        public function getMsg() 
        {
                if (!isset($this->msg)) 
                {
                        //Uses JInput if magic quotes is turned off. Falls back to use JRequest.
                        if(!get_magic_quotes_gpc()) {
                                $id = JFactory::getApplication()->input->get('id', 1, 'INT' );
                        } else {
                                $id = JRequest::getInt('id');
                        }
 
                        switch ($id) 
                        {
                        case 2:
                                $this->msg = 'Good bye World!';
                        break;
                        default:
                        case 1:
                                $this->msg = 'Hello World!';
                        break;
                        }
                }
                return $this->msg;
        }
}