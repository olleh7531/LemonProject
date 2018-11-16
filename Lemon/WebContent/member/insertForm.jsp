<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EDGE,chrome=1" />

<title>Lemon::음악이 필요한 순간, 레몬</title>

<link rel="stylesheet" href="./assets/css/member/insertMember.css" type="text/css" />
<link rel="shortcut icon" href="./assets/img/common/favicon.png">

<script type="text/javascript" src="./assets/js/member/join_main_checkAll.js" ></script>
<script type="text/javascript" src="./assets/js/member/join_main.js" ></script>
<script type="text/javascript" src="./assets/js/member/nickCheck.js" ></script>
<script type="text/javascript" src="./assets/js/jquery-3.3.1.min.js"></script>

<script type="text/javascript">
function check() {
	// 아이디 입력 유무 확인
	if(!document.fr.email_1.value) {
		alert("이메일을 입력하세요");
		document.fr.email_1.focus();
		return false;
	}
	
	function IdCheck() {
		// 아이디 유효성 검사
		for(var i = 0; i < document.fr.email_1.value.length; i++) {
			var ch = document.fr.email_1.value.charAt(i)
			if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z') && !(ch >= 'A' && ch <= 'Z')) {
				alert("이메일에는 대/소문자, 숫자만 입력가능합니다.");
				document.fr.email_1.focus();
				return false;
			}
		}
	}
	
	if(!document.fr.name.value) {
		alert("이름을 입력하세요");
		document.fr.name.focus();
		return false;
	}
	
	if(!document.fr.nickname.value) {
		alert("닉네임을 입력하세요");
		document.fr.nickname.focus();
		return false;
	}

	// 닉네임 길이 체크 (2~10자)
	if(document.fr.nickname.value.length<2 || document.fr.nickname.value.length>10) {
		alert("닉네임을 2~10자까지 입력해주세요.")
		document.fr.nickname.focus();
		return false;
	}
	
	// 닉네임에 공백 사용하지 않기
	if(document.fr.nickname.value.indexOf(" ") >= 0) {
		alert("닉네임에 공백을 사용할 수 없습니다.");
	 	document.fr.nickname.focus();
		return false;
	}
	
	if(!document.fr.birth.value) {
		alert("생년월일을 입력하세요");
		document.fr.birth.focus();
		return false;
	}
	
	// 비밀번호 입력 유무 확인
	if(!document.fr.password.value) {
		alert("비밀번호를 입력하세요");
		document.fr.password.focus();
		return false;
	}
	
	// 비밀번호 길이 체크(4~16자)
	if(document.fr.password.value.length<4 || document.fr.password.value.length>16) {
		alert("비밀번호를 4~16자리까지 입력해주세요");
		document.fr.password.focus();
		return false;
	}
}

</script>

<style>
.btnAuth{
    background-color: #FFF;
    border: 1px solid #bfbfbf;
    border-radius: 5px;
    cursor: pointer;
    font-size: 12px;
    font-weight: bold;
    line-height: 1.4;
    padding: 5px;
    height: 30px;
    color: #666666;
}
</style>

</head>

