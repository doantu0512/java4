package controller.cart;

import DAO.OrderDAO;
import DAO.OrderDetailDAO;
import DAO.UserDao;
import JPAUtils.EncryptUtil;
import entity.Order;
import entity.Orderdetail;
import entity.User;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.List;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {
    private OrderDAO orderDAO;
    private OrderDetailDAO orderDetailDAO;
    private UserDao userDao;

    public OrderServlet() {
        this.orderDAO = new OrderDAO();
        this.orderDetailDAO = new OrderDetailDAO();
        this.userDao = new UserDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        Order orderSession = (Order) session.getAttribute("order");
        if (orderSession != null) {
            User user = (User) session.getAttribute("user");
            List<Orderdetail> listOrder = orderSession.getOrderdetails();
            Order order = new Order();
            order.setUserDatHang(user);
            order.setOrderdetails(listOrder);
            order.setDateCreate(new Date());
            order.setStatus(0);
            double tong = 0;
            for (Orderdetail item : listOrder) {
                tong += item.getDonGia() * item.getSoLuong();
            }
            order.setTongTien(tong);
            try {
                this.orderDAO.create(order);
                for (Orderdetail item : listOrder) {
                    Orderdetail orderdetail = new Orderdetail();
                    orderdetail.setOrder(order);
                    orderdetail.setProduct(item.getProduct());
                    orderdetail.setSoLuong(item.getSoLuong());
                    orderdetail.setDonGia(item.getDonGia());
                    this.orderDetailDAO.create(orderdetail);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            session.removeAttribute("order");
        } else {
            response.sendRedirect("/home");
        }
        response.sendRedirect("/history");
    }
}
