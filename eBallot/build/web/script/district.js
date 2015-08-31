/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
var xmlHttps
var xmlHttps
function showDistrict(str){
    xmlHttps=GetXmlHttpObject();
    if (xmlHttps==null)
    {
        alert ("Browser does not support HTTP Request")
        return
    }
    var url="district_test.jsp";
    url +="?counts=" +str;
    xmlHttps.onreadystatechange = districtChange;
    xmlHttps.open("GET", url, true);
    xmlHttps.send(null);
}

function districtChange(){
    if (xmlHttps.readyState==4 || xmlHttps.readyState=="complete"){
        document.getElementById("district").innerHTML=xmlHttps.responseText
    }
}

function GetXmlHttpObject()
{
    var xmlHttps=null;
    try
    {
        // Firefox, Opera 8.0+, Safari
        xmlHttps=new XMLHttpRequest();
    }
    catch (e)
    {
        //Internet Explorer
        try
        {
            xmlHttps=new ActiveXObject("Msxml2.XMLHTTP");

        }
        catch (e)
        {
            xmlHttps=new ActiveXObject("Microsoft.XMLHTTP");
        }
    }
    return xmlHttps;
}