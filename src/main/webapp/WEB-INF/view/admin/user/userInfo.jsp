<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>User Info ${id} </title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
            </head>

            <body>
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
            </body>

            </html>