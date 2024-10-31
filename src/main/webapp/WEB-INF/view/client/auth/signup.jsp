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
                    <title>Create Account</title>
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

                    <!-- Registration 13 - Bootstrap Brain Component -->
                    <div class="auth-form">
                        <div class="container">
                            <div class="opacity-85 vh-100 d-flex justify-content-center align-items-center">
                                <div class="col-12 col-sm-10 col-md-8 col-lg-6 col-xl-5 col-xxl-4">
                                    <div class="card border border-light-subtle rounded-3 shadow-sm bg-light">
                                        <div class="card-body p-2 p-md-3 p-xl-4">
                                            <div class="text-center mb-3">
                                                <a href="/">
                                                    <img src="/client/img/applelogo.png" alt="Apple Logo" width="50">
                                                </a>
                                            </div>
                                            <h2 class="fs-6 fw-normal text-center text-secondary mb-4">Enter your
                                                details to register</h2>
                                            <form:form action="/signup" method="post" modelAttribute="newRegisterDTO">
                                                <div class="row gy-2 overflow-hidden">
                                                    <c:set var="errorEmail">
                                                        <form:errors path="email" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <c:set var="errorFirstName">
                                                        <form:errors path="firstName" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <c:set var="errorLastName">
                                                        <form:errors path="lastName" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <c:set var="errorPassword">
                                                        <form:errors path="password" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <c:set var="errorConfirmPassword">
                                                        <form:errors path="confirmPassword"
                                                            cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <div class="col-12">
                                                        <div class="form-floating mb-3">
                                                            <form:input type="email"
                                                                class="form-control ${not empty errorEmail ? 'is-invalid':''}"
                                                                name="email" id="email" placeholder="name@example.com"
                                                                path="email" />
                                                            <label for="email" class="form-label">Email</label>
                                                            ${errorEmail}
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-floating mb-3">
                                                            <form:input type="text"
                                                                class="form-control ${not empty errorFirstName ? 'is-invalid':''}"
                                                                name="firstName" id="firstName" placeholder="First Name"
                                                                path="firstName" />
                                                            <label for="firstName" class="form-label">First Name</label>
                                                            ${errorFirstName}
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-floating mb-3">
                                                            <form:input type="text"
                                                                class="form-control ${not empty errorLastName ? 'is-invalid':''}"
                                                                name="lastName" id="lastName" placeholder="Last Name"
                                                                path="lastName" />
                                                            <label for="lastName" class="form-label">Last Name</label>
                                                            ${errorLastName}
                                                        </div>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="form-floating mb-3">
                                                            <form:input type="password"
                                                                class="form-control ${not empty errorPassword ? 'is-invalid':''}"
                                                                name="password" id="password" value=""
                                                                placeholder="Password" path="password" />
                                                            <label for="password" class="form-label">Password</label>
                                                            ${errorPassword}
                                                        </div>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="form-floating mb-3">
                                                            <form:input type="password"
                                                                class="form-control ${not empty errorConfirmPassword ? 'is-invalid':''}"
                                                                name="confirmpassword" id="confirmpassword" value=""
                                                                placeholder="Confirm Password" path="confirmPassword" />
                                                            <label for="confirmpassword" class="form-label">Confirm
                                                                Password</label>
                                                            ${errorConfirmPassword}

                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="checkbox" value=""
                                                                name="iAgree" id="iAgree" required>
                                                            <label class="form-check-label text-secondary" for="iAgree">
                                                                I agree to the <a href="#!"
                                                                    class="link-primary text-decoration-none">terms and
                                                                    conditions</a>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="d-grid my-3">
                                                            <button class="btn btn-primary btn-lg" type="submit">Sign
                                                                up</button>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <p class="m-0 text-secondary text-center">Already have an
                                                            account? <a href="/login"
                                                                class="link-primary text-decoration-none">Sign
                                                                in</a>
                                                        </p>
                                                    </div>
                                                </div>
                                            </form:form>
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

                    <!-- Template Javascript -->
                    <script src="/client/js/main.js"></script>
                </body>

                </html>