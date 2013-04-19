<?php
/**
 * @version   $Id: helper.php 6796 2013-01-27 19:56:01Z btowles $
 * @author    RocketTheme http://www.rockettheme.com
 * @copyright Copyright (C) 2007 - 2013 RocketTheme, LLC
 * @license   http://www.gnu.org/licenses/gpl-2.0.html GNU/GPLv2 only
 */

// no direct access
defined('_JEXEC') or die('Restricted access');

require_once (JPath::clean(JPATH_SITE . '/components/com_content/models/articles.php'));
require_once (JPath::clean(JPATH_SITE . '/components/com_content/helpers/route.php'));
if (file_exists(JPath::clean(JPATH_SITE . '/libraries/joomla/html/html/content.php'))) require_once (JPath::clean(JPATH_SITE . '/libraries/joomla/html/html/content.php'));
if (class_exists('JModelLegacy')) JModelLegacy::addIncludePath(JPATH_SITE . '/components/com_content/models', 'ContentModel');

/**
 * @package    RocketTheme
 * @subpackage rokstories
 */
class modRokStoriesHelper
{
	public static function loadScripts(&$module, &$params)
	{
		JHtml::_('behavior.framework', true);

		$swidth        = $params->get("start_width", 410);
		$layout        = $params->get("layout_type", "layout1");
		$thumbsOpacity = $params->get("thumbs_opacity", 0.3);
		if ($swidth == 'auto' || $layout == 'layout2') $swidth = "'auto'";
		if ($layout == 'layout2') $thumbsOpacity = 1;

		$tlx = $params->get('left_offset_x', -40);
		$tly = $params->get('left_offset_y', -100);
		$trx = $params->get('right_offset_x', -30);
		$try = $params->get('right_offset_y', -100);

		if ($params->get("fixed_thumb", 1) == 0) {
			$tlx = $params->get('left_f_offset_x', -55);
			$tly = $params->get('left_f_offset_y', -105);
			$trx = $params->get('right_f_offset_x', -55);
			$try = $params->get('right_f_offset_y', -105);
		}

		$leftOffset  = "{x: $tlx, y: $tly}";
		$rightOffset = "{x: $trx, y: $try}";


		$document = JFactory::getDocument();
		if (!defined('ROKSTORIES')) {
			$document->addScript(JURI::Root(true) . "/modules/mod_rokstories/tmpl/js/rokstories" . self::_getJSVersion() . ".js");
			$document->addScriptDeclaration("var RokStoriesImage = {}, RokStoriesLinks = {};");
			define('ROKSTORIES', 1);
		}
		$document->addScriptDeclaration("
		RokStoriesImage['rokstories-{$module->id}'] = [];
		RokStoriesLinks['rokstories-{$module->id}'] = [];
		window.addEvent('domready', function() {
			new RokStories('rokstories-{$module->id}', {
				'id': " . $module->id . ",
				'startElement': " . $params->get("start_element", 0) . ",
				'thumbsOpacity': " . $thumbsOpacity . ",
				'mousetype': '" . $params->get("mouse_type", "click") . "',
				'autorun': " . $params->get("autoplay", 0) . ",
				'delay': " . $params->get("autoplay_delay", 5000) . ",
				'scrollerDuration': " . $params->get("scrollerDuration", 5000) . ",
				'scrollerTransition': Fx.Transitions." . $params->get("scrollerTransition", 'Expo.easeInOut') . ",
				'startWidth': " . $swidth . ",
				'layout': '$layout',
				'linkedImgs': " . $params->get("link_images", 0) . ",
				'showThumbs': " . $params->get("show_thumbs", 0) . ",
				'fixedThumb': " . $params->get("fixed_thumb", 1) . ",
				'mask': " . $params->get('show_mask', 1) . ",
				'descsAnim': '" . $params->get('mask_desc_dir', 'topdown') . "',
				'imgsAnim': '" . $params->get('mask_imgs_dir', 'bottomup') . "',
				'thumbLeftOffsets': $leftOffset,
				'thumbRightOffsets': $rightOffset
			});
		});");
	}

	function getList($params)
	{
		$app          = JFactory::getApplication();
		$db           = JFactory::getDBO();
		$user         = JFactory::getUser();
		$userId       = (int)$user->get('id');
		$jnow         = JFactory::getDate();
		$now          = $db->Quote($jnow->toSql());
		$null         = $db->Quote($db->getNullDate());
		$count        = $params->get('count', 4);
		$catid        = $params->get('catid');
		$show_front   = $params->get('show_front', 1);
		$aid          = $user->get('aid', 0);
		$content_type = $params->get('content_type', 'joomla');
		$ordering     = $params->get('itemsOrdering');
		$cid          = $params->get('category_id', NULL);
		$user_id      = $params->get('user_id');
		$thumb_size   = $params->get('thumb_width', 90);

		// content specific stuff
		if ($content_type == 'joomla') {

			$joomla_image = $params->get('joomla_image', 'text');

			// start Joomla specific
			jimport('joomla.application.component.model');

			// Get an instance of the generic articles model
			if (class_exists('JModelLegacy')) {
				$model = JModelLegacy::getInstance('Articles', 'ContentModel', array('ignore_request' => true));
			} else {
				$model = JModel::getInstance('Articles', 'ContentModel', array('ignore_request' => true));
			}
			// Set application parameters in model
			$appParams = JFactory::getApplication()->getParams();
			$model->setState('params', $appParams);

			// Set the filters based on the module params
			$model->setState('list.start', 0);
			$model->setState('list.limit', $count);
			$model->setState('filter.published', 1);

			// Access filter
			$access     = !JComponentHelper::getParams('com_content')->get('show_noauth');
			$authorised = JAccess::getAuthorisedViewLevels(JFactory::getUser()->get('id'));
			$model->setState('filter.access', $access);

			// Category filter
			$model->setState('filter.category_id', $catid);

			// User filter
			$userId = JFactory::getUser()->get('id');
			switch ($user_id) {
				case 'by_me':
					$model->setState('filter.author_id', (int)$userId);
					break;
				case 'not_me':
					$model->setState('filter.author_id', $userId);
					$model->setState('filter.author_id.include', false);
					break;

				case 0:
					break;

				default:
					$model->setState('filter.author_id', $user_id);
					break;
			}

			//  Featured switch
			switch ($show_front) {
				case 1:
					$model->setState('filter.featured', 'show');
					break;
				case 0:
					$model->setState('filter.featured', 'hide');
					break;
				default:
					$model->setState('filter.featured', 'only');
					break;
			}

			// ordering
			switch ($ordering) {
				case 'date' :
					$orderby = 'a.created ASC';
					break;
				case 'rdate' :
					$orderby = 'a.created DESC';
					break;
				case 'alpha' :
					$orderby = 'a.title';
					break;
				case 'ralpha' :
					$orderby = 'a.title DESC';
					break;
				case 'order':
					if ($show_front == '2') $orderby = 'a.featured_ordering'; else
						$orderby = 'a.ordering';
					break;
				case 'random' :
					$orderby = 'RAND()';
					break;
				default :
					$orderby = 'a.id DESC';
					break;
			}

			$ordering = explode(' ', $orderby);
			$model->setState('list.ordering', $ordering[0]);
			$model->setState('list.direction', isset($ordering[1]) ? $ordering[1] : null);

			$rows = $model->getItems();
			// end Joomla specific
		} else {
			// start K2 specific
			require_once(JPATH_SITE . '/components/com_k2/models/itemlist.php');
			require_once(JPATH_SITE . '/components/com_k2/helpers/route.php');
			require_once(JPATH_SITE . '/components/com_k2/helpers/utilities.php');

			//Initialize Variables
			$k2_category   = $params->get('k2_category', array());
			$k2_children   = $params->get('k2_children', 0);
			$k2_ordering   = $params->get('k2_ordering', 'a.title');
			$k2_featured   = $params->get('k2_featured', 1);
			$k2_image_size = $params->get('k2_image_size', 'M');

			$query = "SELECT a.*, c.name AS categoryname,c.id AS categoryid, c.alias AS categoryalias, c.params AS categoryparams";

			$query .= " FROM #__k2_items as a LEFT JOIN #__k2_categories c ON c.id = a.catid";

			$query .= " WHERE a.published = 1 AND a.access IN(" . implode(',', $user->authorisedLevels()) . ") AND a.trash = 0 AND c.published = 1 AND c.access IN(" . implode(',', $user->authorisedLevels()) . ")  AND c.trash = 0";

			//User Filter
			switch ($user_id) {
				case 'by_me':
					$query .= ' AND (a.created_by = ' . (int)$userId . ' OR a.modified_by = ' . (int)$userId . ')';
					break;
				case 'not_me':
					$query .= ' AND (a.created_by <> ' . (int)$userId . ' AND a.modified_by <> ' . (int)$userId . ')';
					break;
			}

			$query .= " AND ( a.publish_up = " . $null . " OR a.publish_up <= " . $now . " )";
			$query .= " AND ( a.publish_down = " . $null . " OR a.publish_down >= " . $now . " )";

			if (!is_null($k2_category)) {
				if (is_array($k2_category)) {
					if ($k2_children) {
						require_once (JPATH_SITE . '/components/com_k2/models/itemlist.php');
						$categories = K2ModelItemlist::getCategoryTree($k2_category);
						$sql        = @implode(',', $categories);
						$query .= " AND a.catid IN ({$sql})";

					} else {
						JArrayHelper::toInteger($k2_category);
						$query .= " AND a.catid IN(" . implode(',', $k2_category) . ")";
					}

				} else {
					if ($k2_children) {
						require_once (JPATH_SITE . '/components/com_k2/models/itemlist.php');
						$categories = K2ModelItemlist::getCategoryTree($k2_category);
						$sql        = @implode(',', $categories);
						$query .= " AND a.catid IN ({$sql})";
					} else {
						$query .= " AND a.catid=" . (int)$k2_category;
					}

				}
			}

			if ($k2_featured == '0') $query .= " AND a.featured != 1";

			if ($k2_featured == '2') $query .= " AND a.featured = 1";

			if ($app->getLanguageFilter()) {
				$languageTag = JFactory::getLanguage()->getTag();
				$query .= " AND c.language IN (" . $db->Quote($languageTag) . ", " . $db->Quote('*') . ") AND a.language IN (" . $db->Quote($languageTag) . ", " . $db->Quote('*') . ")";
			}

			// ordering
			switch ($ordering) {
				case 'date' :
					$orderby = 'a.created ASC';
					break;
				case 'rdate' :
					$orderby = 'a.created DESC';
					break;
				case 'alpha' :
					$orderby = 'a.title';
					break;
				case 'ralpha' :
					$orderby = 'a.title DESC';
					break;
				case 'order':
					if ($k2_featured == '2') $orderby = 'a.featured_ordering'; else
						$orderby = 'a.ordering';
					break;
				case 'random' :
					$orderby = 'RAND()';
					break;
				default :
					$orderby = 'a.id DESC';
					break;
			}

			$query .= " ORDER BY " . $orderby;
			$db->setQuery($query, 0, $count);
			$rows = $db->loadObjectList();
		}

		$i     = 0;
		$lists = array();

		foreach ($rows as $row) {
			//process content plugins
			$text                 = JHtml::_('content.prepare', $row->introtext);
			$lists[$i]            = new stdClass();
			$lists[$i]->id        = $row->id;
			$lists[$i]->created   = $row->created;
			$lists[$i]->modified  = $row->modified;
			$lists[$i]->title     = htmlspecialchars($row->title);
			$lists[$i]->introtext = self::prepareContent($text, $params);

			if ($content_type == 'joomla') {
				$lists[$i]->link = JRoute::_(ContentHelperRoute::getArticleRoute($row->id . ":" . $row->alias, $row->catid . ":" . $row->category_alias));
				$images          = self::getImages($row->images, $row->introtext, $joomla_image, $thumb_size);
			} else {
				$lists[$i]->link = JRoute::_(K2HelperRoute::getItemRoute($row->id, $row->catid));
				$images          = self::getK2Images($row->id, $k2_image_size, $thumb_size);
			}

			if ($images) {
				$lists[$i]->image      = ($images->image) ? $images->image : '';
				$lists[$i]->thumb      = ($images->thumb) ? $images->thumb : '';
				$lists[$i]->thumbSizes = ($images->thumbSizes) ? $images->thumbSizes : '';
			} else {
				$lists[$i]->image      = '';
				$lists[$i]->thumb      = '';
				$lists[$i]->thumbSizes = '';
			}

			$i++;
		}

		return $lists;
	}

	private static function getK2Images($id, $image_size, $thumb_size = 70)
	{

		$images             = new stdClass();
		$images->image      = false;
		$images->thumb      = false;
		$images->thumbSizes = array('width' => $thumb_size, 'height' => 'auto');
		$current_size       = intval($thumb_size);


		if (file_exists(JPATH_SITE . '/media/k2/items/cache/' . md5("Image" . $id) . '_' . $image_size . '.jpg')) {
			$image_path    = 'media/k2/items/cache/' . md5("Image" . $id) . '_' . $image_size . '.jpg';
			$images->image = JURI::Root(true) . '/' . $image_path;

			// create a thumb filename
			$file_div   = strrpos($image_path, '.');
			$thumb_ext  = substr($image_path, $file_div);
			$thumb_prev = substr($image_path, 0, $file_div);
			$thumb_path = $thumb_prev . "_thumb" . $thumb_ext;

			// check to see if this file exists, if so we don't need to create it
			if (function_exists("gd_info")) {
				// file doens't exist, so create it and save it
				if (!class_exists("Thumbnail")) include_once('thumbnail.inc.php');

				if (file_exists($thumb_path)) {
					$existing_thumb     = new Thumbnail($thumb_path);
					$current_size       = $existing_thumb->getCurrentWidth();
					$images->thumbSizes = $existing_thumb->currentDimensions;
				}

				if (!file_exists($thumb_path) || $current_size != $thumb_size) {

					$thumb = new Thumbnail($image_path);

					if ($thumb->error) {
						echo "ROKSTORIES ERROR: " . $thumb->errmsg . ": " . $image_path;
						return false;
					}
					$thumb->resize($thumb_size);
					if (!is_writable(dirname($thumb_path))) {
						$thumb->destruct();
						return false;
					}
					$thumb->save($thumb_path);
					$images->thumbSizes = $thumb->currentDimensions;
					$thumb->destruct();
				}
			}
			$images->thumb = $thumb_path;
		}
		return $images;
	}

	private static function getImages($db_images, $text = array(), $joomla_image = 'text', $thumb_size = 70)
	{
		if ($joomla_image == 'text') {
			$images = self::getImagesFromText($text, $thumb_size);
		} else {
			$images = self::getSelectedImages($db_images, $joomla_image, $thumb_size);
		}
		return $images;

	}

	private static function getSelectedImages($db_images, $joomla_image = 'full', $thumb_size = 70)
	{

		$images             = new stdClass();
		$images->image      = false;
		$images->thumb      = false;
		$images->thumbSizes = array('width' => $thumb_size, 'height' => 'auto');
		$current_size       = intval($thumb_size);

		$db_images = json_decode($db_images);

		$image_fulltext = $db_images->image_fulltext;
		$image_intro    = $db_images->image_intro;

		if ($joomla_image == 'full') {
			$image = ($image_fulltext) ? $image_fulltext : $image_intro;
		} else {
			$image = ($image_intro) ? $image_intro : $image_fulltext;
		}


		if (file_exists(JPATH_SITE . '/' . $image)) {
			$image_path    = $image;
			$images->image = JURI::Root(true) . '/' . $image_path;

			// create a thumb filename
			$file_div   = strrpos($image_path, '.');
			$thumb_ext  = substr($image_path, $file_div);
			$thumb_prev = substr($image_path, 0, $file_div);
			$thumb_path = $thumb_prev . "_thumb" . $thumb_ext;

			// check to see if this file exists, if so we don't need to create it
			if (function_exists("gd_info")) {
				// file doens't exist, so create it and save it
				if (!class_exists("Thumbnail")) include_once('thumbnail.inc.php');

				if (file_exists($thumb_path)) {
					$existing_thumb     = new Thumbnail($thumb_path);
					$current_size       = $existing_thumb->getCurrentWidth();
					$images->thumbSizes = $existing_thumb->currentDimensions;
				}

				if (!file_exists($thumb_path) || $current_size != $thumb_size) {

					$thumb = new Thumbnail($image_path);

					if ($thumb->error) {
						echo "ROKSTORIES ERROR: " . $thumb->errmsg . ": " . $image_path;
						return false;
					}
					$thumb->resize($thumb_size);
					if (!is_writable(dirname($thumb_path))) {
						$thumb->destruct();
						return false;
					}
					$thumb->save($thumb_path);
					$images->thumbSizes = $thumb->currentDimensions;
					$thumb->destruct();
				}
			}
			$images->thumb = $thumb_path;
			return $images;

		} else {
			return false;
		}

	}

	private static function getImagesFromText($text, $thumb_size = 70)
	{
		preg_match("/\<img.+?src=\"(.+?)\".+?\/>/", $text, $matches);

		$images             = new stdClass();
		$images->image      = false;
		$images->thumb      = false;
		$images->thumbSizes = array('width' => $thumb_size, 'height' => 'auto');

		$paths = array();

		if (isset($matches[1])) {
			$image_path = $matches[1];

			//joomla 1.5 only
			$full_url = JURI::base();

			//remove any protocol/site info from the image path
			$parsed_url = parse_url($full_url);

			$paths[] = $full_url;
			if (isset($parsed_url['path']) && $parsed_url['path'] != "/") $paths[] = $parsed_url['path'];


			foreach ($paths as $path) {
				if (strpos($image_path, $path) === 0) {
					$image_path = substr($image_path, strpos($image_path, $path) + strlen($path));
				}
			}

			// remove any / that begins the path
			if (substr($image_path, 0, 1) == '/') $image_path = substr($image_path, 1);

			//if after removing the uri, still has protocol then the image
			//is remote and we don't support thumbs for external images
			if (strpos($image_path, 'http://') !== false || strpos($image_path, 'https://') !== false
			) {
				return false;
			}

			$images->image = JURI::Root(True) . "/" . $image_path;

			// create a thumb filename
			$file_div   = strrpos($image_path, '.');
			$thumb_ext  = substr($image_path, $file_div);
			$thumb_prev = substr($image_path, 0, $file_div);
			$thumb_path = $thumb_prev . "_thumb" . $thumb_ext;

			// check to see if this file exists, if so we don't need to create it
			if (function_exists("gd_info")) {
				// file doens't exist, so create it and save it
				if (!class_exists("Thumbnail")) include_once('thumbnail.inc.php');

				if (file_exists($thumb_path)) {
					$existing_thumb     = new Thumbnail($thumb_path);
					$current_size       = $existing_thumb->getCurrentWidth();
					$images->thumbSizes = $existing_thumb->currentDimensions;
				} else {

					$thumb = new Thumbnail($image_path);

					if ($thumb->error) {
						echo "ROKSTORIES ERROR: " . $thumb->errmsg . ": " . $image_path;
						return false;
					}
					$thumb->resize($thumb_size);
					if (!is_writable(dirname($thumb_path))) {
						$thumb->destruct();
						return false;
					}
					$thumb->save($thumb_path);
					$images->thumbSizes = $thumb->currentDimensions;
					$thumb->destruct();
				}
			}
			$images->thumb = $thumb_path;
		}
		return $images;
	}

	private static function prepareContent($text, &$params)
	{
		$tags_option = $params->get('strip_tags', 'a,i,br');

		$tags       = explode(",", $tags_option);
		$strip_tags = array();
		for ($i = 0; $i < count($tags); $i++) {
			$strip_tags[$i] = '<' . trim($tags[$i]) . '>';
		}
		$tags = implode(',', $strip_tags);

		// strips tags won't remove the actual jscript
		$text = preg_replace("'<script[^>]*>.*?</script>'si", "", $text);

		$text = preg_replace('/{.+?}/', '', $text);
		$text = strip_tags($text, $tags);

		return $text;
	}

	public static function checkRequest()
	{
		return (JFactory::getApplication()->input->getBool('import') == 'true');
	}

	public static function getBrowser()
	{
		$agent      = (isset($_SERVER['HTTP_USER_AGENT'])) ? strtolower($_SERVER['HTTP_USER_AGENT']) : false;
		$ie_version = false;

		if (preg_match("/msie/", $agent) && !preg_match("/opera/", $agent)) {
			$val        = explode(" ", stristr($agent, "msie"));
			$ver        = explode(".", $val[1]);
			$ie_version = $ver[0];
			$ie_version = preg_replace("#[^0-9,.,a-z,A-Z]#", "", $ie_version);
		}

		return $ie_version;
	}

	private static function _getJSVersion()
	{

		return "";
	}
}
