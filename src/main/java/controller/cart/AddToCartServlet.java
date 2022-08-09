package controller.cart;

import DAO.ProductDAO;
import entity.Order;
import entity.Orderdetail;
import entity.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet({"/addtocart", "/up", "/down"})
public class AddToCartServlet extends HttpServlet {
    private ProductDAO productDAO;

    public AddToCartServlet() {
        this.productDAO = new ProductDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.contains("up")) {
            this.up(request, response);
        } else if (uri.contains("addtocart")) {
            this.addtocart(request, response);
        } else if (uri.contains("down")) {
            this.down(request, response);
        }
    }

    protected void up(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int id = Integer.parseInt(request.getParameter("id"));
        Order order = (Order) session.getAttribute("order");
        List<Orderdetail> listOrder = order.getOrderdetails();
        for (Orderdetail item : listOrder) {
            if (item.getProduct().getId() == id) {
                item.setSoLuong(item.getSoLuong() + 1);
            }
        }
        response.sendRedirect("/cart");
    }

    protected void down(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int id = Integer.parseInt(request.getParameter("id"));
        Order order = (Order) session.getAttribute("order");
        List<Orderdetail> listOrder = order.getOrderdetails();
        int test = 0;
        Orderdetail orderdetail = new Orderdetail();
        if (listOrder.size() > 0) {
            for (Orderdetail item : listOrder) {
                if (item.getProduct().getId() == id) {
                    item.setSoLuong(item.getSoLuong() - 1);
                    if (item.getSoLuong() == 0) {
                        orderdetail = item;
                        test++;
                    }
                }
            }
            if (test != 0) {
                listOrder.remove(orderdetail);
                if (listOrder.isEmpty()) {
                    session.removeAttribute("order");
                }
            }
        }
        response.sendRedirect("/cart");
    }

    protected void addtocart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int quantity = 1;
        int idProduct = Integer.parseInt(request.getParameter("idP"));
        Product product = this.productDAO.findByID(idProduct);
        if (product != null) {
            if (request.getParameter("quantity") != null) {
                quantity = Integer.parseInt(request.getParameter("quantity"));
            }
            HttpSession session = request.getSession();
            if (session.getAttribute("order") == null) {
                Order order = new Order();
                Orderdetail orderdetail = new Orderdetail();
                orderdetail.setProduct(product);
                orderdetail.setSoLuong(quantity);
                orderdetail.setDonGia(product.getDonGia());
                List<Orderdetail> list = new ArrayList<>();
                list.add(orderdetail);
                order.setOrderdetails(list);
                session.setAttribute("order", order);

            } else {
                Order order = (Order) session.getAttribute("order");
                List<Orderdetail> listOrder = order.getOrderdetails();
                boolean check = false;
                for (Orderdetail item : listOrder) {
                    if (item.getProduct().getId() == product.getId()) {
                        item.setSoLuong(item.getSoLuong() + quantity);
                        check = true;
                    }
                }
                if (check == false) {
                    Orderdetail orderdetail = new Orderdetail();
                    orderdetail.setProduct(product);
                    orderdetail.setSoLuong(quantity);
                    orderdetail.setDonGia(product.getDonGia());
                    listOrder.add(orderdetail);
                }
                session.setAttribute("order", order);
            }
            response.sendRedirect("/cart");
        } else {
            response.sendRedirect("/cart");
        }
    }
}
