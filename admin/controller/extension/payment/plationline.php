<?php
error_reporting(0);
ini_set('display_errors',0);
class ControllerExtensionPaymentPlatiOnline extends Controller {
	private $error = array(); 

	public function index() {
		$this->load->language('extension/payment/plationline');

		$this->document->setTitle($this->language->get('heading_title') . ' - ' . $this->language->get('text_PO_version'));
		
		$this->load->model('setting/setting');
			
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			unset($this->request->post['plationline']);

			$this->model_setting_setting->editSetting('plationline', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/payment/plationline', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data = $this->get_all_po_statuses();

		$data['heading_title'] = $this->language->get('heading_title');
		$data['link'] = $this->language->get('text_PO_image');
		$data['text_PO_version'] = $this->language->get('text_PO_version');
		$data['text_fill_required_info'] = $this->language->get('text_fill_required_info');

		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_all_zones'] = $this->language->get('text_all_zones');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		
		$data['entry_f_login'] 						= $this->language->get('entry_f_login');
		$data['entry_rsa_auth'] 					= $this->language->get('entry_rsa_auth');
		$data['entry_rsa_itsn'] 					= $this->language->get('entry_rsa_itsn');
		$data['entry_iv_auth'] 						= $this->language->get('entry_iv_auth');
		$data['entry_iv_itsn'] 						= $this->language->get('entry_iv_itsn');
		$data['entry_relay_method'] 				= $this->language->get('entry_relay_method');
		$data['entry_itsn_method'] 					= $this->language->get('entry_itsn_method');
		$data['entry_info_itsn_url'] 				= $this->language->get('entry_info_itsn_url');
		$data['entry_test'] 						= $this->language->get('entry_test');
		$data['entry_total'] 						= $this->language->get('entry_total');	
		$data['entry_order_status'] 				= $this->language->get('entry_order_status');	
		
		$data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		$data['tab_general'] = $this->language->get('tab_general');
		 
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		if (isset($this->error['f_login'])) {
			$data['error_f_login'] = $this->error['f_login'];
		} else {
			$data['error_f_login'] = '';
		}	

		if (isset($this->error['rsa_auth'])) {
			$data['error_rsa_auth'] = $this->error['rsa_auth'];
		} else {
			$data['error_rsa_auth'] = '';
		}	

		if (isset($this->error['rsa_itsn'])) {
			$data['error_rsa_itsn'] = $this->error['rsa_itsn'];
		} else {
			$data['error_rsa_itsn'] = '';
		}

		if (isset($this->error['iv_auth'])) {
			$data['error_iv_auth'] = $this->error['iv_auth'];
		} else {
			$data['error_iv_auth'] = '';
		}	

		if (isset($this->error['iv_itsn'])) {
			$data['error_iv_itsn'] = $this->error['iv_itsn'];
		} else {
			$data['error_iv_itsn'] = '';
		}

		if (isset($this->error['relay_method'])) {
			$data['error_relay_method'] = $this->error['relay_method'];
		} else {
			$data['error_relay_method'] = '';
		}	

		if (isset($this->error['itsn_method'])) {
			$data['error_itsn_method'] = $this->error['itsn_method'];
		} else {
			$data['error_itsn_method'] = '';
		}

  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),       		
      		'separator' => false
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_payment'),
			'href'      => $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('extension/payment/plationline', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
				
		$data['action'] = $this->url->link('extension/payment/plationline', 'token=' . $this->session->data['token'], 'SSL');
		
		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL');
		
		if (isset($this->request->post['plationline_f_login'])) {
			$data['plationline_f_login'] = $this->request->post['plationline_f_login'];
		} else {
			$data['plationline_f_login'] = $this->config->get('plationline_f_login');
		}

		if (isset($this->request->post['plationline_rsa_auth'])) {
			$data['plationline_rsa_auth'] = $this->request->post['plationline_rsa_auth'];
		} else {
			$data['plationline_rsa_auth'] = $this->config->get('plationline_rsa_auth');
		}

		if (isset($this->request->post['plationline_rsa_itsn'])) {
			$data['plationline_rsa_itsn'] = $this->request->post['plationline_rsa_itsn'];
		} else {
			$data['plationline_rsa_itsn'] = $this->config->get('plationline_rsa_itsn');
		}

		if (isset($this->request->post['plationline_iv_auth'])) {
			$data['plationline_iv_auth'] = $this->request->post['plationline_iv_auth'];
		} else {
			$data['plationline_iv_auth'] = $this->config->get('plationline_iv_auth');
		}

		if (isset($this->request->post['plationline_iv_itsn'])) {
			$data['plationline_iv_itsn'] = $this->request->post['plationline_iv_itsn'];
		} else {
			$data['plationline_iv_itsn'] = $this->config->get('plationline_iv_itsn');
		}

		if (isset($this->request->post['plationline_relay_method'])) {
			$data['plationline_relay_method'] = $this->request->post['plationline_relay_method'];
		} else {
			$data['plationline_relay_method'] = $this->config->get('plationline_relay_method');
		}

		if (isset($this->request->post['plationline_itsn_method'])) {
			$data['plationline_itsn_method'] = $this->request->post['plationline_itsn_method'];
		} else {
			$data['plationline_itsn_method'] = $this->config->get('plationline_itsn_method');
		}

		if (isset($this->request->post['plationline_test'])) {
			$data['plationline_test'] = $this->request->post['plationline_test'];
		} else {
			$data['plationline_test'] = $this->config->get('plationline_test');
		}

		if (isset($this->request->post['plationline_total'])) {
			$data['plationline_total'] = $this->request->post['plationline_total'];
		} else {
			$data['plationline_total'] = $this->config->get('plationline_total'); 
		} 
		
		if (isset($this->request->post['plationline_order_status_pending_id'])) {
			$data['plationline_order_status_pending_id'] = $this->request->post['plationline_order_status_pending_id'];
		} else {
			$data['plationline_order_status_pending_id'] = $this->config->get('plationline_order_status_pending_id'); 
		}
		
		if (isset($this->request->post['plationline_order_status_id'])) {
			$data['plationline_order_status_id'] = $this->request->post['plationline_order_status_id'];
		} else {
			$data['plationline_order_status_id'] = $this->config->get('plationline_order_status_id'); 
		}

		if (isset($this->request->post['plationline_order_status_on_hold_id'])) {
			$data['plationline_order_status_on_hold_id'] = $this->request->post['plationline_order_status_on_hold_id'];
		} else {
			$data['plationline_order_status_on_hold_id'] = $this->config->get('plationline_order_status_on_hold_id'); 
		}		

		if (isset($this->request->post['plationline_order_status_decline_id'])) {
			$data['plationline_order_status_decline_id'] = $this->request->post['plationline_order_status_decline_id'];
		} else {
			$data['plationline_order_status_decline_id'] = $this->config->get('plationline_order_status_decline_id'); 
		}

		if (isset($this->request->post['plationline_order_status_error_id'])) {
			$data['plationline_order_status_error_id'] = $this->request->post['plationline_order_status_error_id'];
		} else {
			$data['plationline_order_status_error_id'] = $this->config->get('plationline_order_status_error_id'); 
		}

		if (isset($this->request->post['plationline_order_status_settled_id'])) {
			$data['plationline_order_status_settled_id'] = $this->request->post['plationline_order_status_settled_id'];
		} else {
			$data['plationline_order_status_settled_id'] = $this->config->get('plationline_order_status_settled_id'); 
		}

		if (isset($this->request->post['plationline_order_status_pending_settled_id'])) {
			$data['plationline_order_status_pending_settled_id'] = $this->request->post['plationline_order_status_pending_settled_id'];
		} else {
			$data['plationline_order_status_pending_settled_id'] = $this->config->get('plationline_order_status_pending_settled_id'); 
		}

		if (isset($this->request->post['plationline_order_status_credited_id'])) {
			$data['plationline_order_status_credited_id'] = $this->request->post['plationline_order_status_credited_id'];
		} else {
			$data['plationline_order_status_credited_id'] = $this->config->get('plationline_order_status_credited_id'); 
		}

		if (isset($this->request->post['plationline_order_status_pending_credited_id'])) {
			$data['plationline_order_status_pending_credited_id'] = $this->request->post['plationline_order_status_pending_credited_id'];
		} else {
			$data['plationline_order_status_pending_credited_id'] = $this->config->get('plationline_order_status_pending_credited_id'); 
		}

		if (isset($this->request->post['plationline_order_status_voided_id'])) {
			$data['plationline_order_status_voided_id'] = $this->request->post['plationline_order_status_voided_id'];
		} else {
			$data['plationline_order_status_voided_id'] = $this->config->get('plationline_order_status_voided_id'); 
		}

		if (isset($this->request->post['plationline_order_status_pending_voided_id'])) {
			$data['plationline_order_status_pending_voided_id'] = $this->request->post['plationline_order_status_pending_voided_id'];
		} else {
			$data['plationline_order_status_pending_voided_id'] = $this->config->get('plationline_order_status_pending_voided_id'); 
		}

		if (isset($this->request->post['plationline_order_status_cbk_id'])) {
			$data['plationline_order_status_cbk_id'] = $this->request->post['plationline_order_status_cbk_id'];
		} else {
			$data['plationline_order_status_cbk_id'] = $this->config->get('plationline_order_status_cbk_id'); 
		}

		if (isset($this->request->post['plationline_order_status_expired_id'])) {
			$data['plationline_order_status_expired_id'] = $this->request->post['plationline_order_status_expired_id'];
		} else {
			$data['plationline_order_status_expired_id'] = $this->config->get('plationline_order_status_expired_id'); 
		}

		$this->load->model('localisation/order_status');
		
		$data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();
		
		if (isset($this->request->post['plationline_geo_zone_id'])) {
			$data['plationline_geo_zone_id'] = $this->request->post['plationline_geo_zone_id'];
		} else {
			$data['plationline_geo_zone_id'] = $this->config->get('plationline_geo_zone_id'); 
		}
		
		$this->load->model('localisation/geo_zone');
										
		$data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();
		
		if (isset($this->request->post['plationline_status'])) {
			$data['plationline_status'] = $this->request->post['plationline_status'];
		} else {
			$data['plationline_status'] = $this->config->get('plationline_status');
		}
		
		if (isset($this->request->post['plationline_sort_order'])) {
			$data['plationline_sort_order'] = $this->request->post['plationline_sort_order'];
		} else {
			$data['plationline_sort_order'] = $this->config->get('plationline_sort_order');
		}

		$data['token'] = $this->session->data['token'];

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		$data['is_secure'] = $this->config->get('config_secure');
		$this->response->setOutput($this->load->view('extension/payment/plationline.tpl', $data));
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'extension/payment/plationline')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->request->post['plationline_f_login']) {
			$this->error['f_login'] = $this->language->get('error_f_login');
		}

