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
	
	// 图片路径转换
	Model.prototype.transUrl = function(row) {
		var url = (typeof row === "object") ? "./main/img/" + row.val("imgName") : row;
		return require.toUrl(url);
	};

	
	// 图片路径转换
	Model.prototype.getImageUrl = function(url) {
		return require.toUrl(url);
	};

	Model.prototype.plusBtnClick = function(event){
		var row = event.bindingContext.$object;
		row.val("fNbr",row.val("fNbr")+1);
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
	};

	Model.prototype.backBtnClick = function(event){
		var cartData = this.comp("cartData");
		this.comp("windowReceiver1").windowEnsure(cartData.toJson());
	};

	Model.prototype.windowReceiver1Receive = function(event){
		var cartData = this.comp("cartData");
		cartData.clear();
		cartData.loadData(event.params.cartData);
	};

	return Model;
});