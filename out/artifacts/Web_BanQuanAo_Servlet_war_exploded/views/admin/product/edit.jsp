
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<div class="d-sm-flex align-items-center justify-content-between mb-4 offset-5">
    <h1 class="h3 mb-0 text-gray-800">Product Management</h1>
</div>
<form class=" row mt-3 ms-0 pe-0" action="updateProduct?id=${product.id}" method="post" enctype="multipart/form-data">
    <div class="mb-3 col-6">
        <label class="form-label fw-bold">Category</label>
        <select  class="form-select" name="category_id">
            <c:forEach items="${ dsCategory }" var="category">
                <option ${product.category.id==category.id ? "selected":""} value="${category.id}">
                        ${category.ten}
                </option>
            </c:forEach>
        </select>
    </div>

    <div class="mb-3 col-6">
        <label class="form-label fw-bold">ProductName</label>
        <input type="text" class="form-control" name="ten" value="${product.ten}">
    </div>
    <div class="mb-3 col-6">
        <label class="form-label fw-bold">Price</label>
        <input type="text" class="form-control" name="donGia" value="${product.donGia}">
    </div>
    <div class="mb-3 col-6">
        <label class="form-label fw-bold">Color</label>
        <input type="text" class="form-control" name="mauSac" value="${product.mauSac}">
    </div>
    <div class="mb-3 col-6">
        <label class="form-label fw-bold">Size</label>
        <input type="text" class="form-control" name="kichThuoc" value="${product.kichThuoc}">
    </div>
    <div class="mb-3 col-6">
        <label class="form-label fw-bold">Image</label>
        <input type="file" class="form-control" name="img" value="${product.img}">
    </div>
    <div class="mt-3">
        <button class="btn btn-success">Update</button>
        <button type="reset" class="btn btn-primary">Reset</button>
    </div>
</form>
<br>

