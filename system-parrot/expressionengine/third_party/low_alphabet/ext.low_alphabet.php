<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

// include config file
include PATH_THIRD.'low_alphabet/config.php';

/**
 * Low Alphabet extension class
 *
 * @package         low_alphabet
 * @author          Lodewijk Schutte ~ Low <hi@gotolow.com>
 * @copyright       Copyright (c) 2011-2014, Lodewijk Schutte
 * @link            http://gotolow.com/addons/low-alphabet
 */
class Low_alphabet_ext {

	// --------------------------------------------------------------------
	// PROPERTIES
	// --------------------------------------------------------------------

	/**
	 * Extension settings
	 *
	 * @access      public
	 * @var         array
	 */
	public $settings = array();

	/**
	 * Extension name
	 *
	 * @access      public
	 * @var         string
	 */
	public $name = LOW_ALPHABET_NAME;

	/**
	 * Extension version
	 *
	 * @access      public
	 * @var         string
	 */
	public $version = LOW_ALPHABET_VERSION;

	/**
	 * Extension description
	 *
	 * @access      public
	 * @var         string
	 */
	public $description = 'Allows for proper alphabetical sorting and grouping of channel entries';

	/**
	 * Do settings exist?
	 *
	 * @access      public
	 * @var         bool
	 */
	public $settings_exist = FALSE;

	/**
	 * Documentation link
	 *
	 * @access      public
	 * @var         string
	 */
	public $docs_url = LOW_ALPHABET_DOCS;

	// --------------------------------------------------------------------

	/**
	 * Current class name
	 *
	 * @access      private
	 * @var         string
	 */
	private $class_name;

	// --------------------------------------------------------------------
	// METHODS
	// --------------------------------------------------------------------

	/**
	 * PHP 5 Constructor
	 *
	 * @access      public
	 * @param       mixed     Array with settings or FALSE
	 * @return      null
	 */
	public function __construct($settings = FALSE)
	{
		// Set Class name
		$this->class_name = ucfirst(LOW_ALPHABET_PACKAGE.'_ext');

		// Set settings
		$this->settings = $settings;
	}

	// --------------------------------------------------------------------

	/**
	 *
	 * @param       object    Current Channel object
	 * @param       array     DB result set
	 * @return      array
	 */
	public function channel_entries_query_result($obj, $query)
	{
		// -------------------------------------------
		// Get the latest version of $query
		// -------------------------------------------

		if (ee()->extensions->last_call !== FALSE)
		{
			$query = ee()->extensions->last_call;
		}

		// --------------------------------------
		// Don't do anything if parameter isn't set properly
		// --------------------------------------

		if (ee()->TMPL->fetch_param('low_alphabet') != 'yes') return $query;

		// --------------------------------------
		// Get entries from cache
		// --------------------------------------

		$entries = low_get_cache(LOW_ALPHABET_PACKAGE, 'entries');

		// --------------------------------------
		// Loop through query result to set alpha title
		// --------------------------------------

		foreach ($query AS $i => &$row)
		{
			// Fetch field from cache
			$entry = (array) @$entries[$row['entry_id']];

			// Clean up the field
			$row['low_alphabet_field'] = implode(' ', $entry);

			// Set the letter
			$row['low_alphabet_letter'] = strtolower(substr($row['low_alphabet_field'], 0, 1));
		}

		// --------------------------------------
		// Are we grouping numbers?
		// --------------------------------------

		$group_numbers = (ee()->TMPL->fetch_param('group_numbers') == 'yes');

		// --------------------------------------
		// Do we have a custom label for grouped numbers?
		// --------------------------------------

		$numbers_label = ee()->TMPL->fetch_param('numbers_label', LOW_ALPHABET_NUMBER_URL);

		// --------------------------------------
		// Heading / Footer vars for conditionals
		// First, let's keep track of last letter encountered
		// --------------------------------------

		$last_letter = FALSE;

		// --------------------------------------
		// Loop through query again to set heading and footer vars
		// --------------------------------------

		foreach ($query AS $i => &$row)
		{
			// Initiate heading and footer vars to empty string
			$row['low_alphabet_heading'] = $row['low_alphabet_footer'] = '';

			// Set current letter
			$current_letter = $row['low_alphabet_letter'];

			// Set next letter
			$next_letter = (isset($query[$i+1])) ? $query[$i+1]['low_alphabet_letter'] : FALSE;

			// Set numeric letters to the same number if group
			if ($group_numbers)
			{
				if (is_numeric($current_letter)) $current_letter = LOW_ALPHABET_NUMBER_URL;
				if (is_numeric($next_letter)) $next_letter = LOW_ALPHABET_NUMBER_URL;
			}

			// If next letter differs from the current letter,
			// set footer to y
			if ($current_letter != $next_letter || $next_letter === FALSE)
			{
				$row['low_alphabet_footer'] = 'y';
			}

			// If previous letter differs from the current letter,
			// set header to y
			if ($last_letter != $current_letter)
			{
				$row['low_alphabet_heading'] = 'y';
				$last_letter = ($group_numbers && is_numeric($current_letter)) ? LOW_ALPHABET_NUMBER_URL : $current_letter;
			}

			// Save letter / label in current row
			$row['low_alphabet_url']   = $current_letter;
			$row['low_alphabet_label'] = ($current_letter == LOW_ALPHABET_NUMBER_URL) ? $numbers_label : strtoupper($current_letter);

			// Unset the letter
			unset($row['low_alphabet_letter']);
		}

		// --------------------------------------
		// Return modified query array
		// --------------------------------------

		return $query;
	}

	// --------------------------------------------------------------------

	/**
	 * Activate extension
	 *
	 * @access      public
	 * @return      null
	 */
	public function activate_extension()
	{
		foreach (array('channel_entries_query_result') AS $hook)
		{
			// Insert hook in DB
			ee()->db->insert('extensions', array(
				'class'     => $this->class_name,
				'method'    => $hook,
				'hook'      => $hook,
				'priority'  => 1,
				'version'   => LOW_ALPHABET_VERSION,
				'enabled'   => 'y',
				'settings'  => ''
			));
		}
	}

	// --------------------------------------------------------------------

	/**
	 * Update extension
	 *
	 * @access      public
	 * @param       string    Saved extension version
	 * @return      null
	 */
	public function update_extension($current = '')
	{
		if ($current == '' OR $current == LOW_ALPHABET_VERSION)
		{
			return FALSE;
		}

		// init data array
		$data = array();

		// Add version to data array
		$data['version'] = LOW_ALPHABET_VERSION;

		// Update records using data array
		ee()->db->where('class', $this->class_name);
		ee()->db->update('extensions', $data);
	}

	// --------------------------------------------------------------------

	/**
	 * Disable extension
	 *
	 * @access      public
	 * @return      null
	 */
	public function disable_extension()
	{
		// Delete records
		ee()->db->where('class', $this->class_name);
		ee()->db->delete('extensions');
	}

	// --------------------------------------------------------------------

}
// END CLASS

/* End of file ext.low_alphabet.php */