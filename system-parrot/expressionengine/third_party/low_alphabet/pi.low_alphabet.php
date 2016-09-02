<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

// include config file
include PATH_THIRD.'low_alphabet/config.php';

// Provide info to EE
$plugin_info = array(
	'pi_name'        => LOW_ALPHABET_NAME,
	'pi_version'     => LOW_ALPHABET_VERSION,
	'pi_author'      => 'Lodewijk Schutte ~ Low',
	'pi_author_url'  => LOW_ALPHABET_DOCS,
	'pi_description' => 'Lets you create an alphabetical index and displays entries (filtered) by alpha.',
	'pi_usage'       => 'Go to '.LOW_ALPHABET_DOCS.' for '.LOW_ALPHABET_NAME.' documentation.'
);

/**
 * Low Alphabet Plugin class
 *
 * @package         low_alphabet
 * @author          Lodewijk Schutte ~ Low <hi@gotolow.com>
 * @copyright       Copyright (c) 2011-2014, Lodewijk Schutte
 * @link            http://gotolow.com/addons/low-alphabet
 */
class Low_alphabet {

	// --------------------------------------------------------------------
	// PROPERTIES
	// --------------------------------------------------------------------

	/**
	 * Usable non-custom fields
	 *
	 * @access      private
	 * @var         array
	 */
	private $fields = array(
		LOW_ALPHABET_DEFAULT_FIELD,
		'url_title'
	);

	/**
	 * Usable numeric non-custom fields
	 *
	 * @access      private
	 * @var         array
	 */
	private $numeric_fields = array(
		'entry_date',
		'view_count_one',
		'view_count_two',
		'view_count_three',
		'view_count_four',
		'edit_date',
		'recent_comment_date',
		'comment_total'
	);

	/**
	 * Sort orders for entries
	 *
	 * @access      private
	 * @var         array
	 */
	private $sort_order = array(LOW_ALPHABET_DEFAULT_FIELD => 'asc');

	/**
	 * Ranges used: ['a-f', 'g-l', 'm-r', 's-w', ...]
	 *
	 * @access      private
	 * @var         array
	 */
	private $ranges;

	/**
	 * Map to characters to ranges: ['a' => 'a-f', 'b' => 'a-f', 'k' => 'g-l', ...]
	 *
	 * @access      private
	 * @var         array
	 */
	private $map;

	// --------------------------------------------------------------------
	// METHODS
	// --------------------------------------------------------------------

	/**
	 * Constructor: sets EE instance
	 *
	 * @access      public
	 * @return      null
	 */
	public function __construct()
	{
		// Load helper
		ee()->load->helper(LOW_ALPHABET_PACKAGE);
	}

	// --------------------------------------------------------------------

