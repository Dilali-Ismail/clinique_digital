package org.clinique_degital.clinique_degital.mapper;

import org.clinique_degital.clinique_degital.dto.UserRegistrationDTO;
import org.clinique_degital.clinique_degital.model.User;
import org.clinique_degital.clinique_degital.model.enums.Role;

public class UserMapper {

    public static User fromdtoToEntity(UserRegistrationDTO dto){
        User user = new User();
        user.setNom(dto.getNom());
        user.setEmail(dto.getEmail());
        user.setRole(Role.PATIENT);
        user.setActif(true);
        return user;
    }

}
