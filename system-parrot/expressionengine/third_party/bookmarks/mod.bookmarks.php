<?php

/*
=====================================================
 Bookmarks
-----------------------------------------------------
 http://www.intoeetive.com/
-----------------------------------------------------
 Copyright (c) 2012 Yuri Salimovskiy
=====================================================
 This software is intended for usage with
 ExpressionEngine CMS, version 2.0 or higher
=====================================================
 File: mod.bookmarks.php
-----------------------------------------------------
 Purpose: Lets people bookmark entries (and other data) for quick access
=====================================================
*/


if ( ! defined('BASEPATH'))
{
    exit('Invalid file request');
}


class Bookmarks {

    var $return_data	= ''; 						// Bah!
    
    var $settings = array();
    
    var $perpage = 25;
    
    var $types_table = array(
		'entry'		=> array(
						'table_name'	=>'exp_channel_titles',
						'field_name'	=>'entry_id',
						'group_field'	=>'channel_id'),
		'member'	=> array(
						'table_name'	=>'exp_members',
						'field_name'	=>'member_id',
						'group_field'	=>'group_id'),
		'comment'	=> array(
						'table_name'	=>'exp_comments',
						'field_name'	=>'comment_id',
						'group_field'	=>'channel_id'),
		'category'	=> array(
						'table_name'	=>'exp_categories',
						'field_name'	=>'cat_id',
						'group_field'	=>'group_id')
	);

    /** ----------------------------------------
    /**  Constructor
    /** ----------------------------------------*/

    function __construct()
    {        
    	$this->EE =& get_instance(); 
    	$this->EE->lang->loadfile('member');
    	$this->EE->lang->loadfile('content');
        $this->EE->lang->loadfile('bookmarks');
    }
    /* END */
    
    
    
