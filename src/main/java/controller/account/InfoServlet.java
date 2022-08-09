package controller.account;

import DAO.UserDao;
import entity.User;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/info")
public class InfoServlet extends HttpServlet {
    private UserDao dao;

    public InfoServlet() {
        this.dao=new UserDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("view","/views/account/info/info.jsp");
        request.getRequestDispatcher("/views/account/account.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        String s = request.getParameter("id");
        try {
            int id = Integer.parseInt(s);
            User before = this.dao.findByID(id);
            request.setAttribute("user",before);
            User entity = new User();
            BeanUtils.populate(entity, request.getParameterMap());
            entity.setPassword(before.getPassword());
            entity.setStatus(before.getStatus());
            this.dao.update(entity);
            session.setAttribute("messageInfo","Cập Nhật Thành Công");
            response.sendRedirect("/info");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("errorInfo","Cập Nhật Thất Bại");
            response.sendRedirect("/info");
        }
    }
}
