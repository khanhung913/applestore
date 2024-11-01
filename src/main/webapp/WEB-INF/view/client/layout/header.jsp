<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!-- Navbar start -->
            <div class="container-fluid fixed-top">
                <div class="container px-0">
                    <nav class="navbar navbar-light bg-white navbar-expand-xl">
                        <a href="/" class="navbar-brand">
                            <img src="/client/img/Apple-Logo.png" width="100px" alt="">
                        </a>
                        <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarCollapse">
                            <span class="fa fa-bars text-primary"></span>
                        </button>
                        <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                            <div class="navbar-nav mx-auto">
                                <a href="/" class="nav-item nav-link active mx-5">ホーム</a>
                                <a href="/product" class="nav-item nav-link mx-5">商品</a>
                                <a href="/contact" class="nav-item nav-link mx-5">連絡</a>
                            </div>
                            <div class="d-flex m-3 me-0 flex-end me-5">
                                <c:if test="${not empty pageContext.request.userPrincipal}">
                                    <a href="#" class="position-relative me-4 my-auto">
                                        <i class="fa fa-shopping-bag fa-2x"></i>
                                    </a>
                                    <div class="dropdown my-auto">
                                        <a href="#" class="dropdown" role="button" id="dropdownMenuLink"
                                            data-bs-toggle="dropdown" aria-expanded="false">
                                            <i class="far fa-user-circle fa-2x"></i>
                                        </a>
                                        <ul class="dropdown-menu dropdown-menu-end p-4" aria-
                                            labelledby="dropdownMenuLink">
                                            <li class="d-flex align-items-center flex-column" style="min-width: 200px;">
                                                <img style="width: 100px; height: 100px; border-radius: 50%; overflow: hidden;"
                                                    src="/client/img/kuma.jpg" />
                                                <div class="text-center my-3 text-primary">
                                                    ${pageContext.request.userPrincipal.name}
                                                </div>
                                            </li>
                                            <li class="d-flex justify-content-center flex-lg-wrap">
                                                <a href="#"
                                                    class="btn btn-primary border border-secondary rounded-pill px-3 text-primary dropdown-item d-flex justify-content-center"><i
                                                        class="fas fa-user-circle me-2 my-1"></i>
                                                    アカウント管理</a>
                                            </li>
                                            <li class="d-flex justify-content-center flex-lg-wrap my-3">
                                                <a href="#"
                                                    class="btn btn-primary border border-secondary rounded-pill px-3 text-primary dropdown-item d-flex justify-content-center"><i
                                                        class="fas fa-shopping-cart me-2 my-1"></i>
                                                    注文履歴</a>
                                            </li>
                                            <li>
                                                <hr class="dropdown-divider">
                                            </li>
                                            <li class="d-flex justify-content-center flex-lg-wrap">
                                                <form action="/logout" method="post">
                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                        value="${_csrf.token}" />
                                                    <button
                                                        class="dropdown-item btn btn-primary border border-secondary rounded-pill px-3 text-primary dropdown-item d-flex justify-content-center"
                                                        href=""><i
                                                            class="fas fa-sign-out-alt my-auto mx-2"></i>サインアウト</button>

                                                </form>
                                            </li>
                                        </ul>
                                    </div>
                                </c:if>
                                <c:if test="${empty pageContext.request.userPrincipal}">
                                    <a href="/login" class="position-relative me-4 my-auto">
                                        <i class="fas fa-sign-in-alt fa-2x"></i>
                                    </a>
                                </c:if>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>