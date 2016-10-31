define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
		this.contentName;
		this.tag;
		this.lastContentXid = "homeContent";
	};
	
	// 图片路径转换
	Model.prototype.transUrl = function(row) {
		var url = (typeof row === "object") ? "../main/img/" + row.val("imgName") : row;
		return require.toUrl(url);
	};

	// 图片路径转换
	Model.prototype.getImageUrl = function(url) {
		return require.toUrl(url);
	};
	
	/*
	 * 写首页图片数据缓存的代码 1、数据模型创建时事件
	 * 2、判断有没有localStorage，如果有显示localStorage中的内容，否则显示静态内容。
	 * 3、从服务端获取最新数据和图片，获取之后，更新界面并写入localStorage
	 */
	Model.prototype.modelModelConstruct = function(event) {
		/*
		 * 1、数据模型创建时事件 2、加载静态图片或从缓存中加载图片
		 */
		var carousel = this.comp("carousel1");

		var fImgUrl = localStorage.getItem("index_BannerImg_src");
		if (fImgUrl == undefined) {
			$(carousel.domNode).find("img").eq(0).attr({
				"src" : "../main/img/carouselBox61.jpg",
			});
		} else {
			var fUrl = localStorage.getItem("index_BannerImg_url");
			$(carousel.domNode).find("img").eq(0).attr({
				"src" : fImgUrl,
				"pagename" : fUrl
			});
		}
	};
	
	Model.prototype.imgDataCustomRefresh = function(event) {
		/*
		 * 1、加载轮换图片数据 2、根据data数据动态添加carouse组件中的content页面 3、修改第一张图片
		*/
		var url = require.toUrl("../main/json/imgData.json");
		var imgData = event.source;
		imgData.clear();
		$.ajaxSettings.async = false;
		$.getJSON(url, function(data) {
			imgData.loadData(data);
		});

		var me = this;
		var carousel = this.comp("carousel1");
		event.source.each(function(obj) {
			var fImgUrl = require.toUrl(obj.row.val("fImgUrl"));
			var fUrl = require.toUrl(obj.row.val("fUrl"));
			if (me.comp('contentsImg').getLength() > obj.index) {
				$(carousel.domNode).find("img").eq(obj.index).attr({
					"src" : fImgUrl,
					"pagename" : fUrl
				});
				if (obj.index == 0) {
					localStorage.setItem("index_BannerImg_src", fImgUrl);
					localStorage.setItem("index_BannerImg_url", fUrl);
				}
			} else {
				carousel.add('<img src="' + fImgUrl + '" class="tb-img1" bind-click="openPageClick" pagename="' + fUrl + '"/>');
			}
		});
	};
	

	Model.prototype.goodsDataCustomRefresh = function(event) {
		/*
		 * 1、加载商品数据
		 */
		var url = require.toUrl("../main/json/goodsData.json");
		var goodsData = event.source;
		goodsData.clear();
		$.ajaxSettings.async = false;
		$.getJSON(url, function(data) {
			goodsData.loadData(data);
		});
	};

	// 进入详细页
	Model.prototype.listClick = function(event) {
		/*
		 * 1、获取当前行 2、进入详细页面，并传值rowid
		 * 代码如下：
		   var data = this.comp("goodsData");
		   justep.Shell.showPage("detail", {
				goodsID : data.getValue("id"),
				shopID : data.getValue("fShopID")
		   });
		*/
	};

	// 搜索
	Model.prototype.searchBtnClick = function(event) {
		/*
		 * 1、进入搜索页面
		 * 代码如下：
		 * justep.Shell.showPage("search");
		*/
	};

	// 下划刷新
	Model.prototype.scrollViewPullDown = function(event) {
		/*
		 * 1、滚动视图下拉事件 2、刷新data
		 */
		this.comp("imgData").refreshData();
	};

	Model.prototype.shoppingContentInactive = function(event) {
		/*
		 * 1、购物车页面离开事件 2、获取子页面Model 3、调用子页面的函数showBackBtn，设置返回按钮显否显示
		 代码如下：
		var model = this.comp("shoppingContainer").getInnerModel();
		if (model) {
			model.showBackBtn(false);
		}
		*/
	};
	// 添加事件
	Model.prototype.modelLoad = function(event) {
		/*
		代码如下：
		justep.Shell.on("onRestoreContent", this.onRestoreContent, this);
		justep.Shell.on("onShoppingContent", this.onShoppingContent, this);
		justep.Shell.on("onHomeContent", this.onHomeContent, this);
		*/
	};
	// 卸载事件
	Model.prototype.modelUnLoad = function(event) {
		/*
		代码如下：
		justep.Shell.off("onRestoreContent", this.onRestoreContent);
		justep.Shell.off("onShoppingContent", this.onShoppingContent);
		justep.Shell.off("onHomeContent", this.onHomeContent);
		*/
	};
	// 返回上一次的content
	Model.prototype.onRestoreContent = function(event) {
		/*
		代码如下：
		this.comp("contents2").to(this.lastContentXid);
		 */
	};
	// 记住当前content，切换到购物车页
	Model.prototype.onShoppingContent = function(event) {
		/*
		代码如下：
		this.lastContentXid = this.comp("contents2").getActiveXid();
		this.comp("contents2").to("shoppingContent");
		var shoppingModel = this.comp("shoppingContainer").getInnerModel();
		if (shoppingModel) {
			shoppingModel.showBackBtn(true);
		}
		*/
	};
	// 切换到首页
	Model.prototype.onHomeContent = function(event) {
		/*
		代码如下：
		this.comp("contents2").to("homeContent");
		 */
	};

	return Model;
});