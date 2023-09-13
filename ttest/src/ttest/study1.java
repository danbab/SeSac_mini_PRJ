package ttest;


public class study1 {

	public static void main(String[] args) {

		String[] names = { "Elena", "Suzie", "John", "Emily", "Neda", "Kate", "Alex", "Daniel", "Hamilton" };
		int[] scores = { 65, 74, 23, 75, 68, 96, 88, 98, 54 };

		System.out.println("1등 : " + names[topIndex(scores)]);
	}

	public static int topIndex(int[] scores) {

		int topIndex = 0;
		for (int i = 0; i < scores.length - 1; i++) {

			if (scores[i] < scores[i + 1]) {
				topIndex = i + 1;
			}
		}
		return topIndex;
	}
}
