<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {
	public function index(){
		$this->load->view('view_login');
	}
	public function login_validation(){
		$this->load->library('form_validation');
		$this->form_validation->set_rules('username','Username','required');
		$this->form_validation->set_rules('password','Password','required');
		if($this->form_validation->run())
		{
			$username=$this->input->post('username');
			$password=$this->input->post('password');
			$this->load->model('model_login');

			if($this->model_login->can_login($username,$password))
			{
				$session_data = array(
					'username' => $username,
					'password' => ($password),
					'status' => "sudahlogin"
					);
				$this->session->set_userdata($session_data);
				redirect(base_url() . 'login/enter');
			}
			else{
				$this->session->set_flashdata('error','Invalid Username or Password');
				redirect(base_url() . 'login/index');
			}
		}
		else{
			$this->index();
		}

	}
	
	public function enter(){
  		$username = $this->session->userdata('username');
   		if($username==""){
   		 redirect('login/index');
   		}
   		else{
    		redirect('main/dashboard');
  		}
 	}
	public function logout(){
		$this->session->unset_userdata('username');
		redirect(base_url('login/index'));
	}

}