    function check()
    {
    	$type = ($this->EE->TMPL->fetch_param('type')!='')?$this->EE->TMPL->fetch_param('type'):'entry';
    	
    	$data_id = ($this->EE->TMPL->fetch_param('entry_id')!='')?$this->EE->TMPL->fetch_param('entry_id'):(($this->EE->TMPL->fetch_param('data_id')!==false)?$this->EE->TMPL->fetch_param('data_id'):'');
    	if ($data_id=='' || $this->EE->session->userdata('member_id')==0)
    	{
    		return $this->EE->TMPL->no_results();
    	}
        
        $sites_arr = ($this->EE->TMPL->fetch_param('site_id')) ? explode("|", $this->EE->TMPL->fetch_param('site_id')) : array($this->EE->config->item('site_id'));
    	
    	$tagdata = $this->EE->TMPL->tagdata;
    	
    	$data = array();
    	
    	$cond = array();
    	$cond['bookmarked'] = $cond['added'] = false;
    	$cond['not_bookmarked'] = $cond['not_added'] = true;
    	
    	$q = $this->EE->db->select('bookmark_id')
				->from('bookmarks')
				->where('member_id', $this->EE->session->userdata('member_id'))
				->where_in('site_id', $sites_arr)
				->where('type', $type)
				->where('data_id', $data_id)
				->limit(1)
				->get();
		if ($q->num_rows()==0)
		{
			$action = 'add';
		}
		else
		{
			$cond['bookmarked'] = $cond['added'] = true;
    		$cond['not_bookmarked'] = $cond['not_added'] = false;
			$action = 'remove';
		}
		
		$tagdata = $this->EE->functions->prep_conditionals($tagdata, $cond);
    	
    	if ($this->EE->TMPL->fetch_param('form')=='yes')
    	{
	    	if ($this->EE->TMPL->fetch_param('return')=='')
	        {
	            $return = $this->EE->functions->fetch_site_index();
	        }
	        else if ($this->EE->TMPL->fetch_param('return')=='SAME_PAGE')
	        {
	            $return = $this->EE->functions->fetch_current_uri();
	        }
	        else if (strpos($this->EE->TMPL->fetch_param('return'), "http://")!==FALSE || strpos($this->EE->TMPL->fetch_param('return'), "https://")!==FALSE)
	        {
	            $return = $this->EE->TMPL->fetch_param('return');
	        }
	        else
	        {
	            $return = $this->EE->functions->create_url($this->EE->TMPL->fetch_param('return'));
	        }
	        
	        $data['hidden_fields']['ACT'] = $this->EE->functions->fetch_action_id('Bookmarks', $action);
			$data['hidden_fields']['RET'] = $return;
			$data['hidden_fields']['type'] = $type;
			if ($q->num_rows()==0)
			{
				$data['hidden_fields']['data_id'] = $data_id;
			}
			else
			{
				$data['hidden_fields']['bookmark_id'] = $q->row('bookmark_id');
			}			
				        
	        if ($this->EE->TMPL->fetch_param('ajax')=='yes') $data['hidden_fields']['ajax'] = 'yes';
	        if ($this->EE->TMPL->fetch_param('skip_success_message')=='yes')
	        {
	            $data['hidden_fields']['skip_success_message'] = 'y';
	        }
										      
	        $data['id']		= ($this->EE->TMPL->fetch_param('id')!='') ? $this->EE->TMPL->fetch_param('id') : 'bookmark_form_'.$type.'_'.$data_id;
	        $data['name']		= ($this->EE->TMPL->fetch_param('name')!='') ? $this->EE->TMPL->fetch_param('name') : 'bookmark_form';
	        $data['class']		= ($this->EE->TMPL->fetch_param('class')!='') ? $this->EE->TMPL->fetch_param('class') : 'bookmark_form';
	
	        $tagdata = $this->EE->functions->form_declaration($data).$tagdata."\n"."</form>";
 		}
   		
   		return $tagdata;
    	
    }
    
    
    
    

  
	function add($type='entry')
	{
		$ajax = ($this->EE->input->get_post('ajax')=='yes')?true:false;
		
		$data_id = ($this->EE->input->get_post('entry_id')!='')?$this->EE->input->get_post('entry_id'):(($this->EE->input->get_post('data_id')!==false)?$this->EE->input->get_post('data_id'):'');
		
		if ($this->EE->session->userdata('member_id')==0)
		{
			if ($ajax)
            {
                echo lang('error').": ".$this->EE->lang->line('must_be_logged_in');
                exit();
            }
            return $this->EE->output->show_user_error('general', array($this->EE->lang->line('must_be_logged_in')));
		}
		
		if ($data_id=='')
		{
			if ($ajax)
            {
                echo lang('error').": ".$this->EE->lang->line('invalid_data_id');
                exit();
            }
            return $this->EE->output->show_user_error('general', array($this->EE->lang->line('invalid_data_id')));
		}
		
		$type = ($this->EE->input->get_post('type')!='')?$this->EE->input->get_post('type'):$type;
		if (!array_key_exists($type, $this->types_table))
		{
			if ($ajax)
            {
                echo lang('error').": ".$this->EE->lang->line('invalid_data_type');
                exit();
            }
            return $this->EE->output->show_user_error('general', array($this->EE->lang->line('invalid_data_type')));
		}
		
		$q = $this->EE->db->select($this->types_table[$type]['group_field'])->from($this->types_table[$type]['table_name'])->where($this->types_table[$type]['field_name'], $data_id)->get();
		if ($q->num_rows()==0)
		{
			if ($ajax)
            {
                echo lang('error').": ".$this->EE->lang->line('invalid_data_id');
                exit();
            }
            return $this->EE->output->show_user_error('general', array($this->EE->lang->line('invalid_data_id')));
		}
		
		$group_id = $q->row($this->types_table[$type]['group_field']);
		
		$return = ($this->EE->input->get_post('RET')!==false)?$this->EE->input->get_post('RET'):$this->EE->config->item('site_url');
        $site_name = ($this->EE->config->item('site_name') == '') ? $this->EE->lang->line('back') : stripslashes($this->EE->config->item('site_name'));
            
        $message = array(	
						'title' 	=> lang('success'),
        				'heading'	=> lang('success'),
        				'content'	=> lang('bookmarked').' '.lang($type),
        				'redirect'	=> $return,
        				'link'		=> array($return, $site_name),
                        'rate'		=> 5
        			 );
		
		$q = $this->EE->db->select('bookmark_id')
				->from('bookmarks')
				->where('member_id', $this->EE->session->userdata('member_id'))
				->where('type', $type)
				->where('data_id', $data_id)
				->get();
		if ($q->num_rows()>0)
		{
			if ($ajax)
            {
                echo lang('error').": ".lang('already_bookmarked').' '.lang($type);
                exit();
            }
			$message['title'] = lang('warning');
			$message['heading'] = lang('warning');
			$message['content'] = lang('already_bookmarked').' '.lang($type);
			$this->EE->output->show_message($message);
			return;
		}
		
		$data = array(
			'member_id'		=> $this->EE->session->userdata('member_id'),
			'type'			=> $type,
			'site_id'		=> $this->EE->config->item('site_id'),
			'data_group_id' => $group_id,
			'data_id'		=> $data_id,
			'bookmark_date' => $this->EE->localize->now
		);
		$this->EE->db->insert('bookmarks', $data);
		
		// -------------------------------------------
		// 'bookmarks_bookmark_add_end' hook.
		//  - Do something when bookmark id added
		//
			if ($this->EE->extensions->active_hook('bookmarks_bookmark_add_end') === TRUE)
			{
				$edata = $this->EE->extensions->call('bookmarks_bookmark_add_end', $data, $this->EE->db->insert_id());
				if ($this->EE->extensions->end_script === TRUE) return $edata;
			}
		//
        // -------------------------------------------
		
		if ($ajax)
        {
            echo lang('bookmarked').' '.lang($type);
            exit();
        }
        
        if ($this->EE->input->get_post('skip_success_message')=='y')
        {
        	$this->EE->functions->redirect($return);
        }
		
		$this->EE->output->show_message($message);
	}









