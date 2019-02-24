package beyondwsq.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beyondwsq.domain.Category;
import beyondwsq.domain.Product;
import beyondwsq.service.AdminProductService;

public class AdminUpdateProductUIServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//获得要查询product的那个pid
		String pid = request.getParameter("pid");
	
		//传递pid，查询商品信息
		AdminProductService service = new AdminProductService();
		Product product = null;
		try {
			product = service.findProductByPid(pid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		//获得所有的商品的类别数据
		List<Category> categoryList = null;
		try {
			categoryList = service.findAllCategory();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		//放到request域中，然后再进行回显
		request.setAttribute("categoryList", categoryList);//放到域request中
		request.setAttribute("product", product);
		
		//转发
		request.getRequestDispatcher("/admin/product/edit.jsp").forward(request, response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
