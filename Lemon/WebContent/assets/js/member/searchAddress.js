// 주소 검색 funcion 
function searchAddress() {
        new daum.Postcode({
            oncomplete: function(data) {
            	var fullAddr = '';
                var extraAddr = '';
                
                if (data.userSelectedType === 'R') {
                    fullAddr = data.roadAddress;
                } else {
                    fullAddr = data.jibunAddress;
                }

                if(data.userSelectedType === 'R'){
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                document.getElementById('zip_code').value = data.zonecode; 
                document.getElementById('address1').value = fullAddr;
                document.getElementById('address2').focus();
            }
        }).open();
}
