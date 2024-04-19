package JDBC;

import java.util.Scanner;

public class RentList_Delete {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		RentDao rdao = RentDao.getInstance();
		System.out.print("삭제할 대여건의 번호를 입력하세요");
		int numseq = Integer.parseInt(sc.nextLine());
		RentDto rdto = rdao.getRent(numseq);
		if(rdto==null) {
			System.out.println("입력한 번호의 대여기록이 없스니다. 프로그램을 종료합니다.");
			return;
		}
		int result = rdao.deleteRent(rdto.getNumseq());
		if(result==1)System.out.println("삭제가 완료되었습니다.");
		else System.out.println("삭제를 실패했습니다.");

	}

}
