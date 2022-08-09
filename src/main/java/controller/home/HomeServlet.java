package controller.home;

import DAO.CategoryDAO;
import DAO.ProductDAO;
import entity.Category;
import entity.Product;
import entity.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet({"/home", "/show", "/detail","/search"})
public class HomeServlet extends HttpServlet {
    private CategoryDAO categoryDAO;
    private ProductDAO productDAO;

    public HomeServlet() {
        this.categoryDAO = new CategoryDAO();
        this.productDAO = new ProductDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.contains("home")) {
            this.home(request, response);
        } else if (uri.contains("show")) {
            this.show(request, response);
        }else if (uri.contains("detail")) {
            this.detail(request, response);
        }else if (uri.contains("search")) {
            this.search(request, response);
        }
    }

    private void show(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Category> listCate = this.categoryDAO.all();
        request.setAttribute("listCate", listCate);
        int id = Integer.parseInt(request.getParameter("id"));
        List<Product> list = this.productDAO.findByIDCategory(id);
        request.setAttribute("show", list);
        request.setAttribute("sl", list.size());
        request.setAttribute("view", "/views/home/home.jsp");
        request.getRequestDispatcher("views/home/layout.jsp").forward(request, response);
    }

    protected void home(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Category> listCate = this.categoryDAO.all();
        request.setAttribute("listCate", listCate);
        List<Product> listpro = this.productDAO.getAll();
        request.setAttribute("show", listpro);
        request.setAttribute("sl", listpro.size());
        request.setAttribute("view", "/views/home/home.jsp");
        request.getRequestDispatcher("views/home/layout.jsp").forward(request, response);
    }
    protected void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name=request.getParameter("search");
        List<Product> product=this.productDAO.findByName(name);
        List<Category> listCate = this.categoryDAO.all();
        request.setAttribute("listCate", listCate);
        request.setAttribute("show", product);
        request.setAttribute("sl", product.size());
        request.setAttribute("view", "/views/home/home.jsp");
        request.getRequestDispatcher("views/home/layout.jsp").forward(request, response);
    }


    protected void detail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Category> listCategory = this.categoryDAO.all();
        request.setAttribute("listCategory", listCategory);
        List<Product> listpro = this.productDAO.getAll();
        request.setAttribute("show", listpro);
        String s = request.getParameter("id");
        int id = Integer.parseInt(s);
        Product entity = this.productDAO.findByID(id);
        request.setAttribute("product", entity);
        request.setAttribute("view", "/views/home/detail.jsp");
        request.getRequestDispatcher("views/home/layout.jsp").forward(request, response);
    }

}
