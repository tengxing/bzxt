/**
 * 分页插件
 */

(function($) {
	$.fn.paginate = function(options) {
		var opts = $.extend({}, $.fn.paginate.defaults, options);
		return this.each(function() {
			$this = $(this);
			var o = $.meta ? $.extend({}, opts, $this.data()) : opts;
			var selectedpage = o.start;
			$.fn.draw(o,$this,selectedpage);	
		});
	};
	$.fn.paginate.defaults = {	
		count 		: 5, 		//每个页码组的页码数 如 1 2 3 4 5 
		start 		: 1,		//开始页数 
		display		: 1,		//显示页数 定位到第几页
		totalPage	:10,		//总的页数
		showFirst	:true, 		//显示首页
		showLast	:true,		//显示末页
		fixBottom	:true,		//固定在底部
		mouse		:'slide',
        totalRow:0,
        showTotal:true,
		onChange	: function(){return false;} 	//回调事件
	};
	$.fn.draw = function(o,obj,selectedpage){
		if(o.display > o.count)
			o.display = o.count;
		//$this.empty();
 	if(o.display!=1&&o.fixBottom){
 		//页面滑动底部
 		//window.scrollTo(0,document.body.scrollHeight);
 	}
 	o.display = selectedpage;
 	var div_pagination = obj;//分页div
 	var lis = new StringBuffer();
 	if(o.showFirst){
 		lis.append('<li data-page="first"><a href="javascript:;">首页</a></li>');
 	}
 	lis.append('<li data-page="prevPage"><a href="javascript:;" ><i class="fa fa-angle-left"></i></a></li>');
 	//中间页码数
 	var middenPageIndex = o.count%2==0?o.count/2+1:parseInt(o.count/2)+1;
 	//左侧开始页
 	var leftpageindex  = 1;
 	//总页数足够一个分页组
 	if(o.totalPage>o.count)
 	{
 		if(o.display<=3){
 			//最开始
 			leftpageindex  = 1;
 		}else if(o.display>(o.totalPage-2)){
 			leftpageindex = o.totalPage-o.count+1;
 		}else{
 			leftpageindex = o.display-2;
 		}	
 		 for(var i=0;i<o.count;i++)
 		 {
 			  var index = leftpageindex+i;
 			  //判断是否处于最前面或者最后面
 			  if(o.display<3||(leftpageindex == o.totalPage-o.count+1))
 			  {
 				  if(index==o.display){
 					  lis.append('<li data-id='+index+' class="active"><a href="javascript:;">'+index+'<span class="sr-only">(当前)</span></a></li>');
 				  }else{
 					  lis.append('<li data-id='+index+'><a href="javascript:;" >'+index+'</a></li>');
 				  }
 			  }else{
 				  if(i==2){
 					  lis.append('<li class="active" data-id='+index+'><a href="javascript:;" >'+index+'</a></li>');
 				  }else{
 					  lis.append('<li data-id='+index+'><a href="javascript:;" >'+index+'</a></li>');
 				  }
 			  }
 		  }
 	}
 	else{
 		leftpageindex =1;
 		for(var i=0;i<o.totalPage;i++)
 		{
 			 var index = leftpageindex+i;
 			if(index==o.display){
 				  lis.append('<li data-id='+index+' class="active"><a href="javascript:;">'+index+'<span class="sr-only">(current)</span></a></li>');
 			  }else{
 				  lis.append('<li data-id='+index+'><a href="javascript:;" >'+index+'</a></li>');
 			  }
 		}
 	}
 	lis.append('<li data-page="nextPage"><a href="javascript:;"><i class="fa fa-angle-right"></i></a></li>');
 	
 	if(o.showLast){
 		lis.append('<li data-page="last"><a href="javascript:;">末页</a></li>');
 	}
   
 	div_pagination.html(lis.toString());
 	//绑定点击事件
 	div_pagination.find('li').click(function(){
        if($(this).hasClass("disabled") || $(this).hasClass("active")){
            return;
        }
 		var index = $(this).attr("data-id");
 		if(index == undefined){
 			var id = $(this).attr("data-page");
 			if(id=="prevPage"){
 				//上一页
 				o.display--;
 			}else if(id=="nextPage"){
 				o.display++;
 			}else if(id=="first"){
 				//首页
 				o.display=1;
 			}else if(id=="last"){
 				//末页
 				o.display=o.totalPage; 
 			}
 			o.onChange(o.display); 		//回调事件
			
		$.fn.draw(o,obj,o.display);	//刷新UI
 		}else{
 			//查询具体的某一页
 			o.display = index;
			o.onChange(o.display);			//回调事件
			$.fn.draw(o,obj,o.display);//刷新UI
 		}
 	});
 	div_pagination.find("#select_index").unbind("click");	
		if(o.display == o.totalPage||o.totalPage==0){
				//下一页不可用
				var next = div_pagination.find("li[data-page='nextPage']");
				next.addClass('disabled');
				next.unbind('click');
			  //首页选中
				var prev = div_pagination.find("li[data-page='last']");
				prev.addClass('active');
		}
		if(o.display==1){
			//上一页不可用
			var prev = div_pagination.find("li[data-page='prevPage']");
			prev.addClass('disabled');
			prev.unbind('click');
			//首页选中
			var prev = div_pagination.find("li[data-page='first']");
			prev.addClass('active');
		}
		
	};
	//设置样式
	$.fn.applystyle = function(o,obj,a_css,hover_css,_first,_ul,_ulwrapdiv,_divwrapright){
			alert(0);
					obj.find('a').css(a_css);
					obj.find('span.jPag-current').css(hover_css);
					obj.find('a').hover(
					function(){
						$(this).css(hover_css);
					},
					function(){
						$(this).css(a_css);
					}
					);
					obj.css('padding-left',_first.parent().width() + 5 +'px');
					insidewidth = 0;
					
					obj.find('li').each(function(i,n){
						if(i == (o.display-1)){
							outsidewidth_tmp = this.offsetLeft + this.offsetWidth ;
						}
						insidewidth += this.offsetWidth;
					});
					_ul.css('width',insidewidth+'px');
	};
	//封装string操作
	function StringBuffer() {
	    this.strings = new Array();
	};
	StringBuffer.prototype.append = function(str) {
	    this.strings.push(str);
	    return this;
	};
	StringBuffer.prototype.toString = function() {
	    return this.strings.join("");
	};
	
})(jQuery);