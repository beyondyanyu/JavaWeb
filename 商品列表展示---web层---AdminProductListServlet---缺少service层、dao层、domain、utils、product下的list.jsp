package beyondwsq.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beyondwsq.domain.Product;
import beyondwsq.service.AdminProductService;

public class AdminProductListServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//传递请求到service层
		AdminProductService service = new AdminProductService();

		List<Product> productList = null;
		
		try {
			productList = service.findAllProduct();//获取所有的数据
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//获取数据完毕
		
		request.setAttribute("productList", productList);//将productList放到request域当中
		
		request.getRequestDispatcher("/admin/product/list.jsp").forward(request, response);;//转发到该页面(list.jsp)下;这里是服务器内部地址，不需要写web应用的名称
	
		//到list.jsp页面中取出数据
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
