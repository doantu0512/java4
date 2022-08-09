
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<div class="d-sm-flex align-items-center justify-content-between mb-4 offset-5">
    <h1 class="h3 mb-0 text-gray-800">Account Management</h1>
</div>
<form class=" row mt-3 ms-0 pe-0" action="store" method="post" enctype="multipart/form-data">
    <div class="mb-3 col-6">
        <label class="form-label fw-bold">Name</label>
        <input type="text" class="form-control" name="hoTen">
    </div>
    <div class="mb-3 col-6">
        <label class="form-label fw-bold">Address</label>
        <input type="text" class="form-control" name="diaChi">
    </div>
    <div class="mb-3 col-6">
        <label class="form-label fw-bold">Email</label>
        <input type="email" class="form-control" name="email">
    </div>
    <div class="mb-3 col-6">
        <label class="form-label fw-bold">Phone</label>
        <input type="tel" class="form-control" name="sdt">
    </div>
    <div class="mb-3 col-6">
        <label class="form-label fw-bold">Password</label>
        <input type="password" class="form-control" name="password">
    </div>
    <div class="mb-3 col-6">
        <label class="form-label fw-bold">Avatar</label>
        <input type="file" class="form-control" name="avatar">
    </div>
    <div class=" p-3 mt-4 col-6">
        <label class="form-label fw-bold pe-4 me-3">Gender</label>
        <input class="form-check-input  " type="radio" value="1" checked name="gioiTinh">
        <label class="form-check-label me-5">Boy</label>
        <input class="form-check-input" type="radio" value="0" name="gioiTinh">
        <label class="form-check-label me-3">Girl</label>
    </div>
    <div class=" p-3 mt-4 col-6">
        <label class="form-label fw-bold pe-4 me-3">Permission</label>
        <input class="form-check-input" type="radio" value="1" checked name="nguoiDung">
        <label class="form-check-label me-5">Admin</label>
        <input class="form-check-input" type="radio" value="0" name="nguoiDung">
        <label class="form-check-label me-3">User</label>
    </div>
    <div class="mt-3">
        <button  class="btn btn-success">ADD</button>
        <button type="reset" class="btn btn-primary">Reset</button>
    </div>
</form>
<br>


