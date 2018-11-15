<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ page import="java.io.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.net.*"%>

<%
	request.setCharacterEncoding("UTF-8");

	ArrayList<String> list = new ArrayList<String>();
	
	// 다운로드할 음원의 수 
	for(int i=0 ; i<100 ; i++) {
		String index = "file_name"+i;
		if(!(request.getParameter(index) == null)) {
			list.add(request.getParameter(index));
		} else {
			break;
		}
	}
	
	System.out.println("list.size() : " + list.size());
	System.out.println(list);
	
	// 하나씩 저장
	for(int i=0 ; i<list.size() ; i++) {
		
		String file_name = list.get(i).toString();
		System.out.println("file_name : " + file_name);
		
		// 파일 업로드된 경로
		String root = request.getSession().getServletContext().getRealPath("/");
		String savePath = root + "musicUpload/music/";
		System.out.println("저장 경로 : " + savePath);
		
		// 서버에 실제 저장된 파일명
		String filename = file_name;
		
		// 실제 내보낼 파일명
		String orgfilename = file_name;
		
		out.clear();
		InputStream in = null;
		OutputStream os = null;
		File file = null;
		boolean skip = false;
		String client = "";
		
		try {
			// 파일을 읽어 스트림에 담기
			try {
				file = new File(savePath, filename);
				System.out.println("file : " + file);
				in = new FileInputStream(file);
			} catch (FileNotFoundException fe) {
				skip = true;
			}
			System.out.println("1");
			client = request.getHeader("User-Agent");
			
			// 파일 다운로드 헤더 지정
			response.setContentType("application/octet-stream");
			response.setHeader("Content-Description", "JSP Generated Data");
			System.out.println("2");
			if (!skip) {
				
				// IE
				if (client.indexOf("MSIE") != -1) {
					response.setHeader("Content-Disposition",
							"attachment; filename=" + new String(orgfilename.getBytes("KSC5601"), "ISO8859_1"));
					System.out.println("3");
				} else {
					// 한글 파일명 처리
					orgfilename = new String(orgfilename.getBytes("utf-8"), "iso-8859-1");
					response.setHeader("Content-Disposition", "attachment; filename=\"" + orgfilename + "\"");
					response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
					System.out.println("3-1");
				}

				response.setHeader("Content-Length", "" + file.length());
				System.out.println("file.length() : " + file.length());
				os = response.getOutputStream();
				System.out.println("os : " + os);
				byte b[] = new byte[(int) file.length()];
				int leng = 0;
				System.out.println("4");
				
				while ((leng = in.read(b)) != -1) {
					System.out.println("b : " + b);
					System.out.println("leng : " + leng);
					os.write(b, 0, leng);
					System.out.println("5");
				}
				System.out.println("6");
				
			} else {
				System.out.println("여기오면 안된다");
				response.setContentType("text/html;charset=UTF-8");
				out.println("<script language='javascript'>alert('파일을 찾을 수 없습니다');history.back();</script>");
			}
			System.out.println("7");
			in.close();
			os.close();
			System.out.println("done!");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			in.close();
			os.close();
		}
	}
%>