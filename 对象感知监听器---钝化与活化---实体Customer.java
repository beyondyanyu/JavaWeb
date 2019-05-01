package beyond.domain;

import java.io.Serializable;

import javax.servlet.http.HttpSessionActivationListener;
import javax.servlet.http.HttpSessionEvent;

public class Customer implements HttpSessionActivationListener,Serializable{//实现这个接口
	private String id;
	private String name;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override//服务器正常关闭时钝化
	public void sessionWillPassivate(HttpSessionEvent se) {//钝化---把session存到磁盘
		System.out.println("customer被钝化了");
	}
	@Override//服务器再次启动时活化
	public void sessionDidActivate(HttpSessionEvent se) {//活化---把磁盘恢复到session内存区域中
		System.out.println("customer被活化了");
	}
	
}
