
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<c:if test="${empty list}">
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
        <th scope="col">Image</th>
        <th scope="col">Category</th>
        <th scope="col">ProductName</th>
        <th scope="col">Price</th>
        <th scope="col">Color</th>
        <th scope="col">Size</th>
        <th colspan="3"></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="product">
        <tr>
            <td><img height="50px" src="/images/products/${product.img}" alt=""></td>
            <td>${product.category.ten}</td>
            <td>${product.ten}</td>
            <td><fmt:formatNumber value="${product.donGia}" pattern="#,###"/> VND</td>
            <td>${product.mauSac}</td>
            <td>${product.kichThuoc}</td>
            <td>
                <form action="/editProduct" method="post">
                    <input type="hidden" value="${product.id}" name="id">
                    <button class="btn btn-primary">Update</button>
                </form>
            </td>
            <td>
                <button class="btn btn-danger" data-toggle="modal" data-target="#c${product.id}">Delete</button>
            </td>
            <c:if test="${product.status==1 }">
                <td>
                    <button class="btn btn-secondary" data-toggle="modal" data-target="#ccc${product.id}">Ẩn</button>
                </td>
            </c:if>
            <c:if test="${product.status==2 }">
                <td>
                    <button class="btn btn-warning" data-toggle="modal" data-target="#ddd${product.id}">Mở </button>
                </td>
            </c:if>
            <div id="c${product.id}" class="modal" tabindex="-1">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3 class="modal-title">Xác nhận</h3>
                            <button type="button" class="btn-close" data-dismiss="modal"
                                    aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <h5>Bạn muốn xóa sản phẩm ${product.ten} ?</h5>
                        </div>
                        <div class="modal-footer">
                            <form action="/deleteProduct" method="post">
                                <input type="hidden" value="${product.id}" name="id">
                                <button class="btn btn-danger">Delete</button>
                            </form>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal"
                                    aria-label="Close">Hủy
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <div id="ccc${product.id}" class="modal" tabindex="-1">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3 class="modal-title">Xác nhận</h3>
                            <button type="button" class="btn-close" data-dismiss="modal"
                                    aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <h5>Bạn muốn ẩn  ${product.ten} ?</h5>
                        </div>
                        <div class="modal-footer">
                            <form action="/Hidden" method="post">
                                <input type="hidden" value="${product.id}" name="id">
                                <button class="btn btn-primary">Ẩn</button>
                            </form>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal"
                                    aria-label="Close">Hủy
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <div id="ddd${product.id}" class="modal" tabindex="-1">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3 class="modal-title">Xác nhận</h3>
                            <button type="button" class="btn-close" data-dismiss="modal"
                                    aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <h5>Bạn muốn mở ${product.ten} ?</h5>
                        </div>
                        <div class="modal-footer">
                            <form action="/Open" method="post">
                                <input type="hidden" value="${product.id}" name="id">
                                <button class="btn btn-primary">Mở</button>
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


