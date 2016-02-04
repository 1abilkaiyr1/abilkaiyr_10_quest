package security;

import java.util.Optional;

import models.AuthorisedUser;
import play.libs.F;
import play.mvc.Controller;
import play.mvc.Http;
import play.mvc.Result;
import be.objectify.deadbolt.core.models.Subject;
import be.objectify.deadbolt.java.AbstractDeadboltHandler;


public class MyDeadboltHandler extends AbstractDeadboltHandler {
	public F.Promise<Optional<Result>> beforeAuthCheck(
			final Http.Context context) {
		// returning null means that everything is OK. Return a real result if
		// you want a redirect to a login page or
		// somewhere else
		return F.Promise.promise(Optional::empty);
	}

	public F.Promise<Optional<Subject>> getSubject(final Http.Context context) {
		// in a real application, the user name would probably be in the session
		// following a login process
		return F.Promise.promise(() -> Optional.ofNullable(AuthorisedUser
				.findByEmail(Controller.session("connected"))));
	}

	/*
	 * public F.Promise<Optional<DynamicResourceHandler>>
	 * getDynamicResourceHandler(final Http.Context context) { return
	 * F.Promise.promise(() -> Optional.of(new MyDynamicResourceHandler())); }
	 */
	
	@Override
	public F.Promise<Result> onAuthFailure(final Http.Context context,
			final String content) {
		// you can return any result from here - forbidden, etc
		return F.Promise.promise(() -> ok(views.html.accessFailed.render()));
	}
}