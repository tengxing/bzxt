
/**
 * Created by 151029 on 2016/1/14.
 * 模型列表 js
 *
 */
/**
 * 初始化
 * @param dom
 * @param callbackObject
 * @private
 */
function __init(dom,callbackObject){
    paging();
}
var el=document.body;//遮罩参数
/**
 * 分页插件
 */
function paging(){
/*    $("[data-toggle='popover']").popover();//加载提示框
*/    var totalCount =$('#totalCount').val();//总行数
    var totalPage = totalCount%pageSize==0?totalCount/pageSize:parseInt(totalCount/pageSize+1);//计算总页数

    //分页插件
    $("#pagination").paginate({
        count       : 5,       //每个页码组的页码数
        start       : currentPage,  //起始页
        totalPage   : totalPage,//总的页数
        showFirst   :true,  //显示首页
        showLast    :true,  //显示末页
        fixBottom   :true,  //固定在底部
        mouse       :'press',
        totalRow    :totalCount,
        onChange    : function(page){
            currentPage = page;
            searchModelList();//回调事件
        }
    });
}
/**
 * 编辑功能，跳转到编辑页面
 * @param modelId 模型Id 编辑参数
 */

/**
 * 删除模型
 * @param modelId 模型ID
 */

