package com.sp.dev.admin.visitor;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Properties;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

//ServletContextListener: 서버가 시작되거나 종료될때 발생하는 이벤트를 처리하는 리스너
@WebListener //테스트 할 때는 주석처리 지워야함
public class WebAppInit implements ServletContextListener{
	private String pathname = "/WEB-INF/userNumbers.properties";                                                                                            
	
	
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		//서버가 시작되는 시점
		
		//실제 파일 경로
		pathname = sce.getServletContext().getRealPath(pathname);
		
		loadFile();
	}
	
	
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		//서버가 종료되는 시점
		saveFile();
	}
	
	protected void saveFile() {
		//접속자수를 프로퍼티 파일에 저장
		long toDay, yesterDay, total;
		FileOutputStream fos = null;
		Properties p = new Properties();
		
		try {
			toDay = CountManager.getToDayCount();
			yesterDay = CountManager.getYesterDayCount();
			total = CountManager.getToDayCount();
			
			p.setProperty("toDay", Long.toString(toDay));
			p.setProperty("yesterDay", Long.toString(yesterDay));
			p.setProperty("total", Long.toString(total));
			
			//파일에 저장
			fos = new FileOutputStream(pathname);
			p.store(fos, "count");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(fos != null) {
				try {
					fos.close();
				} catch (Exception e2) {
				}
			}
		}
		
	}
	protected  void loadFile() {
		//프로퍼티 파일에 저장된 접속자 수 가져오기
		long toDay, yesterDay, total;
		FileInputStream fis = null;
		Properties p = new Properties();
		
		try {
			
			File f = new File(pathname);
			if(! f.exists() ) {//파일이 없으면
				return;
			}
			//파일의 내용을 읽어 Properties 객체에 저장
			fis = new FileInputStream(f);
			p.load(fis);
			
			toDay = Long.parseLong(p.getProperty("toDay"));
			yesterDay = Long.parseLong(p.getProperty("yesterDay"));
			total = Long.parseLong(p.getProperty("total"));
			
			CountManager.init(toDay, yesterDay, total);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(fis != null) {
				try {
					fis.close();
				} catch (Exception e2) {
				}
			}
		}
		
	}

}
