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
	 * @var object item
	 */
	protected $item;
        /**
	 * @var object arts
	 */
	public $arts;
 
	/**
	 * Method to auto-populate the model state.
	 *
	 * This method should only be called once per instantiation and is designed
	 * to be called on the first call to the getState() method unless the model
	 * configuration flag to ignore the request is set.
	 *
	 * Note. Calling getState in this method will result in recursion.
	 *
	 * @return	void
	 * @since	1.6
	 */
	protected function populateState() 
	{
		$app = JFactory::getApplication();
		// Get the message id
		$id = JRequest::getInt('id');
		$this->setState('message.id', $id);
 
		// Load the parameters.
		$params = $app->getParams();
		$this->setState('params', $params);
		parent::populateState();
	}
 
	/**
	 * Returns a reference to the a Table object, always creating it.
	 *
	 * @param	type	The table type to instantiate
	 * @param	string	A prefix for the table class name. Optional.
	 * @param	array	Configuration array for model. Optional.
	 * @return	JTable	A database object
	 * @since	1.6
	 */
	public function getTable($type = 'HelloWorld', $prefix = 'HelloWorldTable', $config = array()) 
	{
		return JTable::getInstance($type, $prefix, $config);
	}
 
	/**
	 * Get the message
	 * @return object The message to be displayed to the user
	 */
	public function getItem() 
	{
		if (!isset($this->item)) 
		{
			$id = $this->getState('message.id');
			$this->_db->setQuery($this->_db->getQuery(true)
				->from('#__helloworld as h')
				->leftJoin('#__categories as c ON h.catid=c.id')
				->select('h.greeting, h.params, c.title as category')
				->where('h.id=' . (int)$id));
			if (!$this->item = $this->_db->loadObject()) 
			{
				$this->setError($this->_db->getError());
			}
			else
			{
				// Load the JSON string
				$params = new JRegistry;
				$params->loadJSON($this->item->params);
				$this->item->params = $params;
 
				// Merge global params with item params
				$params = clone $this->getState('params');
				$params->merge($this->item->params);
				$this->item->params = $params;
			}
		}
		return $this->item;
	}
        
        public function selectArt()
        {
            return $this->arts = "this is call from Model pass data to controller and than to view";
        }
        
        public function selectArtDetail($art_id)
        {
                   $db = JFactory::getDbo();
                   
                   $sql = 'select a.art_id, a.art_name, a.art_desc, a.art_refid, a.art_quote, a.art_lasttransaction, a.art_dimh, a.art_diml1, a.art_diml2, a.sur_id, a.tal_id, a.art_upload_date, a.art_format, u.username from tblz_arts a inner join tbl_users u on a.sur_id = u.id where a.art_id='.$art_id;
                   $db->setQuery($sql);
                   
                   return $art = $db->loadObjectList();          
        }
        
        public function updateArt($data, $id)
        {
            $db = JFactory::getDbo();
            
            $sql = 'update tblz_arts set art_desc="'.$data['art_desc'].'", art_refid="'.$data['art_refid'].'", art_quote="'.$data['art_quote'].'", art_lasttransaction="'.$data['art_lasttransaction'].'", art_dimh="'.$data['art_dimh'].'"'.' where art_id='.$id;
            $db->setQuery($sql);
            $db->query();
        }
        
        public function deleteArt($id)
        {
            $db =  JFactory::getDbo();
            
            $sql = 'DELETE FROM tblz_arts WHERE art_id ='.$id;
            
            $db->setQuery($sql);
            $db->query();
        }
        
}
