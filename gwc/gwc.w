<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;"
  xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;top:323px;left:406px;"
    onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="cartData" idColumn="id" confirmDelete="false" confirmRefresh="false" onCustomRefresh="cartDataCustomRefresh"> 
      <column label="id" name="id" type="String" xid="xid1"/>  
      <column label="fTitle" name="fTitle" type="String" xid="xid2"/>  
      <column label="fImg" name="fImg" type="String" xid="xid5"/>  
      <column label="fNbr" name="fNbr" type="Integer" xid="xid6"/>  
      <column label="fPrice" name="fPrice" type="Integer" xid="xid7"/>  
      <column label="gid" name="gid" type="Integer" xid="xid8"/>  
      <data xid="default1">[]</data>
    </div>
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-card x-full x-has-iosstatusbar"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar" style="color:#FFFFFF;" title="已选菜品"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="backBtnClick"
            xid="backBtn" style="color:#FFFFFF;"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">已选菜品</div>  
        <div class="x-titlebar-right reverse"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left pull-right center-block" label="提交菜单" xid="commitBtn" icon="icon-clipboard" style="color:#FFFFFF;background-color:ff3838;" onClick="commitBtnClick">
   <i xid="i3" class="icon-clipboard"></i>
   <span xid="span5">提交菜单</span></a></div> 
      </div> 
    </div>  
    <div class="x-panel-content x-cards" xid="content1"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
        xid="panel2"> 
        <div class="x-panel-content" xid="content2" _xid="C74674B578F00001EB181C901A001736"
          style="top: 0px; bottom: 48px;"> 
          <div component="$UI/system/components/justep/list/list" class="x-list" xid="list1" data="cartData" autoLoad="true"> 
                <ul class="x-list-template x-min-height" xid="listTemplateUl1" componentname="$UI/system/components/justep/list/list#listTemplateUl" id="undefined_listTemplateUl1"> 
                  <li xid="li1" class="text-center tb-listBox text-black" componentname="li(html)" id="undefined_li1" style="padding-left:0px; padding-right:0px;overflow:visible;position:relative;display:block;"> 
                    <div xid="div6" style="overflow:hidden;">
                      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row1" style="overflow:hidden;"> 
                        <div class="x-col x-col-fixed x-col-center pull-left" xid="col2" id="imgcontainer" style="width:auto;"> 
                          <img src="" alt="" xid="image2" onload="AutoResizeImage(this)" bind-attr-src="$model.getImageUrl( val(&quot;fImg&quot;))" />
                        </div>  
                        <div class="x-col" xid="col3"> 
                          <div component="$UI/system/components/justep/row/row" class="x-row" xid="row5"> 
                            <div class="x-col x-col-center" xid="col14"> 
                              <h3 xid="h31" bind-text='ref("fTitle")' style="font-weight:bold;">h3</h3></div> 
                          </div>  
                           
                        <div component="$UI/system/components/justep/row/row" class="x-row" xid="row3">
   <div class="x-col" xid="col16"></div>
   <div class="x-col" xid="col17"><span xid="span2" bind-text='"￥"+ val("fPrice")' style="color:#FF0000;"></span></div>
   <div class="x-col" xid="col18"></div></div><div component="$UI/system/components/justep/row/row" class="x-row" xid="row2">
   <div class="x-col" xid="col4"></div>
   <div class="x-col x-col-fixed x-col-center" xid="col9" style="width:auto;"><div component="$UI/system/components/justep/row/row" class="x-row x-row-center" xid="row7" style="text-align:center;"> 
                            <div class="x-col x-col-fixed x-col-center" xid="col5" style="width:auto;"> 
                              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-sm btn-only-icon" label="button" xid="minusBtn" icon="icon-android-remove" onClick="minusBtnClick"> 
                                <i xid="i2" class="icon-android-remove" />  
                                <span xid="span4" />
                              </a> 
                            </div>  
                            <div class="x-col x-col-fixed x-col-center" xid="col7" style="width:auto;"> 
                              <input component="$UI/system/components/justep/input/input" class="form-control" xid="goodsNbr" dataType="Integer" format="0,000" min="0" max="99" maxLength="2" placeHolder="0" style="text-align:center;width:50px;" bind-ref="ref(&quot;fNbr&quot;)" readonly="true"/>
                            </div>  
                            <div class="x-col x-col-fixed x-col-center" xid="col8" style="width:auto;"> 
                              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-sm btn-only-icon" label="button" xid="plusBtn" icon="icon-android-add" onClick="plusBtnClick"> 
                                <i xid="i1" class="icon-android-add" />  
                                <span xid="span3" />
                              </a> 
                            </div>  
                            </div></div>
   <div class="x-col" xid="col15"></div></div>
  </div> 
                      </div>
                    </div>
                    <div xid="div22" class="x-swipe-area" style="background-color:#ff3838;" bind-click="div22Click">
                      	删除
                    </div> 
                  </li> 
                </ul> 
              </div></div>  
        <div class="x-panel-bottom" xid="bottom2"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-block" label="总计：" xid="button2" style="color:#FFFFFF;font-weight:bold;font-size:x-large;background-color:#ff3838;">
   <i xid="i6"></i>
   <span xid="span10">总计：</span></a></div></div>
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver1" style="top:328px;left:141px;" onReceive="windowReceiver1Receive"/>
</div>
