<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="container mt-5 mb-5">
    <div class="row justify-content-center">
        <div class="col-lg-7">
            <div class="card shadow-lg border-0 rounded-lg">
                <div class="card-header bg-primary text-white text-center">
                    <h3 class="font-weight-light my-2">Tạo Tài Khoản Mới</h3>
                </div>
                <div class="card-body p-5">
                    <c:if test="${not empty alert}">
                        <div class="alert alert-danger text-center" role="alert">
                            ${alert}
                        </div>
                    </c:if>

                    <form action="<c:url value='/register'/>" method="post">
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <div class="form-floating mb-3 mb-md-0">
                                    <input class="form-control" id="username" name="username" type="text" placeholder="Tên đăng nhập" required />
                                    <label for="username">Tên đăng nhập</label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input class="form-control" id="fullname" name="fullname" type="text" placeholder="Họ và tên đầy đủ" required />
                                    <label for="fullname">Họ và tên</label>
                                </div>
                            </div>
                        </div>
                        <div class="form-floating mb-3">
                            <input class="form-control" id="email" name="email" type="email" placeholder="name@example.com" required />
                            <label for="email">Địa chỉ Email</label>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <div class="form-floating mb-3 mb-md-0">
                                    <input class="form-control" id="password" name="password" type="password" placeholder="Mật khẩu" required />
                                    <label for="password">Mật khẩu</label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-floating mb-3 mb-md-0">
                                    <input class="form-control" id="confirmPassword" name="confirmPassword" type="password" placeholder="Xác nhận mật khẩu" required />
                                    <label for="confirmPassword">Xác nhận mật khẩu</label>
                                </div>
                            </div>
                        </div>
                        <div class="mt-4 mb-0">
                            <div class="d-grid"><button class="btn btn-primary btn-block" type="submit">Tạo tài khoản</button></div>
                        </div>
                    </form>
                </div>
                <div class="card-footer text-center py-3">
                    <div class="small"><a href="<c:url value='/login'/>">Đã có tài khoản? Đăng nhập ngay</a></div>
                </div>
            </div>
        </div>
    </div>
</div>