public class Solve {

    public int bucketFromRandom(int randomNumber) {
        int a[] = new int[10];
        for (int i = 0; i < a.length; i++) {
            a[i] = i * randomNumber;
        }
        int index = Math.abs(randomNumber) % a.length;
        return a[index];
    }

    public static void main(String[] args) {
        Solve h = new Solve();

        for (int i = Integer.MIN_VALUE; i <= Integer.MAX_VALUE; i++) {
            try {
                h.bucketFromRandom(i);
            } catch (Exception e) {
                System.out.println("Value: " + i);
                break;
            }
        }
    }
}
