package utilities;

import java.util.*;
import java.math.*;
import org.apache.log4j.Logger;
public class Di {
	static Logger log = Logger.getLogger(Di.class);
    public static void main(String[] args) {
        Scanner sc;
        boolean first_right_number = false;
        BigDecimal initBigDecimal = BigDecimal.ZERO;
        BigDecimal add1 = BigDecimal.ZERO;
        BigDecimal add2 = BigDecimal.ZERO;

        while (!first_right_number)
        {
            System.out.print("Enter a first single numeric value: ");
            sc = new Scanner(System.in);
            if (sc.hasNextBigDecimal()) 
            {
                first_right_number = true;
                add1 = sc.nextBigDecimal();
            }
        }

        boolean second_right_number = false;
        while (!second_right_number)
        {
            System.out.print("Enter a second single numeric value: ");
            sc = new Scanner(System.in);
            if (sc.hasNextBigDecimal()) 
            {
                second_right_number = true;
                add2 = sc.nextBigDecimal();
            }
        }
        BigDecimal result = initBigDecimal.add(add1).add(add2);
        log.info("Sum of the 2 numbers is: " + result.toString());
    }
}