<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;"
  xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;top:210px;left:435px;" onParamsReceive="modelParamsReceive"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="menuData" idColumn="id"> 
      <column label="id" name="id" type="String" xid="column16"/>  
      <column label="title" name="title" type="String" xid="column17"/>  
      <column label="imgName" name="imgName" type="String" xid="column18"/>  
      <column label="pageName" name="pageName" type="String" xid="xid4"/>  
      <data xid="default1">[{"id":"1","title":"锅底系列","imgName":"gdxl.jpg","pageName":"dc"},{"id":"2","title":"精品系列","imgName":"jpxl.jpg","pageName":"dc"},{"id":"3","title":"特色系列","imgName":"tsxl.jpg","pageName":"dc"},{"id":"4","title":"荤菜系列","imgName":"hcxl.jpg","pageName":"dc"},{"id":"5","title":"素菜系列","imgName":"scxl.jpg","pageName":"dc"},{"id":"6","title":"小吃酒水","imgName":"xcjs.jpg","pageName":"dc"}]</data>
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
  <div component="$UI/system/components/justep/data/data" autoLoad="false" xid="cartData" idColumn="id"><column label="id" name="id" type="String" xid="xid1"></column>
  <column label="fTitle" name="fTitle" type="String" xid="xid2"></column>
  <column label="fImg" name="fImg" type="String" xid="xid5"></column>
  <column label="fNbr" name="fNbr" type="Integer" xid="xid6"></column>
  <column label="fPrice" name="fPrice" type="Integer" xid="xid7"></column>
  <column label="gid" name="gid" type="Integer" xid="xid8"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="false" xid="data4" idColumn="id">
   <column label="id" name="id" type="String" xid="column21"></column>
   <column label="title" name="title" type="String" xid="column20"></column>
   <column label="imgName" name="imgName" type="String" xid="column19"></column>
   <column label="pageName" name="pageName" type="String" xid="column15"></column>
   <data xid="default4">[]</data></div></div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-card x-full x-has-iosstatusbar"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="菜单"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="{operation:'window.close'}"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">菜单</div>  
        <div class="x-titlebar-right reverse"></div> 
      </div> 
    </div>  
    <div class="x-panel-content x-cards" xid="content1">
      <div component="$UI/system/components/bootstrap/row/row" class="row tb-box"
        xid="row2"> 
        <div class="col col-xs-3" xid="col4">
          <div component="$UI/system/components/justep/list/list" class="x-list tb-root"
            xid="list3" dataItemAlias="menuRow" autoLoad="true" data="menuData"> 
            <ul class="x-list-template list-group" xid="listTemplateUl3" componentname="$UI/system/components/justep/list/list#listTemplateUl"
              id="undefined_listTemplateUl3"> 
              <li xid="li5" class="list-group-item text-center tb-nopadding" bind-css="{'current':  $model.menuData.currentRow.get()== $object}">
                <h5 xid="h52" class="text-black" bind-text=' ref("title")'/>
              </li>
            </ul> 
          </div>
        </div>  
        <div class="col col-xs-9" xid="col6"> 
          <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
            xid="panel2"> 
            <div class="x-panel-content" xid="content2" _xid="C74674B578F00001EB181C901A001736" style="bottom: 48px; top: 5px;">
              
            <div component="$UI/system/components/justep/list/list" class="x-list" xid="list1" data="goodsData" filter=' $row.val("fShopID") == $model.menuData.val("id")'> 
                <ul class="x-list-template x-min-height" xid="listTemplateUl1" componentname="$UI/system/components/justep/list/list#listTemplateUl" id="undefined_listTemplateUl1"> 
                  <li xid="li1" class="text-center tb-listBox text-black" componentname="li(html)" id="undefined_li1">
                    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row1"> 
                      <div class="x-col x-col-fixed x-col-center pull-left" xid="col2" id="imgcontainer" style="width:auto;">
                       <!--  --> <img src="" alt="" xid="image2" bind-attr-src=" $model.getImageUrl(val(&quot;fImg&quot;)) " onload="AutoResizeImage(this)" />
                      </div>  
                      <div class="x-col" xid="col3">
                        <div component="$UI/system/components/justep/row/row" class="x-row" xid="row5"> 
                          <div class="x-col x-col-center" xid="col14">
                            <span xid="span1" bind-text="ref(&quot;fTitle&quot;)" style="font-weight:bold;" />
                          </div>
                        </div>  
                        <div component="$UI/system/components/justep/row/row" class="x-row" xid="row6"> 
                          <div class="x-col x-col-center" xid="col17">
                            <span xid="span2" bind-text="&quot;￥&quot;+ val(&quot;fPrice&quot;)" />
                          </div>
                        </div>  
                        <div component="$UI/system/components/justep/row/row" class="x-row" xid="row7"><div class="x-col" xid="col1"></div>
  <div class="x-col x-col-fixed x-col-center" xid="col7" style="width:auto;"><a component="$UI/system/components/justep/button/button" class="btn btn-link" label=" 来一份" xid="addBtn" icon="linear linear-pointerup" style="background-color:#FF0000;" onClick="addBtnClick">
   <i xid="i1" class="linear linear-pointerup" style="color:#FFFFFF;"></i>
   <span xid="span3" style="color:#FFFFFF;"> 来一份</span></a></div>
  <div class="x-col" xid="col9"></div></div>
                      </div>
                    </div> 
                  </li>
                </ul> 
              </div></div> 
          <div class="x-panel-bottom" xid="bottom1"><div component="$UI/system/components/justep/button/buttonGroup" class="btn-group x-card btn-group-justified" tabbed="true" xid="buttonGroup1"><a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-left btn-block center-block" xid="cartBtn" icon="icon-ios7-cart" style="color:#FF0000;" label="已点数量（0）">
   <i xid="i3" class="icon-ios7-cart"></i>
   <span xid="span5">已点数量（0）</span></a>
  </div></div></div>
        </div>
      </div>
    </div> 
  </div> 
</div>
