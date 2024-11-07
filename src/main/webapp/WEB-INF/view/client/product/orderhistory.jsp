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
                    <title>Order History - Apple Store</title>
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

                    <!-- Single Product Start -->

                    <div class="container-fluid py-5">
                        <div class="container py-5 col-md-8">
                            <c:if test="${not empty orderList}">
                                <h1 class="text-center">注文履歴</h1>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col">ID</th>
                                                <th scope="col">荷受人</th>
                                                <th scope="col">請求額</th>
                                                <th scope="col">状態</th>
                                                <th scope="col">アクション</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="item" items="${orderList}">

                                                <tr>
                                                    <td>
                                                        <p class="mb-0 mt-4">${item.id}</p>
                                                    </td>
                                                    <td>
                                                        <p class="mb-0 mt-4">${item.receiver_name}</p>
                                                    </td>
                                                    <td>
                                                        <p class="mb-0 mt-4">
                                                            (税込)
                                                            <fmt:formatNumber type="number" pattern=""
                                                                value="${item.totalPrice}" />
                                                        </p>
                                                    </td>
                                                    <td>
                                                        <p class="mb-0 mt-4">${item.status}</p>
                                                    </td>
                                                    <td>
                                                        <a href="#" class="btn btn-success mt-3">詳しく</a>
                                                        <a href="#" class="btn btn-danger mx-3 mt-3">キャンセル</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </c:if>
                            <c:if test="${!not empty orderList}">
                                <div class="card-body cart">
                                    <div class="col-sm-12 empty-cart-cls text-center">
                                        <img src="client/img/orderempty.png" width="300" height="auto"
                                            class="img-fluid mb-4 mr-3">
                                        <h3>注文履歴が空いている</h3>
                                        <a href="/product" class="btn btn-primary cart-btn-transform my-5"
                                            data-abc="true">ショップに戻る</a>


                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </div>


                    <!-- Single Product End -->


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