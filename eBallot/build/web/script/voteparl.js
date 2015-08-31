/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
var xmlHttp
var xmlHttp
function showChart(str){
    xmlHttp=GetXmlHttpObject();
    if (xmlHttp==null)
    {
        alert ("Browser does not support HTTP Request")
        return
    }
    var url="chart.jsp";
    url +="?count=" +str;
   

    xmlHttp.onreadystatechange = chartChange;
    xmlHttp.open("GET", url, true);
    xmlHttp.send(null);


}

function chartChange(){
    if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
        document.getElementById("mychart").innerHTML=xmlHttp.responseText
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