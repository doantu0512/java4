<%--
  Created by IntelliJ IDEA.
  User: thongpro
  Date: 5/26/22
  Time: 6:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<section>
    <div class="container">
        <div class="row">
            <div class="col-sm-3">
                <div class="left-sidebar">
                    <div class="brands_products"><!--brands_products-->
                        <h2>Danh Mục</h2>
                        <div class="brands-name">
                            <c:forEach items="${listCategory}" var="cate">
                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="/show?id=${cate.id}">${cate.ten}</a></li>
                                    <hr>
                                </ul>
                            </c:forEach>
                        </div>
                    </div><!--/brands_products-->
                </div>
            </div>
            <div class="col-sm-9 padding-right">
                <div class="product-details"><!--product-details-->
                    <div class="col-sm-5">
                        <div class="view-product">
                            <img src="images/products/${product.img}" alt=""/>
                        </div>
                    </div>
                    <div class="col-sm-7">
                        <div class="product-information"><!--/product-information-->
                            <h2>${product.ten}</h2>
                            <span>
							<span style="color: red"><fmt:formatNumber value="${product.donGia}" pattern="#,###"/> VND</span>
									<a href="/addtocart?idP=${product.id}" class="btn btn-fefault cart">
										<i class="fa fa-shopping-cart"></i>
										Thêm vào giỏ hàng
									</a>
								</span>
                            <p>Phân Loại : <span style="color: red">${product.category.ten}</span> </p>
                            <p>Size : <span style="color: red">${product.kichThuoc}</span>
                            </p>
                            <p> Color : <span style="color: red;">${product.mauSac}</span></p>
                        </div><!--/product-information-->
                    </div>
                </div><!--/product-details-->


                <div class="recommended_items"><!--recommended_items-->
                    <h2 class="title text-center">Sản Phẩm Khác</h2>

                    <div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="item active">
                            <c:forEach items="${show}" var="pro">
                                <div class="col-sm-4">
                                    <div class="product-image-wrapper">
                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <img  height="250px" src="/images/products/${pro.img}" alt=""/>
                                                <h3 style="color: red"><fmt:formatNumber value="${pro.donGia}" pattern="#,###"/> VND</h3>
                                                <p>${pro.ten}</p>
                                                <a href="/addtocart?idP=${pro.id}" class="btn btn-default add-to-cart"><i
                                                        class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            </div>
                        </div>
                        <a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev">
                            <i class="fa fa-angle-left"></i>
                        </a>
                        <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next">
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </div>
                </div><!--/recommended_items-->

            </div>
        </div>
    </div>
</section>



