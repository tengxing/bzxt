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

    searchModelList('init');
 
});
/**
 * 查询模型列表
 * @params IsInit 状态参数 判断是否是第一次调用searchQcModelList()
 */
function searchModelList(IsInit) {
	

   
    if(IsInit=='init'){//查询时，起始页从1开始(点击查询按钮时，总是从第一页开始的，否则总是从当前页开始)
        currentPage=1;
    }
    var content_dom = $("#tableBody");
    var url =contextPath+"/userMember/userlist?page="+currentPage+"&sort=id&order=desc&rows="+pageSize;
    var js = contextPath+'/js/home/userslist.js';
    console.log(url);

  /*  var js = contextPath+'/home/qcModel/modelManagement/js/modelManagementList.js';*/
    viewer.load(content_dom, url, js);
}
/**
 * 重置查询条件
 */

