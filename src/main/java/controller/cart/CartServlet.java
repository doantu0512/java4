package controller.cart;

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
import java.util.List;

@WebServlet({"/cart", "/storeUserCart"})
public class CartServlet extends HttpServlet {
    private UserDao userDao;
    private Boolean check;

    public CartServlet() {
        this.userDao = new UserDao();
        this.check =false;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        double tong = 0;
        int soLuong = 0;
        User user = (User) session.getAttribute("user");
        if (user!=null){
            check=true;
            request.setAttribute("userDH",user);
        }else {
            check=false;
        }
        request.setAttribute("check",check);
        Order order = (Order) session.getAttribute("order");
        if (order == null) {
            tong = 0;
            soLuong = 0;
        } else {
            List<Orderdetail> listOrder = order.getOrderdetails();
            for (Orderdetail item : listOrder) {
                tong += item.getDonGia() * item.getSoLuong();
                soLuong += item.getSoLuong();
            }
        }
        request.setAttribute("tong", tong);
        session.setAttribute("soLuong", soLuong);
        request.setAttribute("view", "/views/cart/cart.jsp");
        request.getRequestDispatcher("views/home/layout.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String uri = request.getRequestURI();
        if (uri.contains("storeUserCart")) {
            this.storeUserCart(request, response);
        }
    }

    protected void storeUserCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            try {
                String email = request.getParameter("email");
                String pass1 = request.getParameter("password");
                String pass2 = request.getParameter("password2");
                User entity = new User();
                if (pass1.equals(pass2)) {
                    if (this.userDao.findByEmail(email) == null) {
                        BeanUtils.populate(entity, request.getParameterMap());
                        String encrypted = EncryptUtil.encrypt(pass1);
                        entity.setPassword(encrypted);
                        entity.setStatus(1);
                        entity.setGioiTinh(1);
                        entity.setAvatar("undraw_profile.svg");
                        entity.setNguoiDung(false);
                        this.userDao.create(entity);
                        session.setAttribute("user", entity);
                    } else {
                        session.setAttribute("error", "Email Đã Tồn Tại");
                        response.sendRedirect("/cart");
                        return;
                    }
                } else {
                    session.setAttribute("error", "Mật khẩu không trùng với mật khẩu xác nhận");
                    response.sendRedirect("/cart");
                    return;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            try {
                BeanUtils.populate(user, request.getParameterMap());
                this.userDao.update(user);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        response.sendRedirect("/order");
    }
}