package com.hellokoding.auth.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hellokoding.auth.model.User;
import com.hellokoding.auth.service.SecurityService;
import com.hellokoding.auth.service.UserService;
import com.hellokoding.auth.validator.UserValidator;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;
    
    @RequestMapping(value = "/welcome", method = RequestMethod.POST)
    public @ResponseBody User edit(@RequestBody String nomeUsuario) {
    	User usuario = userService.findByUsername(nomeUsuario);
    	
    	return usuario;
    }
    
    @RequestMapping(value = "/alterarUsuario", method = RequestMethod.POST)
    public String alterarUsuario(@RequestBody User nome) {
    	User usuario = userService.findByUsername(nome.getUsername());
    	
    	if(nome.getCPF() != null) {
    		usuario.setCPF(nome.getCPF());
    	}
    	
    	if(nome.getRG() != null) {
    		usuario.setRG(nome.getRG());
    	}

    	if(nome.getUsername() != null) {
    		usuario.setUsername(nome.getUsername());
    	}
    	
    	if(nome.getTelUser() != null) {
    		usuario.setTelUser(nome.getTelUser());
    	}
    	
    	userService.save(usuario);
    	
    	return "welcome";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(User userForm, BindingResult bindingResult, Model model) {
        //userValidator.validate(userForm, bindingResult);

    	if (userForm.getUsername().length() < 6 || userForm.getUsername().length() > 32) { 
    		model.addAttribute("errorPassword", "Nome de usuário acima de 6 caracteres");
    		return "login";
    	}
    	
    	if (userService.findByUsername(userForm.getUsername()) != null) {
    		model.addAttribute("errorPassword", "Usuário já cadastrado");
            return "login";
        }

        if (userForm.getPassword().length() < 8 || userForm.getPassword().length() > 32) {
        	model.addAttribute("errorPassword", "Senha acima de 8 caracteres");
        	return "login";
        }

        if (!userForm.getPasswordConfirm().equals(userForm.getPassword())) {
        	model.addAttribute("errorPassword", "Senhas incompatíveis");
        	return "login";
        }

        userService.save(userForm);

        securityService.autologin(userForm.getUsername(), userForm.getPasswordConfirm());

        return "redirect:/welcome";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null)	
            model.addAttribute("error", "Usuário ou senha invalidos.");

        if (logout != null)
            model.addAttribute("message", "Você conseguiu deslogar com sucesso.");

        return "login";
    }

    @RequestMapping(value = {"/", "/welcome"}, method = RequestMethod.GET)
    public String welcome(Model model) {
        return "welcome";
    }
}