	function remove()
	{
		$ajax = ($this->EE->input->get_post('ajax')=='yes')?true:false;
		
		if ($this->EE->session->userdata('member_id')==0)
		{
			if ($ajax)
            {
                echo lang('error').": ".$this->EE->lang->line('must_be_logged_in');
                exit();
            }
            return $this->EE->output->show_user_error('general', array($this->EE->lang->line('must_be_logged_in')));
		}
		
		if ($this->EE->input->get_post('bookmark_id')=='' && $this->EE->input->get_post('data_id')=='')
		{
			if ($ajax)
            {
                echo lang('error').": ".$this->EE->lang->line('invalid_bookmark_id');
                exit();
            }
            return $this->EE->output->show_user_error('general', array($this->EE->lang->line('invalid_bookmark_id')));
		}
		
		$this->EE->db->select('bookmark_id, type')
				->from('bookmarks')
				->where('member_id', $this->EE->session->userdata('member_id'));
		if ($this->EE->input->get_post('data_id')!='')
		{
			$this->EE->db->where('data_id', $this->EE->input->get_post('data_id'));
			$this->EE->db->where('type', $this->EE->input->get_post('type'));
		}
		else
		{
			$this->EE->db->where('bookmark_id', $this->EE->input->get_post('bookmark_id'));
		}
		$q = $this->EE->db->get();
		if ($q->num_rows()==0)
		{
			if ($ajax)
            {
                echo lang('error').": ".$this->EE->lang->line('invalid_bookmark_id');
                exit();
            }
            return $this->EE->output->show_user_error('general', array($this->EE->lang->line('invalid_bookmark_id')));
		}
		
		$this->EE->db->where('bookmark_id', $q->row('bookmark_id'));
		$this->EE->db->delete('bookmarks');
		
		if ($ajax)
        {
            echo lang('removed_from_bookmarks').' '.lang($q->row('type'));
            exit();
        }
				
		$return = ($this->EE->input->get_post('RET')!==false)?$this->EE->input->get_post('RET'):$this->EE->config->item('site_url');
        $site_name = ($this->EE->config->item('site_name') == '') ? $this->EE->lang->line('back') : stripslashes($this->EE->config->item('site_name'));
        
        if ($this->EE->input->get_post('skip_success_message')=='y')
        {
        	$this->EE->functions->redirect($return);
        }
            
        $message = array(	
						'title' 	=> lang('success'),
        				'heading'	=> lang('success'),
        				'content'	=> lang('removed_from_bookmarks').' '.lang($q->row('type')),
        				'redirect'	=> $return,
        				'link'		=> array($return, $site_name),
                        'rate'		=> 5
        			 );
		
		$this->EE->output->show_message($message);
		
	}
	
	
	
	
	
	function _data($type='entry', $count_only=false)
	{
		if ($this->EE->TMPL->fetch_param('username')!==false)
		{
			$username = $this->EE->TMPL->fetch_param('username');
		}
		if (!isset($username))
		{
			$member_id = ($this->EE->TMPL->fetch_param('member_id')!==false)?$this->EE->TMPL->fetch_param('member_id'):$this->EE->session->userdata('member_id');
			if ($member_id==0)
			{
	            return array();
			}
		}
		if ($count_only!=false)
		{
			$this->EE->db->select('COUNT(data_id) as total_results');
		}
		else
		{
			$this->EE->db->select('data_id, bookmark_date');
		}
		$this->EE->db->from('exp_bookmarks');
		
		if (!isset($username))
		{	
			$this->EE->db->where('member_id', $member_id);
		}
		else
		{
			$this->EE->db->join('exp_members', 'exp_bookmarks.member_id=exp_members.member_id', 'left');
			$this->EE->db->where('username', $username);
		}
		
        $sites_arr = ($this->EE->TMPL->fetch_param('site_id')) ? explode("|", $this->EE->TMPL->fetch_param('site_id')) : array($this->EE->config->item('site_id'));
		$this->EE->db->where_in('exp_bookmarks.site_id', $sites_arr);
		if ($type!='all')
		{
			$this->EE->db->where('exp_bookmarks.type', $type);
		}
			
		$group_id = ($this->EE->TMPL->fetch_param('channel_id')!==false)?$this->EE->TMPL->fetch_param('channel_id'):$this->EE->TMPL->fetch_param('group_id');
		if ($group_id!=false)
		{
			$this->EE->db->where('exp_bookmarks.data_group_id', $group_id);
		}
		
		$q = $this->EE->db->get();
		
		if ($q->num_rows()==0)
		{
			return array();
		}
		
		if ($count_only!=false)
		{
			$bookmarks = $q->row('total_results');
		}
		else
		{	
			$bookmarks = array();
			foreach ($q->result_array() as $row)
			{
				$bookmarks[$row['data_id']] = $row['bookmark_date'];
			}
		}
		
		return $bookmarks;
	}
	
	
	function total()
	{
		$type = 'all';
		
		$bookmarks = $this->_data($type, true);
		if (strpos($this->EE->TMPL->tagdata, 'total_results') !== false) 
		{
			$variables = array(
				0 => array(
					'total_results' => $bookmarks
				)
			);

			$output = $this->EE->TMPL->parse_variables(trim($this->EE->TMPL->tagdata), $variables);
			return $output;
		}
		return $bookmarks;
	}
	
	
	
