<?php
// No direct access to this file
defined('_JEXEC') or die('Restricted access');
?>
<h1><?php echo $this->item->greeting.(($this->item->category and $this->item->params->get('show_category')) ? (' ('.$this->item->category.')') : ''); ?></h1>

<h1><?php // echo $this->arts ;?></h1>

<a href="<?php echo JRoute::_('index.php?option=com_helloworld&task=updhelloworld.test')?>">just click</a>