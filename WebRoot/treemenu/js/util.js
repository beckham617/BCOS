	 function legthRestraint(e){
        var obj=e.srcElement || e.target;
    	var dot=obj.value.indexOf(".");//alert(e.which);
	   	var  key=e.keyCode|| e.which;
	   	if(key==8 || key==9 || key==35 || key==36 || key==46 || (key>=37  && key<=40))//这里为了兼容Firefox的backspace,tab,del,方向键
	        return true;
	    if((key==190 || key==110) && dot==-1){//小数点
            return true;
        }
	    if ((key<=57 && key>=48) || (key<=105 && key>=96)) { //数字
	    	if((dot==-1) && obj.value.length < 13 ){//没有小数点且长度小于或等于13
	            return true;
	        }else if(dot!=-1){//小数点
	        	if((obj.value.substring(dot+1).length < 3) && (obj.value.substring(0,dot).length < 14)){
	        		return true;
	        	}
	        }
	    }        
	    return false;
    }
   
    function toNum(obj){
  		obj.value = reverseFormatAmount(obj.value);
  	}

	function checkNumLength(obj){
		var num = obj.value;
		if(num=="")
			return false;
		if(isNaN(num)){
			alert("请输入正确的数字");
			obj.value = "";
			return false;
		}else{
			var dotIndex;
			var numStr = new String(num); 
			numStr = numStr+"";
			dotIndex = numStr.indexOf(".");
			var strFront = numStr, strEnd = "";
			if (dotIndex != -1) {
				strFront = numStr.substring(0, dotIndex);
				strEnd = numStr.substring(dotIndex + 1, numStr.length);
			}
			if(strFront.length > 13){
				alert("整数部分不能大于13位");
				obj.value = "";
				obj.focus();
				return false;
			}
			if(strEnd.length > 2){
				alert("小数部分不能大于2位");
			     obj.value=JSRoundb(num,2);
				return false;
			}
		}
	}
	
	function JSRoundb(fNum,fBit){
		 var i = 1;
		 var m = 1;
		 var tempNum = fNum;
		 for(i=1;i <= fBit;i++)
		  m = m * 10;
		 tempNum = tempNum * m;
		 tempNum = Math.round(tempNum);
		 tempNum = tempNum / m;
		 return tempNum;
  } 
	
	function formatNu(obj){
  		obj.value = formatNewAmount(obj.value,2);
  	}
  	
  	
function reverseFormatAmount(strData) {
	var i, strTemp;

	strTemp = new String(strData);
	strData = "";
	for (i = 0; i < strTemp.length; i++) {
		var cData;
		cData = strTemp.charAt(i);
		if (cData != ",") {
			strData = strData + cData;
		}
	}
	return strData;
}

function formatNewAmount(strData, decimalNum) {
	if (isInnerFloat(strData)) {
		if (strData != "") {
			var i, strTemp;

			strTemp = new String(strData);
			strData = "";
			for (i = 0; i < strTemp.length; i++) {
				var cData;
				cData = strTemp.charAt(i);
				if (cData != ",") {
					strData = strData + cData;
				}
			}

			var nPoint;
			nPoint = strData.indexOf(".");
			var strFront = strData, strEnd = "";
			if (nPoint != -1) {
				strFront = strData.substring(0, nPoint);
				strEnd = strData.substring(nPoint + 1, strData.length);
			}

			var bHaveMinus = false;
			if (strFront.substring(0, 1) == "-") {
				bHaveMinus = true;
			}

			if (strEnd.length > decimalNum ) {
				var strendlength = strEnd.length;
				var tempnum = JSRound(strEnd, strendlength - decimalNum);
				strEnd = tempnum + '';
				if(strEnd.length > decimalNum ){
					var intFront = parseInt(strFront);
					if (bHaveMinus) {
						intFront--;
					}else{
						intFront++;
					}

					strFront = intFront+'';
					strEnd = '';
				}
			}
			while(strEnd.length < decimalNum){
				strEnd += "0";
			}
			

			strTemp = new String(strFront);
			if (bHaveMinus) {
				strTemp = strTemp.substring(1, strTemp.length);
			}
			strFront = "";
			var nNum;
			nNum = 0;
			for (i = strTemp.length - 1; i >= 0; i--) {
				if (nNum == 3) {
					strFront = "," + strFront;
					nNum = 0;
				}
				nNum++;
				var cData;
				cData = strTemp.charAt(i);
				strFront = cData + strFront;
			}
			if (bHaveMinus) {
				strFront = "-" + strFront;
			}
			
			strData = strFront + "." + strEnd;
		}
	}
	return strData;
}