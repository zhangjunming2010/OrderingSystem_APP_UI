define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};
	
	//图片路径转换
	Model.prototype.getImageUrl = function(url){
		return require.toUrl(url);
	};
	
	//商品点击事件
	Model.prototype.listClick = function(event){
		/*
		 1、获取当前商品ID
		 2、转到商品详细信息页，带参数
		 3、在详细页的接收事件中，从服务端过滤数据

		 显示页面代码如下：
		 justep.Shell.showPage("list",{
			keyValue : this.comp("threeClassData").getValue("fClassName")
		 });
		 */
	};

	return Model;
});