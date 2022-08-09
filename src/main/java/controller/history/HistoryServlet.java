package controller.history;

import DAO.OrderDAO;
import DAO.OrderDetailDAO;
import entity.Order;
import entity.Orderdetail;
import entity.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/history")
public class HistoryServlet extends HttpServlet {
    private OrderDAO orderDAO;
    private OrderDetailDAO orderDetailDAO;

    public HistoryServlet() {
        this.orderDAO=new OrderDAO();
        this.orderDetailDAO=new OrderDetailDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        HttpSession session=request.getSession();
        User user= (User) session.getAttribute("user");
        if (user!=null){
            List<Order> orderList=this.orderDAO.findByIDUser(user.getId());
            request.setAttribute("orderList",orderList);
        }else {
            response.sendRedirect("/home");
        }
        request.setAttribute("view","/views/history/history.jsp");
        request.getRequestDispatcher("/views/home/layout.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        int id= Integer.parseInt(request.getParameter("id"));
        List<Orderdetail> orderdetailList=this.orderDetailDAO.findByIDOrder(id);
        request.setAttribute("list",orderdetailList);
        request.setAttribute("view","/views/history/historydetail.jsp");
        request.getRequestDispatcher("/views/home/layout.jsp").forward(request,response);
    }
}
