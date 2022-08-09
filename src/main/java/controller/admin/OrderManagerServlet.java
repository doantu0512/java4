package controller.admin;

import DAO.OrderDAO;
import DAO.OrderDetailDAO;
import entity.Order;
import entity.Orderdetail;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet({"/OrderManager","/cancel","/confirm","/showOrder"})
public class OrderManagerServlet extends HttpServlet {
    private OrderDAO orderDAO;
    private OrderDetailDAO orderDetailDAO;

    public OrderManagerServlet() {
        this.orderDAO=new OrderDAO();
        this.orderDetailDAO=new OrderDetailDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Order> orderList=this.orderDAO.all();
        request.setAttribute("order",orderList);
        request.setAttribute("view","/views/admin/order/order.jsp");
        request.getRequestDispatcher("/views/admin/admin.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String uri=request.getRequestURI();
      if (uri.contains("confirm")){
          try {
              this.confirm(request,response);
          } catch (Exception e) {
              e.printStackTrace();
          }
      }else if (uri.contains("cancel")){
          this.cancel(request,response);
      }else if (uri.contains("showOrder")){
          this.show(request,response);
      }
    }
    protected void show(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idOrder= Integer.parseInt(request.getParameter("id"));
        List<Orderdetail> orderdetailList=this.orderDetailDAO.findByIDOrder(idOrder);
        request.setAttribute("list",orderdetailList);
        request.setAttribute("view","/views/admin/order/orderdetail.jsp");
        request.getRequestDispatcher("/views/admin/admin.jsp").forward(request,response);
    }

    protected void confirm(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session=request.getSession();
        int id= Integer.parseInt(request.getParameter("id"));
        Order order= orderDAO.findByID(id);
        order.setStatus(1);
        try {
            this.orderDAO.update(order);
            session.setAttribute("message","Xác Nhận HD"+order.getId()+"Thành Công");
        } catch (Exception e) {
            session.setAttribute("error","Xác Nhận HD"+order.getId()+"Thất Bại");
            e.printStackTrace();
        }
        response.sendRedirect("/OrderManager");
    }
    protected void cancel(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        int id= Integer.parseInt(request.getParameter("id"));
        Order order= orderDAO.findByID(id);
        order.setStatus(2);
        try {
            this.orderDAO.update(order);
            session.setAttribute("message","Hủy HD"+order.getId()+" Thành Công");
        } catch (Exception e) {
            session.setAttribute("error","Hủy HD"+order.getId()+" Thất Bại");
            e.printStackTrace();
        }
        response.sendRedirect("/OrderManager");
    }
}
