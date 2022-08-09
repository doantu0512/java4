package controller.account;

import DAO.UserDao;
import JPAUtils.EncryptUtil;
import entity.User;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.util.List;

@WebServlet("/Register")
public class RegisterServlet extends HttpServlet {
    private UserDao userDao;

    public RegisterServlet() {
        this.userDao = new UserDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("view","/views/account/info/register.jsp");
        request.getRequestDispatcher("/views/account/account.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        User entity = new User();
        String pass1 = request.getParameter("password");
        String pass2 = request.getParameter("password2");
        String email = request.getParameter("email");
            if (pass1.equalsIgnoreCase(pass2)) {
                if (this.userDao.findByEmail(email)==null){
                    try {
                        BeanUtils.populate(entity, request.getParameterMap());
                        String encrypted = EncryptUtil.encrypt(pass1);
                        entity.setPassword(encrypted);
                        entity.setStatus(1);
                        entity.setAvatar("undraw_profile.svg");
                        entity.setNguoiDung(false);
                        this.userDao.create(entity);
                        session.setAttribute("message2", "Đăng Ký Thành Công");
                        response.sendRedirect("/Register");
                    } catch (Exception e) {
                        e.printStackTrace();
                        session.setAttribute("error2", "Đăng Ký Thất Bại");
                        response.sendRedirect("/Register");
                    }
                }else {
                    session.setAttribute("error2", "Email Đã Tồn Tại");
                    response.sendRedirect("/Register");
                }
            } else{
                session.setAttribute("error2", "Mật khẩu không trùng với mật khẩu xác nhận");
                response.sendRedirect("/Register");
            }
        }
    }


