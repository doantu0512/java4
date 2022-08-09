<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<section id="cart_items">
    <div class="container">
        <div class="breadcrumbs">
            <ol class="breadcrumb">
                <li><a href="#">Home</a></li>
                <li class="active">Shopping Cart</li>
            </ol>
        </div>
        <div class="row">
            <c:if test="${!empty sessionScope.error}">
                <div class="alert alert-danger">
                        ${sessionScope.error}
                </div>
                <c:remove var="error" scope="session"/>
            </c:if>
            <div class="table-responsive cart_info col-sm-9">
                <table class="table table-condensed">
                    <thead>
                    <tr class="cart_menu">
                        <td class="description"><b>STT</b></td>
                        <td class="image">Item</td>
                        <td class="description">Name</td>
                        <td class="description">Description</td>
                        <td class="price">Price</td>
                        <td class="quantity">Quantity</td>
                        <td class="total">Total</td>
                        <td></td>
                    </tr>
                    </thead>
                    <tbody>
                    <c:if test="${empty sessionScope.order.orderdetails}">
                        <td><p style="color: red;font-size: 20px">Bạn chưa có sản phẩm nào trong giỏ hàng</p></td>
                    </c:if>
                    <c:forEach items="${sessionScope.order.orderdetails}" var="cart" varStatus="status">
                        <tr>
                            <td class="cart_description">
                                <b> #${status.count}</b>
                            </td>
                            <td class="cart_product">
                                <img height="60px" src="/images/products/${cart.product.img}" alt="">
                            </td>
                            <td class="cart_description">
                                    ${cart.product.ten}
                            </td>
                            <td class="cart_description">
                                Size : <span style="color: red">${cart.product.kichThuoc}</span>
                                &ensp;&ensp; Color : <span style="color: red;">${cart.product.mauSac}</span>
                            </td>
                            <td class="cart_price">
                                <fmt:formatNumber value="${cart.product.donGia}" pattern="#,###"/>
                            </td>
                            <td class="cart_quantity">
                                <div class="cart_quantity_button">
                                    <a class="cart_quantity_up" href="/up?id=${cart.product.id}"> + </a>
                                    <input class="cart_quantity_input" type="text" name="quantity"
                                           value="${cart.soLuong}" autocomplete="off" size="2">
                                    <a class="cart_quantity_down" href="/down?id=${cart.product.id}"> - </a>
                                </div>
                            </td>
                            <td class="cart_total">
                                <span style="color: red"><fmt:formatNumber value="${cart.product.donGia*cart.soLuong}"
                                                                           pattern="#,###"/> VND</span>
                            </td>
                            <td class="cart_delete">
                                <a class="cart_quantity_delete" href="/removetocart?idP=${cart.product.id}"><i
                                        class="fa fa-times"></i></a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="col-sm-3">
                <p>Bạn có <span style="color: red;font-size: 15px">${sessionScope.soLuong}</span> sản phẩm trong giỏ
                    hàng</p>
                <hr>
                <b>Thành Tiền :&ensp; &ensp; &ensp;&ensp;&ensp;<span
                        style="color: red; font-size: 20px"><fmt:formatNumber value="${tong}"
                                                                              pattern="#,###"/> VND</span></b>
                <hr>
                <p>Thanh Toán Khi Nhận Hàng</p>
                <hr>
                <c:if test="${!empty sessionScope.order}">
                    &ensp;&ensp;
                    <button class="btn btn-success " data-toggle="collapse" data-target="#zzz">Xác Nhận Thanh Toán
                    </button>
                </c:if>
                <hr>
                &ensp;&ensp; <a class="btn btn-warning" href="/home">Tiếp Tục Mua Hàng</a>
            </div>

        </div>
        <div class="collapse row" id="zzz">
            <div class="col-12 mb-5 mb-md-0">
                <form action="/storeUserCart" method="post">
                    <h2 class="h3 mb-3 text-black">Nhập Tú Tin Nhận Hàng</h2>
                    <div class="p-3 p-lg-5 border">
                        <div class="form-group row">
                            <c:if test="${check==false}">
                            <div class="col-md-6">
                                <label class="form-label fw-bold">Name</label>
                                <input type="text" class="form-control" name="hoTen">
                            </div>
                            </c:if>
                            <c:if test="${check==true}">
                                <div class="col-md-6">
                                    <label class="form-label fw-bold">Name</label>
                                    <p style="color: red;font-size: 20px">${userDH.hoTen}</p>
                                </div>
                            </c:if>
                            <div class="col-md-6">
                                <label class="text-black">Phone </label>
                                <input type="text" class="form-control" name="sdt" value="${userDH.sdt}">
                            </div>
                        </div>
                        <c:if test="${check==false}">
                            <div class="form-group row">
                                <div class="col-md-6">
                                    <label class="text-black"> Password</label>
                                    <input type="password" class="form-control" name="password" placeholder="">
                                </div>
                                <div class="col-md-6">
                                    <label class="text-black">Repeat Password</label>
                                    <input type="password" class="form-control" name="password2" placeholder="">
                                </div>
                            </div>
                        </c:if>
                    </div>
                    <c:if test="${check==false}">
                        <div class="form-group row mb-5">
                            <div class="col-md-12">
                                <label class="text-black">Email Address</label>
                                <input type="email" class="form-control" name="email">
                            </div>
                        </div>
                    </c:if>

                    <div class="form-group row mb-5">
                        <div class="col-md-12">
                            <label class="form-label fw-bold">Address</label>
                            <input type="text" class="form-control" name="diaChi" value="${userDH.diaChi}">
                        </div>
                    </div>
                    <div class="form-group">
                        <button class="btn btn-success" data-toggle="modal" data-target="#modalorder">Đặt Hàng</button>
                    </div>
                    <div id="modalorder" class="modal" tabindex="-1">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h3 class="modal-title">Xác nhận</h3>
                                </div>
                                <div class="modal-body">
                                    <h5>Xác Nhận Đặt Hàng ?</h5>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-success">Xác Nhận</button>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal"
                                            aria-label="Close">Hủy
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    </div>
</section>
<!--/#cart_items-->
<br>
<br>
