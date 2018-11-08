var whitespace = " \t\n\r";
var decimalPointDelimiter = ".";
function disDialog(url, argument, width, height) {
	var retval;
	if (argument == null) {
		retval = window.showModalDialog(url, window, "status:no;resizable:no;dialogHeight:" + height + "px;dialogWidth:" + width + "px;unadorne:yes");
	} else {
		retval = window.showModalDialog(url, argument, "status:no;resizable:no;dialogHeight:" + height + "px;dialogWidth:" + width + "px;unadorne:yes");
	}
	return retval;
}
function getindex() {
	var obj = event.srcElement;
	if (obj.tagName != "TR") {
		obj = obj.parentElement;
	}
	alert(obj.rowIndex);
}
// 得到字符串的真实长度（双字节换算为三个单字节） 
function getStrActualLen(sChars) {
	return sChars.replace(/[^\x00-\xff]/g, "xxx").length;
}
/**判断特殊字符
   %&*_|<>  
*/
function specialChar(strC, strName) {
	var strvalue = strC.value.trim();
	var patrn = /[\%\^\'\#\<\>~`\&\|\/\*\\]/;
	if (patrn.test(strvalue)) {
		alert(strName + "\u4e0d\u80fd\u5f55\u5165\u7279\u6b8a\u5b57\u7b26\uff0c\u8bf7\u91cd\u65b0\u5f55\u5165\n\u4f8b\u5982\uff1a%&*<>^#|/\\' \u7b49");
		strC.value = "";
		strC.focus();
		return false;
	} else {
		return true;
	}
}

//add by ouzhuan at 2010-7-22 针对specialChar(strC, strName)方法，当控件中含有特殊字符时，清空控件逻辑进行修改，当控件中含有特殊字符时，本方法清空控件内容
function specialChar_new(strC, strName) {
	var strvalue = strC.value.trim();
	var patrn = /[\%\^\'\#\<\>~`\&\|\/\*\\]/;
	if (patrn.test(strvalue)) {
		alert(strName + "\u4e0d\u80fd\u5f55\u5165\u7279\u6b8a\u5b57\u7b26\uff0c\u8bf7\u91cd\u65b0\u5f55\u5165\n\u4f8b\u5982\uff1a%&*<>^#|/\\' \u7b49");
		//strC.value = "";
		strC.focus();
		return false;
	} else {
		return true;
	}
}

function isSpecialChar(d_string) {
	var i;
	var specialChar = "\"%&*_|<>'";
	var allValid = false;
	for (i = 0; i < d_string.length; i++) {
		var c = d_string.charAt(i);
		if (specialChar.indexOf(c) >= 0) {
			allValid = true;
		}
	}
	return allValid;
}
	 
// Returns true if character c is a digit
// (0 .. 9).
function isDigit(c) {
	return ((c >= "0") && (c <= "9"));
}
function isWhitespace(s) {
	var i;
	
    // Is s empty?
	if (isEmpty(s)) {
		return true;
	}
	
    // Search through string's characters one by one
    // until we find a non-whitespace character.
    // When we do, return false; if we don't, return true.
	for (i = 0; i < s.length; i++) {   
        // Check that current character isn't whitespace.
		var c = s.charAt(i);
		if (whitespace.indexOf(c) == -1) {
			return false;
		}
	}
	
    // All characters are whitespace.
	return true;
}
// Check whether string s is empty.
function isEmpty(s) {
	return ((s == null) || (s.length == 0));
}
     
//判断是否日期
String.prototype.isDate = function () {
	var r = this.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/);
	if (r == null) {
		return false;
	}
	var d = new Date(r[1], r[3] - 1, r[4]);
	return (d.getFullYear() == r[1] && (d.getMonth() + 1) == r[3] && d.getDate() == r[4]);
};
//判断是否日期加时间
String.prototype.isTime = function () {
	var r = this.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2}) (\d{1,2}):(\d{1,2}):(\d{1,2})$/);
	if (r == null) {
		return false;
	}
	var d = new Date(r[1], r[3] - 1, r[4], r[5], r[6], r[7]);
	return (d.getFullYear() == r[1] && (d.getMonth() + 1) == r[3] && d.getDate() == r[4] && d.getHours() == r[5] && d.getMinutes() == r[6] && d.getSeconds() == r[7]);
};
function checkSpecial(obj) {
	var patrn = /[\^\'\#\<\>~`\&\|\/\*\\]/;
	if (patrn.test(obj)) {
		return true;
	} else {
		return false;
	}
}
//尽可能全的验证特殊字符 add by hfgou at 2010-03-25
function checkSpecialChar(obj){
	var patrn = /[\￥\%\@\!\$\^\'\#\<\>~`\&\|\/\*\\]/;
	if (patrn.test(obj)) {
		return true;
	} else {
		return false;
	}	
}
function checkisDouble(value){
	   var partrn = /^\d+(\.[\d][\d])?$/;
	   if(partrn.test(value))
		{
	      	return true;
	    }
		else
		{
		 	return false;
		}
	}
	
//验证是否日期
function checkisDate(date) {
	return date.isDate();
}

//判断是否金额
function checkisAmount(value) {
	var partrn = /^([\d]{1,3},([\d]{3},)*[\d]{3}|[\d]+)(\.[\d]{1,2})?$/;
	if (partrn.test(value)) {
		return true;
	} else {
		return false;
	}
}
//判断是否金额(验证小数点后3位)
function checkisAmount1(value) {
	var partrn = /^([\d]{1,3},([\d]{3},)*[\d]{3}|[\d]+)(\.[\d]{1,3})?$/;
	if (partrn.test(value)) {
		return true;
	} else {
		return false;
	}
}
//判断是否金额(验证小数点后2位,可以是负数)
function checkisAmount2(value) {
	var partrn = /^([-\+])?([\d]{1,3},([\d]{3},)*[\d]{3}|[\d]+)(\.[\d]{1,2})?$/;
	if (partrn.test(value)) {
		return true;
	} else {
		return false;
	}
}
//判断是否金额(验证小数点后6位,可以是负数)
function checkisAmount3(value) {
	var partrn = /^([-\+])?([\d]{1,3},([\d]{3},)*[\d]{3}|[\d]+)(\.[\d]{1,6})?$/;
	if (partrn.test(value)) {
		return true;
	} else {
		return false;
	}
}
//验证是否小数
function isDouble(value) {
	var partrn = /^[-\+]?\d+(\.[\d]{1,3})?$/;
	if (partrn.test(value)) {
		return true;
	} else {
		return false;
	}
}

function isInt(str) {
	var reg = /^\d+$/;
	if (str.match(reg)) {
		//全部是数字
		return true;
	} else {
		//含有其他字符
		return false;
	}
}

//判断是否利率
function isRate(value) {
	var partrn = /^\d+(\.[\d]{1,6})?$/;
	if (partrn.test(value)) {
		return true;
	} else {
		return false;
	}
}
String.prototype.trim = function () {   
    //   用正则表达式将前后空格
    //   用空字符串替代。   
	return this.replace(/(^\s*)|(\s*$)/g, "");
};
  	
  	//验证数字(输入框的名字,id标识，最大值，最小值，小数位数)
function checkNum(str, objname, max, min, fot) {
	var obj = document.getElementById(objname);
	var objval = obj.value;
	if (isNaN(obj.value)) {
		obj.focus();
		alert(str + "\u8f93\u5165\u7684\u4e0d\u662f\u6570\u5b57\uff0c\u8bf7\u91cd\u65b0\u5f55\u5165");
		return false;
	} else {
		if (objval > max || objval < min) {
			obj.focus();
			alert(str + "\u8f93\u5165\u7684\u6570\u5b57\u8303\u56f4\u5e94\u4e3a\uff08" + min + " \uff0d\uff0d " + max + "\uff09");
			return false;
		}
		var len1 = (parseInt(objval) + "").length;
		var len2 = (objval / 1 + "").length;
			//小数位数
		var objfloNum = len2 - len1 - 1;
		if (objfloNum > fot) {
			obj.focus();
			alert(str + "\u8f93\u5165\u7684\u5c0f\u6570\u4f4d\u6570\u6700\u591a\u4e3a" + fot + ",\u8bf7\u91cd\u65b0\u5f55\u5165");
			return false;
		}
	}
	return true;
}

function checkNumWithoutMsg(obj,max,min,fot){
		var objval = obj.value.trim();
		if (isNaN(obj.value)){
			obj.focus();
			return false;
		}
		else{
			if (objval > max || objval < min){
				obj.focus();
				return false;
			}
			var len1 = (parseInt(objval) + "").length;
			var len2 = (objval / 1 + "").length;
			//小数位数
			var objfloNum = len2-len1-1;
			if (objfloNum > fot){
				obj.focus();
				return false;
			}
		}
		return true;
	}

/**not check length only check number and min-max*/
function checkNum(str, objname, max, min) {
	var obj = document.getElementById(objname);
	var objval = obj.value;
	if (isNaN(obj.value)) {
		obj.focus();
		alert(str + "\u8f93\u5165\u7684\u4e0d\u662f\u6570\u5b57\uff0c\u8bf7\u91cd\u65b0\u5f55\u5165");
		return false;
	} else {
		if (objval > max || objval < min) {
			obj.focus();
			alert(str + "\u8f93\u5165\u7684\u6570\u5b57\u8303\u56f4\u5e94\u4e3a\uff08" + min + " \uff0d\uff0d " + max + "\uff09");
			return false;
		}
		var len1 = (parseInt(objval) + "").length;
		var len2 = (objval / 1 + "").length;
	}
	return true;
}
//判断第一个日期是否大于或等于第二个日期(无时间)
function compDate(DateOne, DateTwo) {
	var OneMonth = DateOne.substring(5, DateOne.lastIndexOf("-"));
	var OneDay = DateOne.substring(DateOne.length, DateOne.lastIndexOf("-") + 1);
	var OneYear = DateOne.substring(0, DateOne.indexOf("-"));
	var TwoMonth = DateTwo.substring(5, DateTwo.lastIndexOf("-"));
	var TwoDay = DateTwo.substring(DateTwo.length, DateTwo.lastIndexOf("-") + 1);
	var TwoYear = DateTwo.substring(0, DateTwo.indexOf("-"));
	if (Date.parse(OneMonth + "-" + OneDay + "-" + OneYear) >= Date.parse(TwoMonth + "-" + TwoDay + "-" + TwoYear)) {
		return true;
	} else {
		return false;
	}
}
//是否项目经理  managers 是否包含user
function isPrjManager( managers, user){
	if(managers == "") return false;
	if(user == "") return false;
	var bol = false;
	 	
	var managerArr = managers.split(",");
	for (var i = 0; i < managerArr.length; i++){
		if (user == managerArr[i]){
			bol = true;
			break;
		}
	}
	return bol;
}

//判断第一个日期是否大于第二个日期(无时间)
function compareDate(DateOne,DateTwo){
	var OneMonth = DateOne.substring(5,DateOne.lastIndexOf ("-"));
	var OneDay = DateOne.substring(DateOne.length,DateOne.lastIndexOf ("-")+1);
	var OneYear = DateOne.substring(0,DateOne.indexOf ("-"));
	var TwoMonth = DateTwo.substring(5,DateTwo.lastIndexOf ("-"));
	var TwoDay = DateTwo.substring(DateTwo.length,DateTwo.lastIndexOf ("-")+1);
	var TwoYear = DateTwo.substring(0,DateTwo.indexOf ("-"));
	if (Date.parse(OneMonth+"-"+OneDay+"-"+OneYear) > Date.parse(TwoMonth+"-"+TwoDay+"-"+TwoYear)){
		return true;
	}else{
		return false;
	}			
}
	
//当前date
function getNowDate(objCtl) {
	var date = new Date();
	var year = date.getFullYear();
	var month = date.getMonth() + 1;
	var day = date.getDate();
	if (month < 10) {
		month = "0" + month;
	}
	if (day < 10) {
		day = "0" + day;
	}
	objCtl.value = year + "-" + month + "-" + day;
}

//获取中文字符的声母的第一个字母(哈--H)
function getFirstPyLetter(s) {
	result = "";
	for (var i = 0; i < s.length; i++) {
		execScript("tmp=asc(\"" + s.substr(i, i + 1) + "\")", "vbscript"); // 不支持 ff
		tmp = 65536 + tmp;
		var py = "";
		if (tmp >= 45217 && tmp <= 45252) {
			py = "A";
		} else {
			if (tmp >= 45253 && tmp <= 45760) {
				py = "B";
			} else {
				if (tmp >= 45761 && tmp <= 46317) {
					py = "C";
				} else {
					if (tmp >= 46318 && tmp <= 46825) {
						py = "D";
					} else {
						if (tmp >= 46826 && tmp <= 47009) {
							py = "E";
						} else {
							if (tmp >= 47010 && tmp <= 47296) {
								py = "F";
							} else {
								if ((tmp >= 47297 && tmp <= 47613) || (tmp == 63193)) {
	        // 鲑 = 63193
									py = "G";
								} else {
									if (tmp >= 47614 && tmp <= 48118) {
										py = "H";
									} else {
										if (tmp >= 48119 && tmp <= 49061) {
											py = "J";
										} else {
											if (tmp >= 49062 && tmp <= 49323) {
												py = "K";
											} else {
												if (tmp >= 49324 && tmp <= 49895) {
													py = "L";
												} else {
													if (tmp >= 49896 && tmp <= 50370) {
														py = "M";
													} else {
														if (tmp >= 50371 && tmp <= 50613) {
															py = "N";
														} else {
															if (tmp >= 50614 && tmp <= 50621) {
																py = "O";
															} else {
																if (tmp >= 50622 && tmp <= 50905) {
																	py = "P";
																} else {
																	if (tmp >= 50906 && tmp <= 51386) {
																		py = "Q";
																	} else {
																		if (tmp >= 51387 && tmp <= 51445) {
																			py = "R";
																		} else {
																			if (tmp >= 51446 && tmp <= 52217) {
																				py = "S";
																			} else {
																				if (tmp >= 52218 && tmp <= 52697) {
																					py = "T";
																				} else {
																					if (tmp >= 52698 && tmp <= 52979) {
																						py = "W";
																					} else {
																						if (tmp >= 52980 && tmp <= 53688) {
																							py = "X";
																						} else {
																							if (tmp >= 53689 && tmp <= 54480) {
																								py = "Y";
																							} else {
																								if (tmp >= 54481 && tmp <= 62289) {
																									py = "Z";
																								} else {
																									py = s.charAt(i);
																								}
																							}
																						}
																					}
																				}
																			}
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
		result = result + py;
	}
	return result;
}
	
//转化回车为Tab
function Enter2Tab() {
	if ((window.event.srcElement.type == "text" || window.event.srcElement.type == "select-one" || window.event.srcElement.type == "checkbox" || window.event.srcElement.type == "radio") && window.event.keyCode == 13) {
		window.event.keyCode = 9;
	}
} 
//只格式化千分位显示,不做4舍5入函数
function formatOnly(strData, numArg) {
	if (isInnerFloat(strData)) {
		if (strData != "") {
			var i, strTemp;

		  	//去掉所有的","
			strTemp = new String(strData);
			strData = "";
			for (i = 0; i < strTemp.length; i++) {
				var cData;
				cData = strTemp.charAt(i);
				if (cData != ",") {
					strData = strData + cData;
				}
			}

		  	//将小数点前和后的数据分别取出来
			var nPoint;
			nPoint = strData.indexOf(".");
			var strFront = strData, strEnd = "";
			if (nPoint != -1) {
				strFront = strData.substring(0, nPoint);
				strEnd = strData.substring(nPoint + 1, strData.length);
			}

		  	//小数点前面的数据加","
			strTemp = new String(strFront);
			var bHaveMinus = false;
			if (strFront.substring(0, 1) == "-") {
				bHaveMinus = true;
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
			if (strEnd.length <= numArg) {
				if (numArg - strEnd.length == 0) {
					strEnd = strEnd;
				} else {
					if (numArg - strEnd.length == 1) {
						strEnd = strEnd + "0";
					} else {
						if (numArg - strEnd.length == 2) {
							strEnd = strEnd + "00";
						} else {
							if (numArg - strEnd.length == 3) {
								strEnd = strEnd + "000";
							} else {
							if (numArg - strEnd.length == 4) {
								strEnd = strEnd + "0000";
							}
						  }
						}
					}
				}
			}
			strData = strFront + "." + strEnd;
		}
	}
	return strData;
}
/**
 * 格式化金额,带四舍五入
 * @param strData 需要格式化的数据
 * @param decimalNum 保留小数位数
 * @return 返回格式化的金额
 */
function formatNewAmount(strData, decimalNum) {
	if (isInnerFloat(strData)) {
		if (strData != "") {
			var i, strTemp;

		  	//去掉所有的","
			strTemp = new String(strData);
			strData = "";
			for (i = 0; i < strTemp.length; i++) {
				var cData;
				cData = strTemp.charAt(i);
				if (cData != ",") {
					strData = strData + cData;
				}
			}
			//数字中除了点. 有其他字符时将只保留字符前面的，比如输入2.9% 会返回2.9 ，输入 3.44+333  会返回3.44
			// add by xiaoweichai 华融最初提出  2010年11月8日15:50:34
			strData=parseFloat(strData)+"";
		  	//将小数点前和后的数据分别取出来
			var nPoint;
			nPoint = strData.indexOf(".");
			var strFront = strData, strEnd = "";
			if (nPoint != -1) {
				strFront = strData.substring(0, nPoint);
				strEnd = strData.substring(nPoint + 1, strData.length);
			}

			// 判断符号
			var bHaveMinus = false;
			if (strFront.substring(0, 1) == "-") {
				bHaveMinus = true;
			}

			//补或者截小数点后面的值，保持两位
			if (strEnd.length > decimalNum ) {
				var strendlength = strEnd.length;
				var tempnum = JSRound(strEnd, strendlength - decimalNum);
				strEnd = tempnum + '';
				// 若溢出
				if(strEnd.length > decimalNum ){
					var intFront = parseInt(strFront);
					// 根据符号判断整数位的加减
					if (bHaveMinus) {
						intFront--;
					}else{
						intFront++;
					}

					strFront = intFront+'';
					strEnd = '';
				}
			}
			// 当小位数不够，补0
			while(strEnd.length < decimalNum){
				strEnd += "0";
			}
			

		  	//小数点前面的数据加","
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
/**
 * format amount 3 decimal
 */
function formatAmount3(strData, decimalNum) {
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
			
			// 判断符号
			var bHaveMinus = false;
			if (strFront.substring(0, 1) == "-") {
				bHaveMinus = true;
			}
			
			//补或者截小数点后面的值，保持三位
			if (strEnd.length > decimalNum) {
				var strendlength = strEnd.length;
				var tempnum = JSRound(strEnd, strendlength - decimalNum);
				if(tempnum == 1000){
					var intFront = parseInt(strFront);
					if (bHaveMinus) {
						intFront--;
					}else{
						intFront++;
					}
					strFront = intFront+'';
					strEnd = "000";
				}else{
					strEnd = tempnum;
				}
			} else {
				if (strEnd.length == 1) {
					strEnd = strEnd + "00";
				}
				if (strEnd.length == 0) {
					strEnd = "000";
				}
				if (strEnd.length == 2) {
					strEnd = "0";
				}
			}
			
			//小数点前面的数据加","
			strTemp = new String(strFront);
			if (bHaveMinus) {
				strTemp = strTemp.substring(1, strTemp.length);
			}
			strFront = "";
			var nNum;
			nNum = 0;
			for (i = strTemp.length - 1; i >= 0; i--) {
				if (nNum == 3 ) {
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
/**format to :1.0000,1.1000,1.1100,1.1110,1.0000*/
function formatAmount4(strData, decimalNum) {
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
			
			// 判断符号
			var bHaveMinus = false;
			if (strFront.substring(0, 1) == "-") {
				bHaveMinus = true;
			}
			
			//补或者截小数点后面的值，保持四位
			if (strEnd.length > decimalNum) {
				var strendlength = strEnd.length;
				var tempnum = JSRound(strEnd, strendlength - decimalNum);
				if(tempnum == 10000){
					var intFront = parseInt(strFront);
					if (bHaveMinus) {
						intFront--;
					}else{
						intFront++;
					}
					strFront = intFront+'';
					strEnd = "0000";
				}else{
					strEnd = tempnum;
				}
			} else {
				if (strEnd.length == 0) {
					strEnd = "0000";
				}
				if (strEnd.length == 1) {
					strEnd = strEnd + "000";
				}
				if (strEnd.length == 2) {
					strEnd = strEnd + "00";
				}
				if (strEnd.length == 3) {
					strEnd = strEnd + "0";
				}
			}
			
			//小数点前面的数据加","
			strTemp = new String(strFront);
			if (bHaveMinus) {
				strTemp = strTemp.substring(1, strTemp.length);
			}
			strFront = "";
			var nNum;
			nNum = 0;
			for (i = strTemp.length - 1; i >= 0; i--) {
				if (nNum == 3 ) {
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

	




function formatAmount(strData) {
    //alert("in formatAmount");
    strData = parseFloat(strData);
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
	
			
			strTemp = new String(strFront);
			var bHaveMinus = false;
			if (strFront.substring(0, 1) == "-") {
				bHaveMinus = true;
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
				
				
			if (strEnd.length > 2) {
				strEnd = strEnd.substring(0, 2);
			} else {
				if (strEnd.length == 1) {
					strEnd = strEnd + "0";
				} else {
					if (strEnd.length == 0) {
						strEnd = "00";
					}
				}
			}
			strData = strFront + "." + strEnd;
		}
	}
	return strData;
}

//格式化数字,去掉千分位","
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

/**
 * 失焦时格式化金额
 * @param obj 需要格式化的表单对象
 * @param showStr 需要格式化的对象的逻辑名称，在弹出报错信息时使用
 */
function formatAmountOnblur(obj,showStr){
	if(obj.value != '' && isNaN(obj.value)){
		alert(showStr+"格式不正确,请重新录入");
		obj.select();
		return;
	}
	obj.value = formatNewAmount(obj.value,2);
}

/**
 * 得焦时金额去逗号
 * @param obj 需要去逗号的表单对象
 */
function toAmountOnfocus(obj){
  	obj.value = reverseFormatAmount(obj.value);
  	obj.select();
}

function NoCN_SYMBOLConvertChineseAmount(currencyDigits){
	var no_sysboleAmount = convertChineseAmount(currencyDigits);
	var CN_SYMBOL = "\uffe5   ";
	return no_sysboleAmount.replace(CN_SYMBOL,"");
}

//转换金额为大写汉字
function convertChineseAmount(currencyDigits) {   
  	//Constants:   
	var MAXIMUM_NUMBER = 9999999999999.99;   
    //Predefine   the   radix   characters   and   currency   symbols   for   output:   
	var CN_ZERO = "\u96f6";
	var CN_ONE = "\u58f9";
	var CN_TWO = "\u8d30";
	var CN_THREE = "\u53c1";
	var CN_FOUR = "\u8086";
	var CN_FIVE = "\u4f0d";
	var CN_SIX = "\u9646";
	var CN_SEVEN = "\u67d2";
	var CN_EIGHT = "\u634c";
	var CN_NINE = "\u7396";
	var CN_TEN = "\u62fe";
	var CN_HUNDRED = "\u4f70";
	var CN_THOUSAND = "\u4edf";
	var CN_TEN_THOUSAND = "\u4e07";
	var CN_HUNDRED_MILLION = "\u4ebf";
	var CN_SYMBOL = "\uffe5   ";
	var CN_DOLLAR = "\u5143";
	var CN_TEN_CENT = "\u89d2";
	var CN_CENT = "\u5206";
	var CN_INTEGER = "\u6574";
	var CN_INTEGER0 = "\u96f6\u89d2\u96f6\u5206";
	var CN_INTEGER1 = "\u96f6\u5206";   
      
  	//Variables:   
	var integral;   //   Represent   integral   part   of   digit   number.   
	var decimal;   //   Represent   decimal   part   of   digit   number.   
	var outputCharacters;   //   The   output   result.   
	var parts;
	var digits, radices, bigRadices, decimals;
	var zeroCount;
	var i, p, d;
	var quotient, modulus;   
      
  	//Validate   input   string:   
	currencyDigits = reverseFormatAmount(currencyDigits);
	if (currencyDigits == "") {   
        //alert("输入的数字不能为空,请重新输入!");   
		return "";
	}
	if (currencyDigits.match(/[^,.\d]/) != null) {   
        //alert("输入的数字非法,请重新输入!");   
		return "\u8f93\u5165\u7684\u6570\u5b57\u975e\u6cd5,\u8bf7\u91cd\u65b0\u8f93\u5165!";
	}
	if ((currencyDigits).match(/^((\d{1,3}(,\d{3})*(.((\d{3},)*\d{1,3}))?)|(\d+(.\d+)?))$/) == null) {   
        //alert("输入的数字格式不正确,请重新输入!");   
		return "\u8f93\u5165\u7684\u6570\u5b57\u683c\u5f0f\u4e0d\u6b63\u786e,\u8bf7\u91cd\u65b0\u8f93\u5165!";
	}   
  	//Normalize   the   format   of   input   digits:   
	currencyDigits = currencyDigits.replace(/,/g, "");   //   Remove   comma   delimiters.   
	currencyDigits = currencyDigits.replace(/^0+/, "");   //   Trim   zeros   at   the   beginning.
    //Assert   the   number   is   not   greater   than   the   maximum   number.   
	if (Number(currencyDigits) > MAXIMUM_NUMBER) {   
        //alert("输入的数字过大,请重新输入!");   
		return "\u8f93\u5165\u7684\u6570\u5b57\u8fc7\u5927,\u8bf7\u91cd\u65b0\u8f93\u5165!";
	}   
      
  	//Process   the   coversion   from   currency   digits   to   characters:
    //Separate   integral   and   decimal   parts   before   processing   coversion:   
	parts = currencyDigits.split(".");
	if (parts.length > 1) {
		integral = parts[0];
		decimal = parts[1];   
        //Cut   down   redundant   decimal   digits   that   are   after   the   second.   
		decimal = decimal.substr(0, 2);
	} else {
		integral = parts[0];
		decimal = "";
	}   
    //Prepare   the   characters   corresponding   to   the   digits:   
	digits = new Array(CN_ZERO, CN_ONE, CN_TWO, CN_THREE, CN_FOUR, CN_FIVE, CN_SIX, CN_SEVEN, CN_EIGHT, CN_NINE);
	radices = new Array("", CN_TEN, CN_HUNDRED, CN_THOUSAND);
	bigRadices = new Array("", CN_TEN_THOUSAND, CN_HUNDRED_MILLION, CN_TEN_THOUSAND, CN_HUNDRED_MILLION);
	decimals = new Array(CN_TEN_CENT, CN_CENT);   
    //Start   processing:   
	outputCharacters = "";   
    //Process   integral   part   if   it   is   larger   than   0:   
	if (Number(integral) > 0) {
		zeroCount = 0;
		for (i = 0; i < integral.length; i++) {
			p = integral.length - i - 1;
			d = integral.substr(i, 1);
			quotient = p / 4;
			modulus = p % 4;
			if (d == "0") {
				zeroCount++;
			} else {
				if (zeroCount > 0) {
					outputCharacters += digits[0];
				}
				zeroCount = 0;
				outputCharacters += digits[Number(d)] + radices[modulus];
			}
			if (modulus == 0 && zeroCount < 4) {
				outputCharacters += bigRadices[quotient];
			}
		}
		outputCharacters += CN_DOLLAR;
	}   
    //Process   decimal   part   if   there   is:   
	if (decimal != "") {
		for (i = 0; i < decimal.length; i++) {
			d = decimal.substr(i, 1);
			if (d != "000") {
				outputCharacters += digits[Number(d)] + decimals[i];
			}
		}
		if (decimal.length < 2) {
			outputCharacters += CN_INTEGER1;
		}
	}   
    //Confirm   and   return   the   final   output   string:   
	if (outputCharacters == "") {
		outputCharacters = CN_ZERO + CN_DOLLAR;
	}
	if (decimal == "") {
		outputCharacters += CN_INTEGER0;
	}
	outputCharacters = CN_SYMBOL + outputCharacters;
	return outputCharacters;
}
function isFloat(s) {
	var i;
	var seenDecimalPoint = false;
	if (isEmpty(s)) {
		if (isFloat.arguments.length == 1) {
			return defaultEmptyOK;
		} else {
			return (isFloat.arguments[1] == true);
		}
	}
	if (s == decimalPointDelimiter) {
		return false;
	}

    //Search through string's characters one by one
    //until we find a non-numeric character.
    //When we do, return false; if we don't, return true.
	for (i = 0; i < s.length; i++) {   
        //Check that current character is number.
		var c = s.charAt(i);
		if ((c == decimalPointDelimiter) && !seenDecimalPoint) {
			seenDecimalPoint = true;
		} else {
			if (!isDigit(c)) {
				return false;
			}
		}
	}

    //All characters are numbers.
	return true;
}
/**
  * 将传入的小数部分四舍五入（如需要格式化的数据为0.123，传入的fNum参数则应为123）
  * @param fNum 需要格式化的数据
  * @param fBit 保留小数位数
  * @return 返回格式化的数据
  */
function JSRound(fNum,fBit){
   var m = 1;
   var length = fNum.length;
   var tempNum = parseInt(fNum,10);
   var len=tempNum+"";
   if (length>len.length){
     for(var i=1;i<=fBit;i++){
       tempNum = tempNum / 10;
       tempNum = Math.round(tempNum);
        }
     tempNum="0"+tempNum;
     return tempNum;
     }else {    
      for (var i = 1; i <= fBit; i++) {
        tempNum = tempNum / 10;
        tempNum = Math.round(tempNum);
           }
        return tempNum;
     }
 }
/**
  * 将传入的小数部分四舍五入（如需要格式化的数据为0.123，传入的fNum参数则应为123）
  * add by hfgou at 2010-03-23
  * @param fNum 需要格式化的数据
  * @param fBit 保留小数位数
  * @return 返回格式化的数据
  */
function JSRoundBetter(fNum,fBit){
   var m = 1;
   var length = fNum.length;
   var tempNum = parseInt(fNum,10);
   var len=tempNum+"";
   if (len.length >=fBit){  //如果参数长度大于小数点位数（最后返回的）
      	for (var i = 1; i <= (len.length-fBit); i++) {
        	tempNum = tempNum / 10;
        	tempNum = Math.round(tempNum);
      	}		
     	return tempNum;
    }else {    
      	for (var i = 1; i <= (fBit-len.length); i++) {
			tempNum = tempNum+"0";
      	}
        return tempNum;
     }
 }
/**
 *浮点数的四舍五入
 *@param fNum 传入的浮点数
 *@param fBit 小数点的位数 
 * add by hfgou at 2010-03-23
 */
function floatRounding(fNum,fBit){
	//将小数点前和后的数据分别取出来
	var nPoint;
	nPoint = fNum.indexOf(".");
	var strFont,strEnd,result = "";
	if (nPoint != -1) {
		strFont = fNum.substring(0,nPoint);
		strEnd = fNum.substring(nPoint + 1, fNum.length);
		var pointNumber = parseFloat(strEnd);
		var resultPoint = JSRoundBetter(pointNumber,fBit);
		var result = strFont+"."+resultPoint;		
	}else{ //如果传过来的是整数
		result = fNum+"";
		for(var i=0;i<fBit;i++){
			if(i == 0){
				result = result+".0"
			}else{
				result = result+"0";
			}
		}
	}
	
	return result
}
/**
 *失焦时，浮点数的四舍五入
 *@param fNum 传入的浮点数
 *@param fBit 小数点的位数 
 * add by ll at 2011-03-23
 */
function onBlurfloatRounding(obj){
	if(obj.value != '' && isNaN(obj.value)){
		alert("格式不正确,请重新录入");
		obj.select();
		return;
	}
	obj.value = floatRounding(obj.value,5);
}

/**
 * 格式化截取4位小数,少于4位补0
 * modified by zq zq
 * @param strData 需要格式化的数据
 * @param decimalNum 保留小数位数
 * @return 返回格式化的金额
 */
function cutNewAmount(strData, decimalNum) {
	if (isInnerFloat(strData)) {
		if (strData != "") {
			var i, strTemp;
			//去掉所有的","
			strTemp = new String(strData);
			strData = "";
			for (i = 0; i < strTemp.length; i++) {
				var cData;
				cData = strTemp.charAt(i);
				if (cData != ",") {
					strData = strData + cData;
				}
			}

			//将小数点前和后的数据分别取出来
			var nPoint;
			nPoint = strData.indexOf(".");
			var strFront = strData, strEnd = "";
			if (nPoint != -1) {
				strFront = strData.substring(0, nPoint);
				strEnd = strData.substring(nPoint + 1, strData.length);
			}
			
			//补或者截小数点后面的值，保持两位
			if (strEnd.length > 4) {
				var strendlength = strEnd.length;
				var tempnum = strEnd.substring(0, 4);
				strEnd = tempnum;
			} else {
				if (strEnd.length == 0) {
					strEnd = strEnd + "0000";
				}
				if (strEnd.length == 1) {
					strEnd = strEnd + "000";
				} else {
					if (strEnd.length == 2) {
						strEnd = strEnd + "00";
					} else {
						if (strEnd.length == 3) {
							strEnd = strEnd + "0";
						} else {
							if (strEnd.length == 4) {
								strEnd = strEnd;
							}
						}
					}
				}
			}
			strData = strFront + "." + strEnd;
		}
	}
	return strData;
}
function formatnumber(fnumber, fdivide, fpoint, fround) {
	//update by xfma 2010-03-01 解决科学计数法显示不对的问题
	var fnum = parseFloat(fnumber) + "";
	var revalue = "";
	fnum = fnum.replace(/^\s*|\s*$/g, "");
	if (fnum == null || fnum == "") {
		for (var i = 0; i < fpoint; i++) {
			revalue += "0";
		}
		return "0." + revalue;
	}
	if (!isInnerFloat(fnumber)){//update by xfma 2010-03-01
		return "NaN";
	}
	fnum = fnum.replace(/,/g, "");
	if (fround) {
		//bhj add 当要求保留两位的时候，当是005时有误差
		//update by xfma 2009-12-29
		var temp ;
		var bhjTeShu = fnum + "";
		if (fnum.replace(/[^.]/g, "").length != 0) {
			var bhjArray = fnum.split(".");
			var bhjTempVar = bhjArray[1].substring(0, 3);
			if (fnum != "" && fnum.substring(0, 1) != "-") {
				if (bhjTempVar == "005" && fpoint == 2) {
					temp = "0.006";
					fnum = Number(fnum) + Number(temp);
				}
			}
		}
		
		fnum += "";
	}
	var arrayf = fnum.split(".");
	if (fdivide) {
		if(arrayf[0].substring(0, 1) == "-"){
			//如果是负数，先去掉“-”，然后再格式 add by xfma 2009-12-29
			arrayf[0] = arrayf[0].substring(1, arrayf[0].length);
			if (arrayf[0].length > 3) {
				while (arrayf[0].length > 3) {
					revalue = "," + arrayf[0].substring(arrayf[0].length - 3, arrayf[0].length) + revalue;
					arrayf[0] = arrayf[0].substring(0, arrayf[0].length - 3);
				}
			}
			//格式以后再加上负号
			arrayf[0] = "-" + arrayf[0] ;
		}else{
			if (arrayf[0].length > 3) {
				while (arrayf[0].length > 3) {
					revalue = "," + arrayf[0].substring(arrayf[0].length - 3, arrayf[0].length) + revalue;
					arrayf[0] = arrayf[0].substring(0, arrayf[0].length - 3);
				}
			}
		}
	}
	revalue = arrayf[0] + revalue;
	if (arrayf.length == 2 && fpoint != 0) {
		arrayf[1] = arrayf[1].substring(0, (arrayf[1].length <= fpoint) ? arrayf[1].length : fpoint);
		var kk = parseInt(fpoint - arrayf[1].length);
		if (kk > 0) {
			for (var i = 0; i < kk ; i++) {
				arrayf[1] += "0";
			}
		}
		revalue += "." + arrayf[1];
	} else {
		if (arrayf.length == 1 && fpoint != 0) {
			revalue += ".";
			for (var i = 0; i < fpoint; i++) {
				revalue += "0";
			}
		}
	}
	return revalue;
}

//是否是float型

//这个方法并不能真正的进行检测是否是float型。
//parseFloat用法：
//	只有字符串中的第一个数字会被返回。
//	开头和结尾的空格是允许的。
//	如果字符串的第一个字符不能被转换为数字，那么 parseFloat() 会返回 NaN。
//  如果只想解析数字的整数部分，请使用 parseInt() 方法。
//	parseFloat("10")          	返回：10
//	parseFloat("10.00")			返回：10
//	parseFloat("10.33")			返回：10.33
//	parseFloat("34 45 66")		返回：34
//	parseFloat(" 60 ")			返回：60
//	parseFloat("40 years")		返回：40
//	parseFloat("He was 40")		返回：NaN

//不知道此方法的作者写这个方法的目的是什么，这里提醒想要用此方法的同事注意.
// xiaoweichai 增加注释 2010年11月8日15:51:42
function isInnerFloat(d_float) {
	if (isNaN(parseFloat(d_float))) {
		return false;
	} else {
		return true;
	}
} 
	
//检查身份证号码 
function checkIdold(pId) {
	var arrVerifyCode = [1, 0, "x", 9, 8, 7, 6, 5, 4, 3, 2];
	var Wi = [7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2];
	var Checker = [1, 9, 8, 7, 6, 5, 4, 3, 2, 1, 1];
	if (pId.length != 15 && pId.length != 18) {
		alert("\u8eab\u4efd\u8bc1\u53f7\u5171\u670915\u4f4d\u621618\u4f4d");
		return false;
	}
	var Ai = pId.length == 18 ? pId.substring(0, 17) : pId.slice(0, 6) + "19" + pId.slice(6, 16);
	if (!/^\d+$/.test(Ai)) {
		alert("\u8eab\u4efd\u8bc1\u9664\u6700\u540e\u4e00\u4f4d\u5916\uff0c\u5fc5\u987b\u4e3a\u6570\u5b57");
		return false;
	}
	var yyyy = Ai.slice(6, 10), mm = Ai.slice(10, 12) - 1, dd = Ai.slice(12, 14);
	var d = new Date(yyyy, mm, dd), now = new Date();
	var year = d.getFullYear(), mon = d.getMonth(), day = d.getDate();
	if (year != yyyy || mon != mm || day != dd || d > now || year < 1940) {
		alert("\u8eab\u4efd\u8bc1\u8f93\u5165\u9519\u8bef");
		return false;
	}
	for (var i = 0, ret = 0; i < 17; i++) {
		ret += Ai.charAt(i) * Wi[i];
	}
	Ai += arrVerifyCode[ret %= 11];
	if (pId.length == 18 && pId != Ai) {
		alert("\u8eab\u4efd\u8bc1\u8f93\u5165\u9519\u8bef");
		return false;
	}
	return true;
} 

function checkId(num) 
	{
    var factorArr = new Array(7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2,1);
    var error;
    var varArray = new Array();
    var intValue;
    var lngProduct = 0;
    var intCheckDigit;
    var intStrLen = num.length;
    var idNumber = num;    
    // initialize
    if ((intStrLen != 15) && (intStrLen != 18)) {
    	alert("身份证号共有15位或18位");
        //error = "输入身份证号码长度不对！";
        //alert(error);
        //frmAddUser.txtIDCard.focus();
        return false;
    }
    if (intStrLen == 15) {
    	if (!convertID(idNumber)) {
    		alert("身份证输入错误");
    		return false;
    	}
    	idNumber = convertID(idNumber);
    	intStrLen = 18;
    }    
    // check and set value
    for(i=0;i<intStrLen;i++) {
        varArray[i] = idNumber.charAt(i);
        if ((varArray[i] < '0' || varArray[i] > '9') && (i != 17)) {
        	alert("身份证输入错误");
            //error = "错误的身份证号码！.";
            //alert(error);
            //frmAddUser.txtIDCard.focus();
            return false;
        } else if (i < 17) {
            varArray[i] = varArray[i]*factorArr[i];
        }
    }
    if (intStrLen == 18) {
        //check date
        var date8 = idNumber.substring(6,14);
        if (checkDate1(date8) == false) {
        	alert("身份证输入错误");
            //error = "身份证中日期信息不正确！.";
            //alert(error);
            return false;
        }        
        // calculate the sum of the products
        for(i=0;i<17;i++) {
            lngProduct = lngProduct + varArray[i];
        }        
        // calculate the check digit
        intCheckDigit = 12 - lngProduct % 11;
        switch (intCheckDigit) {
            case 10:
                intCheckDigit = 'X';
                break;
            case 11:
                intCheckDigit = 0;
                break;
            case 12:
                intCheckDigit = 1;
                break;
        }        
        // check last digit
        if (varArray[17].toUpperCase() != intCheckDigit) {
        	alert("身份证输入错误");
            //error = "身份证效验位错误!...正确为： " + intCheckDigit + ".";
            //alert(error);
            return false;
        }
    } 
    else{        //length is 15
        //check date
        var date6 = idNumber.substring(6,12);
        if (checkDate1(date6) == false) {
        	alert("身份证输入错误");
            //alert("身份证日期信息有误！.");
            return false;
        }
    }
    //alert ("Correct.");
    return true;
	}
	function checkDate1(date8)
	{
		if (date8.length == 6)
			date8 = '19' + date8;
    	var r = date8.match(/^(\d{1,4})(\d{1,2})(\d{1,2})$/); 
	   if(r==null)return false;
	   var d = new Date(r[1], r[2]-1, r[3]); 
	   return (d.getFullYear()==r[1]&&(d.getMonth()+1)==r[2]&&d.getDate()==r[3]);
	}


//根据身份证取 生日
function getBirthday(id) {
	if (checkId(id) == false) {
		return "\u9519\u8bef\u7684\u8eab\u4efd\u8bc1\u53f7\u7801";
	}
	var birthday;
	if (id.length == 15) {
		birthday = "19" + id.slice(6, 8) + "-" + id.slice(8, 10) + "-" + id.slice(10, 12);
	} else {
		birthday = id.slice(6, 10) + "-" + id.slice(10, 12) + "-" + id.slice(12, 14);
	}
	return birthday;
}
	
//根据身份证取 性别
function getSex(id) {
	if (checkId(id) == false) {
		return "\u9519\u8bef\u7684\u8eab\u4efd\u8bc1\u53f7\u7801";
	}
	var sex;
	if (id.length == 15) {
		sex = id.slice(13, 15) % 2 ? "1" : "2";
	} else {
		sex = id.slice(15, 17) % 2 ? "1" : "2";
	}
	return sex;
}
/*
 *15身份证号码升18位,入口参数0为15身份证号码,返回值为18位身份证号码
 *如果证号错误则返回false
 */
function convertID(varInput) {
	if (varInput == null || varInput.trim() == "") {
		return false;
	}
	if (varInput.length == 18) {
		return varInput;
	}
	var strOldID = new String(varInput.trim());
	var strNewID = "";
	if (strOldID.length == 15) {
		for (i = 0; i < 15; i++) {
                     //15位的身份证号必须全部由数字组成，否则，视为非法
			if (checkZInt(strOldID)) {
				return false;
			}
		}
              //取得身份证中的年月日
		var year = "19" + strOldID.substr(6, 2);
              //alert(year);
		var month = strOldID.substr(8, 2);
              //alert(month);
		var day = strOldID.substr(10, 2);
              //alert(day);
              //校验日期是否正确
		if (checkDate(year, month, day)) {
			return false;
		}
		strNewID = strOldID.substring(0, 6) + "19" + strOldID.substring(6, 15);
	} else {
		if (strOldID.length == 18) {
			for (i = 0; i < 17; i++) {
                     //15位的身份证号必须全部由数字组成，否则，视为非法
				if (checkZInt(strOldID.substring(i, 1))) {
					return false;
				}
			}
			if (strOldID.substring(17, 18).toUpperCase != "X" && checkZInt(strOldID.substring(17, 18))) {
				return false;
			}
              //取得身份证中的年月日
			var year = "19" + strOldID.substr(6, 4);
			var month = strOldID.substr(10, 2);
			var day = strOldID.substr(12, 2);
              //校验日期是否正确
			if (checkDate(year, month, day)) {
				return false;
			}
			strNewID = strOldID.substring(0, 17);
		} else {
			if (strOldID.length == 17) {
				for (i = 0; i < 17; i++) {
                     //15位的身份证号必须全部由数字组成，否则，视为非法
					if (checkZInt(strOldID.substring(i, 1))) {
						return false;
					}
				}
              //取得身份证中的年月日
				var year = "19" + strOldID.substr(6, 4);
				var month = strOldID.substr(10, 2);
				var day = strOldID.substr(12, 2);
              //校验日期是否正确
				if (checkDate(year, month, day)) {
					return false;
				}
				strNewID = strOldID;
			}
		}
	}
	return strNewID = strNewID + createCK(strNewID);
}
/*
 *根据17位的身份证号得到最后一位校验码
 *strID：身份证号前17位
 *只返回
 */
function createCK(strID) {
	var s = 0;
	var WI = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2, 1);
	var AI = "10x98765432";
	for (i = 0; i < 17; i++) {
		j = strID.substr(i, 1) * WI[i];
		s = s + j;
	}
	s = s % 11;
	return AI.substr(s, 1);
}
/*
 *主要提供对日期的精确校验，验证日期是否合法
 *非法返回true,合法返回false
 *Junsan Jin 20050902 
 *参数说明：
 *year：年
 *month：月
 *day：日
 */
function checkDate(year, month, day) {
	var flag = false;
	var time = new Date(year, month - 1, day);
		       //alert(time);
	var e_year = time.getFullYear();
		       //alert(e_year);
	var e_month = time.getMonth() + 1;
		       //alert(e_month);
	var e_day = time.getDate();
		       //alert(e_day);
	if (year != e_year || month != e_month || day != e_day) {
		flag = true;
	}
	return flag;
}
/*
		 *检查输入的串是否在0到9之间的字符组成
		 *不是则返回true，如果是则返回false
		 *Junsan Jin 20050902
		 
		 * edit by jjxie3 2008-08-28
		 */
function checkZInt(str) {
	var reg = /^\d+$/;
	if (arr = str.match(reg)) {
		       //全部是数字
		return false;
	} else {
		       //含有其他字符
		return true;
	}
}
/*
		 *字符串去掉左右空格的方法
		 *Junsan Jin 20050902
		 */
String.prototype.trim = function () {
	return this.replace(/(^\s*)|(\s*$)/g, "");
};
/*
		 *字符串去掉左空格的方法
		 *Junsan Jin 20050902
		 */
String.prototype.ltrim = function () {
	return this.replace(/(^\s*)/g, "");
};
/*
 *字符串去掉右空格的方法
 *Junsan Jin 20050902
 */
String.prototype.rtrim = function () {
	return this.replace(/(\s*$)/g, "");
};
/*
 *add by jjxie3
 *验证表单值的格式是否为email地址
 */
function checkEmail(strC, strErrMsg) {
	var strvalue = strC.value.trim();
	var patrn = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
	var matchArray = strvalue.match(patrn);
	if (matchArray == null) {
		alert(strErrMsg);
		strC.value = "";
		strC.focus();
		return false;
	} else {
		return true;
	}
}
	
//---------------------------------------------------
var spell = {45217:"a", 45219:"ai", 45232:"an", 45241:"ang", 45244:"ao", 
			 45253:"ba", 45271:"bai", 45279:"ban", 45294:"bang", 
			 45306:"bao", 45485:"bei", 45500:"ben", 45504:"beng", 
			 45510:"bi", 45534:"bian", 45546:"biao", 45550:"bie", 
			 45554:"bin", 45560:"bing", 45731:"bo", 45752:"bu", 
			 45761:"ca", 45762:"cai", 45773:"can", 45780:"cang", 
			 45785:"cao", 45790:"ce", 45795:"ceng", 45797:"cha", 
			 45808:"chai", 45811:"chan", 45821:"chang", 45996:"chao", 
			 46005:"che", 46011:"chen", 46021:"cheng", 46036:"chi", 
			 46052:"chong", 46057:"chou", 46069:"chu", 46247:"chuai", 
			 46248:"chuan", 46255:"chuang", 46261:"chui", 46266:"chun", 
			 46273:"chuo", 46275:"ci", 46287:"cong", 46293:"cou", 
			 46294:"cu", 46298:"cuan", 46301:"cui", 46309:"cun", 
			 46312:"cuo", 46318:"da", 46324:"dai", 46498:"dan", 
			 46513:"dang", 46518:"dao", 46530:"de", 46533:"deng", 
			 46540:"di", 46559:"dian", 46575:"diao", 46584:"die", 
			 46753:"ding", 46762:"diu", 46763:"dong", 46773:"dou", 
			 46780:"du", 46795:"duan", 46801:"dui", 46805:"dun", 
			 46814:"duo", 46826:"e", 46839:"en", 46840:"er", 
			 47010:"fa", 47018:"fan", 47035:"fang", 47046:"fei", 
			 47058:"fen", 47073:"feng", 47088:"fo", 47089:"fou", 
			 47090:"fu", 47297:"ga", 47299:"gai", 47305:"gan", 
			 47316:"gang", 47325:"gao", 47335:"ge", 47352:"gei", 
			 47353:"gen", 47355:"geng", 47524:"gong", 47539:"gou", 
			 47548:"gu", 47566:"gua", 47572:"guai", 47575:"guan", 
			 47586:"guang", 47589:"gui", 47605:"gun", 47608:"guo", 
			 47614:"ha", 47777:"hai", 47784:"han", 47803:"hang", 
			 47806:"hao", 47815:"he", 47833:"hei", 47835:"hen", 
			 47839:"heng", 47844:"hong", 47853:"hou", 47860:"hu", 
			 48040:"hua", 48049:"huai", 48054:"huan", 48068:"huang", 
			 48082:"hui", 48103:"hun", 48109:"huo", 48119:"ji", 
			 48334:"jia", 48351:"jian", 48553:"jiang", 48566:"jiao", 
			 48594:"jie", 48621:"jin", 48803:"jing", 48828:"jiong", 
			 48830:"jiu", 48847:"ju", 48872:"juan", 48879:"jue", 
			 48889:"jun", 49062:"ka", 49066:"kai", 49071:"kan", 
			 49077:"kang", 49084:"kao", 49088:"ke", 49103:"ken", 
			 49107:"keng", 49109:"kong", 49113:"kou", 49117:"ku", 
			 49124:"kua", 49129:"kuai", 49133:"kuan", 49135:"kuang", 
			 49143:"kui", 49316:"kun", 49320:"kuo", 49324:"la", 
			 49331:"lai", 49334:"lan", 49349:"lang", 49356:"lao", 
			 49365:"le", 49367:"lei", 49378:"leng", 49381:"li", 
			 49577:"lia", 49578:"lian", 49592:"liang", 49603:"liao", 
			 49616:"lie", 49621:"lin", 49633:"ling", 49647:"liu", 
			 49658:"long", 49829:"lou", 49835:"lu", 49855:"lv", 
			 49869:"luan", 49875:"lue", 49877:"lun", 49884:"luo", 
			 49896:"ma", 49905:"mai", 49911:"man", 50082:"mang", 
			 50088:"mao", 50100:"me", 50101:"mei", 50117:"men", 
			 50120:"meng", 50128:"mi", 50142:"mian", 50151:"miao", 
			 50159:"mie", 50161:"min", 50167:"ming", 50173:"miu", 
			 50174:"mo", 50353:"mou", 50356:"mu", 50371:"na", 
			 50378:"nai", 50383:"nan", 50386:"nang", 50387:"nao", 
			 50392:"ne", 50393:"nei", 50395:"nen", 50396:"neng", 
			 50397:"ni", 50408:"nian", 50415:"niang", 50417:"niao", 
			 50419:"nie", 50426:"nin", 50427:"ning", 50595:"niu", 
			 50599:"nong", 50603:"nu", 50606:"nv", 50607:"nuan", 
			 50608:"nue", 50610:"nuo", 50614:"o", 50615:"ou", 50622:"pa", 
			 50628:"pai", 50634:"pan", 50642:"pang", 50647:"pao", 
			 50654:"pei", 50663:"pen", 50665:"peng", 50679:"pi", 
			 50858:"pian", 50862:"piao", 50866:"pie", 50868:"pin", 
			 50873:"ping", 50882:"po", 50891:"pu", 50906:"qi", 
			 50942:"qia", 51107:"qian", 51129:"qiang", 51137:"qiao", 
			 51152:"qie", 51157:"qin", 51168:"qing", 51181:"qiong", 
			 51183:"qiu", 51191:"qu", 51366:"quan", 51377:"que", 
			 51385:"qun", 51387:"ran", 51391:"rang", 51396:"rao", 
			 51399:"re", 51401:"ren", 51411:"reng", 51413:"ri", 
			 51414:"rong", 51424:"rou", 51427:"ru", 51437:"ruan", 
			 51439:"rui", 51442:"run", 51444:"ruo", 51446:"sa", 
			 51449:"sai", 51453:"san", 51619:"sang", 51622:"sao", 
			 51626:"se", 51629:"sen", 51630:"seng", 51631:"sha", 
			 51640:"shai", 51642:"shan", 51658:"shang", 51666:"shao", 
			 51677:"she", 51689:"shen", 51705:"sheng", 51878:"shi", 
			 51925:"shou", 51935:"shu", 52130:"shua", 52132:"shuai", 
			 52136:"shuan", 52138:"shuang", 52141:"shui", 52145:"shun", 
			 52149:"shuo", 52153:"si", 52169:"song", 52177:"sou", 
			 52180:"su", 52193:"suan", 52196:"sui", 52207:"sun", 
			 52210:"suo", 52218:"ta", 52389:"tai", 52398:"tan", 
			 52416:"tang", 52429:"tao", 52440:"te", 52441:"teng", 
			 52445:"ti", 52460:"tian", 52468:"tiao", 52473:"tie", 
			 52476:"ting", 52648:"tong", 52661:"tou", 52665:"tu", 
			 52676:"tuan", 52678:"tui", 52684:"tun", 52687:"tuo", 
			 52698:"wa", 52705:"wai", 52707:"wan", 52724:"wang", 
			 52734:"wei", 52929:"wen", 52939:"weng", 52942:"wo", 
			 52951:"wu", 52980:"xi", 53177:"xia", 53190:"xian", 
			 53216:"xiang", 53236:"xiao", 53416:"xie", 53437:"xin", 
			 53447:"xing", 53462:"xiong", 53469:"xiu", 53478:"xu", 
			 53497:"xuan", 53669:"xue", 53675:"xun", 53689:"ya", 
			 53705:"yan", 53738:"yang", 53755:"yao", 53932:"ye", 
			 53947:"yi", 54000:"yin", 54178:"ying", 54196:"yo", 
			 54197:"yong", 54212:"you", 54233:"yu", 54439:"yuan", 
			 54459:"yue", 54469:"yun", 54481:"za", 54484:"zai", 
			 54491:"zan", 54495:"zang", 54498:"zao", 54512:"ze", 
			 54516:"zei", 54517:"zen", 54518:"zeng", 54522:"zha", 
			 54698:"zhai", 54704:"zhan", 54721:"zhang", 54736:"zhao", 
			 54746:"zhe", 54756:"zhen", 54772:"zheng", 54949:"zhi", 
			 54992:"zhong", 55003:"zhou", 55017:"zhu", 55205:"zhua", 
			 55207:"zhuai", 55208:"zhuan", 55214:"zhuang", 55221:"zhui", 
			 55227:"zhun", 55229:"zhuo", 55240:"zi", 55255:"zong", 
			 55262:"zou", 55266:"zu", 55274:"zuan", 55276:"zui", 
			 55280:"zun", 55282:"zuo"};
var spellArray = new Array();
var pn = "";
/*for (var i=0xB0A1; i<0xD7FC; i++)
 {
  if (spell[i]) pn = spell[i]
  execScript("char=chr(""+i+"")", "vbscript")
  spellArray[char.charCodeAt(0)] = pn
 }*/
function pinyin(char) {
	if (!char.charCodeAt(0) || char.charCodeAt(0) < 1328) {
		//alert(char+"&&"+char.charCodeAt(0));字母数字和字符
		if (char.charCodeAt(0) >= 0 && char.charCodeAt(0) <= 127){
			//alert(char);
			return char;
		}
		return "";
	}
	if (spellArray[char.charCodeAt(0)]) {
		return spellArray[char.charCodeAt(0)];
	}
	execScript("ascCode=hex(asc(\"" + char + "\"))", "vbscript");
	ascCode = eval("0x" + ascCode);
	if (!(ascCode > 45216 && ascCode < 55292)) {
		return "";
	}
	for (var i = ascCode; (!spell[i] && i > 0); ) {
		i--;
	}
	return spell[i];
}
function toPinyin(str) {
	var pStr = "";
	for (var i = 0; i < str.length; i++) {
		if (str.charAt(i) == "\n") {
			pStr += "<br>";
		} else {
			pStr += "<ruby style='ruby-align:center'> " + str.charAt(i) + " <rt>" + pinyin(str.charAt(i)) + "</rt></ruby>";
		}
		//else    pStr += pinyin(str.charAt(i)) + " "
	}
	return pStr;
}
function toPinyinOnly(objID) {
	var pStr = "";
	for (var i = 0; i < $(objID).value.length; i++) {
		if ($(objID).value.charAt(i) == "\n") {
			pStr += "<br>";
		} else {
			//alert($(objID).value.charAt(i));
			var tempStr = pinyin($(objID).value.charAt(i));  
			//pStr += tempStr.charAt(0) ;
			pStr += tempStr;
		}
	}
	return pStr;
}
function pinyinSort(a, b) {
	var rValue = 0;
	for (var i = 0; i < a.length; i++) {
		var pinA = pinyin(a.charAt(i));
		var pinB = pinyin(b.charAt(i));
		if (rValue = pinA > pinB ? 1 : pinA < pinB ? -1 : 0) {
			break;
		}
	}
	return rValue;
}
//--------------------------------------------------------
//浮点数加法运算   
 function FloatAdd(arg1,arg2){   
   var r1,r2,m;   
   try{r1=arg1.toString().split(".")[1].length}catch(e){r1=0}   
   try{r2=arg2.toString().split(".")[1].length}catch(e){r2=0}   
   m=Math.pow(10,Math.max(r1,r2))   
   return (arg1*m+arg2*m)/m   
  }   
  
 //浮点数减法运算   
 function FloatSub(arg1,arg2){   
 var r1,r2,m,n;   
 try{r1=arg1.toString().split(".")[1].length}catch(e){r1=0}   
 try{r2=arg2.toString().split(".")[1].length}catch(e){r2=0}   
 m=Math.pow(10,Math.max(r1,r2));   
 //动态控制精度长度   
 n=(r1>=r2)?r1:r2;   
 return parseFloat(((arg1*m-arg2*m)/m).toFixed(n));   
 }   
    
 //浮点数乘法运算   
 function FloatMul(arg1,arg2)    
 {    
  var m=0,s1=arg1.toString(),s2=arg2.toString();    
  try{m+=s1.split(".")[1].length}catch(e){}    
  try{m+=s2.split(".")[1].length}catch(e){}    
  return Number(s1.replace(".",""))*Number(s2.replace(".",""))/Math.pow(10,m)    
  }    
  
  
//浮点数除法运算   
function FloatDiv(arg1,arg2){    
var t1=0,t2=0,r1,r2;    
try{t1=arg1.toString().split(".")[1].length}catch(e){}    
try{t2=arg2.toString().split(".")[1].length}catch(e){}    
with(Math){    
r1=Number(arg1.toString().replace(".",""))    
r2=Number(arg2.toString().replace(".",""))    
return (r1/r2)*pow(10,t2-t1);    
}
}    

Number.prototype.jDiv = function(arg){
	return FloatDiv(this,arg);
}

Number.prototype.jMul = function(arg){
	return FloatMul(this,arg);
}

Number.prototype.jSub = function(arg){
	return FloatSub(this,arg);
}

Number.prototype.jAdd = function(arg){
	return FloatAdd(this,arg);
}


//是否为手机号 ,如不是,返回false
	 function isMobile(object)
     {
     	
        var s =object.value; 
        var reg0 = /^13\d{5,9}$/;
        var reg1 = /^153\d{4,8}$/;
        var reg2 = /^159\d{4,8}$/;
        var reg3 = /^0\d{10,11}$/;
        var reg4 = /^15\d{5,9}$/;
        var reg5 = /^18\d{5,9}$/;
        var my = false;
        
        if (reg0.test(s))my=true;
        if (reg1.test(s))my=true;
        if (reg2.test(s))my=true;
        if (reg3.test(s))my=true;
        if (reg4.test(s))my=true;
        if (reg5.test(s))my=true;
        //alert("my="+my);
            if(s!="")
            {
                if (!my)
                {
                   return false;
                }else{
                	return true;
                }
            }
     }
     //是否是电话号码
     function isPhone(object){
     	var strPhone=object.value;
     	//alert(strPhone);
		
		var pattern = /^\d{3,4}-\d{7,8}$/  ;
       //var pattern =/(^[0-9]{3,4}\-[0-9]{7,8}$)|(^[0-9]{7,8}$)|(^\([0-9]{3,4}\)[0-9]{3,8}$)|(^0{0,1}13[0-9]{9}$)/; 
        if(strPhone!="")
        {
            if(!pattern.exec(strPhone))
            {
             alert('请输入正确的电话号码:电话号码格式为区号(3到4位)-电话号码(7到8位)"');
             //object.value="";
            
             return false;
            }
         }
         return true;
     }
     
    // 判断是否为数字，是则返回true,否则返回false 
     function f_check_number(obj)   
	{          
	    if (/^\d+$/.test(obj.value))   
	    {   
	       return true;   
	    }    
	    else    
	    {   
	      return false;   
	   }   
	}   
     
     function legthRestraint(e){
    	
    	var obj=e.srcElement || e.target;
    	//alert(obj.value);
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
    
    //检查输入金额的长度（整数部分不能大于13位，小数部分不能大于2位）add by czw 2009-12-15
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
				return false;
			}
			if(strEnd.length > 2){
				alert("小数部分不能大于2位");
				obj.value = "";
				return false;
			}
		}
	}
/**
add by xiaoweichai 2010年4月9日9:00:32
显示"执行中，请稍后..."的层，防止重复提交
*/
function showRunning(){ 
	//IE6时下拉框不可见
    var el = document.createElement("<iframe id='popupdialogbackground'    style='position: absolute;visibility:inherit; width: 100%; height: 100%; left: 0px; top: 0px; zindex: 1; background: #E0EFFC; filter: progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=0)'></iframe>");
	document.body.appendChild(el);
	//新建背景层
	var Divbg = document.createElement("div");   
		Divbg.id = "bgDiv";   
	with(Divbg.style)   
	{   
		position	= "absolute";   
		left		= "0px";   
		top			= "0px"; 
		right		= "0px"; 
		backgroundColor   = "#777";   
		zIndex		= "1000";   
	}   
	document.body.appendChild(Divbg);   
	Divbg.style.width  = document.body.scrollWidth + "px";//整个网页宽
	Divbg.style.height = document.body.scrollHeight + "px";
	Divbg.style.filter = "alpha(Opacity=15)";
 
	//新建消息层
	var Divmsg = document.createElement("div");   
		Divmsg.id = "msgDiv";   
	with(Divmsg.style)   
	{   
		position	= "absolute";                
		width		= "200px";   
		height		= "50px"; 
		border		= "1 solid #336699";   
		backgroundColor   = "white";   
		zIndex		= "10001";   
		fontSize	= "12px";
		marginLeft	= "0px"
		textAlign	= "center"
	}   
	document.body.appendChild(Divmsg);
	Divmsg.style.left = document.body.offsetWidth/2-100 + "px";//无论网页有多大，消息在可见区域的中间
	Divmsg.style.top  = document.body.offsetHeight/2-20 + "px";
	Divmsg.innerHTML="<BR>执行中，请稍后<B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</B>";
	setInterval("neon()",500);
}
function  neon(){//动态显示
	var tt=document.getElementById("msgDiv").innerHTML;  	
	if(tt=="<BR>执行中，请稍后<B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</B>"){
		document.getElementById("msgDiv").innerHTML="<BR>执行中，请稍后<B>..&nbsp;&nbsp;&nbsp;&nbsp;</B>";
	}
	else if(tt=="<BR>执行中，请稍后<B>..&nbsp;&nbsp;&nbsp;&nbsp;</B>"){
		document.getElementById("msgDiv").innerHTML="<BR>执行中，请稍后<B>....&nbsp;&nbsp;</B>";
	}else if(tt=="<BR>执行中，请稍后<B>....&nbsp;&nbsp;</B>"){
		document.getElementById("msgDiv").innerHTML="<BR>执行中，请稍后<B>......</B>";
	}
	else if(tt=="<BR>执行中，请稍后<B>......</B>"){ 
		document.getElementById("msgDiv").innerHTML="<BR>执行中，请稍后<B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</B>";	
	}
}
/**
	add by xiaoweichai 2010-03-25 
	objid:结果列表所在的div的id

	用于使查询结果列表所在的div自适应高度，解决出现小屏幕电脑显示不全，也无法翻页，大屏幕电脑显示空白区域的现象。
	请删除或注释掉这行代码：<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">否则空白处没有背景色
	如果jsp页面有这行代码：<?xml version="1.0" encoding="UTF-8" ?> 请删除
	有的人写的代码中结果列表被两个div包含，一个就够了,2个反而易出现多余的滚动条。
	参考页面：page/query/trustIncomeDistributeQuery.jsp
*/
function autodivheight(objid){ 
 	var divobj=document.getElementById(objid); 	
 	var divobjtop=divobj.offsetTop ;
 	var temdivobj=divobj;
 	while( temdivobj.offsetParent.tagName.toUpperCase() != "BODY")
 	{
 		temdivobj = temdivobj.offsetParent;         
 		divobjtop+=temdivobj.offsetTop;		 
 	} 		
 	var endheight=document.body.clientHeight - divobjtop; 	 
 	divobj.style.cssText = " width: 100%; height:"+endheight+"; BACKGROUND-COLOR: transparent; OVERFLOW: auto;"; 
}

var strFrameTip;	
document.writeln('<iframe id="tipLayer_" frameborder="0px" style="position: absolute;SCROLLING=NO; z-index: 9998; display: none;margin:0px;padding:0px;height:28px;width:400px"></iframe>');
strFrameTip = '<style>';
strFrameTip += 'span{display: block;border:1px solid #640000;background:#FFFFCC;color:#000;font-size:14px;z-index:9999;position: absolute; left:0; top:0;margin:0px;padding:5px;white-space: nowrap;height:28px;width:400px}'; 
strFrameTip += '</style>';
strFrameTip += '<span id="tipLayer_span"></span>';
window.frames.tipLayer_.document.writeln(strFrameTip);
window.frames.tipLayer_.document.close();

function showAmountTip(flag,obj){
	var ftips = document.all.tipLayer_.style;
	var ftip_span = window.frames.tipLayer_.document.getElementById('tipLayer_span');
	if(flag && obj.value != ''){			
			ftip_span.innerHTML = convertChineseAmount(obj.value);
			//ftips.left=event.clientX+10+document.body.scrollLeft;	
			//ftips.top=event.clientY+10+document.body.scrollTop;
			var temobj=obj;
			var temptop,templeft;
			temptop = temobj.offsetTop;
			templeft = temobj.offsetLeft;
		 	while( temobj.offsetParent.tagName.toUpperCase() != "BODY")
		 	{
		 		temobj = temobj.offsetParent;         
		 		temptop+=temobj.offsetTop;	
		 		templeft+=temobj.offsetLeft;	 
		 	}
			ftips.left=templeft;
			ftips.top=temptop + obj.clientHeight + 20;	
			ftip_span.style.width = ftip_span.innerHTML.length*15;
			ftips.width = ftip_span.innerHTML.length*15;
			ftips.display="";	
		}else{
			ftips.display="none";
		}
}

function showAmountTip2(flag,obj){
	var ftips = document.all.tipLayer_.style;
	var ftip_span = window.frames.tipLayer_.document.getElementById('tipLayer_span');
	if(flag && obj.value != ''){			
			ftip_span.innerHTML = convertChineseAmount(obj.value);
			//ftips.left=event.clientX+10+document.body.scrollLeft;	
			//ftips.top=event.clientY+10+document.body.scrollTop;
			var temobj=obj;
			var temptop,templeft;
			temptop = temobj.offsetTop;
			templeft = temobj.offsetLeft;
		 	while( temobj.offsetParent.tagName.toUpperCase() != "BODY")
		 	{
		 		temobj = temobj.offsetParent;         
		 		temptop+=temobj.offsetTop;	
		 		templeft+=temobj.offsetLeft;	 
		 	}
			ftips.left=templeft;
			ftips.top=temptop + obj.clientHeight - 50;	
			ftip_span.style.width = ftip_span.innerHTML.length*15;
			ftips.width = ftip_span.innerHTML.length*15;
			ftips.display="";	
		}else{
			ftips.display="none";
		}
}
//add by ouzhuan at 2010-10-29
function showTip(flag,obj,str){
	var ftips = document.all.tipLayer_.style;
	var ftip_span = window.frames.tipLayer_.document.getElementById('tipLayer_span');
	if(flag && obj.value != ''){			
			ftip_span.innerHTML = str;
			//ftips.left=event.clientX+10+document.body.scrollLeft;	
			//ftips.top=event.clientY+10+document.body.scrollTop;
			var temobj=obj;
			var temptop,templeft;
			temptop = temobj.offsetTop;
			templeft = temobj.offsetLeft;
		 	while( temobj.offsetParent.tagName.toUpperCase() != "BODY")
		 	{
		 		temobj = temobj.offsetParent;         
		 		temptop+=temobj.offsetTop;	
		 		templeft+=temobj.offsetLeft;	 
		 	}
			ftips.left=templeft;
			ftips.top=temptop + obj.clientHeight + 10;	
			ftip_span.style.width = ftip_span.innerHTML.length*22;
			ftips.width = ftip_span.innerHTML.length*22;
			ftips.display="";	
		}else{
			ftips.display="none";
		}
}

function isIP(strIP) {
	if (!strIP) return false;
	var re=/^(\d+)\.(\d+)\.(\d+)\.(\d+)$/g //匹配IP地址的正则表达式
	if(re.test(strIP))
	{
		if( RegExp.$1 <256 && RegExp.$2<256 && RegExp.$3<256 && RegExp.$4<256) return true;
	}
	return false;
}

//----------------------------单人双次录入校验脚本jws-----------------------------
//是否做过双次录入检验标志 jws false是没有做过或需要重新做  true是已校验 
var ischecked = false;
//保存已经成功做过双次录入校验的控件ID jws
var idarrays = new Array();

//是否需要双次录入 true:需要双次录入,false:不需要双次录入 。主要为了区分新增和修改。当为修改时，对未做修改操作的字段不进行双次录入校验
var needDoubleInput = true;
//数组中增加元素方法:idarrays.push(value);
//单击触发此动作，弹出一个div层。 
function justdo(objid,inputname){
	//存在弹出层，在弹出增上在弹出对话框
	e = document.getElementById('popupdialog');
	var tempvalue = objid.value;
	//判断元素在数组中的位置。
	var imm = idarrays.in_array_num(objid.id);
	//允许多次回车出发此事件，此处要将数组中缓存的控件ID清除，只清除指定控件的ID。
	if(imm != undefined){
		//删除从指定位置deletePos开始的指定数量deleteCount的元素，数组形式返回所移除的元素
		idarrays.splice(imm,1); 
	}
	if(e != null){
		if($('trustFlag').value == 'wukuang'){
			if(!ischecked && tempvalue != '' && !idarrays.in_array(objid.id)){
				//单人双次录入，第一次录入完成后触发第二次录入，将第一次录入的值清空掉。
				objid.value = "";
				var vl = objid.doubleinput;
				var windowtitle = "双次录入校验"
				this.createinput = inputname+"：<input name=\'"+objid.name+"\' class=\'box\' size=\'26\' maxlength=\'30\' type=\'text\' id=\'"+objid.id+"_\' value=\'\' onkeypress=\'EnterPress(this)\' firstValue=\'"+tempvalue+"\' />";
				var htm=this.createinput;
				var el = document.createElement("<div id='popupdialogbackground21' style='position: absolute; width: 100%; height: 100%; left: 0px; top: 0px; zindex: 1; background: #aaaaaa; filter: progid:DXImageTransform.Microsoft.Alpha(opacity=15)'></div>");
				e.appendChild(el);
				var ew = document.createElement("<div style='width: 100%; height: 100%; position: absolute; left: 0px; top: 0px;' id='popupdialog21' style='zindex: 1'></div>");
				ew.innerHTML = "<table class=window border='0' cellspacing='0' cellpadding='0'><tr onmouseup='release(this)' onmousemove='move_window(this)' onmousedown='capture(this)'><td class='cross-left-top'/><td class='cross-middle-top'><B>" + windowtitle + "</B></td><td class='cross-right-top'/></tr><tr><td class='cross-left-middle'/><td bgcolor='#A6C8EE'>" + htm + " &nbsp;&nbsp;<input name='submit332' type='button' class='button' onclick='closedialog21();javascript:ischecked = false;' value='取 消'/></td><td class='cross-left-middle'/d></tr>    <tr><td class='cross-left-bottom'/><td class='cross-middle-bottom'/><td class='cross-right-bottom'/></tr></table>";
				e.appendChild(ew);
				ischecked = true;
				$(objid.id+"_").focus();
			}
		}else{
			return false;
		}
	}else{
		//没有弹出层触发此方法
		if($('trustFlag').value == 'wukuang'){
			if(!ischecked && tempvalue != '' && !idarrays.in_array(objid.id)){
				//单人双次录入，第一次录入完成后触发第二次录入，将第一次录入的值清空掉。
				objid.value = "";
				var vl = objid.doubleinput;
				var windowtitle = "双次录入校验"
				this.createinput = inputname+"：<input name=\'"+objid.name+"\' class=\'box\' size=\'26\' maxlength=\'30\' type=\'text\' id=\'"+objid.id+"_\' value=\'\' onkeypress=\'EnterPress(this)\' firstValue=\'"+tempvalue+"\' />";
				var htm=this.createinput;
				var el = document.createElement("<div id='popupdialogbackground21' style='position: absolute; width: 100%; height: 100%; left: 0px; top: 0px; zindex: 1; background: #aaaaaa; filter: progid:DXImageTransform.Microsoft.Alpha(opacity=15)'></div>");
				document.body.appendChild(el);
				var ew = document.createElement("<div style='width: 100%; height: 100%; position: absolute; left: 0px; top: 0px;' id='popupdialog21' style='zindex: 1'></div>");
				ew.innerHTML = "<table class=window border='0' cellspacing='0' cellpadding='0'><tr onmouseup='release(this)' onmousemove='move_window(this)' onmousedown='capture(this)'><td class='cross-left-top'/><td class='cross-middle-top'><B>" + windowtitle + "</B></td><td class='cross-right-top'/></tr><tr><td class='cross-left-middle'/><td bgcolor='#A6C8EE'>" + htm + " &nbsp;&nbsp;<input name='submit332' type='button' class='button' onclick='closedialog21();javascript:ischecked = false;' value='取 消'/></td><td class='cross-left-middle'/d></tr>    <tr><td class='cross-left-bottom'/><td class='cross-middle-bottom'/><td class='cross-right-bottom'/></tr></table>";
				document.body.appendChild(ew);
				ischecked = true;
				$(objid.id+"_").focus();
			}
		}else{
			return false;
		}
	}
}
//判断数组中是否存在某个元素
Array.prototype.S=String.fromCharCode(2);
//String.fromCharCode:将Unicode码转换为对应的字符并返回为字符串   
Array.prototype.in_array=function(e){
	 var r=new RegExp(this.S+e+this.S);  
	 return (r.test(this.S+this.join(this.S)+this.S));  
}
Array.prototype.in_array_num = function(e)  
{
	for(i=0;i<this.length;i++){
		if(this[i]==e){
			return i;
		}
	}
} 

//回车触发校验 目前只对五矿版本
function onEnterPress(objid,inputname){
	if($('trustFlag').value == 'wukuang'){
		if(event.keyCode == 13){
			justdo(objid,inputname);
		}
	}else{
		return false;
	}
}

//接受回车事件，做双次录入校验jws
function EnterPress(currentid){
if(event.keyCode == 13){
	 	ischecked = true;
	 	//得到当前输入值
		var currentValue = currentid.value;
		//得到第一次输入值
		var firstValue = currentid.firstValue;
		//获取控件ID
		var vid = currentid.id.replace("_","");
		if(currentValue != firstValue){
			alert("两次校验失败,请重新录入");
			$(vid).value = "";
			$(vid).focus();
			//校验失败，需要重新校验
			ischecked = false;
		}else{
			//校验成功，为下一个校验控件做准备
			alert("两次录入的值相同，可以继续录入其它项");
			//双次录入校验成功的控件ID放在公共数组（idarrays）中，为下一环节准备数据。下一环节将：如果控件ID已经在数组中存在，则不再进行双次录入校验动作。jws
			idarrays.push(vid);
			ischecked = false;
			needDoubleInput = false;
			$(vid).value = firstValue;
			$(vid).focus();
		}
		closedialog21();
	 } 

}
function closedialog21() {
	e = document.getElementById('popupdialog21');
	ediv = document.getElementById('popupdialog');
	if(ediv != null){
		e.innerHTML = "";
		ediv.removeChild(e);
		e = document.getElementById('popupdialogbackground21');
		ediv.removeChild(e);
	}else{
		e.innerHTML = "";
		document.body.removeChild(e);
		e = document.getElementById('popupdialogbackground21');
		document.body.removeChild(e);
	}
	
	return true;
}

<!--
// 数字转换成大写金额函数  整数部分13位
function atoc(numberValue){
	var numberValue=new String(Math.round(numberValue*100)); // 数字金额
	var chineseValue=""; // 转换后的汉字金额
	var String1 = "零壹贰叁肆伍陆柒捌玖"; // 汉字数字
	var String2 = "万仟佰拾亿仟佰拾万仟佰拾元角分"; // 对应单位
	var len=numberValue.length; // numberValue 的字符串长度
	var Ch1; // 数字的汉语读法
	var Ch2; // 数字位的汉字读法
	var nZero=0; // 用来计算连续的零值的个数
	var String3; // 指定位置的数值
	if(len>15){
	alert("数值超出范围！支持的最大数值为 9999999999999.99");
	return "";
	}
	if (numberValue==0){
	chineseValue = "零元整";
	return chineseValue;
	}
	
	String2 = String2.substr(String2.length-len, len); // 取出对应位数的STRING2的值
	for(var i=0; i<len; i++){
	String3 = parseInt(numberValue.substr(i, 1),10); // 取出需转换的某一位的值
	if ( i != (len - 3) && i != (len - 7) && i != (len - 11) && i !=(len - 15) ){
	if ( String3 == 0 ){
	Ch1 = "";
	Ch2 = "";
	nZero = nZero + 1;
	}
	else if ( String3 != 0 && nZero != 0 ){
	Ch1 = "零" + String1.substr(String3, 1);
	Ch2 = String2.substr(i, 1);
	nZero = 0;
	}
	else{
	Ch1 = String1.substr(String3, 1);
	Ch2 = String2.substr(i, 1);
	nZero = 0;
	}
	}
	else{ // 该位是万亿，亿，万，元位等关键位
	if( String3 != 0 && nZero != 0 ){
	Ch1 = "零" + String1.substr(String3, 1);
	Ch2 = String2.substr(i, 1);
	nZero = 0;
	}
	else if ( String3 != 0 && nZero == 0 ){
	Ch1 = String1.substr(String3, 1);
	Ch2 = String2.substr(i, 1);
	nZero = 0;
	}
	else if( String3 == 0 && nZero >= 3 ){
	Ch1 = "";
	Ch2 = "";
	nZero = nZero + 1;
	}
	else{
	Ch1 = "";
	Ch2 = String2.substr(i, 1);
	nZero = nZero + 1;
	}
	if( i == (len - 11) || i == (len - 3)){ // 如果该位是亿位或元位，则必须写上
	Ch2 = String2.substr(i, 1);
	}
	}
	chineseValue = chineseValue + Ch1 + Ch2;
	}
	
	if ( String3 == 0 ){ // 最后一位（分）为0时，加上“整”
	chineseValue = chineseValue + "整";
	}
	
	return chineseValue;
}
//-->



//---------------------------------------------------------
