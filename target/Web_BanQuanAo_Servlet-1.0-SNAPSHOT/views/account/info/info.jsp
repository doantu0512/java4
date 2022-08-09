<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<div class="container p-5 mt-5">
    <div class="card o-hidden border-0 shadow-lg my-5">
        <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
                <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                <div class="col-lg-7">
                    <div class="p-5">

                        <div class="text-center">
                            <h1 class="h4 text-gray-900 mb-4">Info Account!</h1>
                        </div>
                        <c:if test="${!empty sessionScope.errorInfo}">
                            <div class="alert alert-danger">
                                    ${sessionScope.error2}
                            </div>
                            <c:remove var="error2" scope="session"/>
                        </c:if>
                        <c:if test="${!empty sessionScope.messageInfo}">
                            <div class="alert alert-success">
                                    ${sessionScope.message2}
                            </div>
                            <c:remove var="message2" scope="session"/>
                        </c:if>
                        <form class="user" action="/info" method="post">
                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <input type="text" class="form-control form-control-user"
                                           placeholder="Name" name="hoTen">
                                </div>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control form-control-user"
                                           placeholder="Phone" name="sdt">
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-control form-control-user"
                                       placeholder="Email" name="email">
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <input type="password" class="form-control form-control-user"
                                           placeholder="Password" name="password">
                                </div>
                                <div class="col-sm-6">
                                    <input type="password" class="form-control form-control-user"
                                           placeholder="Repeat Password" name="password2">
                                </div>
                            </div>
                            <div class=" p-3 mt-4 col-6">
                                <label class="form-label fw-bold pe-4 me-3">Gender</label>
                                <input class="form-check-input  " type="radio" value="1" checked name="gioiTinh">
                                <label class="form-check-label me-5">Boy</label>
                                <input class="form-check-input" type="radio" value="0" name="gioiTinh">
                                <label class="form-check-label me-3">Girl</label>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control form-control-user"
                                       placeholder="Address" name="diaChi">
                            </div>
                            <button class="btn btn-primary btn-user btn-block">
                                Register Account
                            </button>
                            <div class="text-center">
                                <p class=" mt-5">
                                    Bạn đã có tài khoản ? <a href="#register" class="loginhere-link text-decoration-none">Đăng nhập
                                    ngay</a>
                                </p>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

