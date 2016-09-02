<?php
 // ----------------------------------------
//  Plugin information array
// ----------------------------------------

$plugin_info = array(
						'pi_name'			=> 'Candidates',
						'pi_version'		=> '1.0',
						'pi_author'			=> 'Sud Reddy',
						'pi_author_url'		=> 'https://www.codelab.ie/',
						'pi_description'	=> 'Handles Candidate Email and Activation',
						'pi_usage'			=> Candidates::usage()
					);
    
// ----------------------------------------
//  Plugin class
// ----------------------------------------

class candidates {
	
	
	//Trigger Email after email register
	//Redirects to success page on email trigger
	function send_email(){
		$first_name = ee()->TMPL->fetch_param('first_name');
		$email = ee()->TMPL->fetch_param('email');	
		$email_encoded = base64_encode($email);
		$activation_link = "http://www.it3sixty.co.uk/account/candidate-activate/{$email_encoded}";
		
		$build_email = "<html> <body>";
		$build_email .= "<p>Hi {$first_name},</p>";
		$build_email .= "<p>Thank you for registering for IT3Sixity Candidate profile. Please click the link below to activate your profile</p>";
		$build_email .= "<p><a href='{$activation_link}'>{$activation_link}</a></p>";
		$build_email .= "<p>Best regards,<br/>IT3Sixty.</p>"; 
		
		$to = $email;
		$subject = "Activate Account";
		$from =" do-not-reply@it3sixty.co.uk";
		$eol = PHP_EOL;
		$headers  = "From: ".$from.$eol;
		$headers .= "Return-Path: <do-not-reply@it3sixty.co.uk>\n";
		$headers .= "Content-Type: text/html; charset=\"utf-8\"".$eol;
		
		$mail = mail($to,$subject,$build_email,$headers);
		
		if($mail){
			header("Location: /account/register/candidate-success");
			exit;
		}
		
	}
	
	//Activate member based on the email
	//Redirect to login page after activation
	function activate_user(){
		$encoded_email = ee()->TMPL->fetch_param('email');
		$email = base64_decode($encoded_email);
		$query =   ee()->db->query("UPDATE exp_members SET group_id = 6 WHERE email = '$email'");
		
		if($query){
			header("Location: /account/activated");
			exit;
		}
		
	}
	//Activate member based on the email
	//Redirect to login page after activation
	function activate_employer(){
		$email = ee()->TMPL->fetch_param('email');

		$results =   ee()->db->query("SELECT member_id FROM exp_members WHERE email = '$email'");
		
		foreach($results->result_array() as $row){
	        $member_id = $row['member_id'];
	    }
		
		$query =   ee()->db->query("UPDATE exp_members SET group_id = '7' WHERE email = '$email'");
		$query =   ee()->db->query("UPDATE exp_channel_titles SET status = 'Employers-id7' WHERE author_id = '$member_id'");
		if($query){
			header("Location: /account/add-user/added/act");
			exit;
		}
	}
	
	function employer(){
		$logged_in_member_id = ee()->session->userdata('member_id');
		return $logged_in_member_id;
	}
	
	function checkifApplied(){
		
		$author_id = ee()->session->userdata('member_id');
		$entry_id = ee()->TMPL->fetch_param('entry_id');
		
		
		$query = ee()->db->query("SELECT count(*) as count FROM exp_comments WHERE author_id = '$author_id' AND entry_id = '$entry_id'");
		
		foreach($query->result_array() as $row){
	        $count = $row['count'];
	    }
	    
	    if($count>0){
		    return "color:red !important;";
	    }
	}
	
	// ----------------------------------------
	//  Plugin Usage
	// ----------------------------------------

	function usage()
	{
		ob_start(); 
?>

<?php
$buffer = ob_get_contents();
	
ob_end_clean(); 

return $buffer;
}
// END


}
// END CLASS
?>