		if (!$this->request->post['plationline_rsa_auth']) {
			$this->error['rsa_auth'] = $this->language->get('error_rsa_auth');
		}

		if (!$this->request->post['plationline_rsa_itsn']) {
			$this->error['rsa_itsn'] = $this->language->get('error_rsa_itsn');
		}

		if (!$this->request->post['plationline_iv_auth']) {
			$this->error['iv_auth'] = $this->language->get('error_iv_auth');
		}

		if (!$this->request->post['plationline_iv_itsn']) {
			$this->error['iv_itsn'] = $this->language->get('error_iv_itsn');
		}

		if (!$this->request->post['plationline_relay_method']) {
			$this->error['relay_method'] = $this->language->get('error_relay_method');
		}

		if (!$this->request->post['plationline_itsn_method']) {
			$this->error['itsn_method'] = $this->language->get('error_itsn_method');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
	
	public function install() {
		$this->createOrderStatuses();
	}
	
	private function get_all_po_statuses() {
		$this->load->language('extension/payment/plationline');
		$data = array();
		$data['entry_order_status_pending'] 			= $this->language->get('entry_order_status_pending');
		$data['entry_order_status_approved'] 			= $this->language->get('entry_order_status_approved');	
		$data['entry_order_status_on_hold'] 			= $this->language->get('entry_order_status_on_hold');
		$data['entry_order_status_decline'] 			= $this->language->get('entry_order_status_decline');
		$data['entry_order_status_error'] 				= $this->language->get('entry_order_status_error');
		$data['entry_order_status_settled'] 			= $this->language->get('entry_order_status_settled');
		$data['entry_order_status_pending_settled'] 	= $this->language->get('entry_order_status_pending_settled');
		$data['entry_order_status_credited'] 			= $this->language->get('entry_order_status_credited');
		$data['entry_order_status_pending_credited'] 	= $this->language->get('entry_order_status_pending_credited');
		$data['entry_order_status_voided'] 				= $this->language->get('entry_order_status_voided');
		$data['entry_order_status_pending_voided'] 		= $this->language->get('entry_order_status_pending_voided');
		$data['entry_order_status_cbk'] 				= $this->language->get('entry_order_status_cbk');
		$data['entry_order_status_expired'] 			= $this->language->get('entry_order_status_expired');
		return $data;
	}

	private function createOrderStatuses() {
		$data = array();
		$lang_id = (int)$this->config->get('config_language_id');

		$this->load->model('localisation/order_status');
		$data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

		$os = $this->get_all_po_statuses();
		$data = array_merge($data,$os);

		$raw_order_status_data[] = array('order_status' => array($lang_id => array('name' => $data['entry_order_status_pending'])));
		$raw_order_status_data[] = array('order_status' => array($lang_id => array('name' => $data['entry_order_status_approved'])));
		$raw_order_status_data[] = array('order_status' => array($lang_id => array('name' => $data['entry_order_status_on_hold'])));
		$raw_order_status_data[] = array('order_status' => array($lang_id => array('name' => $data['entry_order_status_decline'])));
		$raw_order_status_data[] = array('order_status' => array($lang_id => array('name' => $data['entry_order_status_error'])));
		$raw_order_status_data[] = array('order_status' => array($lang_id => array('name' => $data['entry_order_status_settled'])));
		$raw_order_status_data[] = array('order_status' => array($lang_id => array('name' => $data['entry_order_status_pending_settled'])));
		$raw_order_status_data[] = array('order_status' => array($lang_id => array('name' => $data['entry_order_status_credited'])));
		$raw_order_status_data[] = array('order_status' => array($lang_id => array('name' => $data['entry_order_status_pending_credited'])));
		$raw_order_status_data[] = array('order_status' => array($lang_id => array('name' => $data['entry_order_status_voided'])));
		$raw_order_status_data[] = array('order_status' => array($lang_id => array('name' => $data['entry_order_status_pending_voided'])));
		$raw_order_status_data[] = array('order_status' => array($lang_id => array('name' => $data['entry_order_status_cbk'])));
		$raw_order_status_data[] = array('order_status' => array($lang_id => array('name' => $data['entry_order_status_expired'])));

		foreach ($raw_order_status_data as $order_status_data) {
			$status_already_exists = false;
			foreach ($data['order_statuses'] as $existingOrderStatus) {
				if ($existingOrderStatus['name'] == $order_status_data['order_status'][$lang_id]['name']) {
					$status_already_exists = true;
				}
			}
			if (!$status_already_exists) {
				$this->model_localisation_order_status->addOrderStatus($order_status_data);
			}
		}
	}
}
?>
