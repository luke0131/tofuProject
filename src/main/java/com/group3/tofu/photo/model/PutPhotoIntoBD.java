package com.group3.tofu.photo.model;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class PutPhotoIntoBD {

	public static void main(String[] args) throws Exception {
		
		for(int i=1;i<=259;i++)
		{
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream("C:\\Users\\Student\\Desktop\\Product_Photo\\"+i+".jpg"));
			byte[] img = bis.readAllBytes();
			
			bis.close();
			
			Connection conn = DriverManager.getConnection(
					"jdbc:sqlserver://localhost:1433;databaseName=tofucars;user=sa;password=1234;trustServerCertificate=true;");
			
			PreparedStatement preState = conn.prepareStatement("UPDATE Photo SET photo =? WHERE [photo_id]="+i) ;
			
			preState.setBytes(1, img) ;
			preState.execute() ;
			
			preState.close();
			conn.close();
		}
		
	}

}
