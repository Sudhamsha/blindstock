<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

if (!function_exists('get_zoo_settings')) {
	function get_zoo_settings($EE, $force_refresh = FALSE)
	{
		$class    = ZOO_VISITOR_CLASS;
		$settings = FALSE;

		if (!isset($EE->session->cache['zoo'][$class]['settings']) || empty($EE->session->cache['zoo'][$class]['settings']) || $force_refresh === TRUE) {

			if ($EE->db->table_exists('zoo_visitor_settings')) {

				$settings = array();

				$sql    = "SELECT * FROM " . $EE->db->dbprefix('zoo_visitor_settings') . " WHERE site_id = '" . $EE->config->item('site_id') . "'";
				$result = $EE->db->query($sql);
				if ($result->num_rows() > 0) {
					foreach ($result->result_array() as $row) {
						$settings[$row['var']]           = $row['var_value'];
						$settings["fields"][$row['var']] = $row['var_fieldtype'];
					}
				}

				if (isset($settings['member_channel_id'])) {
					$sql    = "SELECT * FROM " . $EE->db->dbprefix('channels') . " WHERE channel_id = '" . $settings['member_channel_id'] . "'"; // AND site_id = '".$EE->config->item('site_id')."'";
					$result = $EE->db->query($sql);
					if ($result->num_rows() > 0) {
						$settings['member_channel_name'] = $result->row()->channel_name;
					}
				}

				$EE->session->cache['zoo'][$class]['settings'] = $settings;
			}

		}

		if (!empty($EE->session->cache['zoo'][$class]['settings']) && count($EE->session->cache['zoo'][$class]['settings']) > 0) {
			$settings = $EE->session->cache['zoo'][$class]['settings'];
		}

		return $settings;
	}
}

if (!function_exists('format_status')) {
	function format_status($group_title, $group_id)
	{
		return preg_replace("/[^a-z0-9_]/i", '_', $group_title) . '-id' . $group_id;
	}
}

if (!function_exists('clean_ajax_string')) {
	function clean_ajax_string($str)
	{
		if (strpos($str, 'img')) {
			return addslashes($str);
		} else {
			return htmlentities($str, ENT_QUOTES, "UTF-8");
		}

	}
}

if (!function_exists('contains_native_member_fields')) {
	function contains_native_member_fields()
	{
		$native_member_fields      = FALSE;
		$native_member_fields_data = array();
		foreach ($_POST as $key => $value) {
			if (strpos($key, 'm_field_id_') !== FALSE) {
				$native_member_fields_data[$key] = $value;
				$native_member_fields            = TRUE;
			}
		}

		return ($native_member_fields) ? $native_member_fields_data : FALSE;
	}
}

function get_error_delimiters($EE)
{

	$delimiter_param = (isset($_POST) && isset($_POST['zoo_visitor_error_delimiters'])) ? $_POST['zoo_visitor_error_delimiters'] : $EE->TMPL->fetch_param('error_delimiters', '');

	$delimiter = explode('|', $delimiter_param);
	$delimiter = (count($delimiter) == 2) ? $delimiter : array('', '');
	return $delimiter;
}

function prep_errors($EE, $errors)
{
	$error_delimiters = get_error_delimiters($EE);
	$prepped_errors   = array();
	if (isset($errors) && count($errors) > 0) {
		foreach ($errors as $key => $error) {
			$prepped_errors[$key] = $error_delimiters[0] . $error . $error_delimiters[1];
		}
	}
	return $prepped_errors;
}

function encrypt_input($EE, $input)
{

	if (!function_exists('mcrypt_encrypt')) {
		return base64_encode($input . md5($EE->session->sess_crypt_key . $input));
	}

	return base64_encode(mcrypt_encrypt(
		MCRYPT_RIJNDAEL_256,
		md5($EE->session->sess_crypt_key),
		$input,
		MCRYPT_MODE_ECB,
		mcrypt_create_iv(mcrypt_get_iv_size(MCRYPT_RIJNDAEL_256, MCRYPT_MODE_ECB), MCRYPT_RAND)
	));
}


function decrypt_input($EE, $input, $xss_clean = TRUE)
{

	if (function_exists('mcrypt_encrypt')) {
		$decoded = rtrim(
			mcrypt_decrypt(
				MCRYPT_RIJNDAEL_256,
				md5($EE->session->sess_crypt_key),
				base64_decode($input),
				MCRYPT_MODE_ECB,
				mcrypt_create_iv(mcrypt_get_iv_size(MCRYPT_RIJNDAEL_256, MCRYPT_MODE_ECB), MCRYPT_RAND)
			),
			"\0"
		);
	}
	else {
		$raw = base64_decode($input);

		$decoded = substr($raw, 0, -32);

		if (substr($raw, -32) !== md5($EE->session->sess_crypt_key . $decoded)) {
			return '';
		}
	}

	return ($xss_clean) ? $EE->security->xss_clean($decoded) : $decoded;
}

function _theme_url($EE)
{
	$theme_folder_url                     = defined('URL_THIRD_THEMES') ? URL_THIRD_THEMES : $EE->config->slash_item('theme_folder_url') . 'third_party/';

	return $theme_folder_url. 'zoo_visitor/';
}

?>