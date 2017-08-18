
$(document).ready(function () {

  var parser2 = document.createElement('a');
  parser2.href = document.URL;
  var calendar_id = parser2.pathname.split('/')[2];
  
  console.log('calendar_id : ', calendar_id);
	
	initCalendar(calendar_id);
	
  $('#search').click(function () {
    updatedByHashTag(calendar_id,'테스트, 감자튀김, test')
  });

  // 편집 종료
  $('#close').click(function () {
    if(confirm('편집을 종료하시겠습니까?')) {
      /* 편집 종료 구현 */
	  $('#editorzone').css('display','none');
    }
  });
});


//달력 초기화
function initCalendar(_calendar_id){
  $.ajax({
    method: "GET",
    url: `/calendars/${_calendar_id}/events`,
    dataType : "json",
    contentType: "application/json; charset=utf-8",
    success: function(data){
      // alert("success");
      for(var i in data){
        var event = data[i];
        console.log(event);
        event.url = `/events/${event.id}`
      }
      setCalendar(data);
    },
    error: function(){
      alert("fail");
    }
  });   
};

//달력 셋팅
function setCalendar(data){
  $('#calendar').fullCalendar({
  	dayClick: function() {
		alert('a day has been clicked!');
	},
  // 	defaultDate: '2014-11-12',
  	lang: 'ko',
  	editable: true,
    events: data
  });
};

//해시태그로 업데이트
function updatedByHashTag(_calendar_id,hash_tags){
  console.log(_calendar_id,hash_tags);
  
  if(hash_tags === '' ) return removeAll();
  
  $.ajax({
    method: "GET",
    url: `/calendars/${_calendar_id}/events/hash_tags/${hash_tags}`,
    dataType : "json",
    contentType: "application/json; charset=utf-8",
    success: function(data){
      // alert("success");
      for(var i in data){
        var event = data[i];
        console.log(event);
        event.url = `/events/${event.id}`
      }
      updateEvents(data);
    },
    error: function(){
      alert("fail");
    }
  });   
};

//이벤트 
function updateEvents(data){
  // $('#calendar').html('');
  // setCalendar(data);
  $('#calendar').fullCalendar( 'removeEvents' );
  $('#calendar').fullCalendar( 'addEventSource', data );
  // $('#calendar').fullCalendar( 
  //   'refetchEventSources', 
  //   data 
  // );
};

function removeAll(){
  $('#calendar').fullCalendar( 'removeEvents' );
};