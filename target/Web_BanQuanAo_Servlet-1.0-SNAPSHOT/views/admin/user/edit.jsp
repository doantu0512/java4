<%--
  Created by IntelliJ IDEA.
  User: thongpro
  Date: 3/31/22
  Time: 9:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<div class="d-sm-flex align-items-center justify-content-between mb-4 offset-5">
    <h1 class="h3 mb-0 text-gray-800">Account Management</h1>
</div>
<form class=" row mt-3 ms-0 pe-0" action="update?id=${user.id}" method="post" enctype="multipart/form-data">
<%--    <div class="mb-3 col-6">--%>
<%--        <label class="form-label fw-bold">Name</label>--%>
<%--        <input type="text" class="form-control" name="hoTen" value="${user.avatar}">--%>
<%--    </div>--%>
    <div class="mb-3 col-6">
        <label class="form-label fw-bold">Name</label>
        <input type="text" class="form-control" name="hoTen" value="${user.hoTen}">
    </div>
    <div class="mb-3 col-6">
        <label class="form-label fw-bold">Address</label>
        <input type="text" class="form-control" name="diaChi" value="${user.diaChi}">
    </div>
    <div class="mb-3 col-6">
        <label class="form-label fw-bold">Email</label>
        <input type="email" class="form-control" name="email" value="${user.email}">
    </div>
    <div class="mb-3 col-6">
        <label class="form-label fw-bold">Phone</label>
        <input type="tel" class="form-control" name="sdt" value="${user.sdt}">
    </div>
    <div class="mb-3 col-6">
        <label class="form-label fw-bold">Avatar</label>
        <input type="file" class="form-control" name="avatar">
    </div>
    <div class=" p-3 mt-4 col-6">
        <label class="form-label fw-bold pe-4">Gender</label>
        <input class="form-check-input" type="radio" value="1" ${user.gioiTinh==1 ? "checked" : ""}  name="gioiTinh">
        <label class="form-check-label me-5">Nam</label>
        <input class="form-check-input" type="radio" value="0" ${user.gioiTinh==0 ? "checked" : ""} name="gioiTinh">
        <label class="form-check-label me-3">Nữ</label>
    </div>
    <div class=" p-3 mt-4 col-6">
        <label class="form-label fw-bold pe-4">Permission</label>
        <input class="form-check-input" type="radio" value="true" ${user.nguoiDung==true ? "checked" : ""}  name="nguoiDung">
        <label class="form-check-label me-5">Admin</label>
        <input class="form-check-input" type="radio" value="false" ${user.nguoiDung==false ? "checked" : ""} name="nguoiDung">
        <label class="form-check-label me-3">User̃</label>
    </div>
    <div class="mt-3">
        <button  class="btn btn-success">Update</button>
        <button type="reset" class="btn btn-primary">Làm mới</button>
    </div>
</form>
<br>

