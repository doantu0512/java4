<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<h2>
    <fmt></fmt>
</h2>
<c:if test="${empty ds}">
    <p class="alert alert-warning">
        Vui Lòng Thêm Mới Dữ Liệu
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
        <th scope="col">Avatar</th>
        <th scope="col">Name</th>
        <th scope="col">Address</th>
        <th scope="col">Phone</th>
        <th scope="col">Email</th>
        <th scope="col">Gender</th>
        <th scope="col">Permission</th>
        <th colspan="3"></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${ds}" var="user">
        <tr>
            <td><img height="50px" src="/images/avatar/${user.avatar}"></td>
            <td>${user.hoTen}</td>
            <td>${user.diaChi}</td>
            <td>${user.sdt}</td>
            <td>${user.email}</td>
            <td>
                <c:choose>
                    <c:when test="${user.gioiTinh==1}">Boy</c:when>
                    <c:when test="${user.gioiTinh==0}">Girl</c:when>
                    <c:otherwise>-</c:otherwise>
                </c:choose>
            </td>
            <td>${user.nguoiDung==true ? "Admin" : "User"}</td>
            <td>
                <form action="edit" method="post">
                    <input type="hidden" value="${user.id}" name="id">
                    <button class="btn btn-primary">Update</button>
                </form>
            </td>
            <td>
                <button class="btn btn-danger" data-toggle="modal" data-target="#a${user.id}">Delete</button>
            </td>
            <c:if test="${user.status==1 }">
                <td>
                    <button class="btn btn-secondary" data-toggle="modal" data-target="#aaa${user.id}">Khóa</button>
                </td>
            </c:if>
            <c:if test="${user.status==2 }">
                <td>
                    <button class="btn btn-warning" data-toggle="modal" data-target="#bbb${user.id}">Mở Khóa</button>
                </td>
            </c:if>
            <div id="a${user.id}" class="modal" tabindex="-1">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3 class="modal-title">Xác nhận</h3>
                            <button type="button" class="btn-close" data-dismiss="modal"
                                    aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <h5>Bạn muốn xóa người dùng ${user.hoTen} ?</h5>
                        </div>
                        <div class="modal-footer">
                            <form action="delete" method="post">
                                <input type="hidden" value="${user.id}" name="id">
                                <button class="btn btn-danger">Xóa</button>
                            </form>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal"
                                    aria-label="Close">Hủy
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <div id="aaa${user.id}" class="modal" tabindex="-1">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3 class="modal-title">Xác nhận</h3>
                            <button type="button" class="btn-close" data-dismiss="modal"
                                    aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <h5>Bạn muốn khóa người dùng ${user.hoTen} ?</h5>
                        </div>
                        <div class="modal-footer">
                            <form action="/khoa" method="post">
                                <input type="hidden" value="${user.id}" name="id">
                                <button class="btn btn-primary">Khóa</button>
                            </form>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal"
                                    aria-label="Close">Hủy
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <div id="bbb${user.id}" class="modal" tabindex="-1">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3 class="modal-title">Xác nhận</h3>
                            <button type="button" class="btn-close" data-dismiss="modal"
                                    aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <h5>Bạn muốn mở khóa người dùng ${user.hoTen} ?</h5>
                        </div>
                        <div class="modal-footer">
                            <form action="/unlock" method="post">
                                <input type="hidden" value="${user.id}" name="id">
                                <button class="btn btn-primary">Mở Khóa</button>
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
