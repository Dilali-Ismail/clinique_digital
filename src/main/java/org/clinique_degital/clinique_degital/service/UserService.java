package org.clinique_degital.clinique_degital.service;

import org.clinique_degital.clinique_degital.dto.UserRegistrationDTO;
import org.clinique_degital.clinique_degital.mapper.UserMapper;
import org.clinique_degital.clinique_degital.model.User;
import org.clinique_degital.clinique_degital.repository.UserRepository;
import org.clinique_degital.clinique_degital.util.PasswordUtil;

import javax.lang.model.element.NestingKind;
import java.util.List;
import java.util.Optional;

public class UserService {

    UserRepository userRepo = new UserRepository();

    public void register (UserRegistrationDTO dto) throws Exception{


        Optional<User> userfind   = userRepo.findUserByEmail(dto.getEmail());

        if(userfind.isPresent()){
              throw new Exception();
        }

        User user = UserMapper.fromdtoToEntity(dto);

        user.setPassword(PasswordUtil.hashPassword(dto.getPassword()));

        userRepo.save(user);

    }

    public Optional<User> login (String email , String password){
        Optional<User> userIn = userRepo.findUserByEmail(email);

        if(userIn.isPresent()){
            User user = userIn.get();

           if(PasswordUtil.checkpassword(password , user.getPassword())){
               return Optional.of(user);
           }

        }

        return Optional.empty();
    }
}
