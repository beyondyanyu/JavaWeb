package beyond.birthday;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import javax.mail.MessagingException;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import beyond.birthday.Customer;
import beyond.mail.MailUtils;

public class BirthdayListener implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		//当web应用启动开启调动---功能在用户的生日当前发送邮件
		
		Timer timer = new Timer();//开启定时器，导util下的包
		timer.scheduleAtFixedRate(new TimerTask() {
			
			@Override
			public void run() {
				//为当前生日用户发邮件
				//1，获得当前过生日的用户
				SimpleDateFormat format = new SimpleDateFormat("MM-dd");//获得当天的日期
				String currentDate = format.format(new Date());//currentDate----10-14
				
				
				QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());//根据当前的时间，从数据库查询今天过生日的用户
				String sql = "select * from customer where birthday like ?";//写SQL语句
				List<Customer> customerList = null;
				try {
					customerList = runner.query(sql, new BeanListHandler<Customer>(Customer.class),"%"+currentDate);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				//2，发邮件给当前过生日的用户
				if(customerList!=null&&customerList.size()>0){
					for(Customer c :customerList){
						String emailMsg = "亲爱的：" + c.getRealname() + ",生日快乐！";
						try {
							MailUtils.sendMail(c.getEmail(), "生日祝福", emailMsg);
							System.out.println(c.getRealname()+"邮件发送完毕");
						} catch (MessagingException e) {
							e.printStackTrace();
						}
					}
					
					
				}
				
				
				
			}
		}, new Date(),1000*30 );//1000ms*30=半分钟
		//实际开发中，起始时间肯定是一个固定的时间
		//period：间隔时间  时间开发中，间隔时间是1天（为一天会有好多人过生日，把今天过生日的人给发送生日祝福）
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		
	}

}
