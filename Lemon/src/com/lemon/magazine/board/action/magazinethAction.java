package com.lemon.magazine.board.action;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.awt.image.renderable.ParameterBlock;
import java.io.File;
import java.util.Enumeration;

import javax.imageio.ImageIO;
import javax.media.jai.JAI;
import javax.media.jai.RenderedOp;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class magazinethAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
		ServletContext context = request.getServletContext();
		String imagePath=context.getRealPath("./magazine/image");
		
		int size = 1*1024*1024 ;
		String filename="";
		
		try{
			MultipartRequest multi=	new MultipartRequest(request,
			  					  imagePath,
								  size,
								  "euc-kr",
								new DefaultFileRenamePolicy());
			
			Enumeration files=multi.getFileNames();
			
			String file =(String)files.nextElement();
			filename=multi.getFilesystemName(file);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		ParameterBlock pb=new ParameterBlock();
		pb.add(imagePath+"/"+filename);
		RenderedOp rOp=JAI.create("fileload",pb);
		
		BufferedImage bi= rOp.getAsBufferedImage();
		BufferedImage thumb=new BufferedImage(100,100,BufferedImage.TYPE_INT_RGB);
		
		Graphics2D g=thumb.createGraphics();
		g.drawImage(bi,0,0,100,100,null);
		
		File file=new File(imagePath+"/sm_"+filename);
		ImageIO.write(thumb,"jpg",file);
		
		return null;
	}

}
