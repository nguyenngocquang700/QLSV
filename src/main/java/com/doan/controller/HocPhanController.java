package com.doan.controller;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.doan.crypto.GenerateKeys;
import com.doan.crypto.Hash;
import com.doan.crypto.RSA;
import com.doan.entity.Hocphan;
import com.doan.entity.Lop;
import com.doan.entity.Nhanvien;

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

	@RequestMapping(value = "/admin/new-hocphan", method = RequestMethod.POST)
	public String newLop(RedirectAttributes re, ModelMap model,
			/* @ModelAttribute("hocphan") Hocphan hp */@RequestParam("mahp") String mahp,
			@RequestParam("tenhp") String tenhp, @RequestParam("sotc") int sotc) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			Hocphan hp = new Hocphan();
//			System.out.println(hp.getMahp() + ", " + hp.getTenhp() + ", " + hp.getSotc());
			hp.setMahp(mahp);
			hp.setTenhp(tenhp);
			hp.setSotc(sotc);
			session.save(hp);
			t.commit();
			re.addFlashAttribute("success", "Th??m h???c ph???n th??nh c??ng!");
//			model.addAttribute("message", "Th??m m???i Sinh vi??n th??nh c??ng !");
		} catch (Exception e) {
			e.printStackTrace();
			t.rollback();
			re.addFlashAttribute("error", "Kh??ng th??? th??m h???c ph???n n??y! Ki???m tra l???i th??ng tin nh???p");
		} finally {
			session.close();
		}
		return "redirect:new-hocphan";
	}

	// ================================NEW HOC PHAN========================================

	@RequestMapping(value = "/admin/new-hocphan", method = RequestMethod.GET)
	public String newHPPage(ModelMap model) {
		model.addAttribute("hocphan", new Hocphan());
		return "admin/new-hocphan";
	}

	// ================================UPDATE HOC PHAN=====================================
	@RequestMapping(value = "/admin/update-hocphan", method = RequestMethod.POST)
	public String updateNV(RedirectAttributes re, ModelMap model, @RequestParam("mahp") String mahp,
			@RequestParam("tenhp") String tenhp, @RequestParam("sotc") int sotc) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		Hocphan hp = (Hocphan) session.get(Hocphan.class, mahp);
		try {
			hp.setMahp(mahp);
			hp.setTenhp(tenhp);
			hp.setSotc(sotc);
			session.update(hp);
			t.commit();
			re.addFlashAttribute("success", "Ch???nh s???a H???c ph???n th??nh c??ng !");
		} catch (Exception e) {
			e.printStackTrace();
			t.rollback();
			re.addFlashAttribute("error", "Ch???nh s???a H???c ph???n th???t b???i !");
		} finally {
			session.close();
		}
		return "redirect:list-hocphan";
	}

	// =============================DELETE HOC PHAN=====================================
	@ModelAttribute("delete-hocphan")
	public Hocphan getHocPhan2del() {
		return new Hocphan();
	}

	@RequestMapping(value = "admin/delete-hocphan", method = RequestMethod.POST)
	public String DeleteHocPhan(RedirectAttributes re, ModelMap model, @RequestParam("mahp") String mahp) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			Hocphan hp = (Hocphan) session.get(Hocphan.class, mahp);
			System.out.println(hp);
			session.delete(hp);
			t.commit();
			re.addFlashAttribute("success", "Xo?? H???c ph???n th??nh c??ng!");
		} catch (Exception e) {
			t.rollback();
			re.addFlashAttribute("error",
					"Xo?? H???c ph???n th???t b???i! B???n ph???i xo?? th??ng tin b???ng ??i???m c???a sinh vi??n tr?????c!");
		} finally {
			session.close();
		}
		session = factory.openSession();
		String hql = "FROM Hocphan";
		Query query = session.createQuery(hql);
		List<Hocphan> list = query.list();
		model.addAttribute("hocphan", list);
		return "redirect:list-hocphan";
	}
}
