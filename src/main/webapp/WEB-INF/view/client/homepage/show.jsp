<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <meta name="description" content="" />
                    <meta name="author" content="" />
                    <title>Apple Store</title>
                    <!-- Google Web Fonts -->
                    <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                    <link
                        href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                        rel="stylesheet">

                    <!-- Icon Font Stylesheet -->
                    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                        rel="stylesheet">

                    <!-- Libraries Stylesheet -->
                    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


                    <!-- Customized Bootstrap Stylesheet -->
                    <link href="/client/css/bootstrap.min.css" rel="stylesheet">

                    <!-- Template Stylesheet -->
                    <link href="/client/css/style.css" rel="stylesheet">
                    <link rel="icon" type="image/x-icon" href="/client/img/applelogo.png">
                </head>

                <body>
                    <!-- Spinner Start -->
                    <div id="spinner"
                        class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                        <div class="spinner-grow text-primary" role="status"></div>
                    </div>
                    <!-- Spinner End -->
                    <jsp:include page="../layout/header.jsp" />

                    <jsp:include page="../layout/banner.jsp" />



                    <!-- Fruits Shop Start-->
                    <div class="container-fluid fruite ">
                        <div class="container py-5">
                            <div class="tab-class text-center">
                                <div class="row g-4">
                                    <div class="d-flex justify-content-center">
                                        <div class="col-lg-8">
                                            <ul class="nav nav-pills d-inline-flex text-center mb-5">
                                                <li class="nav-item">
                                                    <a class="d-flex py-2 m-2 bg-light rounded-pill active"
                                                        data-bs-toggle="pill" href="#tab-1">
                                                        <span class="text-black" style="width: 130px;">iPhone</span>
                                                    </a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="d-flex m-2 py-2 bg-light rounded-pill"
                                                        data-bs-toggle="pill" href="#tab-2">
                                                        <span class="text-black" style="width: 130px;">Mac</span>
                                                    </a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="d-flex m-2 py-2 bg-light rounded-pill"
                                                        data-bs-toggle="pill" href="#tab-3">
                                                        <span class="text-black" style="width: 130px;">Apple
                                                            Watch</span>
                                                    </a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="d-flex m-2 py-2 bg-light rounded-pill"
                                                        data-bs-toggle="pill" href="#tab-4">
                                                        <span class="text-black" style="width: 130px;">AirPods</span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-content">
                                    <div id="tab-1" class="tab-pane fade show p-0 active">
                                        <div class="row g-4">
                                            <div class="col-lg-12">
                                                <div class="row g-4">
                                                    <c:forEach var="iphone" items="${iphones}">
                                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                                            <div class="rounded position-relative fruite-item">
                                                                <a href="/product/${iphone.id}">
                                                                    <div
                                                                        class="product-img border border-secondary border-bottom-0 rounded-top">
                                                                        <img src="/client/img/ProductImage/${iphone.image}"
                                                                            class="img-fluid w-100 rounded-top">
                                                                    </div>
                                                                </a>
                                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                                    style="top: 10px; left: 10px;">${iphone.target}
                                                                </div>
                                                                <div
                                                                    class="p-4 border border-secondary border-top-0 rounded-bottom background-light">
                                                                    <a href="/product/${iphone.id}">
                                                                        <h4 class="my-1">${iphone.name}</h4>
                                                                    </a>
                                                                    <p class="text-black fs-5 mb-0 mt-3">
                                                                        (税込)
                                                                        <fmt:formatNumber type="number" pattern=""
                                                                            value="${iphone.price}" />
                                                                    </p>
                                                                    <div
                                                                        class="d-flex justify-content-center flex-lg-wrap mt-5">
                                                                        <form
                                                                            action="/addItemToCartFromHomePage/${iphone.id}"
                                                                            method="post">
                                                                            <input type="hidden"
                                                                                name="${_csrf.parameterName}"
                                                                                value="${_csrf.token}" />
                                                                            <a href="/product/${iphone.id}"
                                                                                class="btn btn-primary border border-secondary rounded-pill px-3 text-primary"><i
                                                                                    class="fa fa-shopping-bag me-2 text-primary my-1"></i>
                                                                                詳しく見る</a>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="tab-2" class="tab-pane fade show p-0">
                                        <div class="row g-4">
                                            <div class="col-lg-12">
                                                <div class="row g-4">
                                                    <c:forEach var="mac" items="${macs}">
                                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                                            <div class="rounded position-relative fruite-item">
                                                                <a href="/product/${mac.id}">
                                                                    <div
                                                                        class="product-img border border-secondary border-bottom-0 rounded-top">
                                                                        <img src="/client/img/ProductImage/${mac.image}"
                                                                            class="img-fluid w-100 rounded-top">
                                                                    </div>
                                                                </a>
                                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                                    style="top: 10px; left: 10px;">${mac.target}
                                                                </div>
                                                                <div
                                                                    class="p-4 border border-secondary border-top-0 rounded-bottom background-light">
                                                                    <a href="/product/${mac.id}">
                                                                        <h4 class="my-1">${mac.name}</h4>
                                                                    </a>
                                                                    <p class="text-black fs-5 mb-0 mt-3">
                                                                        (税込)
                                                                        <fmt:formatNumber type="number" pattern=""
                                                                            value="${mac.price}" />
                                                                    </p>
                                                                    <div
                                                                        class="d-flex justify-content-center flex-lg-wrap mt-5">
                                                                        <form
                                                                            action="/addItemToCartFromHomePage/${mac.id}"
                                                                            method="post">
                                                                            <input type="hidden"
                                                                                name="${_csrf.parameterName}"
                                                                                value="${_csrf.token}" />
                                                                            <a href="/product/${mac.id}"
                                                                                class="btn btn-primary border border-secondary rounded-pill px-3 text-primary"><i
                                                                                    class="fa fa-shopping-bag me-2 text-primary my-1"></i>
                                                                                詳しく見る</a>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="tab-3" class="tab-pane fade show p-0">
                                        <div class="row g-4">
                                            <div class="col-lg-12">
                                                <div class="row g-4">
                                                    <c:forEach var="applewatch" items="${applewatchs}">
                                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                                            <div class="rounded position-relative fruite-item">
                                                                <a href="/product/${applewatch.id}">
                                                                    <div
                                                                        class="product-img border border-secondary border-bottom-0 rounded-top">
                                                                        <img src="/client/img/ProductImage/${applewatch.image}"
                                                                            class="img-fluid w-100 rounded-top">
                                                                    </div>
                                                                </a>
                                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                                    style="top: 10px; left: 10px;">${applewatch.target}
                                                                </div>
                                                                <div
                                                                    class="p-4 border border-secondary border-top-0 rounded-bottom background-light">
                                                                    <a href="/product/${applewatch.id}">
                                                                        <h4 class="my-1">${applewatch.name}</h4>
                                                                    </a>
                                                                    <p class="text-black fs-5 mb-0 mt-3">
                                                                        (税込)
                                                                        <fmt:formatNumber type="number" pattern=""
                                                                            value="${applewatch.price}" />
                                                                    </p>
                                                                    <div
                                                                        class="d-flex justify-content-center flex-lg-wrap mt-5">
                                                                        <form
                                                                            action="/addItemToCartFromHomePage/${applewatch.id}"
                                                                            method="post">
                                                                            <input type="hidden"
                                                                                name="${_csrf.parameterName}"
                                                                                value="${_csrf.token}" />
                                                                            <a href="/product/${applewatch.id}"
                                                                                class="btn btn-primary border border-secondary rounded-pill px-3 text-primary"><i
                                                                                    class="fa fa-shopping-bag me-2 text-primary my-1"></i>
                                                                                詳しく見る</a>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="tab-4" class="tab-pane fade show p-0">
                                        <div class="row g-4">
                                            <div class="col-lg-12">
                                                <div class="row g-4">
                                                    <c:forEach var="airpods" items="${airpods}">
                                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                                            <div class="rounded position-relative fruite-item">
                                                                <a href="/product/${airpods.id}">
                                                                    <div
                                                                        class="product-img border border-secondary border-bottom-0 rounded-top">
                                                                        <img src="/client/img/ProductImage/${airpods.image}"
                                                                            class="img-fluid w-100 rounded-top">
                                                                    </div>
                                                                </a>
                                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                                    style="top: 10px; left: 10px;">${airpods.target}
                                                                </div>
                                                                <div
                                                                    class="p-4 border border-secondary border-top-0 rounded-bottom background-light">
                                                                    <a href="/product/${airpods.id}">
                                                                        <h4 class="my-1">${airpods.name}</h4>
                                                                    </a>
                                                                    <p class="text-black fs-5 mb-0 mt-3">
                                                                        (税込)
                                                                        <fmt:formatNumber type="number" pattern=""
                                                                            value="${airpods.price}" />
                                                                    </p>
                                                                    <div
                                                                        class="d-flex justify-content-center flex-lg-wrap mt-5">
                                                                        <form
                                                                            action="/addItemToCartFromHomePage/${airpods.id}"
                                                                            method="post">
                                                                            <input type="hidden"
                                                                                name="${_csrf.parameterName}"
                                                                                value="${_csrf.token}" />
                                                                            <a href="/product/${airpods.id}"
                                                                                class="btn btn-primary border border-secondary rounded-pill px-3 text-primary"><i
                                                                                    class="fa fa-shopping-bag me-2 text-primary my-1"></i>
                                                                                詳しく見る</a>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Fruits Shop End-->
                    <jsp:include page="../layout/featur.jsp" />
                    <jsp:include page="../layout/comment.jsp" />
                    <jsp:include page="../layout/footer.jsp" />

                    <!-- JavaScript Libraries -->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="/client/lib/easing/easing.min.js"></script>
                    <script src="/client/lib/waypoints/waypoints.min.js"></script>
                    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                    <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

                    <!-- Template Javascript -->
                    <script src="/client/js/main.js"></script>
                </body>

                </html>