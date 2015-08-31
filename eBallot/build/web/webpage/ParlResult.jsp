<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

    <sql:query var="result" dataSource="jdbc/eBallot">
    select distinct master_name from voteparl
</sql:query>
<%-- 
    Document   : ParlResult
    Created on : Jan 4, 2015, 9:15:36 AM
    Author     : AbdHafeez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
        <script src="http://code.jquery.com/ui/1.11.0/jquery-ui.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/jquery.jqplot.css" />
        <script type="text/javascript" src="js/jquery.jqplot.js"></script>
        <script type="text/javascript" src="js/jqplot.barRenderer.min.js"></script>
        <script type="text/javascript" src="js/jqplot.pieRenderer.min.js"></script>
        <script type="text/javascript" src="js/jqplot.categoryAxisRenderer.min.js"></script>
        <script type="text/javascript" src="js/jqplot.pointLabels.min.js"></script>
        <title>JSP Page</title>

    <sql:query var="userList" dataSource="jdbc/eBallot">
    Select parl_name, vote_count  From voteparl WHERE master_name  = '${param.constituency}'
</sql:query>
<div class="wrapper">

    <div class="grids top">

        <div class="grid-6 grid">
            <div class="green bottom">
                <h3>Quick Links</h3>
                <ul id="nav" class="dropdown cf"> <!-- Apply the clearfix so we can remove the overflow:hidden; later on. -->
                    <li>
                        <a href="#">Electoral Results</a>
                        <ul>
                             <li><a href="ParlResult.jsp">Presidential Result</a></li>
                            <li><a href="PresResult.jsp">Mem. of Parliament Result</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
<div class="grid-10 grid">
    <div class="grids">
        <ul class="tabs">
            <li class="active"><a href="#tab1">Parliamentary vote result </a></li>
        </ul>
        <div class="tab_container">
            <div id="tab1" class="tab_content" style="display: none;">
                <form action="ParlResult.jsp" method="get">
                    <p> Select Constituency Result
                        <select name='constituency'>
                            <option value="none">Select</option>
                            <c:forEach var="row" items="${result.rowsByIndex}">

                                <c:forEach var="column" items="${row}">
                                    <option value="<c:out value="${column}"/>"><c:out value="${column}"/></option>
                                </c:forEach>
                            </c:forEach>
                        </select>
                        <input type="submit" value="submit" name="submit" /></p>
                </form>
            </div>
           
        </div>
        <div class="grid-16 grid intro grey">
            <p> Parliament vote result in <c:out value="${param.constituency}"/></p>
            <div id="piePlot" style="margin-top:50px; margin-left:50px; width:600px; height:500px;">
            </div>
        </div>
    </div>
</div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function(){
        plot = $.jqplot("piePlot", [[ // --- loop over your user list using jstl and get data value pairs
                  <c:forEach items='${ userList.rows }' var='user'>
                     ['${user.parl_name}',parseInt('${user.vote_count}')],
                  </c:forEach>
               ]],  {
            // Only animate if we're not using excanvas (not in IE 7 or IE 8)..
            animate: !$.jqplot.use_excanvas,
            seriesDefaults:{
                renderer:$.jqplot.BarRenderer,
                pointLabels: { show: true },
                rendererOptions: {  barWidth: 25
                }
                
            },
            axes: {
                xaxis: {
                    renderer: $.jqplot.CategoryAxisRenderer
                },
                 yaxis:{
                  autoscale:true
                },
                varyBarColor: {show : true},
            highlighter: { show: false }
            }
        });
    })
    </script>
    <script type="text/javascript">  <!--Javascript for Tabs by Sohtanaka, include it on pages where you use tabs, else delete it-->
        $(document).ready(function() {

            //When page loads...
            $(".tab_content").hide(); //Hide all content
            $("ul.tabs li:first").addClass("active").show(); //Activate first tab
            $(".tab_content:first").show(); //Show first tab content

            //On Click Event
            $("ul.tabs li").click(function() {

                $("ul.tabs li").removeClass("active"); //Remove any "active" class
                $(this).addClass("active"); //Add "active" class to selected tab
                $(".tab_content").hide(); //Hide all tab content

                var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
                $(activeTab).fadeIn(); //Fade in the active ID content
                return false;
            });

        });
    </script>