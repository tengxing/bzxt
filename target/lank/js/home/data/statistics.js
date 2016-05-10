/**
 * Created by qianxm on 2016/1/25.
 * 模型管理页面 js样式
 */
var  currentPage = 1;//初始是当前页码数是1
var pageSize = 10;//每页显示的列数
/**
 * 初始化模型列表
 */
$(function(){

    searchModelList();
 
});
/**
 * 查询模型列表
 * @params IsInit 状态参数 判断是否是第一次调用searchQcModelList()
 */
function searchModelList() {
	

   
  
    var content_dom = $("#container");
    var url =contextPath+"/Data/temperature";
    var js = contextPath+'/js/home/data/temperature.js';
    console.log(url);

  /*  var js = contextPath+'/home/qcModel/modelManagement/js/modelManagementList.js';*/
    viewer.load(content_dom, url, js,'',true,'');
}
/**
 * 重置查询条件
 */

