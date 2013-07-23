<?php // no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );
JHTML::_('behavior.modal');
?>

<?php var_dump($arts);
    foreach ($arts as $art)
    {
        if ($art->art_format=="image/jpeg")
        {
            echo '<a class="modal" href="media/upload/' . $userData->username . '/' . $art->art_name . '">';
            echo '<img width="25%" height="25%" src="media/upload/' .$userData->username. '/' . $art->art_name . '">'; 
            echo '<br />';
            echo '</a>';     
            
        }elseif ($art->art_format=="image/png") {
            
            echo '<a class="modal" href="media/upload/' . $userData->username . '/' . $art->art_name . '">';
            echo '<img width="25%" height="25%" src="media/upload/' .$userData->username. '/' . $art->art_name . '">';
            echo '<br />';
            echo '</a>';     

            

        }elseif ($art->art_format=="audio/mp3"){ 
            ?>
            <script type="text/javascript" src="modules/mod_user_gallery/tmpl/jwplayer.js"></script>
            <div id="myElement">Loading the player...</div>
            <script type="text/javascript">
                jwplayer("myElement").setup({
                     "flashplayer": "/myangkorpeople/modules/mod_user_gallery/tmpl/player.swf", 
                    "file": "/myangkorpeople/media/upload/<?php echo $userData->username ;?>/<?php echo $art->art_name ;?>",
                     "width": "25%", 
                    "height": "50px"
                });
            </script>
        
        <?php
            
        }elseif ($art->art_format=="video/mp4"){
            ?>
            <script type="text/javascript" src="modules/mod_user_gallery/tmpl/jwplayer.js"></script>
            <div id="myElement">Loading the player...</div>
            <script type="text/javascript">
                jwplayer("myElement").setup({
                     "flashplayer": "/myangkorpeople/modules/mod_user_gallery/tmpl/player.swf", 
                    "file": "/myangkorpeople/media/upload/<?php echo $userData->username ;?>/<?php echo $art->art_name ;?>",
                     "width": "50%",
                    "height": "25%"
                });
            </script>
        
        <?php
            
        }     
    }
var_dump($userData->username);
?>
