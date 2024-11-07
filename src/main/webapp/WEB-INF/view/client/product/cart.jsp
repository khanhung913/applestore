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
                    <title>Cart - Apple Store</title>
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
                        <div class="container py-5 col-md-9">
                            <c:if test="${not empty cartItems}">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col">商品</th>
                                                <th scope="col">商品名</th>
                                                <th scope="col">価格</th>
                                                <th scope="col">数量</th>
                                                <th scope="col">小計</th>
                                                <th scope="col">削除</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="item" items="${cartItems}" varStatus="status">

                                                <tr>
                                                    <th scope="row">
                                                        <div class="d-flex align-items-center">
                                                            <img src="client/img/ProductImage/${item.product.image}"
                                                                style="width: 80px; height: auto;" alt="">
                                                        </div>
                                                    </th>
                                                    <td>
                                                        <p class="mb-0 mt-4">${item.product.name}</p>
                                                    </td>
                                                    <td>
                                                        <p class="mb-0 mt-4">
                                                            (税込)
                                                            <fmt:formatNumber type="number" pattern=""
                                                                value="${item.product.price}" />
                                                        </p>
                                                    </td>
                                                    <td>
                                                        <div class="input-group quantity mt-4" style="width: 100px;">
                                                            <div class="input-group-btn">
                                                                <button
                                                                    class="btn btn-sm btn-minus rounded-circle bg-light border">
                                                                    <i class="fa fa-minus"></i>
                                                                </button>
                                                            </div>
                                                            <input type="text"
                                                                class="form-control form-control-sm text-center border-0"
                                                                value="${item.quantity}"
                                                                data-cart-detail-id="${item.id}"
                                                                data-cart-detail-price="${item.product.price}"
                                                                data-cart-detail-index="${status.index}">
                                                            <div class="input-group-btn">
                                                                <button
                                                                    class="btn btn-sm btn-plus rounded-circle bg-light border">
                                                                    <i class="fa fa-plus"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>

                                                        <!-- <c:set var="price">
                                                            ${item.product.price}
                                                        </c:set> -->
                                                        <p class="mb-0 mt-4" data-cart-detail-id="${item.id}">
                                                            (税込)
                                                            <fmt:formatNumber type="number" pattern=""
                                                                value="${item.quantity*item.product.price}" />
                                                        </p>
                                                    </td>
                                                    <td>
                                                        <form:form action="/delete-item/${item.id}" method="post">
                                                            <input type="hidden" name="${_csrf.parameterName}"
                                                                value="${_csrf.token}" />
                                                            <button
                                                                class="btn btn-md rounded-circle bg-light border mt-4">
                                                                <i class="fa fa-times text-danger"></i>
                                                            </button>
                                                        </form:form>
                                                    </td>

                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>

                                <div class="row g-4 justify-content-center">
                                    <div class="col-sm-10 col-md-7 col-lg-7 col-xl-6">
                                        <div class="bg-light rounded">
                                            <div class="p-4">
                                                <h1 class="display-6 mb-4 text-center">合計</span></h1>
                                                <div class="d-flex justify-content-between mb-4">
                                                    <h5 class="mb-0 me-4">商品の小計:</h5>
                                                    <p class="mb-0" data-cart-total-price="${totalPrice}">(税込)
                                                        <fmt:formatNumber type="number" pattern=""
                                                            value="${totalPrice}" />
                                                    </p>
                                                </div>
                                                <div class="d-flex justify-content-between">
                                                    <h5 class="mb-0 me-4">送料:</h5>
                                                    <div class="">
                                                        <p class="mb-0">無料</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div
                                                class="py-3 mb-4 border-top border-bottom d-flex justify-content-between">
                                                <h5 class="mb-0 ps-4 me-4 d-flex align-items-center">ご請求額:</h5>
                                                <p class="mb-0 mx-4 text-black fs-5 fw-bolder"
                                                    data-cart-total-price="${totalPrice}">
                                                    (税込)
                                                    <fmt:formatNumber type="number" pattern="" value="${totalPrice}" />
                                                </p>
                                            </div>
                                            <form:form action="/confirm-checkout" method="post" modelAttribute="cart">
                                                <input type="hidden" name="${_csrf.parameterName}"
                                                    value="${_csrf.token}" />
                                                <div style="display: none;">
                                                    <c:forEach var="item" items="${cart.cartItems}" varStatus="status">
                                                        <div class="mb-3">
                                                            <div class="form-group">
                                                                <label>Id:</label>
                                                                <form:input class="form-control" type="text"
                                                                    value="${item.id}"
                                                                    path="cartItems[${status.index}].id" />
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Quantity:</label>
                                                                <form:input class="form-control" type="text"
                                                                    value="${item.quantity}"
                                                                    path="cartItems[${status.index}].quantity" />
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                                <div class="d-flex justify-content-center"><button
                                                        class="btn border-secondary rounded-pill px-4 py-2 text-primary text-uppercase mb-4 ms-4">レジに進む
                                                    </button></div>
                                            </form:form>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${!not empty cartItems}">
                                <div class="card-body cart">
                                    <div class="col-sm-12 empty-cart-cls text-center">
                                        <img src="client/img/cartempty.png" width="300" height="auto"
                                            class="img-fluid mb-4 mr-3">
                                        <h3>カートが空いている</h3>
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