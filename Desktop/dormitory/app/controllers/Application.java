package controllers;

import models.Student;
import play.data.Form;
import play.mvc.Controller;
import play.mvc.Result;

public class Application extends Controller {

	public Result index() {
		return ok(views.html.index.render("Your new application is ready."));
	}


	public Result addPerson() {

		Student student = Form.form(Student.class).bindFromRequest().get();
		student.save();
		return redirect(routes.Application.index());
	}





}
