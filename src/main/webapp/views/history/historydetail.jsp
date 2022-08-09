<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<section id="cart_items">
    <div class="container">
        <div class="breadcrumbs">
            <ol class="breadcrumb">
                <li><a href="#">Home</a></li>
                <li class="active">History</li>
            </ol>
        </div>
        <div class="table-responsive cart_info ">
            <table class="table table-condensed">
                <thead>
                <tr class="cart_menu">
                    <td class="description"><b>STT</b></td>
                    <td class="image">Hình Ảnh</td>
                    <td class="description">Tên Sản Phẩm</td>
                    <td class="description">Kích Thước</td>
                    <td class="description">Màu Sắc</td>
                    <td class="description">Đơn Giá</td>
                    <td class="description">Số Lượng</td>
                    <td class="description">Tổng Tiền </td>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="detail" varStatus="status">
                    <tr>
                        <td class="cart_description">
                            <b> #${status.count}</b>
                        </td>
                        <td class="cart_product">
                            <img height="60px" src="/images/products/${detail.product.img}" alt="">
                        </td>
                        <td class="cart_description">
                                ${detail.product.ten}
                        </td>
                        <td class="cart_description">
                                ${detail.product.kichThuoc}
                        </td>
                        <td class="cart_description">
                                ${detail.product.mauSac}
                        </td>
                        <td class="cart_total">
                            <fmt:formatNumber value="${detail.donGia}" pattern="#,###"/> VND
                        </td>
                        <td class="cart_description">
                                ${detail.soLuong}
                        </td>
                        <td class="cart_total">
                            <span style="color: red"><fmt:formatNumber value="${detail.donGia*detail.soLuong}" pattern="#,###"/> VND</span>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</section> <!--/#cart_items-->
<br>
<br>

