<%@ page import="vn.edu.hcmuaf.fit.project.DAO.model.ShoppingCart" %>
<%@ page import="vn.edu.hcmuaf.fit.project.DAO.model.CartItem" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- icon -->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- CSS -->
    <link rel="stylesheet" href="./JSPWeb/CSS/CSS_Shopping_Cart.css">
    <title>Shopping-Cart</title>
</head>

<body>
<header class="header_home_menu">
    <img src="/JSPWeb/IMG/logo.jpg" alt="" width="50">
    <ul class="menu">
        <li>
            <a href="./HomePage.jsp">
                <span class="text_header"> TRANG CHỦ</span>
            </a>
        </li>
        <li>
            <a href="./Product.jsp">
                <span class="text_header"> SẢN PHẨM</span>
            </a>
        </li>
        <li>
            <a href="./ShowRoom.jsp">
                <span class="text_header"> SHOWROOM</span>
            </a>
        </li>
        <li>
            <a href="#">
                <span class="text_header"> LIÊN HỆ </span>
            </a>
        </li>
    </ul>

    <ul class="social_icon">
        <li>
            <i class="fa-solid fa-user" style="color: rgb(255, 255, 255);"></i>
            <ul class="dropdown">
                <li><i class="bi bi-person-circle"></i> <span>Ten</span></li>
                <li>
                    <h5>SĐT: +84 xxx.xxx.xxx</h5>
                </li>
                <li><i class="bi bi-box-arrow-right"></i> <span><a href="./Login.jsp">Đăng Xuất</a></span></li>
            </ul>
        </li>
        <li>
            <i class="fa-solid fa-heart" style="color: #ffffff;"></i>
        </li>
        <li>
            <a href="#">
                <i class="fas fa-shopping-cart"></i>
            </a>
        </li>
    </ul>
</header>
<%
    ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("cart");
    if(shoppingCart==null){
        response.sendRedirect("ProductController");
    }
    assert shoppingCart != null;
    List<CartItem> cartItems = shoppingCart.getCartItemList();
    NumberFormat numberFormat = NumberFormat.getCurrencyInstance();
    String e = request.getAttribute("error")==null?"":(String) request.getAttribute("error");


%>
<div class="layer2">
    <h1>Giỏ hàng của bạn</h1>
    <h1 style="font-weight: 1000;">______</h1>
</div>

<div class="Contain_shopping_Cart" style="width: 100%;">
    <div class="Left" style="width: 50%;">
        <div class="text_button">
            <div class="text">
                <h2>Giỏ hàng của bạn</h2>
            </div>
            <div id="cart-actions" style="margin-bottom: 10px;"></div>
        </div>
        <div class="container">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Tên</th>
                    <th scope="col">Gia</th>
                    <th scope="col">Hình ảnh</th>
                    <th scope="col">Số lượng</th>
                    <th scope="col">Thành tiền</th>
                    <th scope="col">Chức năng</th>
                </tr>
                </thead>
                <tbody>
                <%
                    int count = 0;
                    for (CartItem cartItem : cartItems) {
                %>
                <tr>
                    <td><%=count++%></td>
                    <td><%=cartItem.getProductID().getName()%></td>
                    <td><%=cartItem.getProductID().getPrice()%></td>
                    <td><img src="<%=cartItem.getProductID().getImage()%>" alt=""></td>
                    <td><%=cartItem.getQuanlity()%></td>
                    <td><%=numberFormat.format(cartItem.getTotalPrice())%></td>
                    <td>
                        <form action="ShopingCartCL" method="get">
                            <input type="number" name="quanlity" value="<%=cartItem.getQuanlity()%>">
                            <input type="hidden" name="action" value="put">
                            <input type="hidden" name="id" value="<%=cartItem.getProductID().getId()%>">
                            <button type="submit" class="btn btn-success btn-sm">Cập nhập</button>
                        </form>

                        <form action="ShopingCartCL"  method="get" >
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="id" value="<%=cartItem.getProductID().getId()%>">
                            <button type="submit" class="btn btn-danger btn-sm">Xoá</button>
                        </form>

                    </td>
                </tr>

                <% }%>
                </tbody>
            </table>
            <h3>Tổng giá của giỏ hàng là: <%=shoppingCart.getTotalPrice()%></h3>
        </div>
    </div>

    <div class="right" style="width: 50%;">
        <div class="Infor_shopping">
            <h2>Thông tin đơn hàng</h2>
            <div class="total" style="display: flex;">
                <h4>Tổng Tiền:<%=shoppingCart.getTotalPrice()%></h4>
                <p style="color: orange; font-weight: 800;">0<span style="text-decoration:underline;">đ</span></p>
            </div>
            <button type="submit" class="btn">Thanh toán</button>
        </div>
        <div class="Infor_text">
            <p>
                    <span><i class='bx bx-check'></i> Không rủi ro. Đặt hàng trước, thanh toán
                        sau tại nhà. Miễn phí giao hàng
                        & lắp đặt</span> tại tất cả quận huyện thuộc TP.HCM, Hà Nội, Khu đô thị Ecopark, Biên Hòa và một
                số khu vực thuộc Bình Dương.
            </p>
            <p>
                <span><i class='bx bx-check'></i></span> Đơn hàng của quý khách sẽ được <span>giao hàng trong vòng 3
                        ngày</span>, vui lòng đợi nhân viên tư vấn xác nhận lịch giao hàng trước khi thực hiện chuyển khoản
                đơn hàng.
            </p>
            <p>
                <span><i class='bx bx-check'></i> Miễn phí 1 đổi 1 - Bảo hành 2 năm - Bảo trì trọn đời.</span>
            </p>
            <p>
                <span><i class='bx bx-check'></i></span> Tất cả sản phẩm được thiết kế bởi các chuyên gia thiết kế nội thất.
            </p>
            <p>
                <span><i class='bx bx-check'> Chất lượng Quốc Tế đảm bảo theo tiêu chuẩn</i></span> cho người dùng tại Việt Nam
            </p>

        </div>
    </div>
