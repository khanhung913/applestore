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
                    <title>Confirm Your Email</title>
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
                    <meta name="_csrf" content="${_csrf.token}" />
                    <!-- default header name is X-CSRF-TOKEN -->
                    <meta name="_csrf_header" content="${_csrf.headerName}" />
                </head>

                <body>
                    <div id="spinner"
                        class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                        <div class="spinner-grow text-primary" role="status"></div>
                    </div>

                    <div class="auth-form ">
                        <div class="container">
                            <div class=" vh-100 d-flex justify-content-center align-items-center">
                                <div id="confirmRegisterForm"
                                    class="col-12 col-sm-10 col-md-8 col-lg-6 col-xl-5 col-xxl-4">
                                    <div class="card border border-light-subtle rounded-3 shadow-sm bg-light">
                                        <div class="card-body p-2 p-md-3 p-xl-4">
                                            <div class="text-center mb-3">
                                                <a href="/">
                                                    <img src="/client/img/applelogo.png" alt="Apple Logo" width="50">
                                                </a>
                                            </div>
                                            <h2 class="fs-6 fw-normal text-center text-secondary mb-4">
                                                認証コードを送信しました。入力してください。</h2>
                                            <div class="row gy-2 overflow-hidden d-flex align-items-center">
                                                <!-- <form action="/confirmRegister" method="post"> -->
                                                <!-- <input type="hidden" name="${_csrf.parameterName}"
                                                        value="${_csrf.token}" /> -->

                                                <div class="col-12 d-none">
                                                    <div class="d-flex">
                                                        <input type="text" class="" name="email" id="emailRegister"
                                                            value="${email}" />
                                                        <label for="email"></label>
                                                    </div>
                                                </div>
                                                <div class="col-6">
                                                    <div class="d-flex align-items-center">
                                                        <input type="text" class="form-control text-center fs-4"
                                                            name="token" id="tokenRegister" placeholder="認証コード" />
                                                        <label for="token" class="form-label"></label>
                                                    </div>
                                                </div>
                                                <div class="col-6 py-5px">
                                                    <div class="form-floating d-grid my-3 mb-3">
                                                        <button class="btnConfirmRegister btn btn-primary btn-lg"
                                                            type="submit">認証</button>
                                                    </div>
                                                </div>
                                                <!-- </form> -->
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="page-wrapper">
                                    <div id="registerSuccess" class="custom-modal d-none">
                                        <div class="succes succes-animation icon-top"><i class="fa fa-check"></i>
                                        </div>
                                        <div class="succes border-bottom"></div>
                                        <div class="content">
                                            <p class="type mt-4">成功</p>
                                            <p class="message-type px-4">あなたのアカウントが認証されました。</p>
                                            <a href="/login" class="btn btn-primary mb-3">ログイン</a>
                                        </div>
                                    </div>

                                    <div id="registerFail" class="custom-modal d-none">
                                        <div class="danger danger-animation icon-top"><i class="fa fa-times"></i>
                                        </div>
                                        <div class="danger border-bottom"></div>
                                        <div class="content">
                                            <h6 class="type mt-4">失敗</h6>
                                            <h6 class="message-type px-4">認証コードが間違いました。</h6>
                                            <button class="btnRegisterFail btn btn-primary mb-3">再認証</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>




                    <!-- JavaScript Libraries -->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="/client/lib/easing/easing.min.js"></script>
                    <script src="/client/lib/waypoints/waypoints.min.js"></script>
                    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                    <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>
                    <script
                        src="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.js"></script>

                    <!-- Template Javascript -->
                    <script src="/client/js/main.js"></script>
                </body>

                </html>