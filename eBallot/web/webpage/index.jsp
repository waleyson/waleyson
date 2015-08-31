<%-- 
    Document   : index
    Created on : Sep 3, 2014, 3:14:50 PM
    Author     : AbdHafeez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<!--========================================================================== Intro and FlexSlider =====================================================================================-->
<a href="login.jsp">Logout
    <c:out value="${sessionScope['login']}" />
</a>
<div class="wrapper">
    <div class="grids top">
        <div class="grid-6 grid intro">
            <h2>eBallot Web</h2>
            <p>Space for a description, an introduction of yourself or your company or a smart slogan - be creative and use some keywords
                for search engines! By the way: On the right side you see FlexSlider - use you keyboard arrows or the mousewheel to make it slide!
            </p>

        </div><!--end of slogan div-->

        <div class="grid-10 grid">
            <div class="flexslider"><!--http://flex.madebymufffin.com/-->

                <noscript>You have Javascript set to disabled. This slideshow runs with Javascript and will only be shown if you turn it on.<br />
                    Sie haben Javascript deaktiviert. Diese Slideshow wird nur vollständig angezeigt, wenn Sie Javascript aktivieren.</noscript>

                <ul class="slides">

                    <li>
                        <a href="http://www."><img src="img/img1.jpg" alt="demo-image" />
                            <p class="flex-caption">This is a describing caption for your image</p>
                        </a>
                    </li>
                    <li>
                        <a href="http://www."><img src="img/img2.jpg" alt="demo-image" />
                            <p class="flex-caption">Of course you can also remove it, if you want</p>
                        </a>
                    </li>

                    <li>
                        <a href="http://www."><img src="img/img3.jpg" alt="demo-image" />
                            <!-- delete the p if you don´t want to use captions for the images-->
                        </a>
                    </li>

                    <li>
                        <a href="http://www."><img src="img/img4.jpg" alt="demo-image" />
                            <p class="flex-caption">This is another caption for your image</p>
                        </a>
                    </li>

                    <li>

                        <a href="http://www."><img src="img/img5.jpg" alt="demo-image" />
                            <p class="flex-caption">Write whatever you want here!</p>
                        </a>

                    </li>

                </ul>

            </div><!--end of div flexslider-->
        </div><!--end of div grid-10-->
    </div><!--end of div grids-->
    <!--<span class="slidershadow"></span>-->

</div><!--end of div wrapper-->



<!--This is FlexSlider and uses the same settings like the one at the top. If you change them, be aware that it is for both sliders!-->

<div class=" grids flexslider intro ticker top"><!--http://flex.madebymufffin.com/-->
    <noscript>You have Javascript set to disabled. This ticker runs with Javascript and will only be shown if you turn it on.<br />
        Sie haben Javascript deaktiviert. Dieser Ticker wird nur vollständig angezeigt, wenn Sie Javascript aktivieren.</noscript>

    <ul class="slides">

        <li>
            <p class="text-center">
                Hey, let your creativity flow and create something great!
            </p>
        </li>
        <li>
            <p class="text-center">
                You can use this as a ticker!
            </p>
        </li>
        <li>
            <p class="text-center">
                You can use this somewhere else on this page, too, of course.
            </p>
        </li>

        <li>
            <p class="text-center">
                Write anything you want here!
            </p>
        </li>

        <li>
            <p class="text-center">
                You can display some news, if you want.
            </p>
        </li>

        <li>
            <p class="text-center">
                Or maybe some important infos.
            </p>
        </li>

    </ul>

</div><!--end of div flexslider-->
<!--end of wrapper-->

<!--========================================================================== Footer =====================================================================================-->

