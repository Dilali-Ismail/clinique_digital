package org.clinique_degital.clinique_degital.util;

import org.hibernate.property.access.internal.PropertyAccessStrategyNoopImpl;
import org.mindrot.jbcrypt.BCrypt;

public class PasswordUtil {
    
    public static String hashPassword(String Textpassword){
        return BCrypt.hashpw(Textpassword,BCrypt.gensalt());
    }

    public static Boolean checkpassword (String TextPassword , String hashpassword){
        return BCrypt.checkpw(TextPassword,hashpassword);
    }

}