</div>

<div class="layer4">
    <div class="cerfiticate">
        <i class="fa-solid fa-award fa-2xl" style="color: #c9c6c6; font-size: 100px;"></i>
        <h5>
            <span class="span_text" style="color: #9b2805;">BẢO HÀNH</span> <br>Tới 2 Năm
        </h5>
    </div>

    <div class="freeship">
        <i class="fa-solid fa-truck-fast fa-2xl" style="color: #c9c6c6; font-size: 100px;"></i>
        <h5>
            <span class="span_text"  style="color: #9b2805;">FREE SHIP</span> <br> Order Over 1.500.000 <span class="vnd">đ</span>
        </h5>
    </div>

    <div class="support">
        <i class="fa-solid fa-headset fa-2xl" style="color: #c9c6c6; font-size: 100px;"></i>
        <h5>
            <span class="span_text"  style="color: #9b2805;">24 / 7 Support</span> <br>Sẫn Sàng Hỗ Trợ
        </h5>
    </div>
</div>

<footer id="footer_pages" class="footer" style="width: 100%; color: black;">
    <div class="showroom_footer">
        <h2>SHOWROOM</h2>
        <ul>
            <li>Trụ sở & Showroom 1: Tòa nhà Kenli, Số 2 Dịch Vọng Hậu, Q. Cầu Giấy</li>
            <li>Showroom 2: Số 4 Dịch Vọng Hậu, Q. Cầu Giấy</li>
            <li>Trụ sở & Showroom: 69 - 71 Nguyễn Cơ Thạch, Khu đô thị Sala, An Lợi Đông, Quận 2</li>
            <li>Email: xxxxxxx@gmail.com</li>
            <li>Thời gian làm việc : T2 - CN 8h30 - 22h</li>
        </ul>
    </div>

    <div class="suport_footter">
        <h2>HỖ TRỢ KHÁCH HÀNG</h2>
        <ul>
            <li>Hướng Dẫn Mua Hàng</li>
            <li>Chính Sách Bảo Mật</li>
            <li>Chính Sách Đổi Trả Hàng</li>
            <li>Phương Thức Thanh Toán</li>
            <li>Vận Chuyển Lắp Đặt</li>
            <li>Dịch Vụ Bảo Hành</li>
        </ul>
    </div>

    <div class="follow_footer">
        <h2>LIÊN HỆ - THEO DÕI</h2>
        <div class="icon_footer">
            <i class="fa-brands fa-facebook" style="color: #005eff;  font-size: 30px;"></i>
            <i class="fa-brands fa-twitter" style="color: #005eff; font-size: 30px"></i>
            <i class="fa-brands fa-instagram" style="color: #fb1818; font-size: 30px"></i>
        </div>
    </div>
</footer>

<script src="./JSPWeb/js/scoller_header.js"></script>
<script src="./JSPWeb/js/deleteProduct.js"></script>
</body>

</html>
