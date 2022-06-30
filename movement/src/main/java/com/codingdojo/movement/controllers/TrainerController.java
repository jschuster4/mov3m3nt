package com.codingdojo.movement.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;

import com.codingdojo.movement.models.LoginTrainer;
import com.codingdojo.movement.models.Trainer;
import com.codingdojo.movement.services.TrainerService;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.List;


@Controller
@RequestMapping("/trainer")
public class TrainerController {
    
    @Autowired
    private TrainerService trainerService;

    public TrainerController(){}

//    @GetMapping("/{id}")
//    public String showOneTrainer(@PathVariable("id") Long id, Model model, HttpSession session){
//        if(session.getAttribute("trainer")==null){
//            return "redirect:/";
//        }
//        Trainer dbTrainer = trainerService.findById(id);
//        model.addAttribute("trainer", dbTrainer);
//        return "showOneTrainer";
//    }
//
//    @GetMapping("/instructorhome/{id}")
//    public String showOneInstructor(@PathVariable("id") Long id, Model model, HttpSession session) {
//        model.addAttribute("oneTrainer", trainerService.findById(id));
//
//        if(session.getAttribute("trainerId") == null) {
//            return "redirect:/logout";
//        }
//
//        return"instructorhome";
//    }
    
    @GetMapping("")
    public String showTrainerLogin(Model model) {
    	model.addAttribute("newTrainer", new Trainer());
    	model.addAttribute("trainerLogin", new LoginTrainer());
    	return "TrainerLoginAndRegister";
    }
    
    @PostMapping("/register")
    public String registerTrainer(@Valid @ModelAttribute("newTrainer") Trainer trainer, BindingResult res, Model model, @RequestParam ("file")MultipartFile file) {
		if(res.hasErrors()) {
//			model.addAttribute("newTrainer", new Trainer());
	    	model.addAttribute("trainerLogin", new LoginTrainer());
			return "TrainerLoginAndRegister";
		}
		if(trainer.getAvatar()==null||trainer.getAvatar().length()<1)
		{
			res.rejectValue("avatar","avatar_required","Avatar is required.");
			return "TrainerLoginAndRegister";
		}
		String fileName = file.getOriginalFilename();
		try{
			file.transferTo(new File("/Users/mendygiter/Documents/GitHub/mov3m3nt/movement/src/main/resources/static/images/" + file.getOriginalFilename()));
		}
		catch (Exception e) {
			System.out.println(e);
		}
		Trainer dbTrainer= trainerService.create(trainer, res);
		if(dbTrainer == null) {
//			model.addAttribute("newTrainer", new Trainer());
	    	model.addAttribute("trainerLogin", new LoginTrainer());
			return "TrainerLoginAndRegister";
		}
		return "redirect:/trainer";
	}


	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("trainerLogin") LoginTrainer loginTrainer, BindingResult res, Model model, HttpSession session) {
	
		if(res.hasErrors()) {
			model.addAttribute("newTrainer", new Trainer());
//			model.addAttribute("trainerLogin", new LoginTrainer());
			return "TrainerLoginAndRegister";
		}
		Trainer dbTrainer=trainerService.login(loginTrainer, res);
		if(dbTrainer==null) {
			model.addAttribute("newTrainer", new Trainer());
//			model.addAttribute("trainerLogin", new LoginTrainer());
			return "TrainerLoginAndRegister";
		}
		session.setAttribute("sessionTrainer", dbTrainer);
		Long trainer_id= dbTrainer.getId();
		String returnStatement = String.format("redirect:/trainer/home/%o",trainer_id);
		return returnStatement;
		
	}
    
    
    
    @GetMapping("/home/{id}")
    public String showTrainerDashboard(@PathVariable("id")Long id, Model model, HttpSession session) {
    	model.addAttribute("trainer", trainerService.findById(id));
    	return "trainerPage";
    	
//    	might need to add validation that either user or trainer is in session to view this page? 
    }
    
    @GetMapping("/logout")
	public String logout(HttpSession session) {
		
		trainerService.logout(session);
		return "redirect:/user";
    }



}

