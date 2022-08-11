package controller.admin;

import DAO.UserDao;
import JPAUtils.EncryptUtil;
import JPAUtils.FileUtil;
import entity.User;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

@MultipartConfig
@WebServlet({"/store", "/edit", "/update", "/delete", "/User", "/khoa", "/unlock"})
public class UserServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(String.valueOf(UserServlet.class));
    private UserDao dao;
    public UserServlet() {
        this.dao = new UserDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String uri = request.getRequestURI();
        if (uri.contains("User")) {
            this.create(request, response);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String uri = request.getRequestURI();
        if (uri.contains("store")) {
            this.store(request, response);
        } else if (uri.contains("update")) {
            this.update(request, response);
        } else if (uri.contains("edit")) {
            this.edit(request, response);
        } else if (uri.contains("delete")) {
            this.delete(request, response);
        } else if (uri.contains("khoa")) {
            this.Lock(request, response);
        } else if (uri.contains("unlock")) {
            this.UnLock(request, response);
        }
    }

    protected void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> list = this.dao.all();
        request.setAttribute("ds", list);
        request.setAttribute("view", "/views/admin/user/create.jsp");
        request.setAttribute("view1", "/views/admin/user/table.jsp");
        request.getRequestDispatcher("views/admin/admin.jsp").forward(request, response);
    }


    protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String s = request.getParameter("id");
        try {
            int id = Integer.parseInt(s);
            User before = this.dao.findByID(id);
            BeanUtils.populate(before, request.getParameterMap());
            File file = FileUtil.saveFileUpload(request.getServletContext().getRealPath("/images/avatar"), request.getPart("avatar"));
            if (file.getName().equals("/images/avatar")) {
                before.setAvatar(before.getAvatar());
            } else {
                before.setAvatar(file.getName());
            }
            this.dao.update(before);
            logger.info("Cập Nhật User");
            session.setAttribute("message", "Cập Nhật Thành Công");
            response.sendRedirect("/User");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Cập Nhật Thất Bại");
            response.sendRedirect("/User");
        }
    }

    protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String s = request.getParameter("id");
        try {
            int id = Integer.parseInt(s);
            User entity = this.dao.findByID(id);
            if (entity.getId() == user.getId()) {
                session.setAttribute("message", "Bạn Không Thể Xóa Chính Mình");
                response.sendRedirect("/User");
                return;
            } else {
                BeanUtils.populate(entity, request.getParameterMap());
                entity.setStatus(0);
                this.dao.update(entity);
                logger.info("Xóa User");
                session.setAttribute("message", "Xóa Thành Công");
                response.sendRedirect("/User");
            }
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Xóa Thất Bại");
            response.sendRedirect("/User");
        }
    }

    protected void store(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User entity = new User();
        List<User> list = new ArrayList<>();
        try {
            BeanUtils.populate(entity, request.getParameterMap());
            File file = FileUtil.saveFileUpload(request.getServletContext().getRealPath("/images/avatar"), request.getPart("avatar"));
            if (file.getName().equals("/images/avatar")) {
                entity.setAvatar("undraw_profile.svg");
            } else {
                entity.setAvatar(file.getName());
            }
            String encrypted = EncryptUtil.encrypt(request.getParameter("password"));
            entity.setStatus(1);
            entity.setPassword(encrypted);
            this.dao.create(entity);
            logger.info("Thêm Mới User");
            session.setAttribute("message", "Thêm Mới Thành Công");
            list.add(entity);
            request.setAttribute("ds", list);
            List<User> all = this.dao.all();
            request.setAttribute("ds", all);
            response.sendRedirect("/User");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Thêm Mới Thất Bại");
        }

    }

    protected void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String s = request.getParameter("id");
        int id = Integer.parseInt(s);
        User entity = this.dao.findByID(id);
        request.setAttribute("user", entity);
        List<User> list = this.dao.all();
        request.setAttribute("ds", list);
        request.setAttribute("view", "/views/admin/user/edit.jsp");
        request.setAttribute("view1", "/views/admin/user/table.jsp");
        request.getRequestDispatcher("views/admin/admin.jsp").forward(request, response);

    }

    protected void Lock(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String s = request.getParameter("id");
        try {
            int id = Integer.parseInt(s);
            User entity = this.dao.findByID(id);
            if (entity.getId() == user.getId()) {
                session.setAttribute("error", "Bạn Không Thể Khóa Chính Mình");
                response.sendRedirect("/User");
                return;
            }else {
            entity.setStatus(2);
            this.dao.update(entity);
            session.setAttribute("error", "Khóa Tài Khoản Thành Công");
            response.sendRedirect("/User");
            }
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Khóa Tài Khoản Thất Bại");
            response.sendRedirect("/User");
        }
    }

    protected void UnLock(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String s = request.getParameter("id");
        try {
            int id = Integer.parseInt(s);
            User entity = this.dao.findByID(id);
            entity.setStatus(1);
            this.dao.update(entity);
            session.setAttribute("message", "Mở Khóa Tài Khoản Thành Công");
            response.sendRedirect("/User");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Mở Khóa Tài Khoản Thất Bại");
            response.sendRedirect("/User");
        }
    }
}
