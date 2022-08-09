<%--
  Created by IntelliJ IDEA.
  User: thongpro
  Date: 3/31/22
  Time: 9:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<div class="d-sm-flex align-items-center justify-content-between mb-4 offset-5">
    <h1 class="h3 mb-0 text-gray-800">Product Management</h1>
</div>
<form class=" row mt-3 ms-0 pe-0" action="storeProduct" method="post" enctype="multipart/form-data">
    <div class="mb-3 col-6">
        <label class="form-label fw-bold">Category</label>
        <select class="form-select" name="category_id">
            <c:forEach items="${ dsCategory }" var="category">
                <option  value="${ category.id }">
                        ${ category.ten }
                </option>
            </c:forEach>
        </select>
    </div>

    <div class="mb-3 col-6">
        <label class="form-label fw-bold">ProductName</label>
        <input type="text" class="form-control" name="ten">
    </div>
    <div class="mb-3 col-6">
        <label class="form-label fw-bold">Price</label>
        <input type="text" min="0" class="form-control" name="donGia">
    </div>
    <div class="mb-3 col-6">
        <label class="form-label fw-bold">Color</label>
        <input type="text" class="form-control" name="mauSac">
    </div>
    <div class="mb-3 col-6">
        <label class="form-label fw-bold">Size</label>
        <input type="text" class="form-control" name="kichThuoc">
    </div>
    <div class="mb-3 col-6">
        <label class="form-label fw-bold">Image</label>
        <input type="file" class="form-control" name="img">
    </div>
    <div class="mt-3">
        <button  class="btn btn-success">ADD</button>
        <button type="reset" class="btn btn-primary">Reset</button>
    </div>
</form>
<br>


