$(".increase").click(function(){
		alert(parseInt($(".hidden_price").val()));
		var old_price = parseInt($(".hidden_price").val());
		var new_price = parseInt(old_price + 2);
		
		$(".hidden_price").val(new_price);
		
		$(".new_price").html(new_price);
		
		});