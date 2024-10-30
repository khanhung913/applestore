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
                <title>Product Create - SB Admin</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    });
                </script>
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
                                        <h3>Create a Product</h3>
                                        <hr />
                                        <form:form method="post" action="/admin/product/create"
                                            enctype="multipart/form-data" modelAttribute="newProduct" class="row g-3">
                                            <c:set var="errorName">
                                                <form:errors path="name" cssClass="invalid-feedback" />
                                            </c:set>
                                            <c:set var="errorPrice">
                                                <form:errors path="price" cssClass="invalid-feedback" />
                                            </c:set>
                                            <c:set var="errorQuantity">
                                                <form:errors path="quantity" cssClass="invalid-feedback" />
                                            </c:set>
                                            <c:set var="errorDesc">
                                                <form:errors path="productDesc" cssClass="invalid-feedback" />
                                            </c:set>
                                            <div class="mb-3">
                                                <label class="form-label">Product Name:</label>
                                                <form:input type="text"
                                                    class="form-control ${not empty errorName ? 'is-invalid':''}"
                                                    path="name" />
                                                ${errorName}
                                            </div>
                                            <div class="col-md-6">
                                                <label class="form-label">Price:</label>
                                                <form:input type="text"
                                                    class="form-control ${not empty errorPrice ? 'is-invalid':''}"
                                                    path="price" />
                                                ${errorPrice}
                                            </div>
                                            <div class="col-md-6">
                                                <label class="form-label">Quantity:</label>
                                                <form:input type="text"
                                                    class="form-control ${not empty errorQuantity ? 'is-invalid':''}"
                                                    path="quantity" />
                                                ${errorQuantity}
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Product Description:</label>
                                                <form:textarea type="text" rows="5"
                                                    class="form-control ${not empty errorDesc ? 'is-invalid':'has-validation'}"
                                                    path="productDesc" />
                                                ${errorDesc}
                                            </div>
                                            <div class="col-md-6">
                                                <label class="form-label">Target:</label>
                                                <form:select class="form-select" path="target">
                                                    <form:option value="iPhone">iPhone</form:option>
                                                    <form:option value="Mac">Mac</form:option>
                                                    <form:option value="Apple Watch">Apple Watch</form:option>
                                                    <form:option value="AirPods">AirPods</form:option>
                                                </form:select>
                                            </div>
                                            <div class="col-md-6">
                                                <label for="productPictureFile" class="form-label">Choose Product
                                                    Picture:</label>
                                                <input class="form-control" type="file" id="productPictureFile"
                                                    name="file" accept=".png,.jpg.jpeg" />
                                            </div>
                                            <div class="col-12 mt-5 d-flex justify-content-center">
                                                <img style="max-height: 150px;display: none;" id="avatarPreview"
                                                    alt="Avatar Preview">
                                            </div>
                                            <div class="col-12 mb-5 mt-5 d-flex justify-content-center">
                                                <button type="submit" class="btn btn-primary">Submit</button>
                                            </div>
                                        </form:form>
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