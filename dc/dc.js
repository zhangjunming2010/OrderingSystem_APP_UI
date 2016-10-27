function AutoResizeImage(objImg) {
	var img = new Image();
	img.src = objImg.src;
	// var hRatio;
	// var wRatio;
	// var Ratio = 1;
	var w = img.width;
	// var h = img.height;
	// wRatio = maxWidth / w;
	// hRatio = maxHeight / h;
	// if (maxWidth == 0 && maxHeight == 0) {
	// Ratio = 1;
	// } else if (maxWidth == 0) {//
	// if (hRatio < 1)
	// Ratio = hRatio;
	// } else if (maxHeight == 0) {
	// if (wRatio < 1)
	// Ratio = wRatio;
	// } else if (wRatio < 1 || hRatio < 1) {
	// Ratio = (wRatio <= hRatio ? wRatio : hRatio);
	// }
	// if (Ratio < 1) {
	// w = w * Ratio;
	// h = h * Ratio;
	// }
	// objImg.height = h;
	objImg.width = w * 0.3;
}

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
	
	// 图片路径转换
	Model.prototype.transUrl = function(row) {
		var url = (typeof row === "object") ? "./main/img/" + row.val("imgName") : row;
		return require.toUrl(url);
	};

	// 添加商品
	Model.prototype.addBtnClick = function(event) {
		var cartData = this.comp("cartData");
		var row = event.bindingContext.$object;
		var isExit = cartData.find([ "gid" ], [ row.val("id") ]);
		if (isExit.length == "0") {
			cartData.newData({
				"defaultValues" : [ {
					"id" : justep.UUID.createUUID(),
					"fTitle" : row.val("fTitle"),
					"fImg" : row.val("fImg"),
					"fNbr" : 1,
					"fPrice" : row.val("fPrice"),
					"gid" : row.val("id")
				} ]
			});
		} else {
			var rowData = isExit[0];
			cartData.setValue("fNbr", rowData.val("fNbr") + 1, rowData);
		}
		var Nbr = 0;
		cartData.each(function(param){
			Nbr = Nbr + param.row.val("fNbr");
		});
		this.comp("cartBtn").set({
			"label" : "已选(" + Nbr + ")"
		});
		justep.Util.hint(
			row.val("fTitle")+"添加成功！",
			{
				"delay":1000,
				"position":"middle",
			}
		);
		$(".x-hint").find("button[class='close']").hide();
	};

	Model.prototype.modelParamsReceive = function(event) {
		var menu_id = event.params.menu_id;
		var menuData = this.comp("menuData");
		var m = 0;
		var n = 0;
		var tmprows = [];
		
		
		//左侧菜单排序，确保首页点击的菜单在第一个而其他的顺序不变。
		menuData.each(function(param) {
			tmprows.push(param.row);
			m++;
			var id = param.row.val('id');
			if (id == menu_id) {
				n = m;
			}
		});
		var l = n;
		if((n-1) > 0){
			for(var i = 0;i<(n-1);i++){
				menuData.exchangeRow(tmprows[n-1], tmprows[l-2]);
				l--;
			}	
		}
		menuData.first();
	};
	
	Model.prototype.cartBtnClick = function(event){
		var cartData = this.comp("cartData");
		if(cartData.getCount() != "0"){
			var url = require.toUrl('../gwc/gwc.w');
			this.comp("windowDialog1").open({
				src:url,
				params:{
					cartData:cartData.toJson()
				}
			});
		}else{
			justep.Util.hint(
					"请选取菜品！",
					{
						"delay":2000,
						"position":"middle",
						"type":"warning"
					}
			);
			$(".x-hint").find("button[class='close']").hide();
		}
	};
	
	Model.prototype.windowDialog1Receive = function(event){
		var Nbr = 0;
		var cartData = this.comp("cartData");
		cartData.clear();
		cartData.loadData(event.data);
		if(cartData.getCount() != "0"){
			cartData.each(function(param){
				Nbr = Nbr + param.row.val("fNbr");
			});
		}
		this.comp("cartBtn").set({
			"label" : "已选(" + Nbr + ")"
		});
	};
	
	Model.prototype.backBtnClick = function(event){
		var cartData = this.comp("cartData");
		if(cartData.getCount() != "0"){
			this.comp("messageDialog1").show();
		}else{
			this.close();
		}
	};
	
	Model.prototype.messageDialog1Yes = function(event){
		this.comp("cartData").clear();
		this.close();
	};
	
	return Model;
});