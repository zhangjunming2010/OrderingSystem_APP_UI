<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" class="main13" component="$UI/system/components/justep/window/window"
  design="device:mobile;" xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="top:105px;height:auto;left:440px;"
    onModelConstruct="modelModelConstruct" onLoad="modelLoad" onunLoad="modelUnLoad"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="imgData" idColumn="id" onCustomRefresh="imgDataCustomRefresh"> 
      <column label="id" name="id" type="String" xid="xid1"/>  
      <column label="图片" name="fImgUrl" type="String" xid="xid2"/>  
      <column label="链接地址" name="fUrl" type="String" xid="xid9"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="goodsData" idColumn="id" onCustomRefresh="goodsDataCustomRefresh"> 
      <column label="id" name="id" type="String" xid="column1"/>  
      <column label="店铺ID" name="fShopID" type="String" xid="xid3"/>  
      <column label="标题" name="fTitle" type="String" xid="column2"/>  
      <column label="图片" name="fImg" type="String" xid="column3"/>  
      <column label="价格" name="fPrice" type="Float" xid="column4"/>  
      <column label="邮费" name="fPostage" type="String" xid="column6"/>  
      <column label="月销量" name="fRecord" type="Integer" xid="column7"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="menuData" idColumn="id">
   <column label="id" name="id" type="String" xid="column16"></column>
   <column label="title" name="title" type="String" xid="column17"></column>
   <column label="imgName" name="imgName" type="String" xid="column18"></column>
   <column label="pageName" name="pageName" type="String" xid="xid4"></column>
   <data xid="default1">[{&quot;id&quot;:&quot;1&quot;,&quot;title&quot;:&quot;锅底系列&quot;,&quot;imgName&quot;:&quot;gdxl.jpg&quot;,&quot;pageName&quot;:&quot;dc&quot;},{&quot;id&quot;:&quot;2&quot;,&quot;title&quot;:&quot;精品系列&quot;,&quot;imgName&quot;:&quot;jpxl.jpg&quot;,&quot;pageName&quot;:&quot;dc&quot;},{&quot;id&quot;:&quot;3&quot;,&quot;title&quot;:&quot;特色系列&quot;,&quot;imgName&quot;:&quot;tsxl.jpg&quot;,&quot;pageName&quot;:&quot;dc&quot;},{&quot;id&quot;:&quot;4&quot;,&quot;title&quot;:&quot;荤菜系列&quot;,&quot;imgName&quot;:&quot;hcxl.jpg&quot;,&quot;pageName&quot;:&quot;dc&quot;},{&quot;id&quot;:&quot;5&quot;,&quot;title&quot;:&quot;素菜系列&quot;,&quot;imgName&quot;:&quot;scxl.jpg&quot;,&quot;pageName&quot;:&quot;dc&quot;},{&quot;id&quot;:&quot;6&quot;,&quot;title&quot;:&quot;小吃酒水&quot;,&quot;imgName&quot;:&quot;xcjs.jpg&quot;,&quot;pageName&quot;:&quot;dc&quot;}]</data></div></div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"> 
    <div class="x-panel-content tb-trans"> 
      <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
        active="0" xid="contents2" swipe="false" wrap="false" slidable="false"> 
        <div class="x-contents-content x-cards" xid="homeContent"> 
          <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full x-has-iosstatusbar"> 
            <div class="x-panel-content  x-scroll-view" xid="content3" style="bottom: 0px;"> 
              <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView"
                xid="scrollView" onPullDown="scrollViewPullDown"> 
                <div class="x-content-center x-pull-down container" style="display:none;"
                  xid="div16"> 
                  <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i9"/>  
                  <span class="x-pull-down-label" xid="span17">下拉刷新...</span> 
                </div>  
                <div class="x-scroll-content" xid="div17"> 
                  <div component="$UI/system/components/justep/panel/panel"
                    class="panel panel-default x-card" xid="panel1" style="height:auto;"> 
                    <div component="$UI/system/components/bootstrap/carousel/carousel"
                      class="x-carousel carousel" xid="carousel1" auto="true" style="height:auto;"
                      interval="5"> 
                      <ol class="carousel-indicators" xid="ol1"/>  
                      <div class="x-contents carousel-inner" role="listbox"
                        component="$UI/system/components/justep/contents/contents"
                        active="0" slidable="true" wrap="true" swipe="true" xid="contentsImg"
                        routable="false"> 
                        <div class="x-contents-content" xid="content2"> 
                          <img src="" alt="" xid="image13" class="tb-img1" pagename="" style="width:100%;"/> 
                        </div> 
                      </div> 
                    </div> 
                  </div>  
                  <div component="$UI/system/components/justep/panel/panel" class="panel panel-default x-card" xid="panel2">
   <div component="$UI/system/components/justep/list/list" class="x-list" xid="list2" data="menuData">
    <div component="$UI/system/components/bootstrap/row/row" class="row text-center x-list-template" xid="row1">
     <div class="col col-xs-4 cell list-group-item" xid="col1" bind-click="openPageClick">
      <div xid="div1">
       <img class="x-img3" bind-attr-src=' $model.transUrl($object)' xid="image1"></img>
       <h5 class="text-black" bind-text="ref('title')" xid="h51" style="font-weight:bold;">关于我们</h5></div> </div> </div> </div> </div><div component="$UI/system/components/justep/panel/panel"
                    class="panel panel-default x-card" xid="panel3"> 
                    <h4 xid="h41" class="list-group-item text-black" style="font-weight:bold;font-size:medium;"><![CDATA[推荐菜品]]></h4>  
                    <div component="$UI/system/components/justep/list/list" class="x-list" xid="list3">
   <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row3">
   <div class="col col-xs-4" xid="col3"></div>
   <div class="col col-xs-4" xid="col4"></div>
   <div class="col col-xs-4" xid="col5"></div></div></div></div> 
                </div>  
                <div class="x-content-center x-pull-up" xid="div18"> 
                  <span class="x-pull-up-label" xid="span18">加载更多...</span> 
                </div> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
