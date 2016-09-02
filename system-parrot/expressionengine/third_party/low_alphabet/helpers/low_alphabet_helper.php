<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Low Alphabet helper functions
 *
 * @package         low_alphabet
 * @author          Lodewijk Schutte ~ Low <hi@gotolow.com>
 * @copyright       Copyright (c) 2011-2014, Lodewijk Schutte
 * @link            http://gotolow.com/addons/low-alphabet
 */

// --------------------------------------------------------------

/**
 * Strip string from unwanted chars for better sorting
 *
 * @param       string    String to clean up
 * @param       array     Words to ignore at beginning of said string
 * @return      string
 */
if ( ! function_exists('low_alphabet_prep_field'))
{
	function low_alphabet_prep_field($str, $ignore = array())
	{
		static $chars = array();

		// --------------------------------------
		// Get translation array from native foreign_chars.php file
		// --------------------------------------

		if ( ! $chars)
		{
			// This will replace accented chars with non-accented chars
			if (file_exists(APPPATH.'config/foreign_chars.php'))
			{
				include APPPATH.'config/foreign_chars.php';

				if (isset($foreign_characters) && is_array($foreign_characters))
				{
					foreach ($foreign_characters AS $k => $v)
					{
						$chars[low_chr($k)] = $v;
					}
				}
			}

			// Punctuation characters and misc ascii symbols
			$punct = array(
				33,34,35,38,39,40,41,42,43,44,45,46,47,58,59,60,62,63,64,
				91,92,93,94,123,124,125,126,161,162,163,164,165,166,167,
				168,169,170,171,172,174,175,176,177,178,179,180,181,182,
				183,184,185,186,187,188,189,190,191,215,402,710,732,
				8211,8212,8213,8216,8217,8218,8220,8221,8222,8224,8225,
				8226,8227,8230,8240,8242,8243,8249,8250,8252,8254,8260,
				8364,8482,8592,8593,8594,8595,8596,8629,8656,8657,8658,
				8659,8660,8704,8706,8707,8709,8711,8712,8713,8715,8719,
				8721,8722,8727,8730,8733,8734,8736,8743,8744,8745,8746,
				8747,8756,8764,8773,8776,8800,8801,8804,8805,8834,8835,
				8836,8838,8839,8853,8855,8869,8901,8968,8969,8970,8971,
				9001,9002,9674,9824,9827,9829,9830
			);

			// Add punctuation characters to chars array
			foreach ($punct AS $k)
			{
				$chars[low_chr($k)] = ' ';
			}
		}

		// --------------------------------------
		// Get rid of tags
		// --------------------------------------

		$str = strip_tags($str);

		// --------------------------------------
		// Get rid of entities
		// --------------------------------------

		$str = html_entity_decode($str, ENT_QUOTES, (UTF8_ENABLED ? 'UTF-8' : 'ISO-8859-1'));

		// --------------------------------------
		// Replace accented chars with unaccented versions
		// --------------------------------------

		if ($chars)
		{
			$str = strtr($str, $chars);
		}

		// --------------------------------------
		// Get rid of non-alphanumeric chars
		// --------------------------------------

		$str = preg_replace('/[^\s0-9a-z]/iu', '', $str);

		// --------------------------------------
		// Strip out words to ignore
		// --------------------------------------

		if ($ignore)
		{
			// Escape values in ignore array
			$ignore = array_map('preg_quote', $ignore);

			// Strip them off if they're followed by white space
			$str = preg_replace('/^('.implode('|', $ignore).')\s/iu', '', trim($str));
		}

		// --------------------------------------
		// Return trimmed and in lowercase
		// --------------------------------------

		return strtolower(trim($str));
	}
}

// --------------------------------------------------------------------

/**
 * Get utf-8 character from ascii integer
 *
 * @access     public
 * @param      int
 * @return     string
 */
