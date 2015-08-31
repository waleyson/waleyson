/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
var xmlHttp
var xmlHttp
function showBoot(str){
    xmlHttp=GetXmlHttpObject();
    if (xmlHttp==null)
    {
        alert ("Browser does not support HTTP Request")
        return
    }
    var url="polling_boot_test.jsp";
    url +="?counts=" +str;

    xmlHttp.onreadystatechange = bootChange;
    xmlHttp.open("GET", url, true);
    xmlHttp.send(null);


}

function bootChange(){
    if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
        document.getElementById("boot").innerHTML=xmlHttp.responseText
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