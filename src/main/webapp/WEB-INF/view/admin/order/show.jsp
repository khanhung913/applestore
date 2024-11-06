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
                    <title>Order - SB Admin</title>
                    <link href="/css/styles.css" rel="stylesheet" />
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
                </head>

                <body class="sb-nav-fixed">
                    <jsp:include page="../layout/header.jsp" />
                    <div id="layoutSidenav">
                        <jsp:include page="../layout/sideNav.jsp" />
                        <div id="layoutSidenav_content">
                            <main>
                                <main>
                                    <div class="container mt-5">
                                        <div class="row">
                                            <div class="col-md-10 col-12 mx-auto">
                                                <div class="d-flex justify-content-start">
                                                    <h3>Product List</h3>
                                                </div>
                                                <hr />
                                                <table class="table table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">ID</th>
                                                            <th scope="col">User</th>
                                                            <th scope="col">Total Price</th>
                                                            <th scope="col">Status</th>
                                                            <th scope="col">Actions</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="order" items="${orders}">
                                                            <tr>
                                                                <th>${order.id}</th>
                                                                <td>${order.receiver_name}</td>
                                                                <td>¥
                                                                    <fmt:formatNumber type="number" pattern=""
                                                                        value="${order.totalPrice}" />
                                                                </td>
                                                                <td>${order.status}</td>

                                                                <td>
                                                                    <a href="/admin/order-info/${order.id}"
                                                                        class="btn btn-success">View</a>
                                                                    <a href="/admin/order-update/${order.id}"
                                                                        class="btn btn-warning mx-3">Update</a>
                                                                    <a href="/admin/order-delete/${order.id}"
                                                                        class="btn btn-danger">Delete</a>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </main>
                            </main>
                            <jsp:include page="../layout/footer.jsp" />
                        </div>
                    </div>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                        crossorigin="anonymous"></script>
                    <script src="/js/scripts.js"></script>
                </body>

                </html>