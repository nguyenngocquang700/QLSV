package com.doan.controller;

import java.text.DateFormat;
import java.text.Format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;



//import com.nhom26.entity.CountStaffModel;

@Controller(value = "homeControllerOfAdmin")
public class HomeController {
	
//	@Autowired
//	SessionFactory factory;
//	
////	@RequestMapping(value = "/admin", method = RequestMethod.GET)
////	public ModelAndView dashboardPage() {
////		ModelAndView mav = new ModelAndView("admin/dashboard");
////		return mav;
////	}
//	
//	@RequestMapping(value = "/admin")
//	public String listCheckStaff(ModelMap model) {
//		Session session;
//		try {
//			session = factory.getCurrentSession();	
//		} catch (Exception e) {
//			// TODO: handle exception
//			session = factory.openSession();
//		}
//		String hql = "FROM CheckStaffEntity";
//		Query<CheckStaffEntity> query = session.createQuery(hql);
//		List<CheckStaffEntity> list = query.list();
//		System.out.println(list.size());
//		for(int i = list.size() - 1; i > list.size() - 4; i--) {
//			if(i == list.size() - 1) {
//				model.addAttribute("hotencheck", list.get(i).getNhanvien().getHoTen());
//				model.addAttribute("chitietcheck", list.get(i).getChiTiet());
//			} else if (i == list.size() - 2) {
//				model.addAttribute("hotencheck1", list.get(i).getNhanvien().getHoTen());
//				model.addAttribute("chitietcheck1", list.get(i).getChiTiet());
//			} else {
//				model.addAttribute("hotencheck2", list.get(i).getNhanvien().getHoTen());
//				model.addAttribute("chitietcheck2", list.get(i).getChiTiet());
//			}
//		}
//
//		return "admin/dashboard";
//	}
//	
//	@ModelAttribute("TotalStaff")
//	public int getNhanvien() {
//
//		Session session;
//		try {
//			session = factory.getCurrentSession();
//		} catch (HibernateException e) {
//			// TODO: handle exception
//			session = factory.openSession();
//		}
//		String hql = "SELECT MaNV FROM NhanVienEntity";
//		Query<NhanVienEntity> query = session.createQuery(hql);
//		List<NhanVienEntity> list = query.list();
//		return list.size();
//	}
//	
//	@ModelAttribute("TotalDepart")
//	public int getDepartment() {
//
//		Session session;
//		try {
//			session = factory.getCurrentSession();
//		} catch (HibernateException e) {
//			// TODO: handle exception
//			session = factory.openSession();
//		}
//		String hql = "SELECT maPB FROM DepartmentEntity";
//		Query<NhanVienEntity> query = session.createQuery(hql);
//		List<NhanVienEntity> list = query.list();
//		return list.size();
//	}
//	
//	@ModelAttribute("TotalCheckin")
//	public int getCheckin() {
//		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
//		LocalDateTime now = LocalDateTime.now();
//		String dateNowString = dtf.format(now);
//		Session session;
//		try {
//			session = factory.getCurrentSession();
//		} catch (HibernateException e) {
//			// TODO: handle exception
//			session = factory.openSession();
//		}
//		String hql = "FROM CheckStaffEntity";
//		Query<CheckStaffEntity> query = session.createQuery(hql);
//		List<CheckStaffEntity> list = query.list();
//		int count = 0;
//		String todayString = "";
//		for(int i = 0; i < list.size(); i++) {
//			Format parseDate = new SimpleDateFormat("yyyy-MM-dd");
//			todayString = parseDate.format(list.get(i).getNgay());
//			System.out.println(todayString + " - " + dateNowString);
//			if(todayString.equals(dateNowString)) {
//				if(list.get(i).getChiTiet().equals("CHECKIN")) {
//					count++;
//				}
//			}
//		}
//		return count;
//	}
//	
//	@ModelAttribute("TotalCheckout")
//	public int getCheckout() {
//		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
//		LocalDateTime now = LocalDateTime.now();
//		String dateNowString = dtf.format(now);
//		Session session;
//		try {
//			session = factory.getCurrentSession();
//		} catch (HibernateException e) {
//			// TODO: handle exception
//			session = factory.openSession();
//		}
//		String hql = "FROM CheckStaffEntity";
//		Query<CheckStaffEntity> query = session.createQuery(hql);
//		List<CheckStaffEntity> list = query.list();
//		int count = 0;
//		String todayString = "";
//		for(int i = 0; i < list.size(); i++) {
//			Format parseDate = new SimpleDateFormat("yyyy-MM-dd");
//			todayString = parseDate.format(list.get(i).getNgay());
//			System.out.println(todayString + " - " + dateNowString);
//			if(todayString.equals(dateNowString)) {
//				if(list.get(i).getChiTiet().equals("CHECKOUT")) {
//					count++;
//				}
//			}
//		}
//		return count;
//	}
//	
//	public List<StaffOfDepartmentEntity> findAll(){
//		List<StaffOfDepartmentEntity> departments = new ArrayList<StaffOfDepartmentEntity>();
//		Session session;
//		try {
//			session = factory.openSession();
//			
//		} catch (HibernateException e) {
//			// TODO: handle exception
//			session = factory.getCurrentSession();
//		}
//		String hqldepartment = "FROM DepartmentEntity";
//		Query<DepartmentEntity> queryDepart = session.createQuery(hqldepartment);
//		List<DepartmentEntity> listDepart = queryDepart.list();
//		
//		String hqlstaff = "SELECT maPB.maPB FROM NhanVienEntity";
//		Query<String> queryStaff = session.createQuery(hqlstaff);
//		List<String> listStaff = queryStaff.list();
//		System.out.println(listDepart);
//		System.out.println(listStaff);
//		int count = 0;
//		for(int i = 0; i < listDepart.size(); i++) {
//			for(int j = 0; j < listStaff.size(); j++) {
//				String listDeparttemp = listDepart.get(i).getMaPB();
//				System.out.println(listDeparttemp);
//				System.out.println(listStaff.get(j));
//				if(listDeparttemp.equals(listStaff.get(j))) {
//					count++;
//				}
//			}
//			departments.add(new StaffOfDepartmentEntity(listDepart.get(i).getMaPB(),count));
//			count = 0;
//		}
//		System.out.println(departments);
//		return departments;
//	}
//	
//	@RequestMapping(value = "data", method = RequestMethod.GET)
//	@ResponseBody
//	public List<StaffOfDepartmentEntity> DataChart(){
//		List<StaffOfDepartmentEntity> listStaffOfDepartmentEntities=findAll();
//		return listStaffOfDepartmentEntities;
//	}
}