	/**
	 * Creates list from A to Z, filtered by parameters when given
	 *
	 * @access      public
	 * @return      string
	 */
	public function azlist()
	{
		// --------------------------------------
		// Prep no_results to avoid conflicts
		// --------------------------------------

		$this->_prep_no_results();

		// --------------------------------------
		// Initiate some variables used later on
		// --------------------------------------

		$variables = $entries = $map = array();

		// --------------------------------------
		// Check alpha_field parameter
		// --------------------------------------

		$alpha_field = $this->_get_field(ee()->TMPL->fetch_param('alpha_field', LOW_ALPHABET_DEFAULT_FIELD));

		// --------------------------------------
		// Get search: parameter where clause
		// --------------------------------------

		$search_where = $this->_search_where('d.');

		// --------------------------------------
		// Determine select value based on alpha_field
		// --------------------------------------

		$sql_select = (in_array($alpha_field, $this->fields) ? 't.' : 'd.') . $alpha_field . ' AS alpha_field';

		// --------------------------------------
		// Start composing query
		// --------------------------------------

		ee()->db->select($sql_select)->from('channel_titles t');

		// --------------------------------------
		// Join channel data table
		// --------------------------------------

		if ( ! in_array($alpha_field, $this->fields) || $search_where)
		{
			ee()->db->join('channel_data d', 't.entry_id = d.entry_id');

			if ($search_where) ee()->db->where(implode(' AND ', $search_where), NULL, FALSE);
		}

		// --------------------------------------
		// Apply filters
		// --------------------------------------

		$this->_filters();

		// --------------------------------------
		// Get results
		// --------------------------------------

		$query = ee()->db->get();

		// --------------------------------------
		// Ignore words
		// --------------------------------------

		$ignore_words = low_alphabet_ignore_words(ee()->TMPL->fetch_param('alpha_ignore'));

		// --------------------------------------
		// Set the ranges and the map
		// --------------------------------------

		$this->_set_ranges();

		// --------------------------------------
		// Loop through results and populate entries array
		// so we get $entries['a'] = 123;
		// --------------------------------------

		foreach ($query->result() AS $row)
		{
			$title = low_alphabet_prep_field($row->alpha_field, $ignore_words);
			$letter = MB_ENABLED ? mb_strtolower(mb_substr($title, 0, 1)) : strtolower(substr($title, 0, 1));

			if (array_key_exists($letter, $this->map))
			{
				$entries[$this->map[$letter]][] = $title;
			}
		}

		// --------------------------------------
		// Are we showing empty ranges?
		// --------------------------------------

		$show_empty = (ee()->TMPL->fetch_param('show_empty') == 'yes');

		// --------------------------------------
		// Is there a numbers label for 0-9?
		// --------------------------------------

		$numbers_label = ee()->TMPL->fetch_param('numbers_label', LOW_ALPHABET_NUMBER_URL);

		// --------------------------------------
		// Are we multibyting?
		// --------------------------------------

		$upper = MB_ENABLED ? 'mb_strtoupper' : 'strtoupper';

		// --------------------------------------
		// Loop through the ranges and create vars
		// --------------------------------------

		foreach ($this->ranges AS $a)
		{
			// Skip these
			if ( ! $show_empty && ! array_key_exists($a, $entries)) continue;

			// Add letter to vars
			$variables[] = array(
				'low_alphabet_url'     => $a,
				'low_alphabet_label'   => ($a == LOW_ALPHABET_NUMBER_URL) ? $numbers_label : $upper($a),
				'low_alphabet_entries' => array_key_exists($a, $entries) ? count($entries[$a]) : 0
			);
		}

		// --------------------------------------
		// Set return data to either parsed variables
		// or the {if no_results} code block
		// --------------------------------------

		$it	= ($variables)
			? ee()->TMPL->parse_variables(ee()->TMPL->tagdata, $variables)
			: ee()->TMPL->no_results();

		// --------------------------------------
		// Like a movie, like a style
		// --------------------------------------

		return $it;
	}

	// --------------------------------------------------------------------

	/**
	 * Parse channel entries, filtered by letter if given
	 *
	 * This method utilises the native channel:entries method,
	 * but sets the entry_id parameter with the appropriate ids
	 * before calling it, thus filtering the returned entries.
	 *
	 * @access      public
	 * @return      string
	 */
	public function entries()
	{
		// --------------------------------------
		// Prep no_results to avoid conflicts
		// --------------------------------------

		$this->_prep_no_results();

		// --------------------------------------
		// No entries? Return no_results
		// --------------------------------------

		if ($entry_ids = $this->_get_entry_ids())
		{
			// --------------------------------------
			// Set params
			// --------------------------------------

			$params = array(
				'low_alphabet' => 'yes',
				'fixed_order'  => implode('|', $entry_ids),
				'orderby'      => '',
				'sort'         => ''
			);

			// --------------------------------------
			// Auto limit?
			// --------------------------------------

			if (ee()->TMPL->fetch_param('auto_limit') == 'yes')
			{
				$params['limit'] = count($entry_ids);
			}

			// --------------------------------------
			// Call channel::entries
			// --------------------------------------

			return $this->_channel_entries($params);
		}
		else
		{
			return ee()->TMPL->no_results();
		}
	}

