import java.math.BigInteger;
import java.util.Random;

public class Solve {

    static final Random rnd = new Random(0xb483fL);

    static final BigInteger two = new BigInteger("2");
    static final BigInteger min = new BigInteger("843997183");
    static final BigInteger mod = new BigInteger("1000000000");  

    static final BigInteger shift = two.pow(20000).subtract(BigInteger.ONE);

    public static void main(String[] args) {
        BigInteger big;
        
        long l;
        int count = 0;

        do {
            while((l = rnd.nextLong()) < 0L);
            big = BigInteger.valueOf(l);
            big = big.shiftLeft(20000).add(shift).subtract(min);
            
            count++;
            if((count % 10000) == 0) {
                System.out.println(count);
            }
        } while(big.mod(mod).compareTo(BigInteger.ZERO) != 0);
        System.out.println(l);
    }
}
