package com.lnp.controller;


import com.lnp.entity.UserInformation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/permission")
public class PermissionController {


    @RequestMapping("/givePermission")
    public String givePermission(HttpSession session){
        UserInformation user = (UserInformation) session.getAttribute("userSession");

        return "";
    }


}
