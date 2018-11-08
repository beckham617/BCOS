//作者：wgoose
//下面一个函数用于去除属性中的空格
function jTrim(str)
{
	var i = 0;
	var len = str.length;
	if ( str == "" ) return( str );
	j = len -1;
	flagbegin = true;
	flagend = true;
	while ( flagbegin == true && i< len)
	{
		if ( str.charAt(i) == " " )
		{
			i=i+1;
			flagbegin=true;
		}
		else
		{
			flagbegin=false;
		}
	}
	while  (flagend== true && j>=0)
	{
		if (str.charAt(j)==" ")
		{
			j=j-1;
			flagend=true;
		}
		else
		{
			flagend=false;
		}
	}
	if ( i > j ) return ("")
	trimstr = str.substring(i,j+1);
	return trimstr;
}
//下面一个函数用于打开个股明细窗体
function openMingxi(daima)
{
	var url="/gudong/queryMingxiAction.do";
	gudongApp=window.open(url,'gudongApp', 'toolbar=no,location=no,directories=no,status=yes,menubar=no, scrollbars=yes,resizable=no,copyhistory=no,width=8, height=8,top=0,left=0');
	gudongApp.resizeTo(screen.width,screen.height-25)
	gudongApp.focus();
}
//清楚模块切换时的状态条信息
function clearStatus()
{
	window.status="";
}
//用于校验日期输入(年月日：未完成)
function checkDate(starttime,endtime)
{
	var year,month;
	var gone;//年月之间的过渡"-"
	year=datetime.substring(0,4);
	if(isNaN(year)==true)
	{//555555_1
		alert("年输入错误");
		return false;
	}//555555_1
	gone=datetime.substring(4,5);
	month=datetime.substring(5,7);
	if(isNaN(month)==true)
	{//555555_2
		alert("月输入错误");
		return false;
	}//555555_2
	if(gone=="-")
	{//555555_3
		if(month<1||month>12) 
		{
			alert("月份必须在01和12之间!");
			return false;
		}
		if(month=="1"||month=="2"||month=="3"||month=="4"||month=="5"||month=="6"||month=="7"||month=="8"||month=="9")
		{
			alert("月份请补0\n例(2008-08)");
			return false;
		}
	}//555555_3
	else
	{
		alert("请参考格式(yyyy-MM)进行分隔符输入\n例(2008-08)");
		return false;
	}
	return true;
}