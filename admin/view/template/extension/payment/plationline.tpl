<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><img src="view/image/payment/sigla_po_58x22.png" alt="" /> <?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error['error_warning']; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title.'<br /><small>'.$text_PO_version.'</small>'; ?></h3>
      </div>
      <h4 class="row-fluid page-header"><?php echo $text_fill_required_info; ?></h4>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="plationline_f_login"><?php echo $entry_f_login; ?></label>
            <div class="col-sm-10">
              <input type="text" name="plationline_f_login" value="<?php echo $plationline_f_login; ?>" class="form-control"/>
              <?php if ($error_f_login) { ?>
                <div class="text-danger"><?php echo $error_f_login; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="plationline_rsa_auth"><?php echo $entry_rsa_auth; ?></label>
            <div class="col-sm-10">
              <textarea name="plationline_rsa_auth" rows="5" cols="100" class="form-control"><?php echo $plationline_rsa_auth; ?></textarea>
              <?php if ($error_rsa_auth) { ?>
                <div class="text-danger"><?php echo $error_rsa_auth; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="plationline_rsa_itsn"><?php echo $entry_rsa_itsn; ?></label>
            <div class="col-sm-10">
              <textarea name="plationline_rsa_itsn" rows="5" cols="100" class="form-control"><?php echo $plationline_rsa_itsn; ?></textarea>
              <?php if ($error_rsa_itsn) { ?>
                <div class="text-danger"><?php echo $error_rsa_itsn; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="plationline_iv_auth"><?php echo $entry_iv_auth; ?></label>
            <div class="col-sm-10">
              <input type="text" name="plationline_iv_auth" size="97" class="form-control" value="<?php echo $plationline_iv_auth; ?>" />
              <?php if ($error_iv_auth) { ?>
                <div class="text-danger"><?php echo $error_iv_auth; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="plationline_iv_itsn"><?php echo $entry_iv_itsn; ?></label>
            <div class="col-sm-10">
              <input type="text" name="plationline_iv_itsn" size="97" class="form-control" value="<?php echo $plationline_iv_itsn; ?>" />
              <?php if ($error_iv_itsn) { ?>
                <div class="text-danger"><?php echo $error_iv_itsn; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="plationline_relay_method"><?php echo $entry_relay_method; ?></label>
            <div class="col-sm-10">
              <select name="plationline_relay_method" class="form-control">
         <option value="POST_S2S_PO_PAGE" <?php echo $plationline_relay_method=='POST_S2S_PO_PAGE'?'selected':''?>>POST_S2S_PO_PAGE</option>
                 <option value="PTOR" <?php echo $plationline_relay_method=='PTOR'?'selected':''?>>PTOR</option>
                 <option value="POST_S2S_MT_PAGE" <?php echo $plationline_relay_method=='POST_S2S_MT_PAGE'?'selected':''?>>POST_S2S_MT_PAGE</option>
                 <option value="SOAP_PO_PAGE" <?php echo $plationline_relay_method=='SOAP_PO_PAGE'?'selected':''?>>SOAP_PO_PAGE</option>
                 <option value="SOAP_MT_PAGE" <?php echo $plationline_relay_method=='SOAP_MT_PAGE'?'selected':''?>>SOAP_MT_PAGE</option>
              </select>
              <div class="margin-form" style="color: #900; float:none; vertical-align: middle;">
                <?php
                echo '<b>INFO:</b> Site-ul Dvs. '.($is_secure?'<b>ARE</b>':'<b>NU ARE</b>').' certificat SSL activ, din acest motiv va recomandam sa selectati metoda de raspuns <b>'.($is_secure?'PTOR':'POST_S2S_PO_PAGE').'</b>. '.($is_secure?'Clientul VA FI redirectionat catre site-ul Dvs. dupa finalizarea platii, iar starea comenzii se va actualiza in magazinul online.':'Clientului i se va afisa pagina de raspuns PlatiOnline, iar starea comenzii se va actualiza in site-ul Dvs.');
                ?>
             </div>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="plationline_itsn_method"><?php echo $entry_itsn_method; ?></label>
            <div class="col-sm-10">
              <select name="plationline_itsn_method" class="form-control">
                 <option value="POST" <?php echo $plationline_itsn_method=='POST'?'selected':''?>>POST</option>
              </select>
              <div class="margin-form" style="color: #900; float:none; vertical-align: middle;">
                <?php
                  echo '<b>INFO:</b> Pentru a seta URL-ul ITSN accesati <a href="https://merchants.plationline.ro" target="_blank"><b>https://merchants.plationline.ro</b></a>, sectiunea <b>Settings</b>, tab-ul <b>Instant status notification</b>. Completati adresa <b>'.($is_secure?HTTPS_CATALOG:HTTP_CATALOG).'index.php?route=extension/payment/plationline/itsn</b> si selectati metoda <b>POST</b>.';
                ?>
              </div>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="plationline_test"><?php echo $entry_test; ?></label>
            <div class="col-sm-10">
              <?php if ($plationline_test) { ?>
              <input type="radio" name="plationline_test" value="1" checked="checked" />
              <?php echo $text_yes; ?>
              <input type="radio" name="plationline_test" value="0" />
              <?php echo $text_no; ?>
              <?php } else { ?>
              <input type="radio" name="plationline_test" value="1" />
              <?php echo $text_yes; ?>
              <input type="radio" name="plationline_test" value="0" checked="checked" />
              <?php echo $text_no; ?>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="plationline_total"><?php echo $entry_total; ?></label>
            <div class="col-sm-10">
              <input type="text" name="plationline_total" class="form-control" value="<?php echo $plationline_total; ?>" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="plationline_order_status_pending_id"><?php echo $entry_order_status_pending; ?></label>
            <div class="col-sm-10">
              <select name="plationline_order_status_pending_id" class="form-control">
                <?php foreach ($order_statuses as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $plationline_order_status_pending_id || $order_status['name'] == $entry_order_status_pending) { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="plationline_order_status_id"><?php echo $entry_order_status_approved; ?></label>
            <div class="col-sm-10">
              <select name="plationline_order_status_id" class="form-control">
                <?php foreach ($order_statuses as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $plationline_order_status_id || $order_status['name'] == $entry_order_status_approved) { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="plationline_order_status_on_hold_id"><?php echo $entry_order_status_on_hold; ?></label>
            <div class="col-sm-10">
              <select name="plationline_order_status_on_hold_id" class="form-control">
                <?php foreach ($order_statuses as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $plationline_order_status_on_hold_id || $order_status['name'] == $entry_order_status_on_hold) { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="plationline_order_status_decline_id"><?php echo $entry_order_status_decline; ?></label>
            <div class="col-sm-10">
              <select name="plationline_order_status_decline_id" class="form-control">
                <?php foreach ($order_statuses as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $plationline_order_status_decline_id || $order_status['name'] == $entry_order_status_decline) { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="plationline_order_status_error_id"><?php echo $entry_order_status_error; ?></label>
            <div class="col-sm-10">
              <select name="plationline_order_status_error_id" class="form-control">
                <?php foreach ($order_statuses as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $plationline_order_status_error_id || $order_status['name'] == $entry_order_status_error) { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="plationline_order_status_settled_id"><?php echo $entry_order_status_settled; ?></label>
            <div class="col-sm-10">
              <select name="plationline_order_status_settled_id" class="form-control">
                <?php foreach ($order_statuses as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $plationline_order_status_settled_id || $order_status['name'] == $entry_order_status_settled) { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="plationline_order_status_pending_settled_id"><?php echo $entry_order_status_pending_settled; ?></label>
            <div class="col-sm-10">
              <select name="plationline_order_status_pending_settled_id" class="form-control">
                <?php foreach ($order_statuses as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $plationline_order_status_pending_settled_id || $order_status['name'] == $entry_order_status_pending_settled) { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="plationline_order_status_credited_id"><?php echo $entry_order_status_credited; ?></label>
            <div class="col-sm-10">
              <select name="plationline_order_status_credited_id" class="form-control">
                <?php foreach ($order_statuses as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $plationline_order_status_credited_id || $order_status['name'] == $entry_order_status_credited) { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="plationline_order_status_pending_credited_id"><?php echo $entry_order_status_pending_credited; ?></label>
            <div class="col-sm-10">
              <select name="plationline_order_status_pending_credited_id" class="form-control">
                <?php foreach ($order_statuses as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $plationline_order_status_pending_credited_id || $order_status['name'] == $entry_order_status_pending_credited) { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="plationline_order_status_voided_id"><?php echo $entry_order_status_voided; ?></label>
            <div class="col-sm-10">
              <select name="plationline_order_status_voided_id" class="form-control">
                <?php foreach ($order_statuses as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $plationline_order_status_voided_id || $order_status['name'] == $entry_order_status_voided) { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="plationline_order_status_pending_voided_id"><?php echo $entry_order_status_pending_voided; ?></label>
            <div class="col-sm-10">
              <select name="plationline_order_status_pending_voided_id" class="form-control">
                <?php foreach ($order_statuses as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $plationline_order_status_pending_voided_id || $order_status['name'] == $entry_order_status_pending_voided) { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="plationline_order_status_cbk_id"><?php echo $entry_order_status_cbk; ?></label>
            <div class="col-sm-10">
              <select name="plationline_order_status_cbk_id" class="form-control">
                <?php foreach ($order_statuses as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $plationline_order_status_cbk_id || $order_status['name'] == $entry_order_status_cbk) { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="plationline_order_status_expired_id"><?php echo $entry_order_status_expired; ?></label>
            <div class="col-sm-10">
              <select name="plationline_order_status_expired_id" class="form-control">
                <?php foreach ($order_statuses as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $plationline_order_status_expired_id || $order_status['name'] == $entry_order_status_expired) { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="plationline_geo_zone_id"><?php echo $entry_geo_zone; ?></label>
            <div class="col-sm-10">
              <select name="plationline_geo_zone_id" class="form-control">
                <option value="0"><?php echo $text_all_zones; ?></option>
                <?php foreach ($geo_zones as $geo_zone) { ?>
                <?php if ($geo_zone['geo_zone_id'] == $plationline_geo_zone_id) { ?>
                <option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="plationline_status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="plationline_status" class="form-control">
                <?php if ($plationline_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="plationline_sort_order"><?php echo $entry_sort_order; ?></label>
            <div class="col-sm-10">
              <input type="text" name="plationline_sort_order" class="form-control" value="<?php echo $plationline_sort_order; ?>" size="1" />
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>