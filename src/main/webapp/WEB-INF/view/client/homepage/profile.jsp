<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="" />
                <meta name="author" content="" />
                <title>Profil - Apple Store</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                </script>
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
                    crossorigin="anonymous">
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

                <div id="spinner"
                    class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                    <div class="spinner-grow text-primary" role="status"></div>
                </div>
                <!-- Spinner End -->
                <jsp:include page="../layout/header.jsp" />
                <div class="page-content page-container" id="page-content">
                    <div class="container vh-100 d-flex align-items-center">
                        <div class="row container d-flex justify-content-center">
                            <div class="col-xl-4 col-md-12">
                                <div class="card user-card-full">
                                    <!-- <div class="row mx-0"> -->
                                    <!-- <div class="col-sm-4 bg-c-lite-green user-profile"> -->
                                    <div class="card-block text-center text-white">
                                        <div class="mt-n75px d-flex justify-content-center">
                                            <div class="mb-4 square-container d-flex justify-content-center">
                                                <img src="/client/img/avatar/${user.avatar}">
                                            </div>
                                        </div>
                                        <h3 class="fw-bold mb-3">${user.firstName} ${user.lastName}</h3>
                                        <hr class="dropdown-divider w-75 mx-auto">
                                    </div>
                                    <!-- </div> -->
                                    <!-- <div class="col-sm-8"> -->
                                    <div class="card-block">
                                        <h4 class="text-center my-4">個人情報</h4>
                                        <!-- <div class="row"> -->
                                        <div class=" d-flex justify-content-between">
                                            <h6 class="mb-3 ms-5">メール</h6>
                                            <h6 class="me-5">${user.email}</h6>
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <h6 class="mb-3 ms-5">電話番号</h6>
                                            <h6 class="me-5">${user.phone}</h6>
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <h6 class="mb-3 ms-5">住所</h6>
                                            <h6 class="me-5">${user.address}</h6>
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <h6 class="mb-3 ms-5">電話番号</h6>
                                            <h6 class="me-5">${user.phone}</h6>
                                        </div>
                                        <ul class="social-link list-unstyled m-t-40 m-b-10">
                                            <li><a href="#!" data-toggle="tooltip" data-placement="bottom" title=""
                                                    data-original-title="facebook" data-abc="true"><i
                                                        class="mdi mdi-facebook feather icon-facebook facebook"
                                                        aria-hidden="true"></i></a></li>
                                            <li><a href="#!" data-toggle="tooltip" data-placement="bottom" title=""
                                                    data-original-title="twitter" data-abc="true"><i
                                                        class="mdi mdi-twitter feather icon-twitter twitter"
                                                        aria-hidden="true"></i></a></li>
                                            <li><a href="#!" data-toggle="tooltip" data-placement="bottom" title=""
                                                    data-original-title="instagram" data-abc="true"><i
                                                        class="mdi mdi-instagram feather icon-instagram instagram"
                                                        aria-hidden="true"></i></a></li>
                                        </ul>
                                        <!-- </div> -->
                                    </div>
                                    <!-- </div> -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>
                <script src="/client/js/main.js"></script>
            </body>

            </html>