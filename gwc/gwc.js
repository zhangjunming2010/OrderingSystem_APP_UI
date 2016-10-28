function AutoResizeImage(objImg) {
	var img = new Image();
	img.src = objImg.src;
//	var hRatio;
//	var wRatio;
//	var Ratio = 1;
	var w = img.width;
//	var h = img.height;
//	wRatio = maxWidth / w;
//	hRatio = maxHeight / h;
//	if (maxWidth == 0 && maxHeight == 0) {
//		Ratio = 1;
//	} else if (maxWidth == 0) {//
//		if (hRatio < 1)
//			Ratio = hRatio;
//	} else if (maxHeight == 0) {
//		if (wRatio < 1)
//			Ratio = wRatio;
//	} else if (wRatio < 1 || hRatio < 1) {
//		Ratio = (wRatio <= hRatio ? wRatio : hRatio);
//	}
//	if (Ratio < 1) {
//		w = w * Ratio;
//		h = h * Ratio;
//	}
//	objImg.height = h;
	objImg.width = w*0.3;
}

define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var touch = require("./touch");
	
	var Model = function() {
		this.callParent();
	};
	
	// 图片路径转换
	Model.prototype.getImageUrl = function(url) {
		return require.toUrl(url);
	};

	var tmp = "";
	Model.prototype.plusBtnClick = function(event){
		var row = event.bindingContext.$object;
		row.val("fNbr",row.val("fNbr")+1);
		var data = this.comp("cartData");
		tmp = data.toJson();
		var totalPrice = 0;
		data.each(function(param){
			totalPrice = totalPrice + (param.row.val("fNbr") * param.row.val("fPrice"));
		});
		this.comp("button2").set({
			"label" : "总计：" + totalPrice + " 元"
		});
	};

	Model.prototype.minusBtnClick = function(event){
		var row = event.bindingContext.$object;
		var fNbr = row.val("fNbr");
		var cartData = this.comp("cartData");
		if(fNbr > "0"){
			row.val("fNbr",row.val("fNbr")-1);
			if(fNbr = row.val("fNbr") == "0"){
				cartData.deleteData(row);
			}
		}
		var data = this.comp("cartData");
		tmp = data.toJson();
		var totalPrice = 0;
		data.each(function(param){
			totalPrice = totalPrice + (param.row.val("fNbr") * param.row.val("fPrice"));
		});
		this.comp("button2").set({
			"label" : "总计：" + totalPrice + " 元"
		});
	};

	Model.prototype.backBtnClick = function(event){
		var cartData = this.comp("cartData");
		this.comp("windowReceiver1").windowEnsure(cartData.toJson());
	};
	
	Model.prototype.windowReceiver1Receive = function(event){
		var cartData = this.comp("cartData");
		cartData.clear();
		tmp = event.params.cartData;
		cartData.loadData(tmp);
		var totalPrice = 0;
		cartData.each(function(param){
			totalPrice = totalPrice + (param.row.val("fNbr") * param.row.val("fPrice"));
		});
		this.comp("button2").set({
			"label" : "总计：" + totalPrice + " 元"
		});
	};

	Model.prototype.cartDataCustomRefresh = function(event){
		var cartData = this.comp("cartData");
		cartData.clear();
		cartData.loadData(tmp);
		var totalPrice = 0;
		cartData.each(function(param){
			totalPrice = totalPrice + (param.row.val("fNbr") * param.row.val("fPrice"));
		});
		this.comp("button2").set({
			"label" : "总计：" + totalPrice + " 元"
		});
	};
	
	Model.prototype.swipeDelete = function(){
		var newsContentID = this.getIDByXID('content2');
		var swipeAreaSize = 100;
		var dx;
		touch.on('#' + newsContentID, 'touchstart', function(ev){
			var $swipNode = $('#' + newsContentID + " li").has(ev.target);
			dx = parseInt($swipNode.attr('swipeX') || "0");
		});
		
		touch.on('#'+ newsContentID, 'drag', function(ev){
			var $swipNode = $('#' + newsContentID + " li").has(ev.target);
			if(ev.direction === "left" || ev.direction === "right"){
				dx = dx || 0;
				var offx = dx + ev.x;
				if(offx < swipeAreaSize*-1){
					offx = swipeAreaSize*-1;
				}
				if(offx > 0){
					offx = 0;
				}
				if(ev.direction === "right" && $swipNode.hasClass('x-swipe-out')){
					$swipNode.css({'transform':'translate3d('+offx+'px,0,0)'});
				}else if(ev.direction === "left" && (!$swipNode.hasClass('x-swipe-out'))){
					$swipNode.css({'transform':'translate3d('+offx+'px,0,0)'});
				}
			}
		});
		touch.on('#'+ newsContentID, 'dragend', function(ev){
			var $swipNode = $('#' + newsContentID + " li").has(ev.target);
			if(ev.direction === "left"){
				$swipNode.css({'transform':'translate3d(-'+swipeAreaSize+'px,0,0)'});
				$swipNode.addClass('x-swipe-out');
				dx = swipeAreaSize*-1;
			}else if(ev.direction === "right"){
				$swipNode.removeClass('x-swipe-out');
				$swipNode.css({'transform':'translate3d(0,0,0)'});
				dx = 0;
			}
			$swipNode.attr('swipeX',dx);
		});
	};

	Model.prototype.modelLoad = function(event){
		this.swipeDelete();
	};

	Model.prototype.div22Click = function(event){
		var row = event.bindingContext.$object;
		var cartData = this.comp("cartData");
		cartData.deleteData(row);
		var data = this.comp("cartData");
		tmp = data.toJson();
		var totalPrice = 0;
		data.each(function(param){
			totalPrice = totalPrice + (param.row.val("fNbr") * param.row.val("fPrice"));
		});
		this.comp("button2").set({
			"label" : "总计：" + totalPrice + " 元"
		});
		justep.Util.hint(
			row.val("fTitle")+"已删除！",
			{
				"delay":1000,
				"position":"middle",
				"type":"warning"
			}
		);
		$(".x-hint").find("button[class='close']").hide();
	};

	return Model;
});