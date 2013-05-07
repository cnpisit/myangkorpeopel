<?php
// $HeadURL: https://joomgallery.org/svn/joomgallery/JG-2.0/Module/JoomFacebookComments/trunk/mod_joomfacebookcomments.php $
// $Id: mod_joomfacebookcomments.php 4116 2013-02-27 16:54:54Z chraneco $
/******************************************************************************\
**   JoomGallery Module 'JoomFacebookComments' 1.0                            **
**   By: JoomGallery::ProjectTeam                                             **
**   Copyright (C) 2013 JoomGallery::ProjectTeam                              **
**   Released under GNU GPL Public License                                    **
**   License: http://www.gnu.org/copyleft/gpl.html or have a look             **
**   at administrator/components/com_joomgallery/LICENSE.TXT                  **
\******************************************************************************/

// Check to ensure this file is included in Joomla!
defined('_JEXEC') or die('Restricted access');

// Check to ensure that we are in JoomGallery ambit
if(!class_exists('JoomAmbit'))
{
  echo 'We are not in JoomGallery Ambit';

  return;
}

$app = JFactory::getApplication();
switch($app->input->get('view'))
{
  case 'detail':
    $id   = $app->input->get('id', 0, 'int');
    $url  = JRoute::_('index.php?view=detail&id='.$id);
    break;
  case 'category':
    $id   = $app->input->get('catid', 0, 'int');
    $url  = JRoute::_('index.php?view=category&id='.$id);
    break;
  case 'gallery':
    // 'break' intentionally omitted
  case '':
    $url = JRoute::_('index.php?view=gallery');
    break;
  default:
    // Nothing to do
    return;
    break;
}

if($params->get('load_sdk', 1) && !defined('_MOD_JOOMFACEBOOKCOMMENTS_SDK_LOADED'))
{
?><div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/de_DE/all.js#xfbml=1";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script><?php
  define('_MOD_JOOMFACEBOOKCOMMENTS_SDK_LOADED', true);
}

// Ensure that the correct host and path is prepended
$current_uri  = JURI::getInstance(JURI::base());
$current_host = $current_uri->toString(array('scheme', 'host', 'port'));
$uri = JFactory::getUri($url);
$uri->setHost($current_host);
$url = $uri->toString();

?>
<div class="fb-comments" data-href="<?php echo $url; ?>" data-width="<?php echo $params->get('width', 470); ?>" data-num-posts="<?php echo $params->get('num_posts', 10); ?>" data-colorscheme="<?php echo $params->get('colorscheme', 'light'); ?>"></div>