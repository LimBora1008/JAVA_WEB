
package com.javalab.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalab.vo.Member;


public class MemberDao {
   private Connection con;
   private PreparedStatement pstmt;
   private ResultSet rs;
   private DataSource dataSource;

   public MemberDao() {
      try {
         Context ctx = new InitialContext();
         Context envContext = (Context) ctx.lookup("java:/comp/env");
         dataSource = (DataSource) envContext.lookup("jdbc/oracle");
      } catch (Exception e) {
         e.printStackTrace();
      }
   }

   // 아이디 중복 체크
   public boolean isIdExist(String id){
      boolean result = false;
      try {
         con = dataSource.getConnection();
         String query = "select decode(count(*), 1, 'true', 'false') as result from tbl_member";
         query += " where id=?";
         System.out.println("prepareStatememt: " + query);
         pstmt = con.prepareStatement(query);
         pstmt.setString(1, id);
         
         rs = pstmt.executeQuery();
         rs.next();
         // 반환 타입이 불린형이므로, 문자열 타입을 쿼리 결과를 불린형으로 변환
         result = Boolean.parseBoolean(rs.getString("result"));
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         close();         
      }
      return result;
   }
   
   // 사용자가 데이터베이스에 있는지 조회
   public Member loginCheck(Member mb) {
      Member member = null;   
      try {
         // 1. 데이터소스에서 커넥션 객체 얻음
         con = dataSource.getConnection();
         // 2. SQL쿼리문장 생성
         String sql = "select id from tbl_member where id = ? and pwd = ?";
         // 3. 쿼리문 실행 객체 준비
         pstmt = con.prepareStatement(sql);
         // 4. 인자 전달
         pstmt.setString(1, mb.getId());
         pstmt.setString(2, mb.getPwd());
         // 5. 쿼리실행 및 결과반환
         rs = pstmt.executeQuery();

         if(rs.next()) {
            String id = rs.getString("id");
            member = new Member(id);
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         close();         
      }
      return member;
   }      
   
   // DB 자원해제
   private void close()
   {
      try {
         if ( pstmt != null ){ 
            pstmt.close(); 
         }
         if ( con != null ){ 
            con.close(); 
         }
      } catch (Exception e) {
         throw new RuntimeException(e.getMessage());
      }
   } // end close()   
   
   
}