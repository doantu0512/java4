package controller.cart;

import entity.Order;
import entity.Orderdetail;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/removetocart")
public class RemoveToCartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int id = Integer.parseInt(request.getParameter("idP"));
        HttpSession session = request.getSession();
        Order order= (Order) session.getAttribute("order");
        if (order!=null){
            List<Orderdetail> listOrder=order.getOrderdetails();
            for (Orderdetail item:listOrder) {
                if (item.getProduct().getId()==id){
                listOrder.remove(item);
                break;
                }
            }
            if (listOrder.isEmpty()){
                session.removeAttribute("order");
            }
            session.setAttribute("order",order);
            response.sendRedirect("/cart");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
