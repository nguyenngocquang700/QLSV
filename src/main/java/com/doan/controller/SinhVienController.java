package com.doan.controller;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.hibernate.HibernateException;
import org.hibernate.*;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Persistable;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.doan.entity.Sinhvien;
import com.doan.crypto.Hash;
import com.doan.entity.Lop;

@Transactional
@Controller
public class SinhVienController {
	@Autowired
	SessionFactory factory;
	
//	@Autowired
//	ServletContext context;
	
	//===========================================LIST SINH VIEN=======================================
	
	@RequestMapping("/admin/listsv")
	public String listSVPage(ModelMap model) {
		Session session = factory.openSession();
		try {
			String hql = "FROM Sinhvien";
			Query query = session.createQuery(hql);
			List<Sinhvien> list = query.list();
			System.out.print(list);
			model.addAttribute("sinhvien", list);
			model.addAttribute("sinhviens", new Sinhvien());
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print(e);
		} finally {
			session.close();
		}

		return "admin/listsv";
	}
	
	//=========================================NEW SINH VIEN=========================================
	
	@RequestMapping(value = "/admin/new-sv", method = RequestMethod.GET)
	public String newSVPage(ModelMap model) {
		model.addAttribute("sinhvien", new Sinhvien());
		return "admin/new-sv";
	}
	
	@RequestMapping(value = "/admin/new-sv", method = RequestMethod.POST)
	public String newSV(ModelMap model, @ModelAttribute("sinhvien") Sinhvien sv) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			Sinhvien sv1 = new Sinhvien();
			sv1.setMasv(sv.getMasv());
			sv1.setHoten(sv.getHoten());
			sv1.setNgaysinh(sv.getNgaysinh());
			sv1.setDiachi(sv.getDiachi());
			sv1.setLop(sv.getLop());
			sv1.setTendn(sv.getTendn());
			sv1.setMatkhau(Hash.convertSHA1(sv.getMatkhau()));
			session.save(sv);
			t.commit();
			model.addAttribute("message", "Thêm mới Sinh viên thành công !");
		} catch (Exception e) {
			e.printStackTrace();
			t.rollback();
			model.addAttribute("message", "Thêm mới Sinh viên thất bại !");
		} finally {
			session.close();
		}
		return "admin/new-sv";
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		Session session;
		try {
			session = factory.getCurrentSession();	
		} catch (HibernateException e) {
			// TODO: handle exception
			session = factory.openSession();
		}
		String hql = "SELECT malop FROM Lop";
		Query<Lop> query = session.createQuery(hql);
		List<Lop> list = query.list();
		System.out.println(list);
		request.setAttribute("lop", list);
		request.getRequestDispatcher("admin/new-sv").forward(request, response);
	}
	
	@ModelAttribute("listlop")
	public List<Lop> getLop() {
		Session session;
		try {
			session = factory.getCurrentSession();
		} catch (HibernateException e) {
			// TODO: handle exception
			session = factory.openSession();
		}
		String hql = "SELECT malop FROM Lop";
		Query<Lop> query = session.createQuery(hql);
		List<Lop> list = query.list();
		return list;
	}
}
