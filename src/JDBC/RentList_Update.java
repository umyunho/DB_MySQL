package JDBC;

import java.util.Scanner;

public class RentList_Update {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);		
		RentDao rdao = RentDao.getInstance();
		RentDto rdto = new RentDto();		
		
		//수정할 대여기록의 번호
		System.out.println("수정할 대여기록의 번호를 입력하세요");
		int numseq = Integer.parseInt( sc.nextLine() );
		//int numseq = sc.nextInt();
		rdto = rdao.getRent(numseq);
		if(rdto == null) {
			System.out.println("입력한 번호의 대여기록이 없습니다. 프로그램을 종료합니다.");
		}
		
		//기록이 있는지 확인합니다. 없으면 종료
		
		//수정할 대여날짜 입력
		System.out.printf("날짜: %s\n",rdto.getRentdate());
		System.out.println("수정할 날짜를 입력하세요");
		String rentdata = sc.nextLine();
		if(!rentdata.equals(""))rdto.setRentdate(rentdata);
		//수정할 도서번호를 입력. 입력한 번호의 도서가 없으면 다시 입력
		System.out.printf("도서번호: %s\n", rdto.getBnum());
		System.out.println("수정할 도서번호를 입력하세요. 수정하지 않으려면 엔터만 입력하세요");
		//수정할 회원번호를 입력, 입력한 번호의 회원이 없으면 다시 입력
		String membernum = sc.nextLine();
		if(!membernum.equals(""))rdto.setMnum(Integer.parseInt(membernum));
		
		//수정할 할인 금액 입력
		
		//RentDto에 모두 담아서 updateRent메서드에 전송
		


	}

}
