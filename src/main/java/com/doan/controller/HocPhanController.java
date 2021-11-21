package com.doan.controller;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doan.entity.Hocphan;

@Transactional
@Controller
public class HocPhanController {
	@Autowired
	SessionFactory factory;
	
//	@Autowired
//	ServletContext context;
	
	@RequestMapping("/admin/list-hocphan")
	public String listHPPage(ModelMap model) {
		Session session = factory.openSession();
		try {
			String hql = "FROM Hocphan";
			Query query = session.createQuery(hql);
			List<Hocphan> list = query.list();
			System.out.print(list);
			model.addAttribute("hocphan", list);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print(e);
		} finally {
			session.close();
		}

		return "admin/list-hocphan";
	}
}

