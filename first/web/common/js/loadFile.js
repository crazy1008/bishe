 var Path = realPath();
var dynamicLoading = {
	css: function (path) {
		if (!path || path.length === 0) {
			throw new Error('argument "path" is required !');
		}
		document.write("<link type ='text/css'  href = '" + path + "' rel = 'stylesheet' />");
	},
	js: function (path) {
		if (!path || path.length === 0) {
			throw new Error('argument "path" is required !');
		}
		document.write("<script type ='text/javascript'  src = '" + path + "'>" + "</script>");
	},
	icon: function (path) {
		if (!path || path.length === 0) {
			throw new Error('argument "path" is require !');
		}
		document.write("<link rel='icon' href='" + path + "' type='image/x-icon'>");
	}
}
//获取路径
function realPath() {
	var fullPath = window.document.location.href;
	var pathName = window.document.location.pathname;
	var pos = fullPath.indexOf(pathName);
	var localhostPath = fullPath.substring(0, pos);
	var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
	return localhostPath + projectName + "/";
}
//动态加载 CSS 文件
dynamicLoading.css(Path + "common/bootstrap/css/bootstrap.min.css");
dynamicLoading.css(Path + "common/jquery/bootstrap-datepicker3.css");
dynamicLoading.css(Path + "common/css/font-awesome.min.css");
//加载图片
dynamicLoading.icon(Path + "common/image/logo.gif");
//动态加载 JS 文件
dynamicLoading.js(Path + "common/jquery/jquery-3.2.1.min.js");
dynamicLoading.js(Path + "common/jquery/jquery.validate.min.js");
dynamicLoading.js(Path + "common/bootstrap/js/bootstrap.min.js");
dynamicLoading.js(Path + "common/jquery/bootstrap-datepicker.min.js");
dynamicLoading.js(Path + "common/jquery/bootstrap-datepicker.zh-CN.min.js");
dynamicLoading.js(Path + "common/bootstrap/js/bootstrapValidator.js");
dynamicLoading.js(Path + "common/jquery/jqpaginator.min.js");