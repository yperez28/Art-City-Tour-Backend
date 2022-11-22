package com.catware.artCityTour.Service;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;

@Service
public class HashingService {


    private String pepper = "mishisArtisticos"; //ESTO NO PUEDE QUEDARSE AQUI, TIENE QUE SER VARIABLE DE ENTORNO

    public String hashPass(String passToHash){
        String hashedPass = BCrypt.hashpw(passToHash, BCrypt.gensalt() + pepper);
        return hashedPass;
    }

    public Boolean comparePass(String candidate, String hashedPass){
        return BCrypt.checkpw(candidate, hashedPass);
    }
}
