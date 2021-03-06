package com.doan.controller;

import java.util.List;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.doan.crypto.Hash;
import com.doan.entity.Nhanvien;
import com.doan.recaptcha.*;
import com.doan.GenerateRandomString.*;

@Service
@Transactional
@Controller
public class LoginController {
	@Autowired
	SessionFactory factory;

	@Autowired
	ServletContext context;

	@Autowired
	JavaMailSender mailer;
//==========================================GET VIEW LOGIN =========================================

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String loginPage(ModelMap model) {
		Nhanvien nv = new Nhanvien();
		model.addAttribute("login-acc", nv);
		return "login";
	}

	@RequestMapping(value = "forgotpasswd", method = RequestMethod.GET)
	public String forgotPage(ModelMap model) {
		Nhanvien nv = new Nhanvien();
		model.addAttribute("forgot-acc", nv);
		return "forgotpasswd";
	}

	@RequestMapping(value = "reset-password", method = RequestMethod.GET)
	public String resetpassPage(ModelMap model) {
		Nhanvien nv = new Nhanvien();
		model.addAttribute("reset-acc", nv);
		return "reset-password";
	}

	public List<Nhanvien> getByUser(String name, SessionFactory factory) {
		Session session;
		try {
			session = factory.getCurrentSession();
		} catch (HibernateException e) {
			// TODO: handle exception
			session = factory.openSession();
		}
		String hql = "FROM Nhanvien WHERE tendn = :tendn";
		Query<Nhanvien> query = session.createQuery(hql);
		List<Nhanvien> list = query.list();
		return list;
	}

//=====================================CHECK SPECIALWORD============================================

	public static boolean isContainSpecialWord(String str) {
		Pattern VALID_INPUT_REGEX = Pattern.compile("[$&+,:;=\\\\\\\\?@#|/'<>.^*()%!-]", Pattern.CASE_INSENSITIVE);
		Matcher matcher = VALID_INPUT_REGEX.matcher(str);
		return matcher.find();
	}

	// ===============================POST
	// LOGIN=========================================================
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String toLogin(HttpSession httpSession, HttpServletResponse response, RedirectAttributes re,
			@RequestParam("tendn") String tendn, @RequestParam("matkhau") String matkhau) {
		if (tendn.equals("")) {
			re.addFlashAttribute("error", "T??n ????ng nh???p kh??ng ???????c ????? tr???ng");
			return "redirect:login";
		} else if (tendn.contains(" ")) {
			re.addFlashAttribute("error", "T??n ????ng nh???p kh??ng bao g???m k?? t??? kho???ng c??ch");
			return "redirect:login";
		} else if (isContainSpecialWord(tendn)) {
			re.addFlashAttribute("error", "T??n ????ng nh???p kh??ng bao g???m k?? t??? ?????c bi???t");
			return "redirect:login";
		}
		if (matkhau.equals("")) {
			re.addFlashAttribute("error", "M???t kh???u kh??ng ???????c ????? tr???ng");
			return "redirect:login";
		} else if (matkhau.contains(" ")) {
			re.addFlashAttribute("error", "M???t kh???u kh??ng bao g???m k?? t??? kho???ng c??ch");
			return "redirect:login";
		} else if (isContainSpecialWord(matkhau)) {
			re.addFlashAttribute("error", "M???t kh???u kh??ng bao g???m k?? t??? ?????c bi???t");
			return "redirect:login";
		}

		String hql = "FROM Nhanvien WHERE tendn = :tendn AND matkhau = :matkhau";
		Session session = factory.openSession();
//		String hql = String.format("FROM Nhanvien WHERE tendn='%s' and matkhau='%s'", tendn, matkhau);
//		System.out.println(Hash.convertSHA1(matkhau) + "======================================");
		List<Object> list = session.createQuery(hql).setString("tendn", tendn)
				.setParameter("matkhau", Hash.convertSHA1(matkhau)).list();

//		Query query = session.createQuery(hql);
//		List<Nhanvien> list = query.list();
		System.out.println(list);
		if (list.isEmpty()) {
			re.addFlashAttribute("error", "T??i kho???n ho???c m???t kh???u kh??ng ????ng");
			return "redirect:login";
		}
		session.clear();
		session = factory.openSession();
		String CHANGEPASS_REQUIRED = "FROM Nhanvien WHERE tendn = :tendn";
		String hqltendn = "FROM Nhanvien WHERE tendn = :tendn";

		List<Nhanvien> CHANGEPASS_REQUIRED_LIST = session.createQuery(hqltendn).setString("tendn", tendn).list();
		System.out.println("CHANGEPASS_REQUIRED_LIST:" + CHANGEPASS_REQUIRED_LIST);

		Nhanvien checkChangePassRequire = CHANGEPASS_REQUIRED_LIST.get(0);
		System.out.println(checkChangePassRequire);
//		Nhanvien nv = new Nhanvien();
//		int check = nv.get(CHANGEPASS_REQUIRED_LIST.get(0).getChangepw());
		int check = checkChangePassRequire.getChangepw();
		if (check == 1) {
			re.addFlashAttribute("tendn", tendn);
			return "redirect:reset-password";
		}
		httpSession.setAttribute("account", list.get(0));
		httpSession.setMaxInactiveInterval(5 * 60 * 60);
		return "redirect:admin";
	}

