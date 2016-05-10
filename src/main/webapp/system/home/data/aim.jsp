<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/system/common/head.jsp"%>
<script src="<%=request.getContextPath()%>/js/common/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/home/data/highcharts.js"></script>


<script type="text/javascript" src="<%=request.getContextPath()%>/js/home/tools.holly.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/home/jquery.blockui.min.js"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/home/app.js"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/home/toastr.min.js"></script>
<script type="text/javascript">
	var contextPath='<%=request.getContextPath()%>';
</script>	
	

<body>
	<!--<%=request.getContextPath()%>不能够加载里面 否则会报错  -->
	<jsp:include page="/system/common/top.jsp"></jsp:include>
	<nav>
		<%@include file="/system/common/nav.jsp"%>
	</nav>
	<section class="alert">
		<div class="green">
			<p>
				图表中表明：java未来一片光明
			</p>

			<span class="close">&#10006;</span>
		</div>
	</section>




	<section class="content" id="content">
		<div id="container"></div>
		
		<div class="alert">
			
		</div>
	
	</section>
<script type="text/javascript">

$(function () {                                                                     
    $(document).ready(function() {                                                  
        Highcharts.setOptions({                                                     
            global: {                                                               
                useUTC: false                                                       
            }                                                                       
        });                                                                         
                                                                                    
        var chart;                                                                  
        $('#container').highcharts({                                                
            chart: {                                                                
                type: 'spline',                                                     
                animation: Highcharts.svg, // don't animate in old IE               
                marginRight: 10,                                                    
                events: {                                                           
                    load: function() {                                              
                                                                                    
                        // set up the updating of the chart each second             
                        var series = this.series[0];                                
                        setInterval(function() {                                    
                            var x = (new Date()).getTime(), // current time         
                                y = Math.random();                                  
                            series.addPoint([x, y], true, true);                    
                        }, 1000);                                                   
                    }                                                               
                }                                                                   
            },                                                                      
            title: {                                                                
                text: 'Live random data'              //主标题                              
            },    subtitle: {                                                                
                text: 'order by tengxing'       //副标题                                      
            },                                                                    
            xAxis: {                                                                
                type: 'datetime',                                                   
                tickPixelInterval: 150        //横坐标                                      
            },                                                                      
            yAxis: {                                                                
                title: {                             //纵坐标                               
                    text: 'Value'                                                   
                },                                                                  
                plotLines: [{                                                       
                    value: 0,                      //不知                                 
                    width: 1,                                                       
                    color: '#808080'                                                
                }]                                                                  
            },                                                                      
            tooltip: {                                //鼠标放上去显示数据                         
                formatter: function() {                                             
                        return '<b>'+ this.series.name +'</b><br/>'+                
                        Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) +'<br/>'+
                        Highcharts.numberFormat(this.y, 2);                         
                }                                                                   
            },                                                                      
            legend: {                                                               
                enabled: false                                                      
            },                                                                      
            exporting: {                                                            
                enabled: false                                                      
            },                                                                      
            series: [{                                                              
                name: 'Random data',                                                
                data: (function() {                                                 
                    // generate an array of random data                             
                    var data = [],                                                  
                        time = (new Date()).getTime(),                              
                        i;                                                          
                                                                                    
                    for (i = -19; i <= 0; i++) {                                    
                        data.push({                                                 
                            x: time + i * 1000,                                     
                            y: Math.random()                                        
                        });                                                         
                    }                                                               
                    return data;                                                    
                })()                                                                
            }]                                                                      
        });                                                                         
    });                                                                             
                                                                                    
});                                                                                 
</script>
</body>
</html>