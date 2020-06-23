package kr.koreait.koreaitProject;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.koreait.dao.MybatisDAO;
import kr.koreait.vo.BoardList;
import kr.koreait.vo.ManagerVO;
import kr.koreait.vo.MemberVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final String FILE_SERVER_PATH = "C:\\Users\\Administrator\\Desktop\\jsp\\Spring\\workspace\\koreaitProject\\src\\main\\webapp\\resources\\memberPhoto";
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@Autowired
	public SqlSession sqlSession;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "redirect:list";
	}
	
	@RequestMapping("/download")
	public ModelAndView download(@RequestParam HashMap<Object, Object> params, ModelAndView mv) {
		String fileName = (String) params.get("fileName");
		String fullPath = FILE_SERVER_PATH + "/" + fileName;
		File file = new File(fullPath);
		
		mv.setViewName("downloadView");
		mv.addObject("downloadFile", file);
		return mv;
	
	}
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home2(Locale locale, Model model) {
		return "home";
	}
	@RequestMapping(value="/insertOK")
	public String insert(HttpServletRequest request,Model model,MemberVO memberVO,MultipartFile file) {
		System.out.println("insert 들어옴");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		String savedFileName ="";
		int memberIdx= mapper.selectIdx();
		System.out.println(memberVO);
		memberVO.setIdx(memberIdx); 
		try {
			savedFileName=uploadFile(file, uploadPath, memberVO);
		} catch (IOException e) {e.printStackTrace();}
		memberVO.setMemberPhoto(savedFileName);
		mapper.insert(memberVO);
		
		
		return "redirect:list";
	}
	public static String uploadFile(MultipartFile file,String uploadPath, MemberVO memberVO) throws IOException {
	      String media = file.getOriginalFilename();
	      String filename = ((memberVO.getIdx()))+media.substring(media.lastIndexOf("."));
	      System.out.println(filename);
	      File target = new File(uploadPath, filename);
	      
	      FileCopyUtils.copy(file.getBytes(), target);
	      
	      return filename;
	   }
	@RequestMapping(value="/list")
	public String list(HttpServletRequest request,Model model,MemberVO memberVO) {
		System.out.println("list 들어옴");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		
		int pageSize =10;
		int currentPage = 1;
		try {currentPage = Integer.parseInt(request.getParameter("currentPage"));} catch (Exception e) {};
		int totalCount = mapper.selectCount();
		AbstractApplicationContext ctx=new GenericXmlApplicationContext("classpath:applicationCTX.xml");
		BoardList boardList = ctx.getBean("boardList",BoardList.class);
		boardList.initBoardList(pageSize, totalCount, currentPage);
		HashMap<String, Integer> hmap = new HashMap<String, Integer>();
		hmap.put("startNo",boardList.getStartNo());
		hmap.put("endNo",boardList.getEndNo());
		
		boardList.setBoardList(mapper.selectList(hmap));
		System.out.println(boardList);
		model.addAttribute("boardList", boardList);
		return "list";
	}
	@RequestMapping(value="/login")
	public String login(HttpServletRequest request,Model model,MemberVO memberVO) {
		return "login";
	}
	
	@RequestMapping(value="/join")
	public String join(HttpServletRequest request,Model model,MemberVO memberVO) {
		String ip = request.getHeader("X-FORWARDED-FOR");
		if(ip==null) {
			ip=request.getHeader("Proxy-Client-IP");
		}
		if(ip==null) {
			ip=request.getHeader("WL-Proxy-Client-IP");
		}
		if(ip==null) {
			ip=request.getHeader("HTTP_CLIENT_IP");
		}
		if(ip==null) {
			ip=request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if(ip==null) {
			ip=request.getRemoteAddr();
		}
		ManagerVO managerVO=new ManagerVO();
		managerVO.setIp(ip);
		model.addAttribute("ip", ip);
		return "join";
	}
	@RequestMapping(value="/joinOK")
	public String joinOK(HttpServletRequest request,Model model,ManagerVO managerVO) {
		MybatisDAO mapper=sqlSession.getMapper(MybatisDAO.class);
		mapper.registeManager(managerVO);
		System.out.println(managerVO);
		return "redirect:list"; 
	}
	@RequestMapping(value="/delete")
	public String delete(HttpServletRequest request,Model model,MemberVO memberVO) {
		MybatisDAO mapper=sqlSession.getMapper(MybatisDAO.class);
		int idx=Integer.parseInt(request.getParameter("idx"));
		mapper.deleteMember(idx);
		System.out.println(idx);
		return "redirect:list"; 
	}
	@RequestMapping(value="/downImg")
	public String downImg(HttpServletRequest request,Model model,MemberVO memberVO) {
		MybatisDAO mapper=sqlSession.getMapper(MybatisDAO.class);
		String memberPhoto = request.getParameter("memberPhoto");
		System.out.println(memberPhoto);
		model.addAttribute("memberPhoto", memberPhoto);
		return "downImg"; 
	}
	@RequestMapping(value="/update")
	public String update(HttpServletRequest request,Model model,MemberVO memberVO) {
		String name= request.getParameter("name");
		String img= request.getParameter("img");
		String con= request.getParameter("con");
		int age= Integer.parseInt(request.getParameter("age"));
		int idx= Integer.parseInt(request.getParameter("idx"));
		model.addAttribute("name", name);
		model.addAttribute("memberPhoto", img);
		model.addAttribute("con", con);
		model.addAttribute("age", age);
		model.addAttribute("idx", idx);
		return "update";
	}
	@RequestMapping(value="/updateOK")
	public String updateOK(HttpServletRequest request,Model model,MemberVO memberVO,MultipartFile file) {
		System.out.println("update들어옴");
		MybatisDAO mapper=sqlSession.getMapper(MybatisDAO.class);
		/*
		 * try { int idx=Integer.parseInt(request.getParameter("idx"));
		 * System.out.println(idx); } catch (Exception e) { }
		 */
		//memberVO.setMemberPhoto(request.getParameter("img");
		String savedFileName ="";
	
		try {
			savedFileName=uploadFile(file, uploadPath, memberVO);
		} catch (IOException e) {e.printStackTrace();}
		memberVO.setMemberPhoto(savedFileName);
		System.out.println(memberVO);
		mapper.updateMember(memberVO);
		return "redirect:list";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
