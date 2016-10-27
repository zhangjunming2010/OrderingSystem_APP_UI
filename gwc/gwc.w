<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;"
  xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;top:172px;left:684px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="cartData" idColumn="id" confirmDelete="false" confirmRefresh="false" onCustomRefresh="cartDataCustomRefresh">
   <column label="id" name="id" type="String" xid="xid1"></column>
   <column label="fTitle" name="fTitle" type="String" xid="xid2"></column>
   <column label="fImg" name="fImg" type="String" xid="xid5"></column>
   <column label="fNbr" name="fNbr" type="Integer" xid="xid6"></column>
   <column label="fPrice" name="fPrice" type="Integer" xid="xid7"></column>
   <column label="gid" name="gid" type="Integer" xid="xid8"></column>
  <data xid="default1">[]</data></div></div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-card x-full x-has-iosstatusbar"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="已选菜品"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="backBtnClick"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">已选菜品</div>  
        <div class="x-titlebar-right reverse"></div> 
      </div> 
    </div>  
    <div class="x-panel-content x-cards" xid="content1">
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel2">
   <div class="x-panel-content  x-scroll-view" xid="content2" _xid="C74674B578F00001EB181C901A001736" style="top: 0px; bottom: 48px;">
    <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView" xid="scrollView1">
     <div class="x-content-center x-pull-down container" xid="div1">
      <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i5"></i>
      <span class="x-pull-down-label" xid="span7">下拉刷新...</span></div> 
     <div class="x-scroll-content" xid="div2">
      <div component="$UI/system/components/justep/list/list" class="x-list" xid="list1" data="cartData" autoLoad="true">
       <ul class="x-list-template x-min-height" xid="listTemplateUl1" componentname="$UI/system/components/justep/list/list#listTemplateUl" id="undefined_listTemplateUl1">
        <li xid="li1" class="text-center tb-listBox text-black" componentname="li(html)" id="undefined_li1">
         <div component="$UI/system/components/justep/row/row" class="x-row" xid="row1">
          <div class="x-col x-col-fixed x-col-center pull-left" xid="col2" id="imgcontainer" style="width:auto;">
           <img src="" alt="" xid="image2" onload="AutoResizeImage(this)" bind-attr-src='$model.getImageUrl( val("fImg"))'></img></div> 
          <div class="x-col" xid="col3">
           <div component="$UI/system/components/justep/row/row" class="x-row" xid="row5">
            <div class="x-col x-col-center" xid="col14">
             <span xid="span1" style="font-weight:bold;" bind-text='ref("fTitle")'></span></div> </div> 
           <div component="$UI/system/components/justep/row/row" class="x-row" xid="row6">
            <div class="x-col x-col-center" xid="col17">
             <span xid="span2" bind-text='"￥"+ val("fPrice")' style="color:#FF0000;"></span></div> </div> 
           <div component="$UI/system/components/justep/row/row" class="x-row" xid="row7">
            <div class="x-col" xid="col1"></div>
            <div class="x-col x-col-fixed x-col-center" xid="col5" style="width:auto;">
             <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-sm btn-only-icon" label="button" xid="minusBtn" icon="icon-android-remove" onClick="minusBtnClick">
              <i xid="i2" class="icon-android-remove"></i>
              <span xid="span4"></span></a> </div> 
            <div class="x-col x-col-fixed x-col-center" xid="col7" style="width:auto;">
             <input component="$UI/system/components/justep/input/input" class="form-control" xid="goodsNbr" dataType="Integer" format="0,000" min="0" max="99" maxLength="2" placeHolder="0" style="text-align:center;width:50px;" bind-ref='ref("fNbr")'></input></div> 
            <div class="x-col x-col-fixed x-col-center" xid="col8" style="width:auto;">
             <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-sm btn-only-icon" label="button" xid="plusBtn" icon="icon-android-add" onClick="plusBtnClick">
              <i xid="i1" class="icon-android-add"></i>
              <span xid="span3"></span></a> </div> 
            <div class="x-col" xid="col9"></div></div> </div> </div> </li> </ul> </div> </div> 
     <div class="x-content-center x-pull-up" xid="div3">
      <span class="x-pull-up-label" xid="span8">加载更多...</span></div> </div> </div> 
   <div class="x-panel-bottom" xid="bottom1">
    <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group x-card btn-group-justified" tabbed="true" xid="buttonGroup1">
     <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-left btn-block center-block" label="提交菜单" xid="commitBtn" icon="icon-clipboard" style="color:#FF0000;">
      <i xid="i3" class="icon-clipboard"></i>
      <span xid="span5">提交菜单</span></a> </div> </div> </div></div> 
  </div> 
<span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="windowReceiver1" style="top:328px;left:141px;" onReceive="windowReceiver1Receive"></span></div>
