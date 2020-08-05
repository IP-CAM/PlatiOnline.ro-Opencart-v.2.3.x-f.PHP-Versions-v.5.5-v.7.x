<div class="buttons">
    <a class="btn btn-success pull-right" id="pay-po"><span><?php echo $button_confirm; ?></span></a>
  </div>
<script type="text/javascript">
  $('#journal-checkout-confirm-button, #button-confirm, #pay-po').click(function (e) {
    $.ajax({
	    type: "POST",
	    url: 'index.php?route=extension/payment/plationline/confirm',
	    dataType: "json",
	    beforeSend: function(){
	    	$('#pay-po').attr('disabled','disabled');
	    	$('#pay-po').text('Se trimite...');
	    },
	    success: function(data, textStatus) {
	        if (data.redirect) {
	            // data.redirect contains the string URL to redirect to
	            window.location.href = data.redirect;
	        }
	    }
	});
  });
</script>

