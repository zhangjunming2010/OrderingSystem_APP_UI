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
};

define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};
	
	Model.prototype.goodsDataCustomRefresh = function(event) {
		/*
		 * 1、加载商品数据
		 */
		var url = require.toUrl("./main/json/goodsData.json");
		var goodsData = event.source;
		goodsData.clear();
		$.ajaxSettings.async = false;
		$.getJSON(url, function(data) {
			goodsData.loadData(data);
		});
	};

	// 图片路径转换
	Model.prototype.transUrl = function(row) {
		var url = (typeof row === "object") ? "./main/img/" + row.val("imgName") : row;
		return require.toUrl(url);
	};

	// 图片路径转换
	Model.prototype.getImageUrl = function(url) {
		return require.toUrl(url);
	};

	Model.prototype.li5Click = function(event){
		var row = event.bindingContext.$object;
		var menu_id = row.row.id.value.latestValue;
		console.log(menu_id);
	};

	Model.prototype.plusBtnClick = function(event){
		var row = event.bindingContext.$object;
		var cartData = this.comp("cartData");
		cartData.newData({
			"defaultValues" : [ {
				"id" : row.val("id"),
				"fNbr" : 0
			} ]
		})
		row.val("fNbr",row.val("fNbr")+1);
		cartData.saveData();
//		input.focus();
//		document.getElementById(me.getIDByXID("goodsNbr")).focus(); 
//		var goodNbr = input.val();
//		if(goodNbr == ""){
//			goodNbr = 1;
//			input.value = goodNbr;
//		}else{
//			input.value = goodNbr + 1;
//		}
//		input.blur();
//		document.getElementById(me.getIDByXID("goodsNbr")).blur();
	};

	Model.prototype.minusBtnClick = function(event){
		var me = this;
		var input = me.comp("goodsNbr");
		document.getElementById(me.getIDByXID("goodsNbr")).focus(); 
		var goodNbr = input.val();
		if(goodNbr != ""){
			goodNbr = goodNbr - 1;
			input.value = goodNbr - 1;
			if(goodNbr == "0"){
				input.value = "";
			}else{
				input.value = goodNbr;
			}
		}
		document.getElementById(me.getIDByXID("goodsNbr")).blur();
	};

	return Model;
});