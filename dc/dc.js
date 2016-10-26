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
	Model.prototype.getImageUrl = function(url) {
		return require.toUrl(url);
	};
	
	//添加商品
	var clickTimes = 0;
	
	Model.prototype.addBtnClick = function(event){
		var row = event.bindingContext.$object;
		var cartData = this.comp("cartData");
		var isExit = cartData.find(["gid"], [row.val("id")],false,false,false,false);
		if(isExit.length == "0"){
			cartData.newData({
				"defaultValues" : [ {
					"id" : justep.UUID.createUUID(),
					"fTitle" : row.val("fTitle"),
					"fImg":row.val("fImg"),
					"fNbr":1,
					"fPrice":row.val("fPrice"),
					"gid":row.val("id")
				} ]
			});
		}else{
			var rowData = isExit[0];
			cartData.setValue("fNbr", rowData.val("fNbr") + 1, rowData);
			console.log(rowData.val("fTitle")+"所点份数："+rowData.val("fNbr"));
		}
		clickTimes++;
		this.comp("cartBtn").set({
			"label" : "已点数量（"+clickTimes+"）"
		});
	};
	
	Model.prototype.modelParamsReceive = function(event){
		var menu_id = event.params.menu_id;
		var menuData = this.comp("menuData");
		var menuTmp = this.comp("menuTmp");
		menuTmp.clear();
		//获取点击的那个菜单选项并放入到menuTmp中，并删除menuData中的行数据
		menuData.each(function(param){
			  var id = param.row.val('id');
			  if(id == menu_id){
				  var row2 = param.row;
				  menuTmp.loadData([row2.toJson()]);
				  menuData.remove(row2);
			  }
		});
		//将menuData剩余的行数据一次加入到menuTmp中
		menuData.each(function(param){
			  var id = param.row.val('id');
			  if(id != menu_id){
				  var row2 = param.row;
				  menuTmp.loadData([row2.toJson()]);
			  }
		});
		menuTmp.first();
	};

	return Model;
});