	function entries()
	{
		$type = 'entry';
		
		if ($this->EE->TMPL->fetch_param('total_only')=="yes")
		{
			$bookmarks = $this->_data($type, true);
			if (strpos($this->EE->TMPL->tagdata, 'total_results') !== false) 
			{
				$variables = array(
					0 => array(
						'total_results' => $bookmarks
					)
				);
	
				$output = $this->EE->TMPL->parse_variables(trim($this->EE->TMPL->tagdata), $variables);
				return $output;
			}
			return $bookmarks;
		}
		
		$bookmarks = $this->_data($type);
		if (empty($bookmarks))
		{
			return $this->EE->TMPL->no_results();
		}
		
		$var_prefix = ($this->EE->TMPL->fetch_param('prefix')!='') ? $this->EE->TMPL->fetch_param('prefix').':' : '';
		
		$ids = array_keys($bookmarks);
		
		if ($this->EE->TMPL->fetch_param('return_ids_string')=='yes')
		{
			$ids_string = $var_prefix.implode('|', $ids);
			$output = $this->EE->TMPL->swap_var_single('ids_string', $ids_string, $ids_string);
			return $output;
		}
		
        $sites_arr = ($this->EE->TMPL->fetch_param('site_id')) ? explode("|", $this->EE->TMPL->fetch_param('site_id')) : array($this->EE->config->item('site_id'));
        
		$join = array();
		$sql_what = "exp_channel_titles.*, exp_channels.channel_url, exp_channels.comment_url, exp_channels.channel_title";
		$join[] = array('exp_channels', 'exp_channel_titles.channel_id = exp_channels.channel_id', 'left');
		if ($this->EE->TMPL->fetch_param('custom_fields')=="yes")
		{
			$q = $this->EE->db->select('channel_id, channel_html_formatting, channel_allow_img_urls, channel_auto_link_urls')->from('exp_channels')->where_in('site_id', $sites_arr)->get();
			$channel_formatting = array();
			foreach ($q->result_array() as $row)
			{
				$channel_formatting[$row['channel_id']] = array(
					'html_format'	=> $row['channel_html_formatting'],
					'allow_img_url'	=> $row['channel_allow_img_urls'],
					'auto_links'	=> $row['channel_auto_link_urls']
				);
			}
			$q = $this->EE->db->select('field_id, field_name, field_fmt, channel_html_formatting, channel_allow_img_urls, channel_auto_link_urls')
					->from('exp_channel_fields')
					->join('exp_channels', 'exp_channels.field_group=exp_channel_fields.group_id', 'left')
					->where_in('exp_channel_fields.site_id', $sites_arr)
					->get();
			$field_formatting = array();
			foreach ($q->result_array() as $row)
			{
				$sql_what .= ", field_id_".$row['field_id']." AS `".$row['field_name']."`";
				$field_formatting[$row['field_name']] = array(
					'text_format'	=> ($row['field_fmt']=='' || $row['field_fmt']==NULL)?'none':$row['field_fmt'],
					'html_format'	=> $row['channel_html_formatting'],
					'allow_img_url'	=> $row['channel_allow_img_urls'],
					'auto_links'	=> $row['channel_auto_link_urls']
				);
			}
			$join[] = array('exp_channel_data', 'exp_channel_data.entry_id=exp_channel_titles.entry_id', 'left');
			
		}
		if ($this->EE->TMPL->fetch_param('member_data')=="yes")
		{
			$sql_what .= ", exp_members.*";
			$join[] = array('exp_members', 'exp_members.member_id=exp_channel_titles.author_id', 'left');
		}
		
		$this->EE->db->select($sql_what);
		$this->EE->db->from('exp_channel_titles');
		foreach ($join as $a)
		{
			$this->EE->db->join($a[0], $a[1], $a[2]);
		}
		$this->EE->db->where_in('exp_channel_titles.entry_id', $ids);
		
		$sort = (in_array($this->EE->TMPL->fetch_param('sort'), array('asc', 'desc', 'random'))) ? $this->EE->TMPL->fetch_param('sort') : 'desc';
		$this->EE->db->order_by('exp_channel_titles.entry_id', $sort);
		
		$query = $this->EE->db->get();
		
		if ($query->num_rows()==0)
		{
			return $this->EE->TMPL->no_results();
		}
		
		$act = $this->EE->db->query("SELECT action_id FROM exp_actions WHERE class='Bookmarks' AND method='remove'");
		
		$variables = array();

		foreach ($query->result_array() as $row)
		{
	
	        foreach ($row as $key=>$val)
            {
                $variable_row[$var_prefix.$key] = $val;
            }
	        if ($this->EE->TMPL->fetch_param('member_data')=="yes")
	        {
		        $variable_row[$var_prefix.'avatar_url'] = ($row['avatar_filename'] != '') ? $this->EE->config->slash_item('avatar_url').$row['avatar_filename'] : '';
	            $variable_row[$var_prefix.'photo_url'] = ($row['photo_filename'] != '') ? $this->EE->config->slash_item('photo_url').$row['photo_filename'] : '';
          	}
          	if ($this->EE->TMPL->fetch_param('custom_fields')=="yes")
	        {
	        	
				foreach ($field_formatting as $field=>$format)
				{
        			$variable_row[$var_prefix.$field] = array($row[$field], $format);
				}
				
        	}
            $variable_row[$var_prefix.'bookmark_date'] = $bookmarks[$row['entry_id']]; 
        	$variable_row[$var_prefix.'remove_url'] = trim($this->EE->config->item('site_url'), '/').'/?ACT='.$act->row('action_id').'&type='.$type.'&data_id='.$row['entry_id'];
        	if ($this->EE->TMPL->fetch_param('ajax')=='yes') $variable_row[$var_prefix.'remove_url'] .= '&ajax=yes';
	
	        $variables[] = $variable_row;
		}
		
		$output = $this->EE->TMPL->parse_variables(trim($this->EE->TMPL->tagdata), $variables);
		
		return $output;
		
	}
		
		
		
		
		
		
	function members()
	{
		$type = 'member';
		
		if ($this->EE->TMPL->fetch_param('total_only')=="yes")
		{
			$bookmarks = $this->_data($type, true);
			if (strpos($this->EE->TMPL->tagdata, 'total_results') !== false) 
			{
				$variables = array(
					0 => array(
						'total_results' => $bookmarks
					)
				);
	
				$output = $this->EE->TMPL->parse_variables(trim($this->EE->TMPL->tagdata), $variables);
				return $output;
			}
			return $bookmarks;
		}
		
		$bookmarks = $this->_data($type);
		if (empty($bookmarks))
		{
			return $this->EE->TMPL->no_results();
		}
		
		$var_prefix = ($this->EE->TMPL->fetch_param('prefix')!='') ? $this->EE->TMPL->fetch_param('prefix').':' : '';
		
		$ids = array_keys($bookmarks);
		
		if ($this->EE->TMPL->fetch_param('return_ids_string')=='yes')
		{
			$ids_string = $var_prefix.implode('|', $ids);
			$output = $this->EE->TMPL->swap_var_single('ids_string', $ids_string, $ids_string);
			return $output;
		}
		
		$join = array();
		$sql_what = "exp_members.*";
		if ($this->EE->TMPL->fetch_param('custom_fields')=="yes")
		{
			$q = $this->EE->db->select('m_field_id, m_field_name, m_field_fmt')
					->from('exp_member_fields')
					->get();
			$field_formatting = array();
			foreach ($q->result_array() as $row)
			{
				$sql_what .= ", m_field_id_".$row['m_field_id']." AS `".$row['m_field_name']."`";
				$field_formatting[$row['m_field_name']] = array(
					'text_format'	=> $row['m_field_fmt'],
					'html_format'	=> 'safe',
					'allow_img_url'	=> 'n',
					'auto_links'	=> 'y'
				);
			}
			$join[] = array('exp_member_data', 'exp_member_data.member_id=exp_members.member_id', 'left');
			
		}
		
		$this->EE->db->select($sql_what);
		$this->EE->db->from('exp_members');
		foreach ($join as $a)
		{
			$this->EE->db->join($a[0], $a[1], $a[2]);
		}
		$this->EE->db->where_in('exp_members.member_id', $ids);
		
		$sort = (in_array($this->EE->TMPL->fetch_param('sort'), array('asc', 'desc', 'random'))) ? $this->EE->TMPL->fetch_param('sort') : 'desc';
		$this->EE->db->order_by('exp_members.member_id', $sort);
		
		$query = $this->EE->db->get();
		
		if ($query->num_rows()==0)
		{
			return $this->EE->TMPL->no_results();
		}
		
		$act = $this->EE->db->query("SELECT action_id FROM exp_actions WHERE class='Bookmarks' AND method='remove'");
		
		$variables = array();

		foreach ($query->result_array() as $row)
		{
			unset($row["password"]);
			unset($row["unique_id"]);
			unset($row["crypt_key"]);
			unset($row["authcode"]);
	        foreach ($row as $key=>$val)
            {
                $variable_row[$var_prefix.$key] = $val;
            }

          	if ($this->EE->TMPL->fetch_param('custom_fields')=="yes")
	        {
				foreach ($field_formatting as $field=>$format)
				{
        			$variable_row[$var_prefix.$field] = array($row[$field], $format);
				}
        	}
        	
        	$variable_row[$var_prefix.'bookmark_date'] = $bookmarks[$row['member_id']]; 
        	$variable_row[$var_prefix.'remove_url'] = trim($this->EE->config->item('site_url'), '/').'/?ACT='.$act->row('action_id').'&type='.$type.'&data_id='.$row['member_id'];
        	if ($this->EE->TMPL->fetch_param('ajax')=='yes') $variable_row[$var_prefix.'remove_url'] .= '&ajax=yes';

	        $variables[] = $variable_row;
		}
		
		$output = $this->EE->TMPL->parse_variables(trim($this->EE->TMPL->tagdata), $variables);
		
		return $output;
		
	}
	
	
	
	
	
	
	
