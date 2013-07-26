<?php
// No direct access to this file
defined('_JEXEC') or die('Restricted access');
$art = $this->art[0];
//var_dump($art);
?>
<style>
    label
    {
        color: black;
    }
</style>
<form class="form-horizontal" action="<?php echo JRoute::_('index.php?option=com_helloworld&task=helloworld.save&id='.$art->art_id); ?>" method="post">
     <fieldset>
         <legend><center>Update Info</center></legend>
            <div class="control-group">
                <label class="control-label" >Name :</label>
                <div class="controls">
                    <input type="text" name="art_name" value="<?php echo $art->art_name; ?>">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" >Description :</label>
                <div class="controls">
                    <input type="text" name="art_desc" value="<?php echo $art->art_desc; ?>">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" >Ref Id :</label>
                <div class="controls">
                    <input type="text" name="art_refid" value="<?php echo $art->art_refid; ?>">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" >Quote :</label>
                <div class="controls">
                    <input type="text" name="art_quote" value="<?php echo $art->art_quote; ?>">
                </div>
            </div>            
            <div class="control-group">
                <label class="control-label" >Last transaction :</label>
                <div class="controls">
                    <input type="text" name="art_lasttransaction" value="<?php echo $art->art_lasttransaction; ?>">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" >Dimension hight :</label>
                <div class="controls">
                    <input type="text" name="art_dimh" value="<?php echo $art->art_dimh; ?>">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" >Talent :</label>
                <div class="controls">
                    <select>
                        <option></option>
                    </select>
                </div>
            </div>
            <div class="control">
                <input type="submit" class="btn" value="Save">
            </div>
     </fieldset>
</form>
