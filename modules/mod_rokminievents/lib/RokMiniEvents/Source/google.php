<?php
/**
 * @version   $Id: google.php 9098 2013-04-03 20:47:19Z steph $
 * @author    RocketTheme http://www.rockettheme.com
 * @copyright Copyright (C) 2007 - 2013 RocketTheme, LLC
 * @license   http://www.gnu.org/licenses/gpl-2.0.html GNU/GPLv2 only
 */

defined('_JEXEC') or die('Restricted access');

class RokMiniEventsSourceGoogle extends RokMiniEvents_SourceBase
{
	function getEvents(&$params)
	{
        //simplepie has many strict standards errors, since they are not minievents errors they have been suppressed
		jimport('simplepie.simplepie');

		$id      = $params->get('google_gid', '');
		$orderby = $params->get('google_orderby', 'starttime');

		$query = '?singleevents=true&orderby=' . $orderby . '&sortorder=a&max-results=' . $params->get('google_maxresults', 25);

		if ($params->get('time_range') != 'time_span' && $params->get('rangespan') == 'all_events') {
            if ($params->get('google_past')){
                $query .= '&futureevents=false';
            } else {
                $query .= '&futureevents=true';
            }
		} else {
			$startMin = $params->get('startmin');

			$query .= "&start-min=" . $startMin;
			$startMax = $params->get('startmax', false);
			if ($startMax !== false) {
				$query .= "&start-max=" . $startMax;
			}
		}

		$query = 'http://www.google.com/calendar/feeds/' . $id . '/public/full' . $query;

		$rss = @new SimplePie($query, JPATH_CACHE, $params->get('google_gcache', 3600));
		@$rss->enable_order_by_date(false);

		$events = array();

		if ($rss->error) return $events['error'] = $rss->error;

		$items = @$rss->get_items();
		foreach ($items as $item) {
			$when      = @$item->get_item_tags('http://schemas.google.com/g/2005', 'when');
			$link      = ($params->get('google_links') != 'link_no') ? array(
				'internal' => ($params->get('google_links') == 'link_internal') ? true : false,
				'link'     => @$item->get_link()
			) : false;
			$startdate = strtotime($when[0]['attribs']['']['startTime']);
			$enddate   = strtotime($when[0]['attribs']['']['endTime']);
			$event     = new RokMiniEvents_Event($startdate, $enddate, @$item->get_title(), @$item->get_content(), $link);
			if (preg_match('/^[0-9]{4}-[0-9]{2}-[0-9]{2}$/', $startdate)) $event->setAllDay(true);
			$events[] = $event;
		}
		return $events;
	}

	function available()
	{
		return true;
	}
}