<body>
	<%
		String email_id = (String) request.getParameter("email_id");
		String name = (String) request.getParameter("name");
		
 		
 		String code = "";

	%>

	<div id="wrap" class="join">
		<!-- header -->
		<div id="member_header">
			<!-- GNB -->
			<div id="gnb">
				<h1>
					<a href="./main.mi" title="Lemon 메인" onclick="javascript:MemberEtc.goPage('MAIN');">
						<img src="./assets/img/menu/menu_logo.png" width="142" height="100" alt="Lemon" /></a>
				</h1>
			</div>
		</div>
		
		<article class="mnMembers pgJoinEmail">
				<input type='hidden' id='code' value="<%=code%>">
			<form id="joinform" method="post" action="./MemberJoinAction.mb" enctype="multipart/form-data" name="fr" onsubmit="return check()">
				
				<%if(email_id != null) { %>
					<input type='hidden' id='chk' name="chk" value="<%=1%>"/>
					<input type='hidden' id='email_cert' name="email_cert" value="<%=1%>"/>
				<%} %>
				
				<fieldset class="formGroup basic">
					<div class="row id" id="divEmail">
					
						<label for="email" class="lb">이메일</label>
						<div class="col">
							<%if(email_id == null) { %>
							<input type="hidden" name="chk" value="0">
							<div class="formPadding">
								<div class="formItem">
									<input type="text" id="email_1" name="email_1" placeholder="e-mail 입력" onblur="IdCheck()"/>
								</div>
								<span class="at">@</span>
							</div>
							
							<select id="email_2" name="email_2">
								<option value="@naver.com">naver.com</option>
								<option value="@google.com">google.com</option>
								<option value="@hanmail.net">hanmail.net</option>
								<option value="@daum.net">daum.net</option>
								<option value="@nate.com">nate.com</option>
								<option value="@gmail.com">gmail.com</option>
								<option value="@hotmail.com">hotmail.com</option>
								<option value="@lycos.co.kr">lycos.co.kr</option>
								<option value="@empal.com">empal.com</option>
								<option value="@cyworld.com">cyworld.com</option>
								<option value="@yahoo.co.kr">yahoo.co.kr</option>
								<option value="@paran.com">paran.com</option>
								<option value="@dreamwiz.com">dreamwiz.com</option>
							</select>
							
							<%} else {%>
							<div class="formPadding">
								<input type="text" id="email_1" name="email_1" value="<%=email_id %>" readonly style="width: 346px"/>
								<input type="hidden" id="email_2" name="email_2" value="" />
							</div>
							<%} %>
							
						</div>
						<!-- 공통 : 안내 문구 처리 시 desc 비노출 -->
						<p class="desc">이메일은 결제내역 받기, 비밀번호 찾기 등에 사용되므로 정확하게 입력해 주세요.</p>
							<%if(email_id == null) {
								// 일반 회원 가입일 때
							%>
							<div id="authBox" style="display: block; height:50px; margin-left: 90px;">
								<input type="button" class="chkEmail btnAuth" style="width: 100px;"value="이메일 인증 받기" onclick="chkEmail()" >
							</div>
							<%} %>
					</div>
					
					<%if(email_id == null) { %>
						<div class="row">
							<label for="password" class="lb">비밀번호</label>
							<div class="col" id="divPassword">
								<div class="placeholderForm">
									<input type="password" id="password" name="password" placeholder="비밀번호 입력">
								</div>
							</div>
							<p class="desc" id="descPassword">4~16자 영문 대,소문자, 숫자, 특수문자 중 2가지 이상 조합</p>
						</div>
					<%} %>
					
					<div class="row" id="divName">
						<label for="Name" class="lb">이름</label>
						<div class="col">
							<div class="placeholderForm">
								<%if(email_id == null) { %>
								<input type="text" id="name" name="name" placeholder="이름 입력" maxlength="12" />
								<%} else {%>
								<input type="text" id="name" name="name" value="<%=name %>" readonly />
								<%} %>
							</div>
						</div>
					</div>

					<div class="row" id="divNickName">
						<label for="nickName" class="lb">닉네임</label>
						<div class="col">
							<div class="placeholderForm">
								<input type="text" id="nickname" name="nickname" placeholder="닉네임 입력" maxlength="12"/>
							</div>
						</div>
						<span id="idchk" class="desc"></span></td>
						<p class="desc">레몬 회원들과 감상을 나눌 수 있는 별명으로 사용됩니다.</p>
					</div>


					<div class="row" id="divImg">
						<label for="Img" class="lb">이미지</label>
						<div class="col">
							<div class="placeholderForm">
								<input type="file" id="file" name="file"/>
							</div>
						</div>
					</div>
					
					<div class="row" id="divBirthDt">
						<label for="birthDt" class="lb">생년월일</label>
						<div class="col">
							<div class="placeholderForm" id="divBirthDt">
								<input type="date" id="birth" name="birth" min="1900-01-01" max="2018-01-01"/>
							</div>
						</div>
					</div>
					
					<div class="row jender" id="divGender">
						<label for="gender" class="lb">성별</label>
						<div class="col">
							<input type="radio" id="gender" name="gender" value="남" checked/>
							<label for="남">남</label>
							<input type="radio" id="gender" name="gender" value="여" />
							<label for="여">여</label>
						</div>
					</div>
				</fieldset>

				<fieldset class="formGroup chk">
					<legend>회원 가입 약관 체크</legend>

					<p>
						<input type="checkbox" id="joinCheckAll" name="joinCheckAll" onclick="oncheck()">
						<label for="allTermsAgree">아래 내용에 모두 동의합니다.</label>
					</p>

					<ul>
						<li><input type="checkbox" id="userTermsAgree" name="userTermsAgree" />
							<label for="userTermsAgree">이용약관에 동의합니다.</label></li>
						<li id="privacyTerms"><input type="checkbox" id="privacyTermsAgree" name="privacyTermsAgree" />
							<label for="privacyTermsAgree">개인정보 수집 및 이용에 대한 안내에 동의합니다.</label></li>
						<li><input type="checkbox" id="mailTermsAgree" name="mailTermsAgree" />
								<label for="mailTermsAgree">(선택) 레몬 소식, 이벤트 등 홍보/알림 메일 수신에 동의합니다.</label></li>
						<li><input type="checkbox" id="bugsprivacyTermsAgree" name="bugsprivacyTermsAgree" />
								<label for="bugsprivacyTermsAgree">(선택) 레몬 홍보성 개인정보 수집/이용에 동의합니다.</label></li>
						<li><input type="checkbox" id="bugsInfoTermsAgree" name="bugsInfoTermsAgree" />
								<label for="bugsInfoTermsAgree">(선택) 레몬 홍보성 제3자 정보 제공에 동의합니다.</label></li>
					</ul>
				</fieldset>
				
				<p class="btns">
					<input type="submit" onclick="return chkAgree()" value="가입 완료">
				</p>
			</form>
				<div class="terms">
					<aside id="policy" class="agreement">
						<h1>이용약관</h1>
						<div class="tab">
							<button class="tabBugsAgree selected"
									onClick="javascript:tabBugsAgree();return false;">이용약관</button>
							<button class="tabBugsServiceAgree"
									onClick	="javascript:tabBugsServiceAgree();return false;">서비스 상품 약관</button>
						</div>
						<div class="summary" tabindex="0">
							<div id="bugsAgreeZone">
								<strong>제1장. 총칙</strong> <strong id="agree1">제 1 조 (목적)</strong>
								<p>본 약관은 회원이 ㈜아이티윌(이하 “회사”라 합니다)에서 제공하는 유무선 인터넷 음악포탈 레몬
									서비스(이하 '서비스'라 한다)의 회원과 회사간의 권리, 의무 및 책임사항 등 기본적인 사항을 규정함을 목적으로
									합니다.</p>
								<strong>제2장. 약관</strong> <strong id="agree1">제 1 조 (목적)</strong>
								<p>본 약관은 회원이 본 사이트를 이용할 때 동의해야할 약관에 대해 규정하고 있습니다. .</p>
							</div>		
						</div>
					</aside>

					<aside id="privacy" class="agreement">
						<h1>개인정보 수집 및 이용에 대한 안내</h1>
						<div class="summary" tabindex="0">
							<strong id="privacy4">개인정보의 수집목적 및 이용목적</strong>
							<p>회사는 수집한 개인정보를 다음의 목적으로 활용합니다.</p>
							<ul class="depth1">
								<li>1. 서비스 제공에 관한 계약 이행 유료 서비스 제공에 따른 요금정산<br /> 콘텐츠 제공,
									유료 서비스 이용에 대한 과금, 구매 및 요금 결제, 본인인증, 물품배송 또는 청구서 등 발송, 요금 추심
								</li>
								<li>2. 회원관리 <br /> 회원제 서비스 이용에 따른 본인확인, 개인식별, 불량회원의 부정 이용
									방지와 비인가 사용 방지, 중복가입확인, 가입의사 확인, 연령확인, 만 14세 미만 아동 개인정보 수집 시
									법정대리인 동의 여부 확인, 만 19세 미만 아동 및 청소년의 회원가입 시 법정대리인의 동의 여부 확인 및
									법정대리인 본인확인, 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 고지사항 전달
								</li>
								<li>3. 마케팅 및 광고에 활용<br /> 신규 서비스 개발 및 맞춤 서비스 제공, <strong>통계학적
										특성에 따른 서비스 제공 및 광고 게재</strong>, 서비스 유효성 확인, 접속 빈도 파악, 회원의 서비스 이용에 대한
									통계, <strong>이벤트 및 광고성 정보와 참여기회 제공</strong>
								</li>
							</ul>
						</div>

						<div class="summary" tabindex="0">
							<strong id="privacy3">개인정보의 수집범위 및 수집방법</strong>
							<ul class="depth1">
								<li>1. 회사는 회원가입, 상담, 서비스 신청 등 서비스 제공 및 계약이행을 위해 아래와 같이
									개인정보를 수집할 수 있습니다.
									<ul class="depth2">
										<li>(1) 레몬 회원<br /> - 필수: 아이디(이메일 주소), 비밀번호, 점유인증
											정보(휴대폰번호), 생년월일, 성별, 별명
										</li>
									</ul>
								</li>
								<li>2. 회사는 회원이 유료 서비스를 이용하고자 하는 경우 결제 시점에 아래와 같이 결제에 필요한
									정보를 수집할 수 있습니다.<br />
									<ul class="depth2">
										<li>- 결제수단 소유자 정보(이름), 신용카드정보, 휴대전화번호, 유선전화번호</li>
									</ul>
								</li>
							</ul>
						</div>

						<div class="summary" tabindex="0">
							<strong id="privacy9">개인정보의 보관기간 및 이용기간</strong>
							<ul class="depth1">
								<li>1. 이용자의 개인정보는 개인정보의 수집목적 또는 제공받은 목적이 달성되면 파기됩니다. 회원이
									회원탈퇴를 하거나 개인정보 허위기재로 인해 회원 ID 삭제 처분을 받은 경우 수집된 개인정보는 완전히 삭제되며
									어떠한 용도로도 이용할 수 없도록 처리됩니다. 다만, 도용으로 인한 원치 않는 회원탈퇴 등의 피해가 발생할 우려가
									있으므로 탈퇴신청 후 7일의 유예기간 동안 개인정보를 임시 보관하게 되며, 이는 이용 해지 시 이용자에게
									고지됩니다. 7일 후에는 회사의 회원정보 데이터베이스(DB)에서 완전히 삭제됩니다.</li>
								<li>2. 회사는 정보통신망법 관련 조항에 따라 회원이 1년동안 서비스를 이용한 사실 또는 활동한 기록이
									없는 경우, 개인정보의 안전한 보호 및 피해 발생을 방지하기 위해 '정보통신망 이용촉진 및 정보보호등에 관한 법률
									제29조'에 근거하여 이용자에게 사전통지하고 개인정보를 별도로 분리하여 저장 관리합니다.</li>
								<li>3. 2항의 이용한 사실 및 활동한 기록이라 함은 계정로그인, 서비스 이용료 자동결제, 전화상담,
									고객 상담센터 등 고객이 서비스를 이용했다고 볼 수 있는 기록을 의미합니다.</li>
								<li>4. 회사는 유효기간이 도래하기 30일 전까지 이메일, 문자메시지, 휴대전화 등 회원이 입력한
									연락수단을 통하여 사전통지합니다. 휴면처리된 계정의 경우 휴면 전환일로부터 4년간 분리 저장되고, 저장기간 내
									회원이 서비스 재이용을 원하실 경우에는 본인확인 절차를 거쳐 서비스를 재이용하실 수 있습니다.</li>
								<li>5. 또한 명의도용 등 분쟁 발생시 본인확인을 위해 제출 받은 신분증 사본은 본인확인 후 즉시
									파기합니다. 만 19세 미만 아동 및 청소년의 법정대리인 정보는 해당 아동 및 청소년이 성년에 도달하거나 해당
									아동 및 청소년의 회원탈퇴에 따른 개인정보 파기 시 함께 파기됩니다.</li>
								<li>6. 이용자의 개인정보는 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기되나, 아래 각
									항목에 해당하는 경우에는 명시한 기간 동안 보관할 수 있으며, 그 외 다른 목적으로는 사용하지 않습니다.
									<ul class="depth2">
										<li>(1) 회사 내부 방침에 의한 정보보유 사유
											<ul class="depth3">
												<li>가. 불건전한 서비스 이용기록<br /> - 보존 이유: 사법기관 수사의뢰를 하거나 다른
													회원을 보호할 목적<br /> - 보존 기간: 1년
												</li>
												<li>나. 앱가드를 통해 수집된 정보<br /> - 보존 이유 : 부정이용방지와 비인가 사용방지
													및 이용자 관심 등에 기반한 맞춤형 서비스 제공<br /> - 보존 기간 : 수집일로부터 2년
												</li>
											</ul>
										</li>
										<li>(2) 관계법령의 규정에 의하여 보관할 필요가 있는 경우 회사는 수집 및 이용 목적 달성 후에도
											관계법령에서 정한 일정 기간 동안 회원의 개인정보를 보관할 수 있습니다.
											<ul class="depth3">
												<li>가. 웹사이트 방문기록<br /> - 보존 이유 : 통신비밀보호법<br /> - 보존
													기간 : 3개월
												</li>
												<li>나. 소비자의 불만 또는 분쟁처리에 관한 기록<br /> - 보존 이유 : 전자상거래
													등에서의 소비자보호에 관한 법률<br /> - 보존 기간 : 3년
												</li>
												<li>다. 계약 또는 청약철회 등에 관한 기록<br /> - 보존 이유 : 전자상거래 등에서의
													소비자보호에 관한 법률<br /> - 보존 기간 : 5년
												</li>
												<li>라. 대금결제 및 재화 등의 공급에 관한 기록<br /> - 보존 이유 : 전자상거래
													등에서의 소비자보호에 관한 법률<br /> - 보존 기간 : 5년
												</li>
												<li>마. 표시, 광고에 관한 기록<br /> - 보존 이유 : 전자상거래 등에서의 소비자보호에
													관한 법률<br /> - 보존 기간 : 6개월
												</li>
											</ul>
										</li>
									</ul>
								</li>
							</ul>
						</div>
					</aside>

					<aside id="bugsPrivacy" class="agreement">
						<h1>레몬 홍보성 개인정보 수집/이용에 대한 안내</h1>
						<div class="summary" tabindex="0">
							<ul class="depth1 privacyManage">
								<li>1. 앱가드(보안솔루션) 설치 시
									<ul>
										<li>- 제공받는자: 아이티엔엔터테인먼트(주)</li>
										<li>- 제공받는자의 개인정보 이용목적: 이용자 관심 등에 기반한 맞춤형 서비스 제공</li>
										<li>- 제공하는 개인정보 항목: 광고ID, 이용자 단말기 내 설치된 어플리케이션 정보(앱
											설치·실행시각 포함)</li>
										<li>- 개인정보 제공받는 자의 개인정보 보유 및 이용기간: 수집일로부터 2년</li>
									</ul>
								</li>
							</ul>
						</div>
					</aside>

					<aside id="bugsInfo" class="agreement">
						<h1>레몬 홍보성 제3자 정보 제공에 대한 안내</h1>
						<div class="summary" tabindex="0">
							<ul class="depth1 privacy3rdProvide">
								<li>- 개인정보를 제공받는 자: 아이티엔페이코(주)</li>
								<li>- 제공항목: 광고ID, 이용자 단말기 내 설치된 어플리케이션 정보(앱 설치·실행시각 포함)</li>
								<li>- 제공받는 자의 개인정보 이용목적: 이용자 관심 등에 기반한 맞춤형 서비스 제공</li>
								<li>- 제공받는자의 개인정보 보유이용기간: 수집일로부터 2년</li>
							</ul>
						</div>
					</aside>
				</div>
			
		</article>
		<!-- footer -->
		<div id="member_footer" class="">
			<ul class="footer_policy clfix">



				<li class="first_child">이용약관</li>
				<li><strong>개인정보처리방침</strong></li>
				<li>청소년보호정책</li>
				<li>고객센터</li>


			</ul>
			<ul class="footer_menu">



				<li class="menu01 first"><a href=""
					title="Lemon 티켓" target="_blank"><span>Lemon 티켓</span></a></li>


				<li class="menu04"><a
					href=""
					title="Lemon Aztalk" target="_blank"><span>Lemon Aztalk</span></a></li>
				<li class="txt"><span>문의전화 : 1566-0000 (평일 09:00-18:00,유료)</span></li>


			</ul>
			<p>
				<a href="" target="_blank">© LemonCorp.</a>
			</p>
		</div>
		<!-- //footer -->

		<script type="text/javascript">
			function chkEmail(){
				var authBox = document.getElementById("authBox");
				var email = $('#email_1').val()+$('#email_2').val();
				
				authBox.innerHTML=
				"<div style='display: block; height:50px;'>"
				+"<input type='text' id='inputValue'/>"
				+"<input type='button' style='margin-left: 5px; width: 50px;' id='test' class='btnAuth' value='확인' onclick='chkAuth()'/>"	
				+"<input type='button' style='margin-left: 5px; width: 50px;' class='chkEmail btnAuth' value='재전송' onclick='chkEmail()' >"
				+"<input type='hidden' name='email_cert' value='0'/>"
				+"</div>";
				
				alert('메일을 전송합니다.');
				
				$.ajax({
					type : "POST", // method="POST" 방식으로 출력 
					url : "./MemberSendJoinMailAction.mb", // id 체크하는 jsp 파일 주소 불러오기 
					data : {
						email_id : email,
						code : $('#code').val(),
						email_id : $('#email_1').val()+$('#email_2').val()
					},
					success : function(data) { // data를 가져오는 것이 성공하였을 때
					    alert(email+"주소로 인증메일을 발송하였습니다.");
						if(data == "fail"){
							alert("메일 발송이 실패하였습니다.")
						}else{
						alert("이메일 발송 성공");
						data = data.trim();
						document.getElementById("code").value=data;
							
						}
					},
					error : function(xhr, status, error) { // 에러났을 때
						alert("error : " + error);
					}
				});
			}
			
			function chkAuth(){
				var code = document.getElementById("code").value;
				var inputValue = document.getElementById("inputValue").value;
				var authBox = document.getElementById("authBox");
				if(inputValue == code && code.length == 6){
					alert("인증 성공!");	
					authBox.innerHTML="<div style='text-align: center; font-size: 15px;'><strong><p>인증에 성공하였습니다.</p></strong></div><input type='hidden' name='email_cert' value='1'/>";

				}else{
					alert("다시 한번 확인 해 주세요.");						
				}
			}
			
			function oncheck(){
				var checkBox = document.getElementById("joinCheckAll");
				if(checkBox.checked == true){
					document.getElementById("userTermsAgree").checked = true;
					document.getElementById("privacyTermsAgree").checked = true;
					document.getElementById("mailTermsAgree").checked = true;
					document.getElementById("bugsprivacyTermsAgree").checked = true;
					document.getElementById("bugsInfoTermsAgree").checked = true;
				}else {
					document.getElementById("userTermsAgree").checked = false;
					document.getElementById("privacyTermsAgree").checked = false;
					document.getElementById("mailTermsAgree").checked = false;
					document.getElementById("bugsprivacyTermsAgree").checked = false;
					document.getElementById("bugsInfoTermsAgree").checked = false;
				}
			}
		</script>
	</div>
	<script type="text/javascript" src="./assets/js/member/joinMember.js"></script>
	<script type="text/javascript">
	$(function(){
	    $('#nickname').blur(function(){
	        $.ajax({
	            type:"POST",
	            url:"./NicknameCheck.mb",
	            data:{
	                "nickname": $('#nickname').val()
	            },
	            success:function(data){
	                if($.trim(data) == "YES"){
	                    $('#idchk').html('<b style="font-size:11px;color:blue">닉네임 중복이 아닙니다.</b>');
	                }else{
	                    $('#idchk').html('<b style="font-size:11px;color:red">닉네임 중복입니다.</b>');
	                }
	            }
	        });    
	    });
	});
	</script>
</body>
</html>