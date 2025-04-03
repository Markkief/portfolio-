package org.generationitaly.casanova.utils;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

/**
 * Utility class with static methods. Streamlines password encryption
 * and password validation limiting the use of a raw password
 * 
 * @author Redi Levendi
 * @version 0.1 Initial Version
 */

public class PasswordEncryptionUtil {
    private static final PasswordEncoder pwdEncoder = new BCryptPasswordEncoder();

    public static String encrypt(String pwd) {
        return pwdEncoder.encode(pwd);
    }

    public static boolean matches(String rawPwd, String encPwd) {
        return pwdEncoder.matches(rawPwd, encPwd);
    }
}
