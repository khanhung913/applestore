<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <div class="container-fluid fixed-top d-flex justify-content-center">
                <div class="container px-0">
                    <nav class="navbar navbar-light bg-light navbar-expand-xl">
                        <a href="/" class="navbar-brand">
                            <img src="/client/img/Apple-Logo.png" width="100px" alt="">
                        </a>
                        <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarCollapse">
                            <span class="fa fa-bars text-primary"></span>
                        </button>
                        <div class="collapse navbar-collapse bg-light px-5" id="navbarCollapse">
                            <div class="navbar-nav mx-auto d-flex justify-content-between align-items-center">
                                <a href="/" class="nav-item nav-link active mx-5 fs-5">ホーム</a>
                                <a href="/product" class="nav-item nav-link mx-5 fs-5">商品</a>
                                <div class="input-group w-40 mx-auto my-auto mb-4">
                                    <input type="search" class="form-control" placeholder="何を探していますか？"
                                        aria-describedby="search-icon-1">
                                    <span id="search-icon-1" class="input-group-text p-3"><i
                                            class="fa fa-search"></i></span>
                                </div>
                            </div>
                            <div class="d-flex m-3 me-0 flex-end me-5">
                                <c:if test="${not empty pageContext.request.userPrincipal}">
                                    <a href="/cart" class="position-relative me-4 my-auto">
                                        <i class="fa fa-shopping-bag fa-2x"></i>
                                        <span
                                            class="cartTotal position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-white px-1"
                                            style="top: -5px; left: 15px; height: 20px; min-width: 20px;"
                                            id="sumCart">${sessionScope.sum}</span>
                                    </a>
                                    <div class="dropdown my-auto">
                                        <a href="#" class="dropdown" role="button" id="dropdownMenuLink"
                                            data-bs-toggle="dropdown" aria-expanded="false">
                                            <i class="far fa-user-circle fa-2x"></i>
                                        </a>
                                        <ul class="dropdown-menu dropdown-menu-end p-4" aria-
                                            labelledby="dropdownMenuLink">
                                            <li class="d-flex align-items-center flex-column" style="min-width: 200px;">

                                                <c:if test="${not empty sessionScope.avatar}">
                                                    <div class="square-container-w100">
                                                        <img src="/client/img/avatar/${sessionScope.avatar}"
                                                            alt="avatar">
                                                    </div>
                                                </c:if>
                                                <c:if test="${empty sessionScope.avatar}">
                                                    <div class="square-container-w100">
                                                        <img src="/client/img/avatar/avatar.png" alt="avatar">
                                                    </div>
                                                </c:if>
                                                <div class="text-center my-3 text-primary">
                                                    ${sessionScope.lastName}
                                                </div>
                                            </li>
                                            <li class="d-flex justify-content-center flex-lg-wrap">
                                                <a href="/profile"
                                                    class="btn btn-primary border border-secondary rounded-pill px-3 text-primary dropdown-item d-flex justify-content-center"><i
                                                        class="fas fa-user-circle me-2 my-1"></i>
                                                    アカウント管理</a>

                                            <li class="d-flex justify-content-center flex-lg-wrap my-3">
                                                <form action="/order-history" method="post">
                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                        value="${_csrf.token}" />
                                                    <button
                                                        class="btn btn-primary border border-secondary rounded-pill px-4 text-primary dropdown-item d-flex justify-content-center w-200px"><i
                                                            class="fas fa-shopping-cart me-2 my-1"></i>
                                                        注文履歴</button>
                                                </form>
                                            </li>
                                            <li>
                                                <hr class="dropdown-divider">
                                            </li>
                                            <li class="d-flex justify-content-center flex-lg-wrap">
                                                <form action="/logout" method="post">
                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                        value="${_csrf.token}" />
                                                    <button
                                                        class="dropdown-item btn btn-primary border border-secondary rounded-pill px-3 text-primary dropdown-item d-flex justify-content-center w-200px"
                                                        href=""><i
                                                            class="fas fa-sign-out-alt my-auto mx-2"></i>サインアウト</button>

                                                </form>
                                            </li>
                                        </ul>
                                    </div>
                                </c:if>
                                <c:if test="${empty pageContext.request.userPrincipal}">
                                    <a href="/login" class="a-login position-relative me-4 my-auto">
                                        <i class="fas fa-sign-in-alt fa-2x"></i>
                                    </a>
                                </c:if>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>