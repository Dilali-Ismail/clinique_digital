package org.clinique_degital.clinique_degital;

import org.clinique_degital.clinique_degital.util.PasswordUtil;

public class AdminPasswordGenerator {
    public static void main(String[] args) {
        String adminPassword = "admin123";
        String hashedPassword = PasswordUtil.hashPassword(adminPassword);
        System.out.println("Mot de passe haché pour l'admin :");
        System.out.println(hashedPassword);
    }
}