	/**
	 * Return pipe-delimited list of ordered entry_ids
	 *
	 * @access      public
	 * @return      string
	 */
	public function entry_ids()
	{
		// --------------------------------------
		// Get some parameters and check pair tag
		// --------------------------------------

		$pair       = ($tagdata = ee()->TMPL->tagdata) ? TRUE : FALSE;
		$no_results = ee()->TMPL->fetch_param('no_results');
		$separator  = ee()->TMPL->fetch_param('separator', '|');

		// --------------------------------------
		// Create single string from entry ids
		// --------------------------------------

		$entry_ids = $this->_get_entry_ids();
		$entry_ids = empty($entry_ids) ? $no_results : implode($separator, $entry_ids);

		// --------------------------------------
		// Parse+return or just return, depending on tag pair or not
		// --------------------------------------

		if ($pair)
		{
			return ee()->TMPL->parse_variables_row($tagdata, array(
				'low_alphabet:entry_ids' => $entry_ids
			));
		}
		else
		{
			return $entry_ids;
		}
	}

	// --------------------------------------------------------------------

	/**
	 * Return letter based on given text
	 *
	 * @access      public
	 * @return      string
	 */
	public function file_under()
	{
		// Set internal ranges and map
		$this->_set_ranges();

		// Get ignore words
		$ignore = explode('|', ee()->TMPL->fetch_param('alpha_ignore'));

		// Get the text, fallback to the tagdata
		$text = ee()->TMPL->fetch_param('text', ee()->TMPL->tagdata);

		// Handle it
		$text = low_alphabet_prep_field($text, $ignore);

		// Get the first letter
		$text = substr($text, 0, 1);

		// Get the group this text belongs to
		$group = array_key_exists($text, $this->map)
			? $this->map[$text]
			: FALSE;

		// Bail out if group not found
		if ( ! $group) return ee()->TMPL->no_results();

		// Determine label for this group
		$label = ($group == LOW_ALPHABET_NUMBER_URL)
			? ee()->TMPL->fetch_param('numbers_label', LOW_ALPHABET_NUMBER_URL)
			: strtoupper($group);

		if (count(ee()->TMPL->tagparts) == 3)
		{
			$out = ee()->TMPL->tagparts[2];
			return ($out == 'label') ? $label : $group;
		}
		else
		{
			return ee()->TMPL->parse_variables_row(
				ee()->TMPL->tagdata,
				array(
					'low_alphabet_url'   => $group,
					'low_alphabet_label' => $label
				)
			);
		}
	}

	// --------------------------------------------------------------------

	/**
	 * To uppercase
	 *
	 * @access      public
	 * @return      string
	 */
	public function uppercase()
	{
		return $this->_case(ee()->TMPL->fetch_param('text', ''), 'upper');
	}

	// --------------------------------------------------------------------

	/**
	 * To lowercase
	 *
	 * @access      public
	 * @return      string
	 */
	public function lowercase()
	{
		return $this->_case(ee()->TMPL->fetch_param('text', ''), 'lower');
	}

	// --------------------------------------------------------------------
	// PRIVATE METHODS
	// --------------------------------------------------------------------

	/**
	 * Call channel::entries
	 *
	 * @access     private
	 * @param      array
	 * @return     string
	 */
	private function _channel_entries($params = array())
	{
		// --------------------------------------
		// Force given params
		// --------------------------------------

		ee()->TMPL->tagparams = array_merge(ee()->TMPL->tagparams, $params);

		// --------------------------------------
		// Make sure the following params are set
		// --------------------------------------

		$set_params = array(
			'dynamic'  => 'no',
			'paginate' => 'bottom'
		);

		foreach ($set_params AS $key => $val)
		{
			if ( ! ee()->TMPL->fetch_param($key))
			{
				ee()->TMPL->tagparams[$key] = $val;
			}
		}

		// --------------------------------------
		// Take care of related entries
		// --------------------------------------

		if (version_compare(APP_VER, '2.6.0', '<'))
		{
			// We must do this, 'cause the template engine only does it for
			// channel:entries or search:search_results. The bastard.
			ee()->TMPL->tagdata = ee()->TMPL->assign_relationship_data(ee()->TMPL->tagdata);

			// Add related markers to single vars to trigger replacement
			foreach (ee()->TMPL->related_markers AS $var)
			{
				ee()->TMPL->var_single[$var] = $var;
			}
		}

		// --------------------------------------
		// Get channel module
		// --------------------------------------

		if ( ! class_exists('channel'))
		{
			require_once PATH_MOD.'channel/mod.channel'.EXT;
		}

		// --------------------------------------
		// Create new Channel instance
		// --------------------------------------

		$channel = new Channel;

		// --------------------------------------
		// Let the Channel module do all the heavy lifting
		// --------------------------------------

		return $channel->entries();
	}