if ( ! function_exists('low_chr'))
{
	function low_chr($int)
	{
		return html_entity_decode('&#'.$int.';', ENT_QUOTES, (UTF8_ENABLED ? 'UTF-8' : NULL));
		//return mb_convert_encoding("&#{$int};", 'UTF-8', 'HTML-ENTITIES');
	}
}

// --------------------------------------------------------------

/**
 * Compare one field to another for better sorting, used for usort() callback
 *
 * @param       array
 * @param       array
 * @return      int
 */
if ( ! function_exists('low_alphabet_sort'))
{
	function low_alphabet_sort($a, $b)
	{
		if ( ! isset($a['low_alphabet_field']) || ! isset($b['low_alphabet_field']) || $a['low_alphabet_field'] == $b['low_alphabet_field']) return 0;
		return ($a['low_alphabet_field'] < $b['low_alphabet_field']) ? -1 : 1;
	}
}

// --------------------------------------------------------------

/**
 * Return an array of words from string, fallback to empty array
 *
 * @param       string
 * @return      array
 */
if ( ! function_exists('low_alphabet_ignore_words'))
{
	function low_alphabet_ignore_words($str)
	{
		return ($str) ? array_filter(explode('|', $str)) : array();
	}
}

// --------------------------------------------------------------------

/**
 * Converts EE parameter to workable php vars
 *
 * @access     public
 * @param      string    String like 'not 1|2|3' or '40|15|34|234'
 * @return     array     [0] = array of ids, [1] = boolean whether to include or exclude: TRUE means include, FALSE means exclude
 */
if ( ! function_exists('low_explode_param'))
{
	function low_explode_param($str)
	{
		// --------------------------------------
		// Initiate $in var to TRUE
		// --------------------------------------

		$in = TRUE;

		// --------------------------------------
		// Check if parameter is "not bla|bla"
		// --------------------------------------

		if (strtolower(substr($str, 0, 4)) == 'not ')
		{
			// Change $in var accordingly
			$in = FALSE;

			// Strip 'not ' from string
			$str = substr($str, 4);
		}

		// --------------------------------------
		// Return two values in an array
		// --------------------------------------

		return array(preg_split('/(&&?|\|)/', $str), $in);
	}
}

// --------------------------------------------------------------------

/**
 * Flatten results
 *
 * Given a DB result set, this will return an (associative) array
 * based on the keys given
 *
 * @param      array
 * @param      string    key of array to use as value
 * @param      string    key of array to use as key (optional)
 * @return     array
 */
if ( ! function_exists('low_flatten_results'))
{
	function low_flatten_results($resultset, $val, $key = FALSE)
	{
		$array = array();

		foreach ($resultset AS $row)
		{
			if ($key !== FALSE)
			{
				$array[$row[$key]] = $row[$val];
			}
			else
			{
				$array[] = $row[$val];
			}
		}

		return $array;
	}
}

// --------------------------------------------------------------

/**
 * Get cache value, either using the cache method (EE2.2+) or directly from cache array
 *
 * @param       string
 * @param       string
 * @return      mixed
 */
if ( ! function_exists('low_get_cache'))
{
	function low_get_cache($a, $b)
	{
		if (method_exists(ee()->session, 'cache'))
		{
			return ee()->session->cache($a, $b);
		}
		else
		{
			return (isset(ee()->session->cache[$a][$b]) ? ee()->session->cache[$a][$b] : FALSE);
		}
	}
}

// --------------------------------------------------------------

/**
 * Set cache value, either using the set_cache method (EE2.2+) or directly to cache array
 *
 * @param       string
 * @param       string
 * @param       mixed
 * @return      void
 */
if ( ! function_exists('low_set_cache'))
{
	function low_set_cache($a, $b, $c)
	{
		if (method_exists(ee()->session, 'set_cache'))
		{
			ee()->session->set_cache($a, $b, $c);
		}
		else
		{
			ee()->session->cache[$a][$b] = $c;
		}
	}
}

/* End of file low_alphabet_helper.php */