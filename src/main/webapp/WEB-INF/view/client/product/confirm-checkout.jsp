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
                    <title>Check out</title>
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


                    <div class="container mt-5 col-md-10">
                        <div class="row">
                            <div class="col-md-5 order-md-2 mb-4 mt-5">
                                <h4 class="my-4 text-center">カート</h4>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">商品名</th>
                                            <th scope="col" class="text-end">数量</th>
                                            <th scope="col" class="text-center">小計</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="item" items="${cartItems}" varStatus="status">

                                            <tr>

                                                <td>
                                                    <p class="mb-0 mt-4">${item.product.name}</p>
                                                </td>

                                                <td>
                                                    <p class="mb-0 mt-4 text-end me-3">${item.quantity}</p>
                                                </td>
                                                <td>
                                                    <p class="mb-0 mt-4 text-end me-3" id="totalPrice">
                                                        (税込)
                                                        <fmt:formatNumber type="number" pattern=""
                                                            value="${item.quantity*item.product.price}" />
                                                    </p>
                                                </td>

                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <div class="py-3 mb-4 border-bottom d-flex justify-content-between">
                                    <h5 class="mb-0 ps-4 me-4 d-flex align-items-center">ご請求額:</h5>
                                    <p class="mb-0 mx-4 text-black fs-4 fw-bolder">
                                        (税込)
                                        <fmt:formatNumber type="number" pattern="" value="${totalPrice}" />
                                    </p>
                                </div>
                            </div>
                            <div class="col-md-7 order-md-1 mt-5">
                                <h4 class="my-4 text-center">請求先住所</h4>
                                <form:form class="needs-validation" action="/place-order" method="post">

                                    <div class="mb-3">
                                        <label for="email">メール：</label>
                                        <input type="email" class="form-control" id="email" value="${user.email}">
                                        <div class="invalid-feedback"> メールを入力してください。 </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-8 mb-3">
                                            <label for="name">荷受人：</label>
                                            <input type="text" class="form-control" id="name" name="name"
                                                value="${user.firstName} ${user.lastName}" required="">
                                            <div class="invalid-feedback"> Valid name is required. </div>
                                        </div>

                                        <div class="col-md-4 mb-3">
                                            <label for="phone">電話番号：</label>
                                            <input type="text" class="form-control" id="phone" name="phone"
                                                value="${user.phone}" required="">
                                            <div class="invalid-feedback"> 電話番号を入力してください。 </div>
                                        </div>
                                    </div>

                                    <div class="mb-3">
                                        <label for="address">住所：</label>
                                        <input type="text" class="form-control" id="address" name="address"
                                            placeholder="" value="${user.address}" required="">
                                        <div class="invalid-feedback"> 住所を入力してください。 </div>
                                    </div>
                                    <hr class="mb-4">
                                    <h4 class="mb-3 my-4 text-center">支払方法</h4>
                                    <div class="row">
                                        <div class="col-4 custom-control custom-radio">
                                            <input id="cod" name="paymentMethod" type="radio"
                                                class="custom-control-input" checked="" required="">
                                            <label class="custom-control-label" for="credit">代引き</label>
                                        </div>
                                        <div class="col-4 custom-control custom-radio">
                                            <input id="credit" name="paymentMethod" type="radio"
                                                class="custom-control-input" required="">
                                            <label class="custom-control-label" for="credit">クレジットカード</label>
                                        </div>
                                        <div class="col-4 custom-control custom-radio">
                                            <input id="debit" name="paymentMethod" type="radio"
                                                class="custom-control-input" required="">
                                            <label class="custom-control-label" for="debit">デビットカード</label>
                                        </div>
                                    </div>
                                    <hr class="mb-4">
                                    <div class="d-flex justify-content-center"><button
                                            class="btn btn-primary btn-lg btn-block" type="submit">注文を確定する</button>
                                    </div>
                                </form:form>
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