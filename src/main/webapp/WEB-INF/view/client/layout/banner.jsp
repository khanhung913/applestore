<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <div class="container-fluid py-5 hero-header">
                <div class="container py-5">
                    <div class="row g-5 align-items-center">
                        <div class="col-md-12 col-lg-7">
                            <h1 class="mb-5 mt-5 display-6 text-light">Apple製品と出会うための <br />最高の場所です。</h1>
                        </div>
                        <div class="col-md-12 col-lg-5">
                            <div id="carouselId" class="carousel slide position-relative" data-bs-ride="carousel">
                                <div class="carousel-inner" role="listbox">
                                    <div class="carousel-item active rounded">
                                        <img src="/client/img/banner-iphone.jpg"
                                            class="img-fluid w-100 h-100 bg-secondary rounded" alt="First slide">
                                        <a href="#" class="btn px-4 py-2 text-white rounded">iPhone</a>
                                    </div>
                                    <div class="carousel-item rounded">
                                        <img src="/client/img/banner-mac.jpg" class="img-fluid w-100 h-100 rounded"
                                            alt="Second slide">
                                        <a href="#" class="btn px-4 py-2 text-white rounded">Mac</a>
                                    </div>
                                    <div class="carousel-item rounded">
                                        <img src="/client/img/banner-applewatch.jpg"
                                            class="img-fluid w-100 h-100 rounded" alt="Second slide">
                                        <a href="#" class="btn px-4 py-2 text-white rounded">Apple Watch</a>
                                    </div>
                                    <div class="carousel-item rounded">
                                        <img src="/client/img/banner-airpods.jpg" class="img-fluid w-100 h-100 rounded"
                                            alt="Second slide">
                                        <a href="#" class="btn px-4 py-2 text-white rounded">AirPods</a>
                                    </div>
                                </div>
                                <button class="carousel-control-prev" type="button" data-bs-target="#carouselId"
                                    data-bs-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Previous</span>
                                </button>
                                <button class="carousel-control-next" type="button" data-bs-target="#carouselId"
                                    data-bs-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Next</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>