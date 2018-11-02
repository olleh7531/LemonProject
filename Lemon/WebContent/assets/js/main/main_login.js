function checkLoginStatus() {
	var loginBtn = document.querySelector('#googleLogin');
	if(gauth.isSignedIn.get()){
		// 구글 아이디로 로그인했을 때 버튼 value
		loginBtn.value = 'Google Logout';
		var profile = gauth.currentUser.get().getBasicProfile();
		
		var email_id = profile.getEmail();
		var name = profile.getFamilyName()+profile.getGivenName();
		
		location.href="GoogleLoginAction.mb?email_id="+email_id+"&name="+name;
		
	} else {
		// 구글 아이디로 로그인하지 않았을 때 버튼 value
		loginBtn.value = 'Google Login';
		
	}
}

function init() {
	gapi.load('auth2', function() {
		window.gauth = gapi.auth2.init({
			client_id:'141907764505-ne7ed3l6jl9f9qrhjquriot58lq4e8s0.apps.googleusercontent.com'
		})
		gauth.then(function(){
		console.log('googleAuth success');
		checkLoginStatus();
		}, function(){
			console.log('googleAuth fail');
		});
	});
}