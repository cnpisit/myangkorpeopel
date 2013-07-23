<?php
// No direct access to this file
defined('_JEXEC') or die('Restricted access');
?>
<h1><?php echo $this->item->greeting.(($this->item->category and $this->item->params->get('show_category')) ? (' ('.$this->item->category.')') : ''); ?></h1>



<!--<a href="<?php echo JRoute::_('index.php?option=com_helloworld&task=updhelloworld.test')?>">just click</a>-->
<!--<a href="<?php // echo JRoute::_('index.php?option=com_helloworld&task=helloworld.showMe')?>">just click</a>-->
<?php 
//    $user = JFactory::getUser();
//    $userId = (int) $user->get('id');
//    var_dump($userId);
//    
//    $model = $this->getModel('HelloWorld');
//    $data = $model->selectArt();
//    var_dump($data);
//    
     $db = JFactory::getDbo();
    $sql = 'select * from tblz_arts';
    
    $db->setQuery($sql);
    $arts = $db->loadObjectList();
    
    
    foreach ($arts as $art)
    {
    $sql1 = 'select `username` from tbl_users where id='.$art->sur_id;
    $db->setQuery($sql1);
    $username = $db->loadObjectList();
    
         $id = $art->art_id;
         ?>
        <div class="layout-arts" style="width: 24%; height: 100%;float: left; padding:5px">
            <span>
             <a href="<?php echo JRoute::_('index.php?option=com_helloworld&task=helloworld.detail&id='.$id)?>">
                 
                  <?php 
                 if($art->art_format=="image/jpeg")
                 {
                     echo '<img src="media/upload/'.$username[0]->username.'/'.$art->art_name.'">';
                 }  else {
                     var_dump($art);
                 }
                 ?>
             </a>
            </span>
        </div>   
         <?php
    }
    
//    var_dump($this->res);
?>
