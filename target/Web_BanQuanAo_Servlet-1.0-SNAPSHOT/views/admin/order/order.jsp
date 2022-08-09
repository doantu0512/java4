<%--
  Created by IntelliJ IDEA.
  User: thongpro
  Date: 3/31/22
  Time: 5:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<div class="d-sm-flex align-items-center justify-content-between mb-4 offset-5">
    <h1 class="h3 mb-0 text-gray-800">Order Management</h1>
</div>
<c:if test="${empty order}">
    <p class="alert alert-warning">
        Hóa Đơn Trống
    </p>
</c:if>
<c:if test="${!empty sessionScope.error}">
    <div class="alert alert-danger">
            ${sessionScope.error}
    </div>
    <c:remove var="error" scope="session"/>
</c:if>
<c:if test="${!empty sessionScope.message}">
    <div class="alert alert-success">
            ${sessionScope.message}
    </div>
    <c:remove var="message" scope="session"/>
</c:if>
<table class="table table-success table-striped">
    <thead>
    <tr>
        <th scope="col">STT</th>
        <th scope="col">Mã Đơn Hàng</th>
        <th scope="col">Tên Khách Hàng</th>
        <th scope="col">Số Điện Thoại</th>
        <th scope="col">Email</th>
        <th scope="col">Địa Chỉ</th>
        <th scope="col">Ngày Đặt Hàng</th>
        <th scope="col">Tổng Tiền </th>
        <th scope="col">Trạng Thái</th>
        <th colspan="2"></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${order}" var="order" varStatus="status">
        <tr>
            <td>#${status.count}</td>
            <td>HD${order.id}</td>
            <td>${order.userDatHang.hoTen}</td>
            <td>${order.userDatHang.sdt}</td>
            <td>${order.userDatHang.email}</td>
            <td>${order.userDatHang.diaChi}</td>
          <td> <fmt:formatDate value="${order.dateCreate}" pattern="dd/MM/yyyy"/></td>
            <td><span style="color: red"><fmt:formatNumber value="${order.tongTien}" pattern="#,###"/> VND</span></td>
            <td>
                <c:choose>
                    <c:when test="${order.status==0}">
                        <button data-toggle="modal" data-target="#aa${order.id}" class="btn btn-success">Xác Nhận</button>
                        <button data-toggle="modal" data-target="#cc${order.id}" class="btn btn-danger">Hủy</button>
                    </c:when>
                    <c:when test="${order.status==1}"><p style="color:#0c4128"></p>Đã Xác Nhận</c:when>
                    <c:when test="${order.status==2}"><p style="color: red">Đã Hủy</p></c:when>
                    <c:otherwise>-</c:otherwise>
                </c:choose>
            </td>
            <td>
                <form action="showOrder" method="post">
                    <input type="hidden" value="${order.id}" name="id">
                    <button class="btn btn-warning">Xem Chi Tiết</button>
                </form>
            </td>
                <%--            Modal cancel--%>
            <div id="cc${order.id}" class="modal" tabindex="-1">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3 class="modal-title">Xác nhận</h3>
                            <button type="button" class="btn-close" data-dismiss="modal"
                                    aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <h5>Bạn muốn hủy Hóa Đơn HD${order.id} ?</h5>
                        </div>
                        <div class="modal-footer">
                            <form action="/cancel" method="post">
                                <input type="hidden" value="${order.id}" name="id">
                                <button class="btn btn-success">Xác Nhận</button>
                            </form>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal"
                                    aria-label="Close">Hủy
                            </button>
                        </div>
                    </div>
                </div>
            </div>
<%--            Modal confirm--%>
            <div id="aa${order.id}" class="modal" tabindex="-1">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3 class="modal-title">Xác nhận</h3>
                            <button type="button" class="btn-close" data-dismiss="modal"
                                    aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <h5>Xác Nhận Đơn Hàng HD${order.id} ?</h5>
                        </div>
                        <div class="modal-footer">
                            <form action="/confirm" method="post">
                                <input type="hidden" value="${order.id}" name="id">
                                <button class="btn btn-success">Xác Nhận</button>
                            </form>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal"
                                    aria-label="Close">Hủy
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </tr>
    </c:forEach>
    </tbody>
</table>


