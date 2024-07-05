<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
<style>
@keyframes fadeIn {
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
}

h1 {
    font-family: 'Helvetica Neue', Arial, sans-serif;
    font-size: 3em;
    color: #437cb5;
    text-align: center;
    text-transform: uppercase;
    letter-spacing: 0.05em;
    font-weight: bold;
    margin-top: 0px;
    margin-bottom: 0px;
    padding: 10px 20px;
    background: linear-gradient(to right, #6a11cb, #2575fc);
    color: #fff;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    animation: fadeIn 2s ease-in-out forwards;
    opacity: 0;
}

.services_section .service_taital {
    color: #ffffff;
    text-align: center;
}

.services_section .service_text {
    color: #dcdada;
    text-align: center;
    font-weight: bold; /* 텍스트를 굵게 설정 */
}

.services_section .services_section_2 {
    padding-top: 20px;
}

.services_section .icon_1 {
    text-align: center;
}

.services_section .design_text {
    color: #ffffff;
    text-align: center;
}

.services_section .lorem_text {
    color: #d5d5d5;
    text-align: center;
    font-size: 1.2em; /* 텍스트 크기를 원하는 크기로 설정 */
}

.services_section .icon_3 {
    text-align: center;
}

.services_section .read_bt_2 a {
    color: #000;
    background-color: #ffffff;
}

.services_section .read_bt_2 a:hover {
    background-color: #8480f9;
}

@media (min-width: 768px) {
    .custom-col-sm-4 {
        flex: 0 0 50%;
        max-width: 50%;
    }
}
</style>
</head>
<body>
<!-- <div id="content"> -->
    <img src="${pageContext.request.contextPath}/resources/images/banner.png" style="width: 80%" />
    <h1>MAKE YOUR DREAMS COME TRUE AT JAVALLAR!</h1>
    
    <div class="services_section layout_padding" style="background-image: url('${pageContext.request.contextPath}/resources/images/services-bg.png');">
        <div class="container">
            <h1 class="service_taital"><span class="our_text">Check Our</span> Services!</h1>
            <p class="service_text">There are many variations of passages of Lorem Ipsum available, but the majority have suffered </p>
            <div class="services_section_2">
                <div class="row">
                    <div class="col-sm-4 custom-col-sm-4">
                        <div class="icon_1"><img src="${pageContext.request.contextPath}/resources/images/icon-1.png"></div>
                        <h4 class="design_text">Logo Design</h4>
                        <p class="lorem_text">We specialize in creating unique and impactful logos tailored to your brand identity. </p>
                        <div class="icon_2"><img src="${pageContext.request.contextPath}/resources/images/icon-2.png"></div>
                        <h4 class="design_text">Web Development</h4>
                        <p class="lorem_text">From simple websites to complex web applications, we deliver solutions that meet your business needs. </p>
                    </div>
                    <div class="col-sm-4">
                        <div class="icon_3"><img src="${pageContext.request.contextPath}/resources/images/icon-3.png"></div>
                        <h4 class="design_text">Web Design</h4>
                        <p class="lorem_text">Our designs are not just visually appealing but also user-friendly, ensuring a seamless browsing experience. </p>
                        <div class="icon_4"><img src="${pageContext.request.contextPath}/resources/images/icon-4.png"></div>
                        <h4 class="design_text">Banner Design</h4>
                        <p class="lorem_text">Catch the attention of your audience with our creative and eye-catching banner designs. </p>
                    </div>
                    <div class="col-sm-4 custom-col-sm-4">
                        <div class="icon_5"><img src="${pageContext.request.contextPath}/resources/images/icon-5.png"></div>
                        <h4 class="design_text">Social Media Work</h4>
                        <p class="lorem_text">Enhance your online presence and engagement with our strategic social media marketing services. </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- </div> -->
    <%-- <jsp:include page="/WEB-INF/views/include/services.jsp" /> -->
    <%-- <jsp:include page="/WEB-INF/views/include/footer.jsp" /> --%>
</body>
</html>