	function comments()
	{
		$type = 'comment';
		
		if ($this->EE->TMPL->fetch_param('total_only')=="yes")
		{
			$bookmarks = $this->_data($type, true);
			if (strpos($this->EE->TMPL->tagdata, 'total_results') !== false) 
			{
				$variables = array(
					0 => array(
						'total_results' => $bookmarks
					)
				);
	
				$output = $this->EE->TMPL->parse_variables(trim($this->EE->TMPL->tagdata), $variables);
				return $output;
			}
			return $bookmarks;
		}
		
		$bookmarks = $this->_data($type);
		if (empty($bookmarks))
		{
			return $this->EE->TMPL->no_results();
		}
		
		$var_prefix = ($this->EE->TMPL->fetch_param('prefix')!='') ? $this->EE->TMPL->fetch_param('prefix').':' : '';
		
		$ids = array_keys($bookmarks);
		
		if ($this->EE->TMPL->fetch_param('return_ids_string')=='yes')
		{
			$ids_string = $var_prefix.implode('|', $ids);
			$output = $this->EE->TMPL->swap_var_single('ids_string', $ids_string, $ids_string);
			return $output;
		}
		
		$join = array();
		$sql_what = "exp_comments.*, exp_channel_titles.title, exp_channel_titles.url_title, exp_channel_titles.author_id AS entry_author_id, exp_channels.comment_text_formatting, exp_channels.comment_html_formatting, exp_channels.comment_allow_img_urls, exp_channels.comment_auto_link_urls, exp_channels.channel_url, exp_channels.comment_url, exp_channels.channel_title ";
		$join[] = array('exp_channels', 'exp_comments.channel_id = exp_channels.channel_id', 'left');
		$join[] = array('exp_channel_titles', 'exp_comments.entry_id = exp_channel_titles.entry_id', 'left');

		if ($this->EE->TMPL->fetch_param('member_data')=="yes")
		{
			$sql_what .= ", exp_members.*";
			$join[] = array('exp_members', 'exp_members.member_id=exp_comments.author_id', 'left');
		}
		
		$this->EE->db->select($sql_what);
		$this->EE->db->from('exp_comments');
		foreach ($join as $a)
		{
			$this->EE->db->join($a[0], $a[1], $a[2]);
		}
		$this->EE->db->where_in('exp_comments.comment_id', $ids);
		
		$sort = (in_array($this->EE->TMPL->fetch_param('sort'), array('asc', 'desc', 'random'))) ? $this->EE->TMPL->fetch_param('sort') : 'desc';
		$this->EE->db->order_by('exp_comments.comment_id', $sort);
		
		$query = $this->EE->db->get();
		
		if ($query->num_rows()==0)
		{
			return $this->EE->TMPL->no_results();
		}
		
		$act = $this->EE->db->query("SELECT action_id FROM exp_actions WHERE class='Bookmarks' AND method='remove'");
		
		$variables = array();

		foreach ($query->result_array() as $row)
		{
			$format = array(
				'text_format'	=> $row['comment_text_formatting'],
				'html_format'	=> $row['comment_html_formatting'],
				'allow_img_url'	=> $row['comment_allow_img_urls'],
				'auto_links'	=> $row['channel_auto_link_urls']
			);
			$row['comment_url'] = ($row['comment_url']!='')?$row['comment_url']:$row['channel_url'];
	        foreach ($row as $key=>$val)
            {
                $variable_row[$var_prefix.$key] = $val;
            }
	        if ($this->EE->TMPL->fetch_param('member_data')=="yes")
	        {
		        $variable_row[$var_prefix.'avatar_url'] = ($row['avatar_filename'] != '') ? $this->EE->config->slash_item('avatar_url').$row['avatar_filename'] : '';
	            $variable_row[$var_prefix.'photo_url'] = ($row['photo_filename'] != '') ? $this->EE->config->slash_item('photo_url').$row['photo_filename'] : '';
          	}
          	
          	$variable_row[$var_prefix.'comment'] = array($row['comment'], $format);

			$variable_row[$var_prefix.'comment_auto_path'] = $row['comment_url'];     
			$variable_row[$var_prefix.'comment_url_title_auto_path'] = $row['comment_url'].$row['url_title'];     
			$variable_row[$var_prefix.'comment_entry_id_auto_path'] = $row['comment_url'].$row['entry_id'];     

            $variable_row[$var_prefix.'bookmark_date'] = $bookmarks[$row['comment_id']]; 
        	$variable_row[$var_prefix.'remove_url'] = trim($this->EE->config->item('site_url'), '/').'/?ACT='.$act->row('action_id').'&type='.$type.'&data_id='.$row['comment_id'];
        	if ($this->EE->TMPL->fetch_param('ajax')=='yes') $variable_row[$var_prefix.'remove_url'] .= '&ajax=yes';
	
	        $variables[] = $variable_row;
		}
		
		$output = $this->EE->TMPL->parse_variables(trim($this->EE->TMPL->tagdata), $variables);
		
		return $output;
	}
	
	
	
	
	
	
	
