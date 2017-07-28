function navBar(data){
	var ulHtml = '<ul class="layui-nav layui-nav-tree">';
	for(var i=0;i<data.length;i++){
		if(data[i].spread){
			ulHtml += '<li class="layui-nav-item layui-nav-itemed">';
		}else{
			ulHtml += '<li class="layui-nav-item">';
		}
		if(data[i].children != undefined && data[i].children.length > 0){
			ulHtml += '<a href="javascript:;">';
            ulHtml += '<i class="layui-icon larry-icon '+data[i].icon+' " data-icon="'+data[i].icon+'"></i>';
            ulHtml += '<cite>'+data[i].title+'</cite>';
			ulHtml += '<span class="layui-nav-more"></span>';
			ulHtml += '</a>'
			ulHtml += '<dl class="layui-nav-child">';
			for(var j=0;j<data[i].children.length;j++){
				ulHtml += '<dd><a href="javascript:;" data-url="'+data[i].children[j].href+'">';
				if(data[i].children[j].icon != undefined && data[i].children[j].icon != ''){
                    ulHtml += '<i class="layui-icon larry-icon '+data[i].children[j].icon+'" data-icon="'+data[i].children[j].icon+'"></i>';
                }
				ulHtml += '<cite>'+data[i].children[j].title+'</cite></a></dd>';
			}
			ulHtml += "</dl>"
		}else{
			ulHtml += '<a href="javascript:;" data-url="'+data[i].href+'">';
            ulHtml += '<i class="layui-icon larry-icon '+data[i].icon+'" data-icon="'+data[i].icon+'"></i>';
			ulHtml += '<cite>'+data[i].title+'</cite></a>';
		}
		ulHtml += '</li>'
	}
	ulHtml += '</ul>';
	return ulHtml;
}


function topNavBar(pdata){
    $.each(pdata,function(index,item){
        alert(item.title)
    })
    var ulHtml = '<ul class="layui-nav clearfix">';
    for(var i=0;i<data.length;i++){
        if(data[i] = 0){
            ulHtml += '<li class="layui-nav-item layui-this" data-pid="'+data[i].pid+'">';
        }else{
            ulHtml += '<li class="layui-nav-item" data-pid="'+data[i].pid+'">';
        }
            ulHtml += '<a><i class="larry-icon '+data[i].icon+'"></i>';
            ulHtml += '<cite>'+data[i].title+'</cite></a>';

        ulHtml += '</li>'
    }
    ulHtml += '</ul>';
    return ulHtml;
}
