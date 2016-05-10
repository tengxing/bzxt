package com.sdut.edu.cn.Login.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "/userLogin")
public class LoginController {

	private static final Logger logger = Logger.getLogger(LoginController.class);

	

	@RequestMapping(value = "/login_in", method = RequestMethod.POST, produces = "text/html; charset=utf-8") // 返回编码
	public String login_in(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			Map<String, Object> map, String username, String password, RedirectAttributes redirectmap) {
		logger.info(username);
		// 想要得到 SecurityUtils.getSubject() 的对象．．访问地址必须跟ｓｈｉｒｏ的拦截地址内．不然后会报空指针
		/*Subject user = SecurityUtils.getSubject();
		// 用户输入的账号和密码,,存到UsernamePasswordToken对象中..然后由shiro内部认证对比,
		// 认证执行者交由ShiroDbRealm中doGetAuthenticationInfo处理
		// 当以上认证成功后会向下执行,认证失败会抛出异常
		UsernamePasswordToken token = new UsernamePasswordToken(username, password);
		try {
			user.login(token);
		} catch (LockedAccountException lae) {
			token.clear();*/
			/*request.setAttribute("error", "用户已经被锁定不能登录，请与管理员联系！");
			return "/login";
		} catch (ExcessiveAttemptsException e) {
			token.clear();
			request.setAttribute("error", "账号：" + username + " 登录失败次数过多,锁定10分钟!");
			return "/login";
		} catch (AuthenticationException e) {
			token.clear();
			map.put("error", "用户或密码不正确！");

			return "/login";
		}
		
		 * User user=(User) request.getSession().getAttribute("loginuser");
		 * session.setAttribute("loginuser",user);
		 
	session.setAttribute("userSession", request.getSession().getAttribute("userSession"));

		logger.info(request.getSession().getAttribute("userSession"));
		map.put("a","ds");
*/
		return "home";
	}

}