	function categories()
	{
		$type = 'category';
		
		if ($this->EE->TMPL->fetch_param('total_only')=="yes")
		{
			$bookmarks = $this->_data($type, true);
			if (strpos($this->EE->TMPL->tagdata, 'total_results') !== false) 
			{
				$variables = array(
					0 => array(
						'total_results' => $bookmarks
					)
				);
	
				$output = $this->EE->TMPL->parse_variables(trim($this->EE->TMPL->tagdata), $variables);
				return $output;
			}
			return $bookmarks;
		}
		
		$bookmarks = $this->_data($type);
		if (empty($bookmarks))
		{
			return $this->EE->TMPL->no_results();
		}
		
		$var_prefix = ($this->EE->TMPL->fetch_param('prefix')!='') ? $this->EE->TMPL->fetch_param('prefix').':' : '';
		
		$ids = array_keys($bookmarks);
		
		if ($this->EE->TMPL->fetch_param('return_ids_string')=='yes')
		{
			$ids_string = $var_prefix.implode('|', $ids);
			$output = $this->EE->TMPL->swap_var_single('ids_string', $ids_string, $ids_string);
			return $output;
		}
		
		$join = array();
		$sql_what = "exp_categories.*";
		if ($this->EE->TMPL->fetch_param('custom_fields')=="yes")
		{
			$q = $this->EE->db->select('group_id, field_html_formatting')->from('exp_category_groups')->where('site_id', $this->EE->config->item('site_id'))->get();
			$html_formatting = array();
			foreach ($q->result_array() as $row)
			{
				$html_formatting[$row['group_id']] = $row['field_html_formatting'];
			}
			
			$q = $this->EE->db->select('field_id, group_id, field_name')
					->from('exp_category_fields')
					->where_in('site_id', $sites_arr)
					->get();
			$field_formatting = array();
			foreach ($q->result_array() as $row)
			{
				$sql_what .= ", field_id_".$row['field_id']." AS `".$row['field_name']."`, field_ft_".$row['field_id'];
				$field_formatting[$row['field_name']] = array(
					'text_format'	=> "field_ft_".$row['field_id'],
					'html_format'	=> $html_formatting[$row['group_id']],
					'allow_img_url'	=> 'y',
					'auto_links'	=> 'n'
				);
			}
			$join[] = array('exp_category_field_data', 'exp_categories.cat_id=exp_category_field_data.cat_id', 'left');
			
		}
		
		$this->EE->db->select($sql_what);
		$this->EE->db->from('exp_categories');
		foreach ($join as $a)
		{
			$this->EE->db->join($a[0], $a[1], $a[2]);
		}
		$this->EE->db->where_in('exp_categories.cat_id', $ids);
		
		$sort = (in_array($this->EE->TMPL->fetch_param('sort'), array('asc', 'desc', 'random'))) ? $this->EE->TMPL->fetch_param('sort') : 'desc';
		$this->EE->db->order_by('exp_categories.cat_id', $sort);
		
		$query = $this->EE->db->get();
		
		if ($query->num_rows()==0)
		{
			return $this->EE->TMPL->no_results();
		}
		
		$act = $this->EE->db->query("SELECT action_id FROM exp_actions WHERE class='Bookmarks' AND method='remove'");
		
		$variables = array();

		foreach ($query->result_array() as $row)
		{
			foreach ($row as $key=>$val)
			{
				$new_key = str_replace('cat_', 'category_', $key);
				$variable_row[$var_prefix.$new_key] = $val;
			}

          	if ($this->EE->TMPL->fetch_param('custom_fields')=="yes")
	        {
				foreach ($field_formatting as $field=>$format)
				{
        			$format['text_format'] = $row[$format['text_format']];
					$variable_row[$var_prefix.$field] = array($row[$field], $format);
				}
        	}
        	
        	$variable_row[$var_prefix.'bookmark_date'] = $bookmarks[$row['cat_id']]; 
        	$variable_row[$var_prefix.'remove_url'] = trim($this->EE->config->item('site_url'), '/').'/?ACT='.$act->row('action_id').'&type='.$type.'&data_id='.$row['cat_id'];
        	if ($this->EE->TMPL->fetch_param('ajax')=='yes') $variable_row[$var_prefix.'remove_url'] .= '&ajax=yes';

	        $variables[] = $variable_row;
		}

		$output = $this->EE->TMPL->parse_variables(trim($this->EE->TMPL->tagdata), $variables);
		
		return $output;
	}
	
	
	
	
	
	
	
	
	function by()
	{
		$type = ($this->EE->TMPL->fetch_param('type')!='')?$this->EE->TMPL->fetch_param('type'):'entry';
		$data_id = ($this->EE->TMPL->fetch_param('entry_id')!='')?$this->EE->TMPL->fetch_param('entry_id'):(($this->EE->TMPL->fetch_param('data_id')!='')?$this->EE->TMPL->fetch_param('data_id'):'');
		
		if ($data_id=='')
		{
			return $this->EE->TMPL->no_results();
		}
		
		if ($this->EE->TMPL->fetch_param('total_only')=="yes")
		{
			$this->EE->db->select('COUNT(bookmark_id) AS total_results');
			$this->EE->db->from('bookmarks');
			$this->EE->db->where('data_id', $data_id);
			$this->EE->db->where('type', $type);
			$query = $this->EE->db->get();

			if (strpos($this->EE->TMPL->tagdata, 'total_results') !== false) 
			{
				$variables = array(
					0 => array(
						'total_results' => $query->row('total_results')
					)
				);
	
				$output = $this->EE->TMPL->parse_variables(trim($this->EE->TMPL->tagdata), $variables);
				return $output;
			}
			return $query->row('total_results');
		}
		
		$var_prefix = ($this->EE->TMPL->fetch_param('prefix')!='') ? $this->EE->TMPL->fetch_param('prefix').':' : '';
		
		$join = array();
		$sql_what = "exp_members.*";
		$join[] = array('exp_bookmarks', 'exp_members.member_id=exp_bookmarks.member_id', 'left');
		if ($this->EE->TMPL->fetch_param('custom_fields')=="yes")
		{
			$q = $this->EE->db->select('m_field_id, m_field_name, m_field_fmt')
					->from('exp_member_fields')
					->get();
			$field_formatting = array();
			foreach ($q->result_array() as $row)
			{
				$sql_what .= ", m_field_id_".$row['m_field_id']." AS `".$row['m_field_name']."`";
				$field_formatting[$row['m_field_name']] = array(
					'text_format'	=> $row['m_field_fmt'],
					'html_format'	=> 'safe',
					'allow_img_url'	=> 'n',
					'auto_links'	=> 'y'
				);
			}
			$join[] = array('exp_member_data', 'exp_member_data.member_id=exp_members.member_id', 'left');
			
		}
		
		$this->EE->db->select($sql_what);
		$this->EE->db->from('exp_members');
		foreach ($join as $a)
		{
			$this->EE->db->join($a[0], $a[1], $a[2]);
		}
		$this->EE->db->where('data_id', $data_id);
		$this->EE->db->where('type', $type);
		$query = $this->EE->db->get();
		
		if ($query->num_rows()==0)
		{
			return $this->EE->TMPL->no_results();
		}
		
		$variables = array();

		foreach ($query->result_array() as $row)
		{
	
	        unset($row["password"]);
			unset($row["unique_id"]);
			unset($row["crypt_key"]);
			unset($row["authcode"]);
			foreach ($row as $key=>$val)
            {
                $variable_row[$var_prefix.$key] = $val;
            }

          	if ($this->EE->TMPL->fetch_param('custom_fields')=="yes")
	        {
				foreach ($field_formatting as $field=>$format)
				{
        			$variable_row[$var_prefix.$field] = array($row[$field], $format);
				}
        	}
        	
        	$variable_row[$var_prefix.'avatar_url'] = ($row['avatar_filename'] != '') ? $this->EE->config->slash_item('avatar_url').$row['avatar_filename'] : '';
         	$variable_row[$var_prefix.'photo_url'] = ($row['photo_filename'] != '') ? $this->EE->config->slash_item('photo_url').$row['photo_filename'] : '';

	        $variables[] = $variable_row;
		}
		
		$output = $this->EE->TMPL->parse_variables(trim($this->EE->TMPL->tagdata), $variables);
		
		return $output;
		
	}


}
/* END */
?>