	// =======================================POST FORGOT
	// PASSWORD=====================================

	@RequestMapping(value = "forgotpasswd", method = RequestMethod.POST)
	public String forgotUserPassword(RedirectAttributes re, @RequestParam("tendn") String tendn,
			@RequestParam("g-recaptcha-response") String gRecaptchaResponse) {
		boolean valid = false;
		System.out.println("recaptcha: " + gRecaptchaResponse);
		valid = VerifyUtils.verify(gRecaptchaResponse);
		System.out.println(valid);

		String hql = "FROM Nhanvien WHERE tendn = :tendn";
		Session session = factory.openSession();
		List<Nhanvien> list = session.createQuery(hql).setString("tendn", tendn).list();

		if (list != null && valid == true) { // Create token ConfirmationToken
			Nhanvien nv = (Nhanvien) session.get(Nhanvien.class, list.get(0).getManv());
			// Create the email SimpleMailMessage mailMessage = new SimpleMailMessage();
			String generatePass = RandomUtils.GenerateString();
			String body = String.format("<h3>Qu???n L?? Sinh Vi??n PTITHCM</h3> " + "<p>Xin ch??o %s,</p> "
					+ "<p>B???n v???a g???i y??u c???u ?????t l???i M???t kh???u cho t??i kho???n QLSV? M???t kh???u c???a b???n l??: %s</p>"
					+ "<p>B???n ?????i m???t kh???u sau khi nh???n ???????c mail n??y nh??. H??y lu??n b???o m???t th??ng tin ????ng nh???p v?? M???t kh???u c???a b???n</p>"
					+ "\r\n" + "<p>Tr??n tr???ng,</p>" + "<p>Nh??m 10</p>", tendn, generatePass);
			MimeMessage mail = mailer.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mail);
			try {
				helper.setFrom("hellowangg107@gmail.com");
				helper.setTo(nv.getEmail());
				helper.setSubject("[QLSV PTITHCM] Y??U C???U ?????T L???I M???T KH???U");
				helper.setText(body, true);
				mailer.send(mail);
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			nv.setMatkhau(Hash.convertSHA1(generatePass));
			nv.setChangepw(1);
			session.clear();
			session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
				session.update(nv);
				t.commit();
			} catch (Exception e) {
				t.rollback();
				// TODO: handle exception
				re.addFlashAttribute("success", "Y??u c???u ?????t l???i m???t kh???u th??nh c??ng. H??y ki???m tra email c???a b???n!");
				return "redirect:forgotpasswd";
			}
		}
		re.addFlashAttribute("success", "Y??u c???u ?????t l???i m???t kh???u th??nh c??ng. H??y ki???m tra email c???a b???n!");
		return "forgotpasswd";
	}

	// ======================================RESET
	// PASSWORD============================================

	@RequestMapping(value = "reset-password", method = RequestMethod.POST)
	public String ResetPassword(HttpSession httpSession, HttpServletResponse response, RedirectAttributes re,
			@RequestParam("tendn") String tendn, @RequestParam("oldpass") String oldpass,
			@RequestParam("newpass") String newpass, @RequestParam("retypepass") String retypepass) {
		String hql = "FROM Nhanvien WHERE tendn = :tendn AND matkhau = :matkhau";
		Session session = factory.openSession();
		List<Nhanvien> list = session.createQuery(hql).setString("tendn", tendn)
				.setParameter("matkhau", Hash.convertSHA1(oldpass)).list();
		System.out.println(list);
		if (list.isEmpty()) {
			re.addFlashAttribute("error", "M???t kh???u c?? kh??ng tr??ng kh???p");
			re.addFlashAttribute("tendn", tendn);
			return "redirect:reset-password";
		}
		boolean checkpass = oldpass.equals(newpass);
		System.out.println(checkpass);
		if (retypepass.equals(newpass)) {

			session.clear();
			session = factory.openSession();
			Transaction t = session.beginTransaction();
			Nhanvien nv = (Nhanvien) session.get(Nhanvien.class, list.get(0).getManv());
			nv.setMatkhau(Hash.convertSHA1(newpass));
			nv.setChangepw(0);
			try {
				session.update(nv);
				t.commit();
			} catch (Exception e) {
				t.rollback();
				// TODO: handle exception
			}
		} else {
			re.addFlashAttribute("error", "M???t kh???u m???i kh??ng tr??ng kh???p");
			re.addFlashAttribute("tendn", tendn);
			return "redirect:reset-password";
		}
		httpSession.setAttribute("account", list.get(0));
		httpSession.setMaxInactiveInterval(5 * 60 * 60);
		return "redirect:admin";
	}

	// ===============================LOGOUT==========================================
	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		return "redirect:/login"; // Where you go after logout here.
	}
}