	// --------------------------------------------------------------------

	/**
	 * Apply filters to current query
	 *
	 * @access     private
	 * @return     void
	 */
	private function _filters()
	{
		// This is now!
		$now = ee()->localize->now;

		// --------------------------------------
		// Filter by site
		// --------------------------------------

		ee()->db->where_in('t.site_id', array_values(ee()->TMPL->site_ids));

		// --------------------------------------
		// Filter by channel
		// --------------------------------------

		if ($channels = ee()->TMPL->fetch_param('channel'))
		{
			// Determine which channels to filter by
			list($channels, $in) = low_explode_param($channels);

			// Join channels table
			ee()->db->join('channels c', 't.channel_id = c.channel_id');
			ee()->db->{($in ? 'where_in' : 'where_not_in')}('c.channel_name', $channels);
		}

		// --------------------------------------
		// Filter by entry ID
		// --------------------------------------

		if ($entry_id = ee()->TMPL->fetch_param('entry_id'))
		{
			// Determine which statuses to filter by
			list($entry_id, $in) = low_explode_param($entry_id);

			// Adjust query accordingly
			ee()->db->{($in ? 'where_in' : 'where_not_in')}('t.entry_id', $entry_id);
		}

		// --------------------------------------
		// Filter by status - defaults to open
		// --------------------------------------

		if ($status = ee()->TMPL->fetch_param('status', 'open'))
		{
			// Determine which statuses to filter by
			list($status, $in) = low_explode_param($status);

			// Adjust query accordingly
			ee()->db->{($in ? 'where_in' : 'where_not_in')}('t.status', $status);
		}

		// --------------------------------------
		// Filter by expired entries
		// --------------------------------------

		if (ee()->TMPL->fetch_param('show_expired') != 'yes')
		{
			ee()->db->where("(t.expiration_date = '0' OR t.expiration_date > '{$now}')");
		}

		// --------------------------------------
		// Filter by future entries
		// --------------------------------------

		if (ee()->TMPL->fetch_param('show_future_entries') != 'yes')
		{
			ee()->db->where("t.entry_date < '{$now}'");
		}

		// --------------------------------------
		// Filter by category
		// --------------------------------------

		if ($categories_param = ee()->TMPL->fetch_param('category'))
		{
			// Determine which categories to filter by
			list($categories, $in) = low_explode_param($categories_param);

			if (strpos($categories_param, '&'))
			{
				// Execute query the old-fashioned way, so we don't interfere with active record
				// Get the entry ids that have all given categories assigned
				$query = ee()->db->query(
					"SELECT entry_id, COUNT(*) AS num
					FROM exp_category_posts
					WHERE cat_id IN (".implode(',', $categories).")
					GROUP BY entry_id HAVING num = ". count($categories));

				// If no entries are found, make sure we limit the query accordingly
				if ( ! ($entry_ids = low_flatten_results($query->result_array(), 'entry_id')))
				{
					$entry_ids = array(0);
				}

				ee()->db->where_in('entry_id', $entry_ids);
			}
			else
			{
				// Join category table
				ee()->db->join('category_posts cp', 'cp.entry_id = t.entry_id');
				ee()->db->{($in ? 'where_in' : 'where_not_in')}('cp.cat_id', $categories);
			}
		}

		// --------------------------------------
		// Filter by author_id
		// --------------------------------------

		if ($author_id = ee()->TMPL->fetch_param('author_id'))
		{
			// Allow for [NOT_]CURRENT_USER
			$author_id = str_replace('NOT_', 'not ', $author_id);
			$author_id = str_replace('CURRENT_USER', ee()->session->userdata('member_id'), $author_id);

			// Determine which statuses to filter by
			list($author_id, $in) = low_explode_param($author_id);

			// Adjust query accordingly
			ee()->db->{($in ? 'where_in' : 'where_not_in')}('t.author_id', $author_id);
		}
	}

	// --------------------------------------------------------------------

	/**
	 * Get ordered entry ids
	 *
	 * @access     private
	 * @return     array
	 */
	private function _get_entry_ids()
	{
		// --------------------------------------
		// Merge non-numeric and numeric fields
		// --------------------------------------

		$this->fields = array_merge($this->fields, $this->numeric_fields);

		// --------------------------------------
		// Check numeric fields
		// --------------------------------------

		if ($numeric_fields = ee()->TMPL->fetch_param('numeric_fields'))
		{
			list($numeric_fields, $in) = low_explode_param($numeric_fields);

			// Get proper field names
			$numeric_fields = array_map(array($this, '_get_field'), $numeric_fields);

			// Add to class property
			$this->numeric_fields = array_merge($this->numeric_fields, $numeric_fields);
		}

		// --------------------------------------
		// Get alpha_filter parameter
		// --------------------------------------

		$alpha_filter = ee()->TMPL->fetch_param('alpha_filter');

		// --------------------------------------
		// Turn 'yes' and 'no' back to 'y' and 'n'
		// --------------------------------------

		if (in_array($alpha_filter, array('yes', 'no')))
		{
			$alpha_filter = substr($alpha_filter, 0, 1);
		}

		// --------------------------------------
		// Check if alpha filter does not match a known filter, set it to FALSE
		// --------------------------------------

		if ( ! (preg_match('/^[a-z0-9](\-[a-z0-9])?$/', $alpha_filter)))
		{
			$alpha_filter = FALSE;
		}

		// --------------------------------------
		// Get numbers parameter
		// --------------------------------------

		$numbers = ee()->TMPL->fetch_param('numbers', 'before');

		// --------------------------------------
		// Check orderby parameter
		// --------------------------------------

		if ($orderby = ee()->TMPL->fetch_param('orderby'))
		{
			list($orderby, $in) = low_explode_param($orderby);

			// Get proper field names
			$orderby = array_map(array($this, '_get_field'), $orderby);
		}
		else
		{
			$orderby = array(LOW_ALPHABET_DEFAULT_FIELD);
		}

		// --------------------------------------
		// Get alpha_field
		// --------------------------------------

		$alpha_field = ($af = ee()->TMPL->fetch_param('alpha_field')) ? $this->_get_field($af) : $orderby[0];

		// --------------------------------------
		// Check sort parameter
		// --------------------------------------

		if ($sort = ee()->TMPL->fetch_param('sort'))
		{
			list($sort, $in) = low_explode_param($sort);
		}
		else
		{
			$sort = array('asc');
		}

		// --------------------------------------
		// Combine the orderby and sort arrays
		// --------------------------------------

		if (count($orderby) > count($sort))
		{
			$sort = array_pad($sort, count($orderby), 'asc');
		}
		elseif (count($orderby) < count($sort))
		{
			$sort = array_slice($sort, 0, count($orderby));
		}

		$this->sort_order = array_combine($orderby, $sort);
		unset($orderby, $sort);

		// --------------------------------------
		// Check to see if we need to join the channel_data table
		// And compose fields to select
		// --------------------------------------

		$join = FALSE;
		$select = array('t.entry_id');

		foreach ($this->sort_order AS $field => $sort)
		{
			if (in_array($field, $this->fields))
			{
				$select[] = "t.{$field}";
			}
			else
			{
				$join = TRUE;
				$select[] = "d.{$field}";
			}
		}

		// --------------------------------------
		// Initiate entries
		// --------------------------------------

		$entries = array();

		// --------------------------------------
		// Get search: parameter where clause
		// --------------------------------------

		$search_where = $this->_search_where('d.');

		// --------------------------------------
		// Get all titles and handle those; there
		// might be accents, punctuation or entities
		// present that we need to filter out.
		// We'll filter by site, channel and status.
		// The rest will be filtered by the Channel module
		// --------------------------------------

		ee()->db->select($select)->from('channel_titles t');

		// --------------------------------------
		// Join custom fields?
		// --------------------------------------

		if ($join || $search_where)
		{
			ee()->db->join('channel_data d', 't.entry_id = d.entry_id');

			if ($search_where) ee()->db->where(implode(' AND ', $search_where), NULL, FALSE);
		}

		// --------------------------------------
		// Apply filters
		// --------------------------------------

		$this->_filters();

		// --------------------------------------
		// Execute query
		// --------------------------------------

		$query = ee()->db->get();

		// --------------------------------------
		// Get ignore words
		// --------------------------------------

		$ignore_words = low_alphabet_ignore_words(ee()->TMPL->fetch_param('alpha_ignore'));

		// Set groups etc.
		$this->_set_ranges();

		// --------------------------------------
		// Loop through results, add entry ids to array
		// --------------------------------------

		foreach ($query->result_array() AS $row)
		{
			// Keep track of flag whether to add the result to the entry ids
			$add = TRUE;

			foreach (array_keys($this->sort_order) AS $field)
			{
				// Only prep field if it's not a numeric field
				if ( ! in_array($field, $this->numeric_fields))
				{
					// Clean the alpha fields
					$row[$field] = low_alphabet_prep_field($row[$field], $ignore_words);
				}
			}

			// Get first char
			$first = MB_ENABLED ? mb_substr($row[$alpha_field], 0, 1) : substr($row[$alpha_field], 0, 1);

			// If we have a char to filter by, check it
			if ($alpha_filter !== FALSE)
			{
				if ( ! isset($this->map[$first]) || $this->map[$first] != $alpha_filter)
				{
					$add = FALSE;
				}
			}

			// Add entry to entry_ids, and keep alpha field
			if ($add === TRUE)
			{
				$entry_id = $row['entry_id'];
				unset($row['entry_id']);
				$entries[$entry_id] = $row;
			}
		}

		// --------------------------------------
		// Check existing entry_id parameter
		// --------------------------------------

		if (isset(ee()->TMPL->tagparams['entry_id']) && strlen(ee()->TMPL->tagparams['entry_id']))
		{
			list($ids, $in) = low_explode_param(ee()->TMPL->tagparams['entry_id']);

			// Get array of found ids by getting the keys (gross)
			$gross_ids = array_keys($entries);

			// Either remove $ids from $entry_ids OR limit $entry_ids to $ids
			$method = $in ? 'array_intersect' : 'array_diff';

			// What we're left with, are the actual ids we need (net)
			$net_ids = $method($gross_ids, $ids);

			// Loop through these and unset non-existent ones
			foreach (array_diff($gross_ids, $net_ids) AS $id)
			{
				unset($entries[$id]);
			}
		}

		// --------------------------------------
		// Sort the entries
		// --------------------------------------

		uasort($entries, array($this, '_multi_alpha_sort'));

		// --------------------------------------
		// Put numbers at the end of the query array
		// --------------------------------------

		if ($numbers == 'after')
		{
			// Initiate letters and numbers array
			$letters = $numbers = array();

			// Loop through entries
			foreach ($entries AS $id => $row)
			{
				if (is_numeric(substr($row[$alpha_field], 0, 1)))
				{
					$numbers[] = $id;
				}
				else
				{
					$letters[] = $id;
				}
			}

			// merge letters and numbers, so numbers are at the end
			$entry_ids = array_merge($letters, $numbers);
		}
		else
		{
			// Regular order, just give me the keys, thank you
			$entry_ids = array_keys($entries);
		}

		// --------------------------------------
		// Add entries to cache, so the extension can use them
		// --------------------------------------

		low_set_cache(LOW_ALPHABET_PACKAGE, 'entries', $entries);
		// low_set_cache(LOW_ALPHABET_PACKAGE, 'ranges', $this->ranges);
		// low_set_cache(LOW_ALPHABET_PACKAGE, 'map', $this->map);

		return $entry_ids;
	}

	/**
	 * Check for {if low_alphabet_no_results}
	 *
	 * @access      private
	 * @return      void
	 */
	private function _prep_no_results()
	{
		// Shortcut to tagdata
		$td =& ee()->TMPL->tagdata;
		$open = 'if '.LOW_ALPHABET_PACKAGE.'_no_results';
		$close = '/if';

		// Check if there is a custom no_results conditional
		if (strpos($td, $open) !== FALSE && preg_match('#'.LD.$open.RD.'(.*?)'.LD.$close.RD.'#s', $td, $match))
		{
			$this->_log("Prepping {$open} conditional");

			// Check if there are conditionals inside of that
			if (stristr($match[1], LD.'if'))
			{
				$match[0] = ee()->functions->full_tag($match[0], $td, LD.'if', LD.'\/if'.RD);
			}

			// Set template's no_results data to found chunk
			ee()->TMPL->no_results = substr($match[0], strlen(LD.$open.RD), -strlen(LD.$close.RD));

			// Remove no_results conditional from tagdata
			$td = str_replace($match[0], '', $td);
		}
	}

	/**
	 * Return upper/lower case
	 *
	 * @access      private
	 * @param       string
	 * @param       string
	 * @return      string
	 */
	private function _case($str, $to = 'upper')
	{
		// Override for numbers label
		if ($str == LOW_ALPHABET_NUMBER_URL)
		{
			return ee()->TMPL->fetch_param('numbers_label', $str);
		}

		// Compose method
		$method = 'strto'.$to;

		// Strip to first letter, only if word="yes"
		if ( ! (ee()->TMPL->fetch_param('word', 'no') == 'yes'))
		{
			$str = substr($str, 0, 1);
		}

		// Return modified string
		return $method($str);
	}

	// --------------------------------------------------------------------

	/**
	 * Set internal ranges and map based on params
	 *
	 * @access      private
	 * @param       string
	 * @return      string
	 */
	private function _set_ranges()
	{
		// --------------------------------------
		// Reset
		// --------------------------------------

		$this->ranges = $this->map = array();

		// --------------------------------------
		// Define the ranges based on groups or default
		// --------------------------------------

		if ($groups = ee()->TMPL->fetch_param('alpha_groups'))
		{
			// Do it manually
			$this->ranges = explode('|', $groups);
		}
		else
		{
			// Default per letter
			$letters = range('a', 'z');
			$numbers = (ee()->TMPL->fetch_param('group_numbers') == 'yes')
				? array(LOW_ALPHABET_NUMBER_URL)
				: range(0, 9);

			// Add numbers to the ranges?
			switch(ee()->TMPL->fetch_param('numbers', 'before'))
			{
				case 'before':
					$this->ranges = array_merge($numbers, $letters);
				break;

				case 'after':
					$this->ranges = array_merge($letters, $numbers);
				break;

				default:
					$this->ranges = $letters;
			}
		}

		// --------------------------------------
		// Create map from ranges so we know which letter/number belongs to which range/group
		// --------------------------------------

		foreach ($this->ranges AS $range)
		{
			if (strlen($range) === 1)
			{
				// Single letter
				$this->map[$range] = $range;
			}
			elseif (preg_match('/^[a-z0-9]\-[a-z0-9]$/', $range))
			{
				// Range of letters: map each one
				list($from, $to) = explode('-', $range);

				foreach (range($from, $to) AS $x)
				{
					$this->map[$x] = $range;
				}
			}
		}
	}

	// --------------------------------------------------------------------

	/**
	 * Gets field id from field name
	 *
	 * @access      private
	 * @param       string
	 * @return      string
	 */
	private function _get_field($str)
	{
		// --------------------------------------
		// If field is in usable non-custom fields, just return that
		// --------------------------------------

		if (in_array($str, $this->fields))
		{
			return $str;
		}

		// --------------------------------------
		// Get custom channel fields from cache
		// --------------------------------------

		if ( ! ($fields = low_get_cache('channel', 'custom_channel_fields')))
		{
			// If not present, get them from the API
			// Takes some effort, but its reusable for others this way
			ee()->TMPL->log_item('Low Alphabet: Getting channel field info from API');

			ee()->load->library('api');
			ee()->api->instantiate('channel_fields');

			$fields = ee()->api_channel_fields->fetch_custom_channel_fields();

			foreach ($fields AS $key => $val)
			{
				low_set_cache('channel', $key, $val);
			}

			$fields = $fields['custom_channel_fields'];
		}

		// --------------------------------------
		// To be somewhat compatible with MSM,
		// get the first ID that matches,
		// not just for current site, but all given.
		// --------------------------------------

		// Initiate ID
		$it = 0;

		// Check active site IDs, return first match encountered
		foreach (ee()->TMPL->site_ids AS $site_id)
		{
			if (isset($fields[$site_id][$str]))
			{
				$it = $fields[$site_id][$str];
				break;
			}
		}

		return $it ? 'field_id_'.$it : LOW_ALPHABET_DEFAULT_FIELD;
	}

	/**
	 * Create a list of where-clauses for given search parameters
	 *
	 * @access     private
	 * @param      array
	 * @param      string
	 * @return     array
	 */
	private function _search_where($prefix = '')
	{
		// --------------------------------------
		// Initiate where array
		// --------------------------------------

		$where = $search = array();

		// --------------------------------------
		// Get search params
		// --------------------------------------

		foreach (ee()->TMPL->tagparams AS $key => $val)
		{
			if (substr($key, 0, 7) == 'search:')
			{
				$search[substr($key, 7)] = $val;
			}
		}

		// --------------------------------------
		// Loop through search filters and create where clause accordingly
		// --------------------------------------

		foreach ($search AS $key => $val)
		{
			// Get field
			$field = $this->_get_field($key);

			// Skip non-existent fields
			if ($field == LOW_ALPHABET_DEFAULT_FIELD || ! strlen($val)) continue;

			// Initiate some vars
			$exact = $all = FALSE;
			$field = $prefix.$field;

			// Exact matches
			if (substr($val, 0, 1) == '=')
			{
				$val   = substr($val, 1);
				$exact = TRUE;
			}

			// All items? -> && instead of |
			if (strpos($val, '&&') !== FALSE)
			{
				$all = TRUE;
			}

			// Convert parameter to bool and array
			list($items, $in) = low_explode_param($val);

			// Init sql for where clause
			$sql = array();

			// Loop through each sub-item of the filter an create sub-clause
			foreach ($items AS $item)
			{
				// Convert IS_EMPTY constant to empty string
				$empty = ($item == 'IS_EMPTY');
				$item  = str_replace('IS_EMPTY', '', $item);

				// greater/less than matches
				if (preg_match('/^([<>]=?)(\d+)$/', $item, $matches))
				{
					$gtlt = $matches[1];
					$item = $matches[2];
				}
				else
				{
					$gtlt = FALSE;
				}

				// whole word? Regexp search
				if (substr($item, -2) == '\W')
				{
					$operand = $in ? 'REGEXP' : 'NOT REGEXP';
					$item    = '[[:<:]]'.preg_quote(substr($item, 0, -2)).'[[:>:]]';
				}
				else
				{
					// Not a whole word
					if ($exact || $empty)
					{
						// Use exact operand if empty or = was the first char in param
						$operand = $in ? '=' : '!=';
						$item = "'".ee()->db->escape_str($item)."'";
					}
					// Greater/Less than option
					elseif ($gtlt !== FALSE)
					{
						$operand = $gtlt;
						$item = "'".ee()->db->escape_str($item)."'";
					}
					else
					{
						// Use like operand in all other cases
						$operand = $in ? 'LIKE' : 'NOT LIKE';
						$item = "'%".ee()->db->escape_str($item)."%'";
					}
				}

				// Add sub-clause to this statement
				$sql[] = sprintf("(%s %s %s)", $field, $operand, $item);
			}

			// Inclusive or exclusive
			$andor = $all ? ' AND ' : ' OR ';

			// Add complete clause to where array
			$where[] = '('.implode($andor, $sql).')';
		}

		// --------------------------------------
		// Where now contains a list of clauses
		// --------------------------------------

		return $where;
	}

	// --------------------------------------------------------------------

	/**
	 * Sorts the array of entries based on the sort order set in the class - used by uasort()
	 *
	 * @access      private
	 * @param       array
	 * @param       array
	 * @return      int
	 */
	private function _multi_alpha_sort($a, $b)
	{
		foreach ($this->sort_order AS $key => $sort)
		{
			if (in_array($key, $this->numeric_fields))
			{
				if ($a[$key] < $b[$key])
				{
					return ($sort == 'asc') ? -1 : 1;
				}
				elseif ($a[$key] > $b[$key])
				{
					return ($sort == 'asc') ? 1 : -1;
				}
				else
				{
					continue;
				}
			}
			else
			{
				if (strnatcasecmp($a[$key], $b[$key]) < 0)
				{
					return ($sort == 'asc') ? -1 : 1;
				}
				elseif (strnatcasecmp($a[$key], $b[$key]) > 0)
				{
					return ($sort == 'asc') ? 1 : -1;
				}
				else
				{
					continue;
				}
			}
		}

		return 0;
	}

}
// END CLASS

/* End of file pi.low_alphabet.php */