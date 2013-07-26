<?php
// No direct access to this file
defined('_JEXEC') or die('Restricted access');
JHTML::_('behavior.modal');
?>
<?php 
    
    
          $art = $this->art[0];

          $array = array();
          foreach ($art as $k => $v)
          {
              $array[$k] = $v; 
          }
          var_dump($art->art_id);
          
?>
<style>
    div.art
    {
        width: 45%; 
        height: 100%;
        float: left;
        padding:10px;
        border: 2px;
        margin: 10px
    } 
    
    .inline-info
    {
        display: inline;
        float: left;
        margin: 2px;
    }
    .modify-icon
    {
        float: right;
        /*margin: ;*/
    }
    .art
    {
        background-color: #eeeeee;
        max-width: 500px;
        max-height: 500px;
        min-height: 250px
    }
    
    img
    {
       border: 20x;
    }
</style>

<div class="art-layout" >
    <div class="art">
        
        <?php 
            if($art->art_format=="image/jpeg")
            {
                echo '<img src="media/upload/'.$art->username.'/'.$art->art_name.'">'; 

            } elseif ($art->art_format=="image/png") {
                echo '<img src="media/upload/'.$art->username.'/'.$art->art_name.'">'; 
            } elseif ($art->art_format=="video/mp4") {
                echo '<video width="100%" height="40%" controls>
                      <source src="media/upload/'.$art->username.'/'.$art->art_name.'" type="video/mp4">
                      </video>';
            } elseif ($art->art_format=="audio/mp3") {
                echo '<audio controls width="100%" hieght="50%" padding-bottom="5px">
                            <source src="media/upload/'.$art->username.'/'.$art->art_name.'" type="audio/mpeg">
                            <source src="media/upload/'.$art->username.'/'.$art->art_name.'" type="audio/ogg">
                            Your browser does not support this audio format.
                           </audio>';
            }
        ?>
    </div>
    <div id="1">
        <form> 
            <fieldset>
                <legend>
                    Additional Info
                    <span class="modify-icon">
                        <a class="modal" href="index.php?option=com_helloworld&tmpl=component&task=helloworld.edit&id=<?php echo $art->art_id; ?>">
                            <abbr title="Edit"><i class="icon-edit"></i></abbr>
                        </a>
                        <a href="index.php?option=com_helloworld&task=helloworld.delete&id=<?php echo $art->art_id; ?>">
                            <abbr title="Delete"><i class="icon-trash"></i></abbr>
                        </a>
                    </span>
                </legend>
                    
                <span class="inline-info">
                    <b>Name</b> : <?php echo $art->art_name ?><br/>
                    <b>Description</b> : <?php echo $art->art_desc ?><br/>
                    <b>Refid</b> : <?php echo $art->art_refid ?><br/>
                    <b>Quote</b> : <?php echo $art->art_quote ?><br/>
                    <b>Last transmition</b> : <?php echo $art->art_lasttransaction ?><br/>
                    <b>High</b> : <?php echo $art->art_dimh ?><br/>
                    <b>Format</b> : <?php echo $art->art_format ?><br/>
                </span>
            </fieldset>
        </form>
    </div>
    <a href="<?php echo JRoute::_('index.php?option=com_helloworld'); ?>">Back To Gallery</a>
</div>