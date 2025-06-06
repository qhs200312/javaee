package com.example.servlet;

import com.example.dao.ItemDAO;
import com.example.model.Item;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/items")
public class ItemServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Item> list = new ItemDAO().listAll();
            request.setAttribute("list", list);
            request.getRequestDispatcher("items.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ItemDAO dao = new ItemDAO();
        try {
            String action = request.getParameter("action");
            if ("add".equals(action)) {
                Item item = new Item();
                item.setName(request.getParameter("name"));
                item.setQuantity(Integer.parseInt(request.getParameter("quantity")));
                dao.insert(item);
            } else if ("edit".equals(action)) {
                Item item = new Item();
                item.setId(Integer.parseInt(request.getParameter("id")));
                item.setName(request.getParameter("name"));
                item.setQuantity(Integer.parseInt(request.getParameter("quantity")));
                dao.update(item);
            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                dao.delete(id);
            }
            response.sendRedirect("items");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
