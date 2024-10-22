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
                <title>Product - SB Admin</title>
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
                                        <h3>User Info</h3>
                                        <table class="table">
                                            <thead>

                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <th>ID</th>
                                                    <td>${user.id}</td>
                                                </tr>
                                                <tr>
                                                    <th>Email</th>
                                                    <td>${user.email}</td>
                                                </tr>
                                                <tr>
                                                    <th>FirstName</th>
                                                    <td>${user.firstName}</td>
                                                </tr>
                                                <tr>
                                                    <th>LastName</th>
                                                    <td>${user.lastName}</td>
                                                </tr>
                                                <tr>
                                                    <th>Phone</th>
                                                    <td>${user.phone}</td>
                                                </tr>
                                                <tr>
                                                    <th>Address</th>
                                                    <td>${user.address}</td>
                                                </tr>
                                            </tbody>
                                            </hr>
                                        </table>
                                        <a href="/admin/user" class="btn btn-primary">Back</a>
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