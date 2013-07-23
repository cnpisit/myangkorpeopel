<?php // no direct access
defined('_JEXEC') or die('Restricted access');
?>
<?php
JHTML::_('behavior.modal');
$database = JFactory::getDbo();
$user = JFactory::getUser();

$userId = (int) $user->get('id');
$userName = $user->get('username');

$sql = "SELECT * FROM `tblz_arts`  WHERE `sur_id` =" . $userId . " ORDER BY `art_id` DESC LIMIT 1";

$database->setQuery($sql);
$art = (array) $database->loadObjectList();

//Change Object into Array 
if (!empty($art)) {
    foreach ($art['0'] as $k => $v) {
        $array[$k] = $v;
    }
    // Test fomat of file for using plugin
    if ($array['art_format'] == "audio/mp3") {
        ?>
        <script type="text/javascript" src="modules/mod_lastestart/tmpl/jwplayer.js"></script>
        <div id="myElement">Loading the player...</div>
        <script type="text/javascript">
            jwplayer("myElement").setup({
                 "flashplayer": "modules/mod_lastestart/tmpl/player.swf", 
                "file": "media/upload/<?php echo $userName ;?>/<?php echo $array['art_name'];?>",
                 "width": "100%", 
                "height": "50px"
            });
        </script>
        <?php
    } elseif ($array['art_format']=="video/mp4") {
        ?>
        <script type="text/javascript" src="modules/mod_lastestart/tmpl/jwplayer.js"></script>
        <div id="myElement">Loading the player...</div>
        <script type="text/javascript">
            jwplayer("myElement").setup({
                 "flashplayer": "modules/mod_lastestart/tmpl/player.swf", 
                "file": "media/upload/<?php echo $userName ;?>/<?php echo $array['art_name'];?>",
                 "width": "100%", 
                "height": "250px"
            });
        </script>
        <?php
    }else {
        echo '<a class="modal" href="media/upload/' . $userName . '/' . $array['art_name'] . '">';
        echo '<div class="rt-image">';
        echo '<img class="rg-grid-thumb-img" src="media/upload/' . $userName . '/' . $array['art_name'] . '">';
        echo '</div>';
        echo '<br />';
        echo '</a>';       
    }

    echo '<h4>' . $array['art_desc'] . '<h4>';
}
?>