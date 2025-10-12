package org.clinique_degital.clinique_degital.service;

import org.clinique_degital.clinique_degital.dto.PatientRegistrationDTO;
import org.clinique_degital.clinique_degital.mapper.UserMapper;
import org.clinique_degital.clinique_degital.model.Patient;
import org.clinique_degital.clinique_degital.model.User;
import org.clinique_degital.clinique_degital.repository.UserRepository;
import org.clinique_degital.clinique_degital.util.PasswordUtil;

import java.security.PublicKey;
import java.util.Optional;

public class UserService {

    UserRepository userRepo = new UserRepository();

    public void register (PatientRegistrationDTO dto) throws Exception{

        if(userRepo.findUserByEmail(dto.getEmail()).isPresent()){
            throw new Exception("Email deja exist");
        }

        Patient patient = UserMapper.fromdtoToEntity(dto);
        patient.setPassword(PasswordUtil.hashPassword(dto.getPassword()));
        userRepo.save(patient);

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
