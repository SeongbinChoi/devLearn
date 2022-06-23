package com.sp.dev.admin.visitor;

import java.util.Calendar;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;



@WebListener
public class CountManager implements HttpSessionListener{
	private static int currentCount;
	private static long toDayCount, yesterDayCount, totalCount;
	
	public static void init(long toDay, long yesterDay, long total) {
		toDayCount = toDay;
		yesterDayCount = yesterDay;
		totalCount = total;
	}
	
	public CountManager() {
		//자정이 되면 오늘 인원은 어제 인원으로, 오늘 인원은 0으로 변경
		TimerTask task = new TimerTask() {
			@Override
			public void run() {
				yesterDayCount = toDayCount;
				toDayCount = 0;
				
			}
		};
		
		Timer timer = new Timer();
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, 1);
		
		cal.set(Calendar.HOUR, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);
		
		//밤 12시마다 1번씩 실행
		 timer.schedule(task, cal.getTime(), 1000*60*60*24 );
	}
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		//세션이 만들어 질 때
		HttpSession session = se.getSession();
		ServletContext context = session.getServletContext();
		
		//동기화 블럭 - 연산되는 동안 다른 사람이 들어와도 연산에 문제 없도록
		synchronized (se) {
			currentCount++;
			toDayCount++;
			totalCount++;
			
			context.setAttribute("currentCount", currentCount);
			context.setAttribute("toDayCount", toDayCount);
			context.setAttribute("yesterDayCount", yesterDayCount);
			context.setAttribute("totalCount", totalCount);
			
		}
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		//세션이 소멸될 때
		HttpSession session = se.getSession();
		ServletContext context = session.getServletContext();
		
		synchronized (se) {
			currentCount--;
			if(currentCount < 0) {
				currentCount = 0;
			}
			
			context.setAttribute("currentCount", currentCount);
			context.setAttribute("toDayCount", toDayCount);
			context.setAttribute("yesterDayCount", yesterDayCount);
			context.setAttribute("totalCount", totalCount);
		}
		
	}

	public static int getCurrentCount() {
		return currentCount;
	}

	public static long getToDayCount() {
		return toDayCount;
	}

	public static long getYesterDayCount() {
		return yesterDayCount;
	}

	public static long getTotalCount() {
		return totalCount;
	}
	
}
