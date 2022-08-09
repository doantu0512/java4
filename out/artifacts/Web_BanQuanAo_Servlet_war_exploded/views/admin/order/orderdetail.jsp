
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<div class="d-sm-flex align-items-center justify-content-between mb-4 offset-5">
    <h1 class="h3 mb-0 text-gray-800">Order Management</h1>
</div>
<c:if test="${empty list}">
    <p class="alert alert-warning">
        Hóa Đơn Trống
    </p>
</c:if>
<table class="table table-success table-striped">
    <thead>
    <tr>
        <th scope="col">STT</th>
        <th scope="col">Hình Ảnh</th>
        <th scope="col">Tên Sản Phẩm</th>
        <th scope="col">Kích Thước</th>
        <th scope="col">Màu Sắc</th>
        <th scope="col">Đơn Giá</th>
        <th scope="col">Số Lượng</th>
        <th scope="col">Tổng Tiền</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="orderdetail" varStatus="status">
        <tr>
            <td>#${status.count}</td>
            <td><img height="50px" src="/images/products/${orderdetail.product.img}" alt=""></td>
            <td>${orderdetail.product.ten}</td>
            <td>${orderdetail.product.kichThuoc}</td>
            <td>${orderdetail.product.mauSac}</td>
            <td><fmt:formatNumber value="${orderdetail.donGia}" pattern="#,###"/> VND</td>
            <td>${orderdetail.soLuong}</td>
            <td><span style="color: red"><fmt:formatNumber value="${orderdetail.donGia*orderdetail.soLuong}" pattern="#,###"/> VND</span></td>
        </tr>
    </c:forEach>
    </tbody>
</table>


