package controller.account;

import DAO.UserDao;
import JPAUtils.EncryptUtil;
import entity.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet({"/login","/logout"})
public class LoginServlet extends HttpServlet {
    private UserDao userDao;

    public LoginServlet() {
        this.userDao = new UserDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String uri = request.getRequestURI();
        if (uri.contains("logout")) {
            this.logout(request, response);
        }
        request.setAttribute("view", "/views/account/info/login.jsp");
        request.getRequestDispatcher("/views/account/account.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String pwd = request.getParameter("password");
        User user = this.userDao.findByEmail(email);
        if (user == null) {
            session.setAttribute("error", "Tên Đăng Nhập Không Tồn Tại");
            response.sendRedirect("/login");
        } else {
            boolean check = EncryptUtil.check(pwd, user.getPassword());
            if (check == true) {
                // Đăng nhập thành công
                if (user.getStatus()==2){
                    session.setAttribute("error", "Tài Khoản Này Đã Bị Khóa");
                    response.sendRedirect("/login");
                }else if (user.getStatus()==0){
                    session.setAttribute("error", "Tài Khoản Này Đã Bị Xóa");
                    response.sendRedirect("/login");
                }else {
                    if (user.getNguoiDung() == true) {
                        response.sendRedirect("/User");
                    } else {
                        response.sendRedirect("/home");
                    }
                }
                session.setAttribute("user", user);
            } else {
                // Đăng nhập thất bại
                session.setAttribute("error", "Mật Khẩu không chính xác ");
                response.sendRedirect("/login");
            }
        }
    }
    protected void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        request.setAttribute("view", "/views/account/info/login.jsp");
        request.getRequestDispatcher("/views/account/account.jsp").forward(request, response);
    }
}