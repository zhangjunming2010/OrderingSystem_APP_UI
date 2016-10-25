<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" class="main13" component="$UI/system/components/justep/window/window"
  design="device:mobile;" xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;top:326px;left:35px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="menuData" idColumn="id">
   <column label="id" name="id" type="String" xid="column16"></column>
   <column label="title" name="title" type="String" xid="column17"></column>
   <column label="imgName" name="imgName" type="String" xid="column18"></column>
   <column label="pageName" name="pageName" type="String" xid="column1"></column>
   <data xid="default1">[{&quot;id&quot;:&quot;1&quot;,&quot;title&quot;:&quot;锅底系列&quot;,&quot;imgName&quot;:&quot;gdxl.jpg&quot;,&quot;pageName&quot;:&quot;dc&quot;},{&quot;id&quot;:&quot;2&quot;,&quot;title&quot;:&quot;精品系列&quot;,&quot;imgName&quot;:&quot;jpxl.jpg&quot;,&quot;pageName&quot;:&quot;dc&quot;},{&quot;id&quot;:&quot;3&quot;,&quot;title&quot;:&quot;特色系列&quot;,&quot;imgName&quot;:&quot;tsxl.jpg&quot;,&quot;pageName&quot;:&quot;dc&quot;},{&quot;id&quot;:&quot;4&quot;,&quot;title&quot;:&quot;荤菜系列&quot;,&quot;imgName&quot;:&quot;hcxl.jpg&quot;,&quot;pageName&quot;:&quot;dc&quot;},{&quot;id&quot;:&quot;5&quot;,&quot;title&quot;:&quot;素菜系列&quot;,&quot;imgName&quot;:&quot;scxl.jpg&quot;,&quot;pageName&quot;:&quot;dc&quot;},{&quot;id&quot;:&quot;6&quot;,&quot;title&quot;:&quot;小吃酒水&quot;,&quot;imgName&quot;:&quot;xcjs.jpg&quot;,&quot;pageName&quot;:&quot;dc&quot;}]</data></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="goodsData" idColumn="gID"><column label="ID" name="gID" type="String" xid="xid1"></column>
  <column label="mID" name="mID" type="String" xid="xid2"></column>
  <column label="菜品名称" name="gName" type="String" xid="xid3"></column>
  <column label="菜品价格" name="gPrice" type="Integer" xid="xid4"></column>
  <column label="销售数量" name="gCount" type="String" xid="xid5"></column>
  <column label="菜品图片" name="gPic" type="String" xid="xid6"></column>
  <data xid="default2">[{&quot;gID&quot;:&quot;1&quot;,&quot;mID&quot;:&quot;1&quot;,&quot;gName&quot;:&quot;红汤（微辣）&quot;,&quot;gPrice&quot;:0,&quot;gCount&quot;:&quot;1&quot;,&quot;gPic&quot;:&quot;../sy/main/img/gdxl.jpg&quot;},{&quot;gID&quot;:&quot;2&quot;,&quot;mID&quot;:&quot;1&quot;,&quot;gName&quot;:&quot;红汤（中辣）&quot;,&quot;gPrice&quot;:0,&quot;gCount&quot;:&quot;1&quot;,&quot;gPic&quot;:&quot;../sy/main/img/gdxl.jpg&quot;},{&quot;gID&quot;:&quot;3&quot;,&quot;mID&quot;:&quot;1&quot;,&quot;gName&quot;:&quot;红汤（无情辣）&quot;,&quot;gPrice&quot;:0,&quot;gCount&quot;:&quot;1&quot;,&quot;gPic&quot;:&quot;../sy/main/img/gdxl.jpg&quot;}]</data></div></div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full x-card x-has-iosstatusbar"> 
    <div class="x-panel-top" height="49"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        title="菜单"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            label="分类" xid="button6" icon="icon-chevron-left" onClick="{operation:'window.close'}"> 
            <i xid="i6" class="icon-chevron-left"/>  
            <span xid="span6">分类</span> 
          </a> 
        </div>  
        <div class="x-titlebar-title">菜单</div>  
        <div class="x-titlebar-right reverse"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label=" (25)" xid="button2" icon="icon-ios7-cart-outline">
   <i xid="i2" class="icon-ios7-cart-outline"></i>
   <span xid="span3"> (25)</span></a></div> 
      </div> 
    </div>  
    <div xid="content" class="x-panel-content x-cards"> 
      <div component="$UI/system/components/bootstrap/row/row" class="row tb-box"> 
        <div class="col col-xs-3" xid="col10"> 
          <div component="$UI/system/components/justep/list/list" class="x-list tb-root"
            xid="rootClassList" data="menuData" dataItemAlias="menuRow"> 
            <ul class="x-list-template list-group" xid="listTemplateUl1"> 
              <li xid="li1" bind-css="{'current':menuRow.val('id')== $model.menuData.val(&quot;id&quot;)}"
                class="list-group-item text-center tb-nopadding"> 
                <h5 xid="h52" class="text-black" bind-text='ref("title")'><![CDATA[]]></h5> 
              </li> 
            </ul> 
          </div> 
        </div>  
        <div class="col col-xs-9" xid="col11"> 
          <div component="$UI/system/components/justep/list/list" class="x-list" xid="list1" data="goodsData" limit="6" bind-click="listClick">
   <ul class="x-list-template" xid="listTemplateUl2">
    <li xid="li2" class="media">
     <div xid="div10" class="media-left">
      <img alt="" xid="image1" class="img-rounded media-object" bind-attr-src='$model.getImageUrl( val("gPic"))' style="width:80px;"></img></div> 
     <div class="media-body" xid="div14">
      <h5 class="media-heading lead text-black" xid="h51" bind-text='ref("gName")'></h5>
      <div class="text-muted" xid="div15">
       <span xid="span11" class="text-danger">￥</span>
       <span xid="span9" class="text-danger" bind-text='ref("gPrice")'></span></div> 
      <div class="text-muted" xid="div16">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-xs btn-only-label" label=" 来一份" xid="button1" icon="linear linear-bus">
   <i xid="i1" class="linear linear-bus"></i>
   <span xid="span1"> 来一份</span></a></div></div> </li> </ul> </div></div> 
      </div> 
    </div> 
  </div> 
</div>