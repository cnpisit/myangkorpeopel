<?php
/**
 * FW Gallery 2.2.0
 * @copyright (C) 2012 Fastw3b
 * @license http://www.gnu.org/copyleft/gpl.html GNU/GPL
 * @link http://www.fastw3b.net/ Official website
 **/
defined( '_JEXEC' ) or die( 'Restricted access' );

JHTML :: _('behavior.framework', true);
JHTML :: script('components/com_fwgallery/assets/js/cerabox.min.js');



$document =& JFactory::getDocument();
$document->addScript($host.'components/com_fwgallery/swfupload/swfupload.js');
$document->addScript($host.'components/com_fwgallery/swfupload/swfupload.queue.js');
$document->addScript($host.'components/com_fwgallery/swfupload/fileprogress.js');
$document->addScript($host.'components/com_fwgallery/swfupload/handlers.js');
$document->addStyleSheet($host.'components/com_fwgallery/swfupload/default.css');

$session = & JFactory::getSession();
 
$swfUploadHeadJs ='
var swfu;
 
window.onload = function()
{
 
var settings = 
{
        //this is the path to the flash file, you need to put your components name into it
        flash_url : "'.$host.'../components/com_fwgallery/swfupload/swfupload.swf",
 
        //we can not put any vars into the url for complicated reasons, but we can put them into the post...
        upload_url: "index.php",
        post_params: 
        {
                "option" : "com_fwgallery",
                "controller" : "mycontroller",
                "task" : "upload.php",
                "id" : "'.$myItemObject->id.'",
                "'.$session->getName().'" : "'.$session->getId().'",
                "format" : "raw"
        }, 
        //you need to put the session and the "format raw" in there, the other ones are what you would normally put in the url
        file_size_limit : "200 MB",
        //client side file chacking is for usability only, you  need to check server side for security
        file_types : "*.jpg;*.jpeg;*.gif;*.png;*.mp3;*.mp4;*.flv;",
        file_types_description : "All Files",
        file_upload_limit : 100,
        file_queue_limit : 100,
        custom_settings : 
        {
                progressTarget : "fsUploadProgress",
                cancelButtonId : "btnCancel"
        },
        debug: false,
 
        // Button settings
        button_image_url: "'.$host.'../components/com_fwgallery/swfupload/XPButtonUploadText_61x22.png",
        button_width: "90",
        button_height: "29",
        button_placeholder_id: "spanButtonPlaceHolder",
        button_text: \'<span class="theFont" ></span>\',
        button_text_style: ".theFont { font-size: 12; }",
        button_text_left_padding: 5,
        button_text_top_padding: 5,
 
        // The event handler functions are defined in handlers.js
        file_queued_handler : fileQueued,
        file_queue_error_handler : fileQueueError,
        file_dialog_complete_handler : fileDialogComplete,
        upload_start_handler : uploadStart,
        upload_progress_handler : uploadProgress,
        upload_error_handler : uploadError,
        upload_success_handler : uploadSuccess,
        upload_complete_handler : uploadComplete,
        queue_complete_handler : queueComplete  // Queue plugin event
};
swfu = new SWFUpload(settings);
};
 
';

//add the javascript to the head of the html document
$document->addScriptDeclaration($swfUploadHeadJs);

?>

