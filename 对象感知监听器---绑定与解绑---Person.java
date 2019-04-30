package beyond.domain;

import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

public class Person implements HttpSessionBindingListener{//该监听器是绑到对象身上的，不需要配置web.xml
	
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
	@Override
	public void valueBound(HttpSessionBindingEvent event) {//绑定的方法
		System.out.println("Person被绑定了");
	}
	@Override
	public void valueUnbound(HttpSessionBindingEvent event) {//解绑的方法
		System.out.println("Person被解绑了");

	}
}
