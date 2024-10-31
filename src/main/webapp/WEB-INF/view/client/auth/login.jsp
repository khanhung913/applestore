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
                    <title>Login</title>
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


                    <!-- Login 13 - Bootstrap Brain Component -->
                    <section class="auth-form">
                        <div class="container">
                            <div class="opacity-85 vh-100 row d-flex justify-content-center align-items-center">
                                <div class="col-12 col-sm-10 col-md-8 col-lg-6 col-xl-5 col-xxl-4">
                                    <div class="card border border-light-subtle rounded-3 shadow-sm bg-light">
                                        <div class="card-body p-3 p-md-4 p-xl-5">
                                            <div class="text-center mb-3">
                                                <a href="/">
                                                    <img src="/client/img/applelogo.png" alt="Apple Logo" width="50">
                                                </a>
                                            </div>
                                            <h2 class="fs-6 fw-normal text-center text-secondary mb-4">Sign in to your
                                                account</h2>
                                            <form action="#!">
                                                <div class="row gy-2 overflow-hidden">
                                                    <div class="col-12">
                                                        <div class="form-floating mb-3">
                                                            <input type="email" class="form-control" name="email"
                                                                id="email" placeholder="name@example.com" required>
                                                            <label for="email" class="form-label">Email</label>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-floating mb-3">
                                                            <input type="password" class="form-control" name="password"
                                                                id="password" value="" placeholder="Password" required>
                                                            <label for="password" class="form-label">Password</label>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="d-flex gap-2 justify-content-between">
                                                            <div class="form-check">
                                                                <input class="form-check-input" type="checkbox" value=""
                                                                    name="rememberMe" id="rememberMe">
                                                                <label class="form-check-label text-secondary"
                                                                    for="rememberMe">
                                                                    Keep me logged in
                                                                </label>
                                                            </div>
                                                            <a href="#!"
                                                                class="link-primary text-decoration-none">Forgot
                                                                password?</a>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="d-grid my-3">
                                                            <button class="btn btn-primary btn-lg" type="submit">Log
                                                                in</button>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <p class="m-0 text-secondary text-center">Don't have an account?
                                                            <a href="/signup"
                                                                class="link-primary text-decoration-none">Sign
                                                                up</a>
                                                        </p>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>


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