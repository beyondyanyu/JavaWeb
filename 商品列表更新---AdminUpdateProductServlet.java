package beyondwsq.web;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import beyondwsq.domain.Product;
import beyondwsq.service.AdminProductService;

public class AdminUpdateProductServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//设置编码问题，可以添加中文
		request.setCharacterEncoding("UTF-8");
		
		//1.获取数据
		Map<String, String[]> properties = request.getParameterMap();//返回一个Map集合，以键值对的形式；Map数据是从表单页面数据所获取的
		Product product = new Product();
		try {
			BeanUtils.populate(product, properties);//通过数据封装，就会将map中的数据封装到product这个实体当中
			//BeanUtils内部封装实质：比较map跟key的名字跟实体(product)属性的名字是否相同，相同则自动封装
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		//程序运行到此位置，Product已经封装完毕---使用BeanUtils将表单的数据封装完毕
		
		//2.封装数据
		
		//但是，事实上所Product表中定义的属性要比数据库上的属性要多
		//手动去设置表单中没有的这四种信息属性
		
		//这里需要获取旧商品的pid，所以这个自动生成没必要;
		//product.setPid(UUID.randomUUID().toString());

		//private String pimage;
		product.setPimage("products/1/c_0001.jpg");
		
		//private String pdate;商品上架日期
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");//设置格式化日期
		String pdate = format.format(new Date());//util包下的
		product.setPdate(pdate);
		
		//private int pflag;商品是否下架 0代表未下架  
		product.setPflag(0);//0代表未下架
		
		
		//3.传递数据给service层
		AdminProductService service = new AdminProductService();
		try {
			service.updateProduct(product);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//添加数据成功，跳转到列表页面
		//没有进行request域的数据的传递，都用重定向
		response.sendRedirect(request.getContextPath() + "/adminProductList");//往servlet上跳转

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