<div id="fwgallery" class="fw-galleries">
<?php
if (!$this->params->get('hide_iphone_app_promo') and JFHelper :: detectIphone()) {
?>
	<div class="fwg-iphone-promo"><img src="<?php echo JURI :: root(true); ?>/components/com_fwgallery/assets/images/iPhoneAppStore_transp_mini.png" /></div>
<?php
}
if ($this->list) {
    $user = JFactory::getUser();
	$this->row_limit = $this->params->get('galleries_a_row', 3);
	$this->gallery_width = $this->params->get('gallery_box_width');
	if (!$this->gallery_width) $this->gallery_width = $this->params->get('im_th_w');
	$this->gallery_image_height = $this->params->get('im_th_h');

	$this->counter = 1;
?>
    <form action="<?php echo JRoute::_('index.php?option=com_fwgallery&view=galleries&Itemid='.JFHelper :: getItemid()); ?>" method="post" name="adminForm" id="adminForm">
	    <div class="fwgs-header">
<?php
	if ($this->params->get('display_gallery_sorting')) {
?>
			<div class="fwgs-header-ordering">
				<?php echo JText :: _('FWG_ORDER_BY'); ?>: <?php echo JHTML :: _('select.genericlist', array(
					JHTML :: _('select.option', 'name', JText :: _('FWG_ALPHABETICALLY'), 'id', 'name'),
					JHTML :: _('select.option', 'new', JText :: _('FWG_NEWEST_FIRST'), 'id', 'name'),
					JHTML :: _('select.option', 'old', JText :: _('FWG_OLDEST_FIRST'), 'id', 'name'),
					JHTML :: _('select.option', 'order', JText :: _('FWG_ORDERING'), 'id', 'name')
				), 'order', 'onchange="this.form.submit();"', 'id', 'name', $this->order); ?>
			</div>
<?php
	}
    if ($this->params->get('display_total_galleries')) {
?>
		    <div class="fwgs-header-total"><?php echo JText::_('FWG_TOTAL_GALLERIES'); ?>: <?php echo $this->pagination->total; ?></div>
<?php
    }
    if ($this->params->get('display_galleries_limit_selector')) {
?>
	        <div class="fwgs-header-pagination">
	        	<?php echo JText::_('FWG_DISPLAY_LIMIT'); ?>: <?php echo $this->pagination->getLimitBox(); ?>
	        </div>
<?php
    }
?>
	        <div class="clr"></div>
	    </div>
<?php
    foreach ($this->list as $row) {
    	$this->row = $row;
    	echo $this->loadTemplate('item');

        if ($this->counter >= $this->row_limit) {
?>
        	<div class="clr"></div>
<?php
        	$this->counter = 1;
        } else $this->counter++;
    }
?>
		<div class="clr"></div>
        <div class="fwgs-footer-pagination pagination">
        	<?php echo $this->pagination->getPagesLinks(); ?>
        </div>
    </form>
<?php
	if ($this->params->get('display_galleries_lightbox')) {
?>
    <script type="text/javascript">
	window.addEvent('domready', function() {
		document.getElements('.fwgs-image a').each(function(el) {
			el.addEvent('click', function() {
				var id = document.getElement(this).getProperty('rel');
				if (id) {
					if (document.getElement('#fwg-preview-gallery')) document.getElement('#fwg-preview-gallery').dispose();
					if (document.getElement('#fwg-lightbox')) document.getElement('#fwg-lightbox').dispose();
					if (document.getElement('#fwg-lightboxOverallView')) document.getElement('#fwg-lightboxOverallView').dispose();
					if (document.getElement('#fwg-lightboxIndicator')) document.getElement('#fwg-lightboxIndicator').dispose();

					new Request.JSON({
						url: '<?php echo JRoute :: _('index.php?option=com_fwgallery&view=gallery', false); ?>',
						data: {
							id: id,
							format: 'json'
						},
						onSuccess: function(data) {
							var div = new Element('div', {
								'id': 'fwg-preview-gallery',
								'style': 'display: none'
							});
							div.inject(document.getElement('body'));
							for (var i in data.images) {
								var link = new Element('a', {
									'class':'fwg-lightbox',
									'href': data.images[i].link,
									'rel':'fwg-lightbox-gallery-link'
								});
								link.inject(div);
								var image = new Element('img', {
									alt: data.images[i].descr
								});
								image.inject(link);
							}
							var cerabox = new CeraBox(div.getElements('a.fwg-lightbox'), {
								titleFormat: 'Image {number} / {total} {title}',
								events: {
									onOpen: function(currentItem, collection) {
					 				}
								}
							});
							div.getElement('a.fwg-lightbox').fireEvent('click');
						}
					}).send();
				}
			});
		});
	});
</script>

<?php
	}
} else {
    echo JText::_('FWG_NO_GALLERIES_AVAILABLE_FOR_PREVIEW_');
}
?>
</div>
<?php
$this->params = JComponentHelper :: getParams('com_fwgallery');
if (!$this->params->get('hide_fw_copyright')) {
?>
<div id="fwcopy" style="display:block;visibility:visible;text-align:center;font-size:10px;padding:20px 0;">
	<?php echo JText::_("FWG_POWERED_BY"); ?> <a href="http://fastw3b.net/fwgallery.html" target="_blank"><?php echo JText::_("FWG_FW_GALLERY"); ?></a>
</div>
<?php
}
?>

<!--<div id="swfuploader">
        <form id="form1" action="<?php echo JRoute::_('index.php?option=com_fwgallery&task=galleries.upload');?>" method="post" enctype="multipart/form-data">
        <fieldset class="adminform">
                        <div class="fieldset flash" id="fsUploadProgress">
                            <span class="legend" style="border: 2px; color: blue">Upload your art here</span>
                        </div>
                <div id="divStatus">0 Files Uploaded</div>
                            <span id="spanButtonPlaceHolder" >upload</span>
                                <input id="btnCancel" type="button" value="Cancel" onclick="swfu.cancelQueue();" disabled="disabled" style="margin-left: 2px; font-size: 8pt; height: 29px;" /> 
                </div>
                <div><input type="submit" value="submit" class="btn"></div>
        </fieldset>
        </form>
</div>-->