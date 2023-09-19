package iuiProject;

import java.sql.SQLException;

public class Testjava {

	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub
		MemberDAO service = new MemberDAO();
		MemberDTO member = new MemberDTO("danbab","1111","danbab2@naver.com","단밥");
		
		int result = service.join(member);
		
		if(result==1) {
			System.out.println("회원가입 완료");
		}else {
			System.out.println("이런 젠장!");
		}

	}

}
