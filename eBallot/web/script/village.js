 /* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
var xmlHttp
var xmlHttp
function showVillage(str){
    xmlHttp=GetXmlHttpObject();
    if (xmlHttp==null)
    {
        alert ("Browser does not support HTTP Request")
        return
    }
    var url="village_test.jsp";
    url +="?counts=" +str;

    xmlHttp.onreadystatechange = villageChange;
    xmlHttp.open("GET", url, true);
    xmlHttp.send(null);


}

function villageChange(){
    if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
        document.getElementById("village").innerHTML=xmlHttp.responseText
    }
}

function GetXmlHttpObject()
{
    var xmlHttp=null;
    try
    {
        // Firefox, Opera 8.0+, Safari
        xmlHttp=new XMLHttpRequest();
    }
    catch (e)
    {
        //Internet Explorer
        try
        {
            xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
        }
        catch (e)
        {
            xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
        }
    }
    return xmlHttp;
}

