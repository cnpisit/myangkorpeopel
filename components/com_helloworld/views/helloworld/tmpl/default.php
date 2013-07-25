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
        <div class="layout-arts" style="width: 25%; height: 100%; float: left; padding:15px">
            
            <span>
             <a href="<?php echo JRoute::_('index.php?option=com_helloworld&task=helloworld.detail&id='.$id)?>">
                 
                  <?php 
                 if($art->art_format=="image/jpeg")
                 {
                     echo '<img src="media/upload/'.$username[0]->username.'/'.$art->art_name.'">'; 
                     
                 }  elseif($art->art_format == "audio/mp3") {
//                     echo '<img src="media/upload/'.$username[0]->username.'/'.$art->art_name.'">'; 
                     echo '<audio controls width="auto">
                            <source src="media/upload/'.$username[0]->username.'/'.$art->art_name.'" type="audio/mpeg">
                            <source src="media/upload/'.$username[0]->username.'/'.$art->art_name.'" type="audio/ogg">
                            Your browser does not support this audio format.
                           </audio>';
                 } elseif ($art->art_format=="video/mp4") {
//                     echo '<img src="media/upload/'.$username[0]->username.'/'.$art->art_name.'">'; 
                     echo '<video width="280" height="auto%" controls>
                           <source src="media/upload/'.$username[0]->username.'/'.$art->art_name.'" type="video/mp4">
                           </video>';
                 } else {
                    echo '<img src="media/upload/'.$username[0]->username.'/'.$art->art_name.'">'; 
//                    var_dump($art);
                 }
                 ?>
             </a>
            </span>
            <span class="title-arts"><label><?php echo $art->art_name; ?></label></span>
        </div>   
         <?php
    }
    
//    var_dump($this->res);
?>
