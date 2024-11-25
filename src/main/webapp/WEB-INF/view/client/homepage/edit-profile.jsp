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
                <title>Edit Profile - Apple Store</title>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                </script>
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
                    crossorigin="anonymous">
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
                <div id="spinner"
                    class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                    <div class="spinner-grow text-primary" role="status"></div>
                </div>
                <jsp:include page="../layout/header.jsp" />
                <div class="page-content page-container" id="page-content">
                    <div class="container vh-100 d-flex align-items-center">
                        <div class="row container d-flex justify-content-center">
                            <div class="col-xl-4 col-md-12">
                                <div class="card user-card-full">
                                    <div class="card-block p-4">
                                        <form method="post" action="/edit" enctype="multipart/form-data"
                                            class="row g-3">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                            <h3 class="text-center">編集</h3>
                                            <div class="">
                                                <label class="form-label">メール:</label>
                                                <input type="email" class="form-control" value="${user.email}"
                                                    required />
                                                <errors path="email" />
                                            </div>
                                            <div class="col-md-6">
                                                <label class="form-label">姓:</label>
                                                <input type="text" class="form-control" value="${user.firstName}"
                                                    name="firstName" required />
                                                <errors path="firstName" />
                                            </div>
                                            <div class="col-md-6">
                                                <label class="form-label">名:</label>
                                                <input type="text" class="form-control" value="${user.lastName}"
                                                    name="lastName" required />
                                                <errors path="lastName" />
                                            </div>
                                            <div class="">
                                                <label class="form-label">電話番号:</label>
                                                <input type="text" id="phone" name="phone" class="form-control"
                                                    value="${user.phone}" name="phone" />
                                            </div>
                                            <div class="">
                                                <label class="form-label">住所:</label>
                                                <input type="text" class="form-control" value="${user.address}"
                                                    name="address" />
                                            </div>
                                            <div class="">
                                                <label for="avatarFile" class="form-label">写真を選択する:</label>
                                                <input class="form-control" type="file" id="avatarFile" name="file"
                                                    accept=".png,.jpg,.jpeg" />
                                            </div>
                                            <div class="col-12 mt-5 d-flex justify-content-center">
                                                <img style="max-height: 150px;display: none;" id="avatarPreview"
                                                    alt="Avatar Preview">
                                            </div>
                                            <div class="col-12 d-flex justify-content-center">
                                                <button type="submit" class="btn btn-primary">Submit</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>
                <script src="/client/js/main.js"></script>
            </body>

            </html>