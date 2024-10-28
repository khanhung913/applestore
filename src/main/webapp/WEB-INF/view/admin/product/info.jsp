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
                <title>Product Info - SB Admin</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sideNav.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container mt-5">
                                <div class="row">
                                    <div class="col-md-6 col-12 mx-auto">
                                        <h3>Product Info</h3>
                                        <table class="table">
                                            <thead>

                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <th>ID</th>
                                                    <td>${product.id}</td>
                                                </tr>
                                                <tr>
                                                    <th>Name</th>
                                                    <td>${product.name}</td>
                                                </tr>
                                                <tr>
                                                    <th>Price</th>
                                                    <td>${product.price}</td>
                                                </tr>
                                                <tr>
                                                    <th>Quantity</th>
                                                    <td>${product.quantity}</td>
                                                </tr>
                                                <tr>
                                                    <th>Sold</th>
                                                    <td>${product.sold}</td>
                                                </tr>
                                                <tr>
                                                    <th>Target</th>
                                                    <td>${product.target}</td>
                                                </tr>
                                                <tr>
                                                    <th>Image</th>
                                                    <td><img src="/client/img/ProductImage/${product.image}"></td>
                                                </tr>
                                            </tbody>
                                            </hr>
                                        </table>
                                        <a href="/admin/product" class="btn btn-primary">Back</a>
                                    </div>
                                </div>
                            </div>
                        </main>
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>
            </body>

            </html>